// gcn.v
//DONT USE PIN F2 on the board!


module gcn(clk32MHz, rumble, pin, clk1us, clk4us, hi, lo, clkPoll, pollDone);
    input clk32MHz, rumble;
    output wire pin; //The controller communications pin.
    //Debug Outputs
    output wire clk1us, clk4us, hi, lo, clkPoll, pollDone;
    wire pollVal; 

    clkDiv a(clk32MHz, clk1us, clk4us, clkPoll);
    txVal  b(clk1us, hi, lo);
    poll   c(clkPoll, 1'b1, clk4us, hi, lo, pollVal, pollDone);

    assign pin = (pollDone) ? 1'b0 : pollVal;
endmodule

module clkDiv(in, clk1us, clk4us, clkPoll);
    input in;
    output reg clk1us, clk4us, clkPoll;

    reg [6:0] counter;
    reg [6:0] nextCount;

    reg [16:0] bigCounter;
    reg [16:0] nextBigCount;

    always @(posedge in) begin
        counter <= nextCount;
        bigCounter <= nextBigCount;

        //Set the 1us clk
        if(counter < 16 || (counter > 31 && counter < 48) || (counter > 63 && counter < 80) || (counter > 95 && counter < 112)) begin
            clk1us <= 1;
        end else begin
            clk1us <= 0;
        end

        //Set the 4us clk
        if(counter < 64) begin
            clk4us <= 1;
        end else begin
            clk4us <= 0;
        end

        //Set the poll clk
        if(bigCounter < 64 || bigCounter > 191) begin
            clkPoll <= 0;
        end else begin
            clkPoll <= 1;
        end 
    end

    always @* begin
        nextCount = counter + 1;
        nextBigCount = bigCounter + 1;
    end

endmodule

module txVal(clk1us, hi, lo);
//Outputs the high and low transmit patterns
	input clk1us;
	output reg hi, lo;
	
	reg[1:0] counter;
	reg[1:0] nextCount;
	
	always @(posedge clk1us) begin
		//Set hi
		if(counter == 0) begin //Even
			hi <= 0;
		end else begin
			hi <= 1;
		end
		
		//Set lo
		if(counter == 3) begin //Odd
			lo <= 1;
		end else begin
			lo <= 0;
		end

        counter <= nextCount;
	end
	
	always @* begin
		nextCount = counter + 1;
	end
	
endmodule



module poll(en, rumble, clk4us, hi, lo, pin, done);
//Sends the polling pattern over pin
    input en, rumble, clk4us, hi, lo;
    output pin;
    output reg done;

    reg [22:0] cmd;
    reg txVal;

    reg [5:0] count;
    reg [5:0] nextCount;

    assign pin = (txVal) ? hi : lo;

    always @(posedge clk4us) begin
        if(en) begin
            //Set up the command to be transmitted
            cmd[22:1] <= 22'b1000000000000110000001;
            if(rumble) begin
               cmd[0] <= 1'b1;
            end else begin
               cmd[0] <= 1'b0;
            end
            done <= 0;
            count <= 0;
            txVal <= 0;
        end else if(count < 23) begin
            count <= nextCount;
            txVal <= cmd[22];
            cmd = cmd << 1;
        end else begin
            done <= 1;
            txVal <= 0;
        end
    end

    always @* begin
        if(count < 25) begin
            nextCount = count + 1;
        end else begin
            nextCount = count;
        end
    end
endmodule