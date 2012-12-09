//////////////////////////////////////////////////////////////////////
// Created by Actel SmartDesign Wed Dec 05 14:26:16 2012
// Testbench Template
// This is a basic testbench that instantiates your design with basic 
// clock and reset pins connected.  If your design has special
// clock/reset or testbench driver requirements then you should 
// copy this file and modify it. 
//////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module testbench;

parameter SYSCLK_PERIOD = 100; // 10MHz

reg SYSCLK;
reg NSYSRESET;

initial
begin
    SYSCLK = 1'b0;
    NSYSRESET = 1'b0;
end

//////////////////////////////////////////////////////////////////////
// Reset Pulse
//////////////////////////////////////////////////////////////////////
initial
begin
    #(SYSCLK_PERIOD * 10 )
        NSYSRESET = 1'b1;
end


//////////////////////////////////////////////////////////////////////
// 10MHz Clock Driver
//////////////////////////////////////////////////////////////////////
always @(SYSCLK)
    #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK;


//////////////////////////////////////////////////////////////////////
// Instantiate Unit Under Test:  final_mss0
//////////////////////////////////////////////////////////////////////
final_mss0 final_mss0_0 (
    // Inputs
    .PADDR({24{1'b0}}),
    .PSEL({1{1'b0}}),
    .PENABLE({1{1'b0}}),
    .PWRITE({1{1'b0}}),
    .PWDATA({32{1'b0}}),
    .PRDATAS0({32{1'b0}}),
    .PREADYS0({1{1'b0}}),
    .PSLVERRS0({1{1'b0}}),
    .PRDATAS1({32{1'b0}}),
    .PREADYS1({1{1'b0}}),
    .PSLVERRS1({1{1'b0}}),
    .PRDATAS2({32{1'b0}}),
    .PREADYS2({1{1'b0}}),
    .PSLVERRS2({1{1'b0}}),
    .PRDATAS3({32{1'b0}}),
    .PREADYS3({1{1'b0}}),
    .PSLVERRS3({1{1'b0}}),
    .PRDATAS4({32{1'b0}}),
    .PREADYS4({1{1'b0}}),
    .PSLVERRS4({1{1'b0}}),
    .PRDATAS5({32{1'b0}}),
    .PREADYS5({1{1'b0}}),
    .PSLVERRS5({1{1'b0}}),
    .PRDATAS6({32{1'b0}}),
    .PREADYS6({1{1'b0}}),
    .PSLVERRS6({1{1'b0}}),
    .PRDATAS7({32{1'b0}}),
    .PREADYS7({1{1'b0}}),
    .PSLVERRS7({1{1'b0}}),
    .PRDATAS8({32{1'b0}}),
    .PREADYS8({1{1'b0}}),
    .PSLVERRS8({1{1'b0}}),
    .PRDATAS9({32{1'b0}}),
    .PREADYS9({1{1'b0}}),
    .PSLVERRS9({1{1'b0}}),
    .PRDATAS10({32{1'b0}}),
    .PREADYS10({1{1'b0}}),
    .PSLVERRS10({1{1'b0}}),
    .PRDATAS11({32{1'b0}}),
    .PREADYS11({1{1'b0}}),
    .PSLVERRS11({1{1'b0}}),
    .PRDATAS12({32{1'b0}}),
    .PREADYS12({1{1'b0}}),
    .PSLVERRS12({1{1'b0}}),
    .PRDATAS13({32{1'b0}}),
    .PREADYS13({1{1'b0}}),
    .PSLVERRS13({1{1'b0}}),
    .PRDATAS14({32{1'b0}}),
    .PREADYS14({1{1'b0}}),
    .PSLVERRS14({1{1'b0}}),
    .PRDATAS15({32{1'b0}}),
    .PREADYS15({1{1'b0}}),
    .PSLVERRS15({1{1'b0}}),

    // Outputs
    .PRDATA( ),
    .PREADY( ),
    .PSLVERR( ),
    .PADDRS0( ),
    .PSELS0( ),
    .PENABLES( ),
    .PWRITES( ),
    .PWDATAS( ),
    .PADDRS( ),
    .PSELS1( ),
    .PSELS2( ),
    .PSELS3( ),
    .PSELS4( ),
    .PSELS5( ),
    .PSELS6( ),
    .PSELS7( ),
    .PSELS8( ),
    .PSELS9( ),
    .PSELS10( ),
    .PSELS11( ),
    .PSELS12( ),
    .PSELS13( ),
    .PSELS14( ),
    .PSELS15( )

    // Inouts

);

endmodule

