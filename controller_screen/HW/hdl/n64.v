// n64.v

module n64(clk, controller);
    input clk;
    output reg controller;
    
    reg [34:0] counter;
    reg [34:0] nextCount;

    always@(posedge clk) begin
        counter = nextCount;
        if(counter < 16000000)
            controller <= 1;
        else
            controller <= 0;
    end

    always @* begin
        if(counter < 32000000)
            nextCount = counter + 1;
        else
            nextCount = 0;
    end 
endmodule