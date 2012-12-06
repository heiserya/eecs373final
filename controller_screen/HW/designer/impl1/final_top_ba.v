`timescale 1 ns/100 ps
// Version: 9.1 SP5 9.1.5.1
// File used only for Simulation


module final_top(
       MSS_RESET_N,
       GPIO_0_BI,
       pin,
       clk1us,
       clk4us
    );
input  MSS_RESET_N;
inout  GPIO_0_BI;
output pin;
output clk1us;
output clk4us;

    wire final_mss_0_FAB_CLK, clk1us_c, clk4us_c, 
        \gcn_0/a/counter[1]_net_1 , \gcn_0/a/counter[0]_net_1 , 
        \gcn_0/a/counter[3]_net_1 , \gcn_0/a/DWACT_FINC_E[0] , 
        \gcn_0/a/out6 , \gcn_0/a/nextCount[5] , \gcn_0/a/nextCount[4] , 
        \gcn_0/a/nextCount[0] , \gcn_0/a/nextCount[1] , 
        \gcn_0/a/counter[2]_net_1 , \gcn_0/a/nextCount[2] , 
        \gcn_0/a/nextCount[3] , \gcn_0/a/counter[4]_net_1 , 
        \gcn_0/a/counter[5]_net_1 , \gcn_0/a/N_4 , \gcn_0/a/N_12 , 
        \gcn_0/b/counter[1]_net_1 , \gcn_0/b/counter[0]_net_1 , 
        \gcn_0/b/counter[3]_net_1 , \gcn_0/b/DWACT_FINC_E[0] , 
        \gcn_0/b/out6 , \gcn_0/b/nextCount[5] , \gcn_0/b/nextCount[4] , 
        \gcn_0/b/nextCount[0] , \gcn_0/b/nextCount[1] , 
        \gcn_0/b/counter[2]_net_1 , \gcn_0/b/nextCount[2] , 
        \gcn_0/b/nextCount[3] , \gcn_0/b/counter[4]_net_1 , 
        \gcn_0/b/counter[5]_net_1 , \gcn_0/b/N_4 , \gcn_0/b/N_12 , 
        \final_mss_0/MSS_ADLIB_INST_EMCCLK , 
        \final_mss_0/MSS_ADLIB_INST_FCLK , 
        \final_mss_0/MSS_GPIO_0_GPIO_0_BI_Y , 
        \final_mss_0/MSS_GPIO_0_GPIO_0_BI_D , 
        \final_mss_0/MSS_GPIO_0_GPIO_0_BI_E , 
        \final_mss_0/MSS_RESET_0_MSS_RESET_N_Y , 
        \final_mss_0/MSS_ADLIB_INST_PLLLOCK , 
        \final_mss_0/MSS_CCC_0/N_CLKA_RCOSC , 
        \final_mss_0/MSS_CCC_0/I_MSSCCC/SDIN_INT , 
        \final_mss_0/MSS_CCC_0/I_MSSCCC/SCLK_INT , 
        \final_mss_0/MSS_CCC_0/I_MSSCCC/SSHIFT_INT , 
        \final_mss_0/MSS_CCC_0/I_MSSCCC/SDOUT_INT , 
        \final_mss_0/MSS_CCC_0/I_MSSCCC/EXTFB_INT , 
        \final_mss_0/MSS_CCC_0/I_MSSCCC/GLA_INT , 
        \final_mss_0/MSS_CCC_0/I_MSSCCC/LOCK_INT , 
        \final_mss_0/MSS_CCC_0/I_MSSCCC/CLKB_INT , 
        \final_mss_0/MSS_CCC_0/I_MSSCCC/GLB_INT , 
        \final_mss_0/MSS_CCC_0/I_MSSCCC/YB_INT , 
        \final_mss_0/MSS_CCC_0/I_MSSCCC/MODE_INT , 
        \final_mss_0/MSS_CCC_0/I_MSSCCC/CLKC_INT , 
        \final_mss_0/MSS_CCC_0/I_MSSCCC/SUPDATE_INT , 
        \final_mss_0/MSS_CCC_0/I_MSSCCC/GLC_INT , 
        \final_mss_0/MSS_CCC_0/I_MSSCCC/YC_INT , GLMUXINT_GND, 
        PLLEN_VCC, \pin_pad/U0/NET1 , \pin_pad/U0/NET2 , 
        \final_mss_0/MSS_ADLIB_INST/GPO[16]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[16]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[20]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[21]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[20]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[21]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[22]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[23]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[24]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[22]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[23]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[24]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[25]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[26]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[27]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[25]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[26]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[27]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[28]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[29]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[30]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[28]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[29]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[30]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[31]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI0SSO[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI0SSO[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[31]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/UART0CTSnINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/UART0DSRnINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI0SSO[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/UART0RTSnINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/UART0DTRnINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/UART0RInINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/UART0DCDnINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/UART1CTSnINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/UART1DSRnINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/UART1RInINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/UART1DCDnINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/I2C0SMBALERTNOINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/I2C0BCLKINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/I2C0SMBALERTNIINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/I2C0SMBUSNIINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/I2C1SMBALERTNOINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/I2C1BCLKINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/I2C1SMBALERTNIINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/I2C1SMBUSNIINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/UART1RTSnINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/UART1DTRnINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/TXEVINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/RXEVINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/VRONINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/CALIBININT_NET , 
        \final_mss_0/MSS_ADLIB_INST/I2C0SMBUSNOINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/I2C1SMBUSNOINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/CALIBOUTINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[0]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[0]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[8]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[8]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[9]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[10]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[11]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[9]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[10]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[11]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[12]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[13]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[14]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[12]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[13]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[14]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[15]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[16]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[15]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[16]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[0]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPREADYINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPSLVERRINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[0]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[8]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[9]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[8]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[9]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[10]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[11]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[12]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[10]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[11]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[12]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[13]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[14]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[15]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[13]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[14]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[15]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPSELINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPENABLEINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWRITEINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPSELINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPENABLEINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWRITEINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPREADYINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPSLVERRINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/DEEPSLEEPINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[20]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SLEEPINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSINT[0]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSINT[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[21]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[22]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[23]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSINT[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSINT[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSINT[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[24]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[25]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[26]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSINT[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/M2FRESETnINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSINT[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[27]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[28]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[29]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[0]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSINT[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/WDINTINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[30]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[31]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[0]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[8]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[9]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[8]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[9]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[10]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[11]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[12]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[10]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[11]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[12]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[13]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[14]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[15]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[13]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[14]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[15]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[16]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[16]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[20]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[21]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[20]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[21]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[22]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[23]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[24]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[22]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[23]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[24]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[25]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[26]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[27]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[25]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[26]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[27]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[28]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[29]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[30]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[28]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[29]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[30]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[31]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[31]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABINTINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/F2MRESETnINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/DMAREADY[0]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/DMAREADY[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[16]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[16]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[20]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[21]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[20]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[21]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[22]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[23]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[24]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[22]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[23]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[24]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[25]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[26]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[27]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[25]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[26]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[27]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[28]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[29]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[30]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[28]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[29]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[30]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[31]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SYNCCLKFDBKINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[31]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/LVTTL0INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/LVTTL1INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/LVTTL2INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/LVTTL0ENINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/LVTTL1ENINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/LVTTL2ENINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/LVTTL3INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/LVTTL4INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/LVTTL5INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/LVTTL3ENINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/LVTTL4ENINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/LVTTL5ENINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/LVTTL6INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/LVTTL7INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/LVTTL6ENINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/LVTTL7ENINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/CMP0INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/CMP1INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/CMP2INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/CMP3INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/CMP4INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/CMP5INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABSDD0DINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABSDD1DINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/CMP6INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/CMP7INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABACETRIGINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABSDD0CLKINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABSDD1CLKINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[0]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[8]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[9]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[10]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[11]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[12]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[13]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[14]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[15]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[16]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[20]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[21]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[22]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[23]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[24]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[25]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[26]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[27]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[28]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[29]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[30]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[31]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/VCC15GOODINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/VCC33GOODINT_NET , 
        \final_mss_0/MSS_ADLIB_INST/PUFABnINT_NET , 
        \clk1us_pad/U0/NET1 , \clk1us_pad/U0/NET2 , 
        \clk4us_pad/U0/NET1 , \clk4us_pad/U0/NET2 , AFLSDF_VCC, 
        AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GLMUXINT_GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign PLLEN_VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_30  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[1]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[0]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[2]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[0]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[1]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[2]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_43  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[19]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[18]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[20]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/FABPREADYINT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/FABPSLVERRINT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/DEEPSLEEPINT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_90  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[29]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[28]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[30]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[28]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[29]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[30]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_81  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[17]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[18]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[19]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_51  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[11]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[10]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[12]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[10]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[11]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[12]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_33  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[10]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[9]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[11]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[9]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[10]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[11]INT_NET ));
    AX1C \gcn_0/a/nextCount_I_20  (.A(\gcn_0/a/counter[3]_net_1 ), .B(
        \gcn_0/a/DWACT_FINC_E[0] ), .C(\gcn_0/a/counter[4]_net_1 ), .Y(
        \gcn_0/a/nextCount[4] ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_93  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/I2C0SMBUSNOINT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/I2C1SMBUSNOINT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/CALIBOUTINT_NET ));
    AND3 \gcn_0/b/nextCount_I_12  (.A(\gcn_0/b/counter[0]_net_1 ), .B(
        \gcn_0/b/counter[1]_net_1 ), .C(\gcn_0/b/counter[2]_net_1 ), 
        .Y(\gcn_0/b/N_12 ));
    AX1C \gcn_0/b/nextCount_I_9  (.A(\gcn_0/b/counter[1]_net_1 ), .B(
        \gcn_0/b/counter[0]_net_1 ), .C(\gcn_0/b/counter[2]_net_1 ), 
        .Y(\gcn_0/b/nextCount[2] ));
    AND3 \gcn_0/a/nextCount_I_12  (.A(\gcn_0/a/counter[0]_net_1 ), .B(
        \gcn_0/a/counter[1]_net_1 ), .C(\gcn_0/a/counter[2]_net_1 ), 
        .Y(\gcn_0/a/N_12 ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_42  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPENABLEINT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPSELINT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWRITEINT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPSELINT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPENABLEINT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWRITEINT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_32  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[7]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[6]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[8]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[6]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[7]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[8]INT_NET ));
    XOR2 \gcn_0/a/nextCount_I_5  (.A(\gcn_0/a/counter[0]_net_1 ), .B(
        \gcn_0/a/counter[1]_net_1 ), .Y(\gcn_0/a/nextCount[1] ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_92  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        GLMUXINT_GND), .PIN2INT(GLMUXINT_GND), .PIN3INT(GLMUXINT_GND));
    XOR2 \gcn_0/b/nextCount_I_24  (.A(\gcn_0/b/N_4 ), .B(
        \gcn_0/b/counter[5]_net_1 ), .Y(\gcn_0/b/nextCount[5] ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_86  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[17]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[16]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[18]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[16]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[17]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[18]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_56  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[26]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[25]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[27]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[25]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[26]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[27]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_45  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[25]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[24]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[26]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSINT[2]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSINT[3]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSINT[4]INT_NET ));
    IOPAD_TRI \clk1us_pad/U0/U0  (.D(\clk1us_pad/U0/NET1 ), .E(
        \clk1us_pad/U0/NET2 ), .PAD(clk1us));
    NOR2 \gcn_0/b/out6lto5  (.A(\gcn_0/b/nextCount[5] ), .B(
        \gcn_0/b/nextCount[4] ), .Y(\gcn_0/b/out6 ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_35  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[16]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[15]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[17]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[15]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[16]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[17]INT_NET ));
    DFN1 \gcn_0/a/out  (.D(\gcn_0/a/out6 ), .CLK(final_mss_0_FAB_CLK), 
        .Q(clk1us_c));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_95  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/I2C1SMBALERTNIINT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/I2C1BCLKINT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/I2C1SMBUSNIINT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[6]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[7]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/I2C1SMBALERTNOINT_NET ));
    IOTRI_OB_EB \pin_pad/U0/U1  (.D(GLMUXINT_GND), .E(PLLEN_VCC), 
        .DOUT(\pin_pad/U0/NET1 ), .EOUT(\pin_pad/U0/NET2 ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_49  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[5]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[4]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[6]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[4]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[5]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[6]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_39  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[8]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[7]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[9]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[7]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[8]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[9]INT_NET ));
    DFN1 \gcn_0/a/counter[4]  (.D(\gcn_0/a/nextCount[4] ), .CLK(
        final_mss_0_FAB_CLK), .Q(\gcn_0/a/counter[4]_net_1 ));
    DFN1 \gcn_0/b/counter[3]  (.D(\gcn_0/b/nextCount[3] ), .CLK(
        final_mss_0_FAB_CLK), .Q(\gcn_0/b/counter[3]_net_1 ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_47  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[31]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[30]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[0]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[0]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSINT[7]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/WDINTINT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_37  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[2]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[1]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[3]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[1]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[2]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[3]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_48  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[2]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[1]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[3]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[1]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[2]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[3]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_73  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABACETRIGINT_NET ), .PIN6INT(), 
        .PIN1INT(\final_mss_0/MSS_ADLIB_INST/CMP6INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/CMP7INT_NET ), .PIN3INT(
        GLMUXINT_GND));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_38  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[5]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[4]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[6]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[4]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[5]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[6]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_2  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(\final_mss_0/MSS_ADLIB_INST/GPI[17]INT_NET ), 
        .PIN5INT(\final_mss_0/MSS_ADLIB_INST/GPI[16]INT_NET ), 
        .PIN6INT(\final_mss_0/MSS_ADLIB_INST/GPI[18]INT_NET ), 
        .PIN1INT(\final_mss_0/MSS_ADLIB_INST/GPO[16]INT_NET ), 
        .PIN2INT(\final_mss_0/MSS_ADLIB_INST/GPO[17]INT_NET ), 
        .PIN3INT(\final_mss_0/MSS_ADLIB_INST/GPO[18]INT_NET ));
    AX1C \gcn_0/a/nextCount_I_9  (.A(\gcn_0/a/counter[1]_net_1 ), .B(
        \gcn_0/a/counter[0]_net_1 ), .C(\gcn_0/a/counter[2]_net_1 ), 
        .Y(\gcn_0/a/nextCount[2] ));
    XOR2 \gcn_0/b/nextCount_I_5  (.A(\gcn_0/b/counter[0]_net_1 ), .B(
        \gcn_0/b/counter[1]_net_1 ), .Y(\gcn_0/b/nextCount[1] ));
    AND3 \gcn_0/a/nextCount_I_23  (.A(\gcn_0/a/DWACT_FINC_E[0] ), .B(
        \gcn_0/a/counter[3]_net_1 ), .C(\gcn_0/a/counter[4]_net_1 ), 
        .Y(\gcn_0/a/N_4 ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_72  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(\final_mss_0/MSS_ADLIB_INST/FABSDD1DINT_NET )
        , .PIN5INT(\final_mss_0/MSS_ADLIB_INST/FABSDD0DINT_NET ), 
        .PIN6INT(), .PIN1INT(\final_mss_0/MSS_ADLIB_INST/CMP3INT_NET ), 
        .PIN2INT(\final_mss_0/MSS_ADLIB_INST/CMP4INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/CMP5INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_75  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        GLMUXINT_GND), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[0]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[1]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_60  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABINTINT_NET ), .PIN6INT(), 
        .PIN1INT(GLMUXINT_GND), .PIN2INT(GLMUXINT_GND), .PIN3INT(
        GLMUXINT_GND));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_44  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[22]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[21]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[23]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/SLEEPINT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSINT[0]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSINT[1]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_34  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[13]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[12]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[14]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[12]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[13]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[14]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_63  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/VCC15GOODINT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/VCC33GOODINT_NET ), .PIN3INT(
        GLMUXINT_GND));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_4  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(\final_mss_0/MSS_ADLIB_INST/GPI[23]INT_NET ), 
        .PIN5INT(\final_mss_0/MSS_ADLIB_INST/GPI[22]INT_NET ), 
        .PIN6INT(\final_mss_0/MSS_ADLIB_INST/GPI[24]INT_NET ), 
        .PIN1INT(\final_mss_0/MSS_ADLIB_INST/GPO[22]INT_NET ), 
        .PIN2INT(\final_mss_0/MSS_ADLIB_INST/GPO[23]INT_NET ), 
        .PIN3INT(\final_mss_0/MSS_ADLIB_INST/GPO[24]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_94  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/I2C0SMBALERTNIINT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/I2C0BCLKINT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/I2C0SMBUSNIINT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[4]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[5]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/I2C0SMBALERTNOINT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_3  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(\final_mss_0/MSS_ADLIB_INST/GPI[20]INT_NET ), 
        .PIN5INT(\final_mss_0/MSS_ADLIB_INST/GPI[19]INT_NET ), 
        .PIN6INT(\final_mss_0/MSS_ADLIB_INST/GPI[21]INT_NET ), 
        .PIN1INT(\final_mss_0/MSS_ADLIB_INST/GPO[19]INT_NET ), 
        .PIN2INT(\final_mss_0/MSS_ADLIB_INST/GPO[20]INT_NET ), 
        .PIN3INT(\final_mss_0/MSS_ADLIB_INST/GPO[21]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_9  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(\final_mss_0/MSS_ADLIB_INST/UART1RInINT_NET )
        , .PIN5INT(\final_mss_0/MSS_ADLIB_INST/UART1DSRnINT_NET ), 
        .PIN6INT(\final_mss_0/MSS_ADLIB_INST/UART1DCDnINT_NET ), 
        .PIN1INT(\final_mss_0/MSS_ADLIB_INST/SPI1SSO[1]INT_NET ), 
        .PIN2INT(\final_mss_0/MSS_ADLIB_INST/SPI1SSO[2]INT_NET ), 
        .PIN3INT(\final_mss_0/MSS_ADLIB_INST/SPI1SSO[3]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_41  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[14]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[13]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[15]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[13]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[14]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[15]INT_NET ));
    XOR2 \gcn_0/a/nextCount_I_24  (.A(\gcn_0/a/N_4 ), .B(
        \gcn_0/a/counter[5]_net_1 ), .Y(\gcn_0/a/nextCount[5] ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_79  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[11]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[12]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[13]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_31  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[4]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[3]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[5]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[3]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[4]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[5]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_91  (.PIN4(
        final_mss_0_FAB_CLK), .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), 
        .PIN1(), .PIN2(), .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/SYNCCLKFDBKINT_NET ), .PIN5INT(), 
        .PIN6INT(\final_mss_0/MSS_ADLIB_INST/FABPWDATA[31]INT_NET ), 
        .PIN1INT(\final_mss_0/MSS_ADLIB_INST/FABPRDATA[31]INT_NET ), 
        .PIN2INT(GLMUXINT_GND), .PIN3INT(GLMUXINT_GND));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_62  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(\final_mss_0/MSS_ADLIB_INST/LVTTL1ENINT_NET )
        , .PIN5INT(\final_mss_0/MSS_ADLIB_INST/LVTTL0ENINT_NET ), 
        .PIN6INT(\final_mss_0/MSS_ADLIB_INST/LVTTL2ENINT_NET ), 
        .PIN1INT(\final_mss_0/MSS_ADLIB_INST/LVTTL0INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/LVTTL1INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/LVTTL2INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_77  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[5]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[6]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[7]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_78  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[8]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[9]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[10]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_65  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/PUFABnINT_NET ), .PIN2INT(
        GLMUXINT_GND), .PIN3INT(GLMUXINT_GND));
    MSS_CCC_GL_IF \final_mss_0/MSS_CCC_0/I_MSSCCC/U_TILE1  (.PIN2(
        GLMUXINT_GND), .PIN3(GLMUXINT_GND), .PIN4(GLMUXINT_GND), .PIN1(
        ), .PIN5(), .PIN2INT(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/EXTFB_INT ), .PIN3INT(), 
        .PIN4INT(), .PIN1INT(\final_mss_0/MSS_CCC_0/I_MSSCCC/LOCK_INT )
        , .PIN5INT(\final_mss_0/MSS_CCC_0/I_MSSCCC/GLA_INT ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_46  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[28]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[27]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[29]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSINT[5]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/M2FRESETnINT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSINT[6]INT_NET ));
    IOTRI_OB_EB \clk4us_pad/U0/U1  (.D(clk4us_c), .E(PLLEN_VCC), .DOUT(
        \clk4us_pad/U0/NET1 ), .EOUT(\clk4us_pad/U0/NET2 ));
    NOR2 \gcn_0/a/out6lto5  (.A(\gcn_0/a/nextCount[5] ), .B(
        \gcn_0/a/nextCount[4] ), .Y(\gcn_0/a/out6 ));
    DFN1 \gcn_0/a/counter[3]  (.D(\gcn_0/a/nextCount[3] ), .CLK(
        final_mss_0_FAB_CLK), .Q(\gcn_0/a/counter[3]_net_1 ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_36  (.PIN4(GLMUXINT_GND), 
        .PIN5(PLLEN_VCC), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), .PIN3(
        ), .PIN4INT(\final_mss_0/MSS_ADLIB_INST/MSSPSLVERRINT_NET ), 
        .PIN5INT(\final_mss_0/MSS_ADLIB_INST/MSSPREADYINT_NET ), 
        .PIN6INT(\final_mss_0/MSS_ADLIB_INST/MSSPRDATA[0]INT_NET ), 
        .PIN1INT(\final_mss_0/MSS_ADLIB_INST/MSSPADDR[18]INT_NET ), 
        .PIN2INT(\final_mss_0/MSS_ADLIB_INST/MSSPADDR[19]INT_NET ), 
        .PIN3INT(\final_mss_0/MSS_ADLIB_INST/MSSPWDATA[0]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_80  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[14]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[15]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[16]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_50  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[8]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[7]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[9]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[7]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[8]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[9]INT_NET ));
    IOPAD_TRI \clk4us_pad/U0/U0  (.D(\clk4us_pad/U0/NET1 ), .E(
        \clk4us_pad/U0/NET2 ), .PAD(clk4us));
    INV \gcn_0/b/nextCount_I_4  (.A(\gcn_0/b/counter[0]_net_1 ), .Y(
        \gcn_0/b/nextCount[0] ));
    MSS_CCC_IF \final_mss_0/MSS_CCC_0/I_MSSCCC/U_TILE0  (.PIN2(
        GLMUXINT_GND), .PIN3(GLMUXINT_GND), .PIN4(GLMUXINT_GND), .PIN1(
        ), .PIN2INT(\final_mss_0/MSS_CCC_0/I_MSSCCC/SDIN_INT ), 
        .PIN3INT(\final_mss_0/MSS_CCC_0/I_MSSCCC/SCLK_INT ), .PIN4INT(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/SSHIFT_INT ), .PIN1INT(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/SDOUT_INT ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_83  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[23]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[24]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[25]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_53  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[17]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[16]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[18]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[16]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[17]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[18]INT_NET ));
    DFN1 \gcn_0/b/counter[0]  (.D(\gcn_0/b/nextCount[0] ), .CLK(
        final_mss_0_FAB_CLK), .Q(\gcn_0/b/counter[0]_net_1 ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_67  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        GLMUXINT_GND), .PIN2INT(GLMUXINT_GND), .PIN3INT(GLMUXINT_GND));
    DFN1 \gcn_0/b/counter[1]  (.D(\gcn_0/b/nextCount[1] ), .CLK(
        final_mss_0_FAB_CLK), .Q(\gcn_0/b/counter[1]_net_1 ));
    IOTRI_OB_EB \clk1us_pad/U0/U1  (.D(clk1us_c), .E(PLLEN_VCC), .DOUT(
        \clk1us_pad/U0/NET1 ), .EOUT(\clk1us_pad/U0/NET2 ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_74  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABSDD1CLKINT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABSDD0CLKINT_NET ), .PIN6INT(), 
        .PIN1INT(GLMUXINT_GND), .PIN2INT(GLMUXINT_GND), .PIN3INT(
        GLMUXINT_GND));
    DFN1 \gcn_0/b/out  (.D(\gcn_0/b/out6 ), .CLK(final_mss_0_FAB_CLK), 
        .Q(clk4us_c));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_82  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[20]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[21]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[22]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_7  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/UART0CTSnINT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/GPI[31]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/UART0DSRnINT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/GPO[31]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/SPI0SSO[1]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/SPI0SSO[2]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_52  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[14]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[13]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[15]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[13]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[14]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[15]INT_NET ));
    MSS_APB_IP #( .ACT_CONFIG(128), .ACT_FCLK(64000000), .ACT_DIE("IP4X3M1")
        , .ACT_PKG("fg484") )  \final_mss_0/MSS_ADLIB_INST/U_CORE  (
        .FCLK(\final_mss_0/MSS_ADLIB_INST_FCLK ), .MACCLKCCC(
        GLMUXINT_GND), .RCOSC(GLMUXINT_GND), .MACCLK(GLMUXINT_GND), 
        .PLLLOCK(\final_mss_0/MSS_ADLIB_INST_PLLLOCK ), .MSSRESETn(
        \final_mss_0/MSS_RESET_0_MSS_RESET_N_Y ), .GPOE({nc0, nc1, nc2, 
        nc3, nc4, nc5, nc6, nc7, nc8, nc9, nc10, nc11, nc12, nc13, 
        nc14, nc15, nc16, nc17, nc18, nc19, nc20, nc21, nc22, nc23, 
        nc24, nc25, nc26, nc27, nc28, nc29, nc30, 
        \final_mss_0/MSS_GPIO_0_GPIO_0_BI_E }), .SPI0DO(), .SPI0DOE(), 
        .SPI0DI(GLMUXINT_GND), .SPI0CLKI(GLMUXINT_GND), .SPI0CLKO(), 
        .SPI0MODE(), .SPI0SSI(GLMUXINT_GND), .SPI0SSO({nc31, nc32, 
        nc33, nc34, \final_mss_0/MSS_ADLIB_INST/SPI0SSO[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI0SSO[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI0SSO[1]INT_NET , nc35}), 
        .UART0TXD(), .UART0RXD(GLMUXINT_GND), .I2C0SDAI(GLMUXINT_GND), 
        .I2C0SDAO(), .I2C0SCLI(GLMUXINT_GND), .I2C0SCLO(), .SPI1DO(), 
        .SPI1DOE(), .SPI1DI(GLMUXINT_GND), .SPI1CLKI(GLMUXINT_GND), 
        .SPI1CLKO(), .SPI1MODE(), .SPI1SSI(GLMUXINT_GND), .SPI1SSO({
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/SPI1SSO[1]INT_NET , nc36}), 
        .UART1TXD(), .UART1RXD(GLMUXINT_GND), .I2C1SDAI(GLMUXINT_GND), 
        .I2C1SDAO(), .I2C1SCLI(GLMUXINT_GND), .I2C1SCLO(), .MACTXD({
        nc37, nc38}), .MACRXD({GLMUXINT_GND, GLMUXINT_GND}), .MACTXEN()
        , .MACCRSDV(GLMUXINT_GND), .MACRXER(GLMUXINT_GND), .MACMDI(
        GLMUXINT_GND), .MACMDO(), .MACMDEN(), .MACMDC(), .EMCCLK(
        \final_mss_0/MSS_ADLIB_INST_EMCCLK ), .EMCCLKRTN(
        \final_mss_0/MSS_ADLIB_INST_EMCCLK ), .EMCRDB({GLMUXINT_GND, 
        GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND, 
        GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND, 
        GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND, 
        GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND}), .EMCAB({nc39, nc40, 
        nc41, nc42, nc43, nc44, nc45, nc46, nc47, nc48, nc49, nc50, 
        nc51, nc52, nc53, nc54, nc55, nc56, nc57, nc58, nc59, nc60, 
        nc61, nc62, nc63, nc64}), .EMCWDB({nc65, nc66, nc67, nc68, 
        nc69, nc70, nc71, nc72, nc73, nc74, nc75, nc76, nc77, nc78, 
        nc79, nc80}), .EMCRWn(), .EMCCS0n(), .EMCCS1n(), .EMCOEN0n(), 
        .EMCOEN1n(), .EMCBYTEN({nc81, nc82}), .EMCDBOE(), .ADC0(
        GLMUXINT_GND), .ADC1(GLMUXINT_GND), .ADC2(GLMUXINT_GND), .ADC3(
        GLMUXINT_GND), .ADC4(GLMUXINT_GND), .ADC5(GLMUXINT_GND), .ADC6(
        GLMUXINT_GND), .ADC7(GLMUXINT_GND), .ADC8(GLMUXINT_GND), .ADC9(
        GLMUXINT_GND), .ADC10(GLMUXINT_GND), .ADC11(GLMUXINT_GND), 
        .SDD0(), .SDD1(), .SDD2(), .ABPS0(GLMUXINT_GND), .ABPS1(
        GLMUXINT_GND), .ABPS2(GLMUXINT_GND), .ABPS3(GLMUXINT_GND), 
        .ABPS4(GLMUXINT_GND), .ABPS5(GLMUXINT_GND), .ABPS6(
        GLMUXINT_GND), .ABPS7(GLMUXINT_GND), .ABPS8(GLMUXINT_GND), 
        .ABPS9(GLMUXINT_GND), .ABPS10(GLMUXINT_GND), .ABPS11(
        GLMUXINT_GND), .TM0(GLMUXINT_GND), .TM1(GLMUXINT_GND), .TM2(
        GLMUXINT_GND), .TM3(GLMUXINT_GND), .TM4(GLMUXINT_GND), .TM5(
        GLMUXINT_GND), .CM0(GLMUXINT_GND), .CM1(GLMUXINT_GND), .CM2(
        GLMUXINT_GND), .CM3(GLMUXINT_GND), .CM4(GLMUXINT_GND), .CM5(
        GLMUXINT_GND), .GNDTM0(GLMUXINT_GND), .GNDTM1(GLMUXINT_GND), 
        .GNDTM2(GLMUXINT_GND), .VAREF0(GLMUXINT_GND), .VAREF1(
        GLMUXINT_GND), .VAREF2(GLMUXINT_GND), .VAREFOUT(), .GNDVAREF(
        GLMUXINT_GND), .PUn(GLMUXINT_GND), .MSSPADDR({
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[16]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[15]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[14]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[13]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[12]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[11]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[10]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[9]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[8]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPADDR[0]INT_NET }), .MSSPWDATA({
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[31]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[30]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[29]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[28]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[27]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[26]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[25]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[24]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[23]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[22]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[21]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[20]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[16]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[15]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[14]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[13]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[12]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[11]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[10]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[9]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[8]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[0]INT_NET }), .MSSPRDATA({
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[31]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[30]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[29]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[28]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[27]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[26]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[25]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[24]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[23]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[22]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[21]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[20]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[16]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[15]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[14]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[13]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[12]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[11]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[10]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[9]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[8]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[0]INT_NET }), .FABPADDR({
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[31]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[30]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[29]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[28]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[27]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[26]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[25]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[24]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[23]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[22]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[21]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[20]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[16]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[15]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[14]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[13]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[12]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[11]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[10]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[9]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[8]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPADDR[0]INT_NET }), .FABPWDATA({
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[31]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[30]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[29]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[28]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[27]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[26]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[25]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[24]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[23]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[22]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[21]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[20]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[16]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[15]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[14]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[13]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[12]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[11]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[10]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[9]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[8]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[0]INT_NET }), .FABPRDATA({
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[31]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[30]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[29]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[28]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[27]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[26]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[25]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[24]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[23]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[22]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[21]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[20]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[16]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[15]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[14]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[13]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[12]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[11]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[10]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[9]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[8]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[0]INT_NET }), .DMAREADY({
        \final_mss_0/MSS_ADLIB_INST/DMAREADY[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/DMAREADY[0]INT_NET }), .MSSINT({
        \final_mss_0/MSS_ADLIB_INST/MSSINT[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSINT[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSINT[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSINT[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSINT[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSINT[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSINT[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/MSSINT[0]INT_NET }), .GPI({
        \final_mss_0/MSS_ADLIB_INST/GPI[31]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[30]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[29]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[28]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[27]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[26]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[25]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[24]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[23]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[22]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[21]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[20]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPI[16]INT_NET , GLMUXINT_GND, 
        GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND, 
        GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND, 
        GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND, 
        GLMUXINT_GND, GLMUXINT_GND, 
        \final_mss_0/MSS_GPIO_0_GPIO_0_BI_Y }), .GPO({
        \final_mss_0/MSS_ADLIB_INST/GPO[31]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[30]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[29]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[28]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[27]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[26]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[25]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[24]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[23]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[22]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[21]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[20]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/GPO[16]INT_NET , nc83, nc84, nc85, 
        nc86, nc87, nc88, nc89, nc90, nc91, nc92, nc93, nc94, nc95, 
        nc96, nc97, \final_mss_0/MSS_GPIO_0_GPIO_0_BI_D }), .MACM2FTXD({
        nc98, nc99}), .MACF2MRXD({GLMUXINT_GND, GLMUXINT_GND}), 
        .ACEFLAGS({\final_mss_0/MSS_ADLIB_INST/ACEFLAGS[31]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[30]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[29]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[28]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[27]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[26]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[25]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[24]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[23]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[22]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[21]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[20]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[19]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[18]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[17]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[16]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[15]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[14]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[13]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[12]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[11]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[10]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[9]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[8]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[7]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[6]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[5]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[4]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[3]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[2]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[1]INT_NET , 
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[0]INT_NET }), .UART0CTSn(
        \final_mss_0/MSS_ADLIB_INST/UART0CTSnINT_NET ), .UART0DSRn(
        \final_mss_0/MSS_ADLIB_INST/UART0DSRnINT_NET ), .UART0RTSn(
        \final_mss_0/MSS_ADLIB_INST/UART0RTSnINT_NET ), .UART0DTRn(
        \final_mss_0/MSS_ADLIB_INST/UART0DTRnINT_NET ), .UART0RIn(
        \final_mss_0/MSS_ADLIB_INST/UART0RInINT_NET ), .UART0DCDn(
        \final_mss_0/MSS_ADLIB_INST/UART0DCDnINT_NET ), .UART1CTSn(
        \final_mss_0/MSS_ADLIB_INST/UART1CTSnINT_NET ), .UART1DSRn(
        \final_mss_0/MSS_ADLIB_INST/UART1DSRnINT_NET ), .UART1RIn(
        \final_mss_0/MSS_ADLIB_INST/UART1RInINT_NET ), .UART1DCDn(
        \final_mss_0/MSS_ADLIB_INST/UART1DCDnINT_NET ), 
        .I2C0SMBALERTNO(
        \final_mss_0/MSS_ADLIB_INST/I2C0SMBALERTNOINT_NET ), .I2C0BCLK(
        \final_mss_0/MSS_ADLIB_INST/I2C0BCLKINT_NET ), .I2C0SMBALERTNI(
        \final_mss_0/MSS_ADLIB_INST/I2C0SMBALERTNIINT_NET ), 
        .I2C0SMBUSNI(\final_mss_0/MSS_ADLIB_INST/I2C0SMBUSNIINT_NET ), 
        .I2C1SMBALERTNO(
        \final_mss_0/MSS_ADLIB_INST/I2C1SMBALERTNOINT_NET ), .I2C1BCLK(
        \final_mss_0/MSS_ADLIB_INST/I2C1BCLKINT_NET ), .I2C1SMBALERTNI(
        \final_mss_0/MSS_ADLIB_INST/I2C1SMBALERTNIINT_NET ), 
        .I2C1SMBUSNI(\final_mss_0/MSS_ADLIB_INST/I2C1SMBUSNIINT_NET ), 
        .UART1RTSn(\final_mss_0/MSS_ADLIB_INST/UART1RTSnINT_NET ), 
        .UART1DTRn(\final_mss_0/MSS_ADLIB_INST/UART1DTRnINT_NET ), 
        .TXEV(\final_mss_0/MSS_ADLIB_INST/TXEVINT_NET ), .RXEV(
        \final_mss_0/MSS_ADLIB_INST/RXEVINT_NET ), .VRON(
        \final_mss_0/MSS_ADLIB_INST/VRONINT_NET ), .MACM2FTXEN(), 
        .MACF2MCRSDV(GLMUXINT_GND), .MACM2FMDEN(), .MACF2MRXER(
        GLMUXINT_GND), .MACM2FMDO(), .MACF2MMDI(GLMUXINT_GND), 
        .MACM2FMDC(), .I2C0SMBUSNO(
        \final_mss_0/MSS_ADLIB_INST/I2C0SMBUSNOINT_NET ), .I2C1SMBUSNO(
        \final_mss_0/MSS_ADLIB_INST/I2C1SMBUSNOINT_NET ), .CALIBOUT(
        \final_mss_0/MSS_ADLIB_INST/CALIBOUTINT_NET ), .CALIBIN(
        \final_mss_0/MSS_ADLIB_INST/CALIBININT_NET ), .LVTTL0(
        \final_mss_0/MSS_ADLIB_INST/LVTTL0INT_NET ), .LVTTL1(
        \final_mss_0/MSS_ADLIB_INST/LVTTL1INT_NET ), .LVTTL2(
        \final_mss_0/MSS_ADLIB_INST/LVTTL2INT_NET ), .LVTTL0EN(
        \final_mss_0/MSS_ADLIB_INST/LVTTL0ENINT_NET ), .LVTTL1EN(
        \final_mss_0/MSS_ADLIB_INST/LVTTL1ENINT_NET ), .LVTTL2EN(
        \final_mss_0/MSS_ADLIB_INST/LVTTL2ENINT_NET ), .LVTTL3(
        \final_mss_0/MSS_ADLIB_INST/LVTTL3INT_NET ), .LVTTL4(
        \final_mss_0/MSS_ADLIB_INST/LVTTL4INT_NET ), .LVTTL5(
        \final_mss_0/MSS_ADLIB_INST/LVTTL5INT_NET ), .LVTTL3EN(
        \final_mss_0/MSS_ADLIB_INST/LVTTL3ENINT_NET ), .LVTTL4EN(
        \final_mss_0/MSS_ADLIB_INST/LVTTL4ENINT_NET ), .LVTTL5EN(
        \final_mss_0/MSS_ADLIB_INST/LVTTL5ENINT_NET ), .LVTTL6(
        \final_mss_0/MSS_ADLIB_INST/LVTTL6INT_NET ), .LVTTL7(
        \final_mss_0/MSS_ADLIB_INST/LVTTL7INT_NET ), .LVTTL8(), 
        .LVTTL6EN(\final_mss_0/MSS_ADLIB_INST/LVTTL6ENINT_NET ), 
        .LVTTL7EN(\final_mss_0/MSS_ADLIB_INST/LVTTL7ENINT_NET ), 
        .LVTTL8EN(), .LVTTL9(), .LVTTL10(), .LVTTL11(), .LVTTL9EN(), 
        .LVTTL10EN(), .LVTTL11EN(), .CMP0(
        \final_mss_0/MSS_ADLIB_INST/CMP0INT_NET ), .CMP1(
        \final_mss_0/MSS_ADLIB_INST/CMP1INT_NET ), .CMP2(
        \final_mss_0/MSS_ADLIB_INST/CMP2INT_NET ), .CMP3(
        \final_mss_0/MSS_ADLIB_INST/CMP3INT_NET ), .CMP4(
        \final_mss_0/MSS_ADLIB_INST/CMP4INT_NET ), .CMP5(
        \final_mss_0/MSS_ADLIB_INST/CMP5INT_NET ), .FABSDD0D(
        \final_mss_0/MSS_ADLIB_INST/FABSDD0DINT_NET ), .FABSDD1D(
        \final_mss_0/MSS_ADLIB_INST/FABSDD1DINT_NET ), .FABSDD2D(), 
        .CMP6(\final_mss_0/MSS_ADLIB_INST/CMP6INT_NET ), .CMP7(
        \final_mss_0/MSS_ADLIB_INST/CMP7INT_NET ), .CMP8(), 
        .FABACETRIG(\final_mss_0/MSS_ADLIB_INST/FABACETRIGINT_NET ), 
        .CMP9(), .FABSDD0CLK(
        \final_mss_0/MSS_ADLIB_INST/FABSDD0CLKINT_NET ), .FABSDD1CLK(
        \final_mss_0/MSS_ADLIB_INST/FABSDD1CLKINT_NET ), .FABSDD2CLK(), 
        .VCC15GOOD(\final_mss_0/MSS_ADLIB_INST/VCC15GOODINT_NET ), 
        .VCC33GOOD(\final_mss_0/MSS_ADLIB_INST/VCC33GOODINT_NET ), 
        .PUFABn(\final_mss_0/MSS_ADLIB_INST/PUFABnINT_NET ), 
        .MSSPREADY(\final_mss_0/MSS_ADLIB_INST/MSSPREADYINT_NET ), 
        .MSSPSLVERR(\final_mss_0/MSS_ADLIB_INST/MSSPSLVERRINT_NET ), 
        .MSSPSEL(\final_mss_0/MSS_ADLIB_INST/MSSPSELINT_NET ), 
        .MSSPENABLE(\final_mss_0/MSS_ADLIB_INST/MSSPENABLEINT_NET ), 
        .MSSPWRITE(\final_mss_0/MSS_ADLIB_INST/MSSPWRITEINT_NET ), 
        .FABPSEL(\final_mss_0/MSS_ADLIB_INST/FABPSELINT_NET ), 
        .FABPENABLE(\final_mss_0/MSS_ADLIB_INST/FABPENABLEINT_NET ), 
        .FABPWRITE(\final_mss_0/MSS_ADLIB_INST/FABPWRITEINT_NET ), 
        .FABPREADY(\final_mss_0/MSS_ADLIB_INST/FABPREADYINT_NET ), 
        .FABPSLVERR(\final_mss_0/MSS_ADLIB_INST/FABPSLVERRINT_NET ), 
        .DEEPSLEEP(\final_mss_0/MSS_ADLIB_INST/DEEPSLEEPINT_NET ), 
        .SLEEP(\final_mss_0/MSS_ADLIB_INST/SLEEPINT_NET ), .M2FRESETn(
        \final_mss_0/MSS_ADLIB_INST/M2FRESETnINT_NET ), .WDINT(
        \final_mss_0/MSS_ADLIB_INST/WDINTINT_NET ), .FABINT(
        \final_mss_0/MSS_ADLIB_INST/FABINTINT_NET ), .F2MRESETn(
        \final_mss_0/MSS_ADLIB_INST/F2MRESETnINT_NET ), .SYNCCLKFDBK(
        \final_mss_0/MSS_ADLIB_INST/SYNCCLKFDBKINT_NET ), .CMP10(), 
        .CMP11());
    RCOSC \final_mss_0/MSS_CCC_0/I_RCOSC  (.CLKOUT(
        \final_mss_0/MSS_CCC_0/N_CLKA_RCOSC ));
    DFN1 \gcn_0/b/counter[4]  (.D(\gcn_0/b/nextCount[4] ), .CLK(
        final_mss_0_FAB_CLK), .Q(\gcn_0/b/counter[4]_net_1 ));
    MSS_CCC_GL_IF \final_mss_0/MSS_CCC_0/I_MSSCCC/U_TILE2  (.PIN2(
        GLMUXINT_GND), .PIN3(GLMUXINT_GND), .PIN4(GLMUXINT_GND), .PIN1(
        ), .PIN5(final_mss_0_FAB_CLK), .PIN2INT(), .PIN3INT(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/CLKB_INT ), .PIN4INT(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/MODE_INT ), .PIN1INT(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/YB_INT ), .PIN5INT(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/GLB_INT ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_85  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[29]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[30]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[31]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_71  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/CMP0INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/CMP1INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/CMP2INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_55  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[23]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[22]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[24]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[22]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[23]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[24]INT_NET ));
    AX1C \gcn_0/b/nextCount_I_20  (.A(\gcn_0/b/counter[3]_net_1 ), .B(
        \gcn_0/b/DWACT_FINC_E[0] ), .C(\gcn_0/b/counter[4]_net_1 ), .Y(
        \gcn_0/b/nextCount[4] ));
    MSS_CCC_IP #( .VCOFREQUENCY(64.000000) )  
        \final_mss_0/MSS_CCC_0/I_MSSCCC/U_MSSCCC  (.CLKA(
        \final_mss_0/MSS_CCC_0/N_CLKA_RCOSC ), .EXTFB(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/EXTFB_INT ), .GLA(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/GLA_INT ), .GLAMSS(
        \final_mss_0/MSS_ADLIB_INST_FCLK ), .LOCK(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/LOCK_INT ), .LOCKMSS(
        \final_mss_0/MSS_ADLIB_INST_PLLLOCK ), .CLKB(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/CLKB_INT ), .GLB(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/GLB_INT ), .YB(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/YB_INT ), .CLKC(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/CLKC_INT ), .GLC(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/GLC_INT ), .YC(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/YC_INT ), .MACCLK(), .SDIN(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/SDIN_INT ), .SCLK(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/SCLK_INT ), .SSHIFT(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/SSHIFT_INT ), .SUPDATE(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/SUPDATE_INT ), .MODE(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/MODE_INT ), .SDOUT(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/SDOUT_INT ), .PLLEN(PLLEN_VCC), 
        .OADIV({GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND, 
        GLMUXINT_GND}), .OADIVHALF(GLMUXINT_GND), .OADIVRST(
        GLMUXINT_GND), .OAMUX({PLLEN_VCC, GLMUXINT_GND, GLMUXINT_GND}), 
        .BYPASSA(GLMUXINT_GND), .DLYGLA({GLMUXINT_GND, GLMUXINT_GND, 
        GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND}), .DLYGLAMSS({
        GLMUXINT_GND, PLLEN_VCC, GLMUXINT_GND, GLMUXINT_GND, 
        GLMUXINT_GND}), .DLYGLAFAB({GLMUXINT_GND, PLLEN_VCC, PLLEN_VCC, 
        PLLEN_VCC, PLLEN_VCC}), .OBDIV({GLMUXINT_GND, GLMUXINT_GND, 
        GLMUXINT_GND, GLMUXINT_GND, PLLEN_VCC}), .OBDIVHALF(
        GLMUXINT_GND), .OBDIVRST(GLMUXINT_GND), .OBMUX({GLMUXINT_GND, 
        PLLEN_VCC, PLLEN_VCC}), .BYPASSB(GLMUXINT_GND), .DLYGLB({
        GLMUXINT_GND, GLMUXINT_GND, PLLEN_VCC, PLLEN_VCC, GLMUXINT_GND})
        , .OCDIV({GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND, 
        GLMUXINT_GND, GLMUXINT_GND}), .OCDIVHALF(GLMUXINT_GND), 
        .OCDIVRST(GLMUXINT_GND), .OCMUX({GLMUXINT_GND, GLMUXINT_GND, 
        GLMUXINT_GND}), .BYPASSC(PLLEN_VCC), .DLYGLC({GLMUXINT_GND, 
        GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND}), 
        .FINDIV({GLMUXINT_GND, GLMUXINT_GND, PLLEN_VCC, PLLEN_VCC, 
        GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND}), .FBDIV({
        GLMUXINT_GND, GLMUXINT_GND, GLMUXINT_GND, PLLEN_VCC, PLLEN_VCC, 
        PLLEN_VCC, PLLEN_VCC}), .FBDLY({GLMUXINT_GND, GLMUXINT_GND, 
        GLMUXINT_GND, GLMUXINT_GND, PLLEN_VCC}), .FBSEL({GLMUXINT_GND, 
        PLLEN_VCC}), .XDLYSEL(GLMUXINT_GND), .VCOSEL({GLMUXINT_GND, 
        GLMUXINT_GND, GLMUXINT_GND}), .GLMUXINT(GLMUXINT_GND), 
        .GLMUXSEL({GLMUXINT_GND, GLMUXINT_GND}), .GLMUXCFG({
        GLMUXINT_GND, GLMUXINT_GND}));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_89  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[26]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[25]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[27]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[25]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[26]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[27]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_64  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(\final_mss_0/MSS_ADLIB_INST/LVTTL4ENINT_NET )
        , .PIN5INT(\final_mss_0/MSS_ADLIB_INST/LVTTL3ENINT_NET ), 
        .PIN6INT(\final_mss_0/MSS_ADLIB_INST/LVTTL5ENINT_NET ), 
        .PIN1INT(\final_mss_0/MSS_ADLIB_INST/LVTTL3INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/LVTTL4INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/LVTTL5INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_59  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        GLMUXINT_GND), .PIN2INT(GLMUXINT_GND), .PIN3INT(GLMUXINT_GND));
    DFN1 \gcn_0/a/counter[2]  (.D(\gcn_0/a/nextCount[2] ), .CLK(
        final_mss_0_FAB_CLK), .Q(\gcn_0/a/counter[2]_net_1 ));
    IOPAD_BI \final_mss_0/MSS_GPIO_0_GPIO_0_BI  (.D(
        \final_mss_0/MSS_GPIO_0_GPIO_0_BI_D ), .E(
        \final_mss_0/MSS_GPIO_0_GPIO_0_BI_E ), .Y(
        \final_mss_0/MSS_GPIO_0_GPIO_0_BI_Y ), .PAD(GPIO_0_BI));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_6  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(\final_mss_0/MSS_ADLIB_INST/GPI[29]INT_NET ), 
        .PIN5INT(\final_mss_0/MSS_ADLIB_INST/GPI[28]INT_NET ), 
        .PIN6INT(\final_mss_0/MSS_ADLIB_INST/GPI[30]INT_NET ), 
        .PIN1INT(\final_mss_0/MSS_ADLIB_INST/GPO[28]INT_NET ), 
        .PIN2INT(\final_mss_0/MSS_ADLIB_INST/GPO[29]INT_NET ), 
        .PIN3INT(\final_mss_0/MSS_ADLIB_INST/GPO[30]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_87  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[20]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[19]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[21]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[19]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[20]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[21]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_76  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[2]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[3]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[4]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_57  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[29]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[28]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[30]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[28]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[29]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[30]INT_NET ));
    DFN1 \gcn_0/a/counter[1]  (.D(\gcn_0/a/nextCount[1] ), .CLK(
        final_mss_0_FAB_CLK), .Q(\gcn_0/a/counter[1]_net_1 ));
    IOPAD_IN \final_mss_0/MSS_RESET_0_MSS_RESET_N  (.PAD(MSS_RESET_N), 
        .Y(\final_mss_0/MSS_RESET_0_MSS_RESET_N_Y ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_88  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[23]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[22]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/FABPWDATA[24]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[22]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[23]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/FABPRDATA[24]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_61  (.PIN4(GLMUXINT_GND), 
        .PIN5(PLLEN_VCC), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), .PIN3(
        ), .PIN4INT(\final_mss_0/MSS_ADLIB_INST/DMAREADY[0]INT_NET ), 
        .PIN5INT(\final_mss_0/MSS_ADLIB_INST/F2MRESETnINT_NET ), 
        .PIN6INT(\final_mss_0/MSS_ADLIB_INST/DMAREADY[1]INT_NET ), 
        .PIN1INT(GLMUXINT_GND), .PIN2INT(GLMUXINT_GND), .PIN3INT(
        GLMUXINT_GND));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_58  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[31]INT_NET ), .PIN6INT(), 
        .PIN1INT(\final_mss_0/MSS_ADLIB_INST/MSSPWDATA[31]INT_NET ), 
        .PIN2INT(GLMUXINT_GND), .PIN3INT(GLMUXINT_GND));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_10  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(\final_mss_0/MSS_ADLIB_INST/VRONINT_NET ), 
        .PIN5INT(\final_mss_0/MSS_ADLIB_INST/RXEVINT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/CALIBININT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/UART1RTSnINT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/UART1DTRnINT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/TXEVINT_NET ));
    MSS_CCC_GL_IF \final_mss_0/MSS_CCC_0/I_MSSCCC/U_TILE3  (.PIN2(
        GLMUXINT_GND), .PIN3(GLMUXINT_GND), .PIN4(GLMUXINT_GND), .PIN1(
        ), .PIN5(), .PIN2INT(), .PIN3INT(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/CLKC_INT ), .PIN4INT(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/SUPDATE_INT ), .PIN1INT(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/YC_INT ), .PIN5INT(
        \final_mss_0/MSS_CCC_0/I_MSSCCC/GLC_INT ));
    IOPAD_TRI \pin_pad/U0/U0  (.D(\pin_pad/U0/NET1 ), .E(
        \pin_pad/U0/NET2 ), .PAD(pin));
    DFN1 \gcn_0/b/counter[5]  (.D(\gcn_0/b/nextCount[5] ), .CLK(
        final_mss_0_FAB_CLK), .Q(\gcn_0/b/counter[5]_net_1 ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_20  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(), 
        .PIN2INT(GLMUXINT_GND), .PIN3INT(GLMUXINT_GND));
    DFN1 \gcn_0/b/counter[2]  (.D(\gcn_0/b/nextCount[2] ), .CLK(
        final_mss_0_FAB_CLK), .Q(\gcn_0/b/counter[2]_net_1 ));
    XOR2 \gcn_0/b/nextCount_I_13  (.A(\gcn_0/b/N_12 ), .B(
        \gcn_0/b/counter[3]_net_1 ), .Y(\gcn_0/b/nextCount[3] ));
    INV \gcn_0/a/nextCount_I_4  (.A(\gcn_0/a/counter[0]_net_1 ), .Y(
        \gcn_0/a/nextCount[0] ));
    XOR2 \gcn_0/a/nextCount_I_13  (.A(\gcn_0/a/N_12 ), .B(
        \gcn_0/a/counter[3]_net_1 ), .Y(\gcn_0/a/nextCount[3] ));
    AND3 \gcn_0/b/nextCount_I_16  (.A(\gcn_0/b/counter[0]_net_1 ), .B(
        \gcn_0/b/counter[1]_net_1 ), .C(\gcn_0/b/counter[2]_net_1 ), 
        .Y(\gcn_0/b/DWACT_FINC_E[0] ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_66  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(\final_mss_0/MSS_ADLIB_INST/LVTTL7ENINT_NET )
        , .PIN5INT(\final_mss_0/MSS_ADLIB_INST/LVTTL6ENINT_NET ), 
        .PIN6INT(), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/LVTTL6INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/LVTTL7INT_NET ), .PIN3INT(
        GLMUXINT_GND));
    AND3 \gcn_0/a/nextCount_I_16  (.A(\gcn_0/a/counter[0]_net_1 ), .B(
        \gcn_0/a/counter[1]_net_1 ), .C(\gcn_0/a/counter[2]_net_1 ), 
        .Y(\gcn_0/a/DWACT_FINC_E[0] ));
    DFN1 \gcn_0/a/counter[5]  (.D(\gcn_0/a/nextCount[5] ), .CLK(
        final_mss_0_FAB_CLK), .Q(\gcn_0/a/counter[5]_net_1 ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_84  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(), .PIN5INT(), .PIN6INT(), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[26]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[27]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/ACEFLAGS[28]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_54  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[20]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[19]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[21]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[19]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[20]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[21]INT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_8  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/UART0DCDnINT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/UART0RInINT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/UART1CTSnINT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/SPI0SSO[3]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/UART0RTSnINT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/UART0DTRnINT_NET ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_5  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(\final_mss_0/MSS_ADLIB_INST/GPI[26]INT_NET ), 
        .PIN5INT(\final_mss_0/MSS_ADLIB_INST/GPI[25]INT_NET ), 
        .PIN6INT(\final_mss_0/MSS_ADLIB_INST/GPI[27]INT_NET ), 
        .PIN1INT(\final_mss_0/MSS_ADLIB_INST/GPO[25]INT_NET ), 
        .PIN2INT(\final_mss_0/MSS_ADLIB_INST/GPO[26]INT_NET ), 
        .PIN3INT(\final_mss_0/MSS_ADLIB_INST/GPO[27]INT_NET ));
    AND3 \gcn_0/b/nextCount_I_23  (.A(\gcn_0/b/DWACT_FINC_E[0] ), .B(
        \gcn_0/b/counter[3]_net_1 ), .C(\gcn_0/b/counter[4]_net_1 ), 
        .Y(\gcn_0/b/N_4 ));
    DFN1 \gcn_0/a/counter[0]  (.D(\gcn_0/a/nextCount[0] ), .CLK(
        final_mss_0_FAB_CLK), .Q(\gcn_0/a/counter[0]_net_1 ));
    MSS_IF \final_mss_0/MSS_ADLIB_INST/U_40  (.PIN4(GLMUXINT_GND), 
        .PIN5(GLMUXINT_GND), .PIN6(GLMUXINT_GND), .PIN1(), .PIN2(), 
        .PIN3(), .PIN4INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[11]INT_NET ), .PIN5INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[10]INT_NET ), .PIN6INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPRDATA[12]INT_NET ), .PIN1INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[10]INT_NET ), .PIN2INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[11]INT_NET ), .PIN3INT(
        \final_mss_0/MSS_ADLIB_INST/MSSPWDATA[12]INT_NET ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
