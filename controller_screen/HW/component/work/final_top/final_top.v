`timescale 1 ns/100 ps
// Version: 9.1 SP5 9.1.5.1


module final_top(
       UART_0_TXD,
       UART_0_RXD,
       MSS_RESET_N,
       GPIO_0_BI
    );
output UART_0_TXD;
input  UART_0_RXD;
input  MSS_RESET_N;
inout  GPIO_0_BI;

    wire GND_net, VCC_net;
    
    VCC VCC (.Y(VCC_net));
    GND GND (.Y(GND_net));
    final_mss final_mss_0 (.MSS_RESET_N(MSS_RESET_N), .M2F_RESET_N(), 
        .GPIO_0_BI(GPIO_0_BI), .UART_0_TXD(UART_0_TXD), .UART_0_RXD(
        UART_0_RXD));
    
endmodule
