//////////////////////////////////////////////////////////////////////
// Created by Actel SmartDesign Sun Dec 09 18:21:43 2012
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
// Instantiate Unit Under Test:  final_mss
//////////////////////////////////////////////////////////////////////
final_mss final_mss_0 (
    // Inputs
    .MSSPREADY({1{1'b0}}),
    .MSSPSLVERR({1{1'b0}}),
    .MSSPRDATA({32{1'b0}}),
    .UART_0_RXD({1{1'b0}}),
    .UART_1_RXD({1{1'b0}}),
    .MSS_RESET_N(NSYSRESET),

    // Outputs
    .M2F_RESET_N( ),
    .MSSPSEL( ),
    .MSSPENABLE( ),
    .MSSPWRITE( ),
    .FAB_CLK( ),
    .MSSPADDR( ),
    .MSSPWDATA( ),
    .UART_0_TXD( ),
    .UART_1_TXD( ),

    // Inouts
    .GPIO_0_BI( )

);

endmodule

