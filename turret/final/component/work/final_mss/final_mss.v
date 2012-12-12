`timescale 1 ns/100 ps
// Version: 9.1 SP5 9.1.5.1


module final_mss(
       MSSPSEL,
       MSSPENABLE,
       MSSPWRITE,
       MSSPREADY,
       MSSPSLVERR,
       M2F_RESET_N,
       FAB_CLK,
       M2F_GPO_31,
       MSSPADDR,
       MSSPRDATA,
       MSSPWDATA,
       UART_0_TXD,
       UART_0_RXD,
       UART_1_TXD,
       UART_1_RXD,
       ADCDirectInput_0,
       VAREF1,
       MSS_RESET_N
    );
output MSSPSEL;
output MSSPENABLE;
output MSSPWRITE;
input  MSSPREADY;
input  MSSPSLVERR;
output M2F_RESET_N;
output FAB_CLK;
output M2F_GPO_31;
output [19:0] MSSPADDR;
input  [31:0] MSSPRDATA;
output [31:0] MSSPWDATA;
output UART_0_TXD;
input  UART_0_RXD;
output UART_1_TXD;
input  UART_1_RXD;
input  ADCDirectInput_0;
input  VAREF1;
input  MSS_RESET_N;

    wire MSSINT_GPO_31_A, MSS_ACE_0_ADC5_Y, MSS_ACE_0_VAREF1_Y, 
        MSS_ADLIB_INST_EMCCLK, MSS_ADLIB_INST_FCLK, 
        MSS_ADLIB_INST_MACCLK, MSS_ADLIB_INST_MACCLKCCC, 
        MSS_ADLIB_INST_PLLLOCK, MSS_RESET_0_MSS_RESET_N_Y, 
        MSS_UART_0_RXD_Y, MSS_UART_0_TXD_D, MSS_UART_1_RXD_Y, 
        MSS_UART_1_TXD_D, GND_net, VCC_net;
    
    INBUF_MSS #( .ACT_CONFIG(0), .ACT_PIN("W22") )  MSS_UART_1_RXD (
        .PAD(UART_1_RXD), .Y(MSS_UART_1_RXD_Y));
    INBUF_A MSS_ACE_0_VAREF1 (.PAD(VAREF1), .Y(MSS_ACE_0_VAREF1_Y));
    GND GND (.Y(GND_net));
    OUTBUF_MSS #( .ACT_CONFIG(0), .ACT_PIN("V20") )  MSS_UART_1_TXD (
        .D(MSS_UART_1_TXD_D), .PAD(UART_1_TXD));
    MSSINT MSSINT_GPO_31 (.A(MSSINT_GPO_31_A), .Y(M2F_GPO_31));
    VCC VCC (.Y(VCC_net));
    MSS_APB #( .ACT_CONFIG(0), .ACT_DIE("IP4X3M1"), .ACT_FCLK(100000000)
        , .ACT_PKG("fg484") )  MSS_ADLIB_INST (.MSSPADDR({MSSPADDR[19], 
        MSSPADDR[18], MSSPADDR[17], MSSPADDR[16], MSSPADDR[15], 
        MSSPADDR[14], MSSPADDR[13], MSSPADDR[12], MSSPADDR[11], 
        MSSPADDR[10], MSSPADDR[9], MSSPADDR[8], MSSPADDR[7], 
        MSSPADDR[6], MSSPADDR[5], MSSPADDR[4], MSSPADDR[3], 
        MSSPADDR[2], MSSPADDR[1], MSSPADDR[0]}), .MSSPWDATA({
        MSSPWDATA[31], MSSPWDATA[30], MSSPWDATA[29], MSSPWDATA[28], 
        MSSPWDATA[27], MSSPWDATA[26], MSSPWDATA[25], MSSPWDATA[24], 
        MSSPWDATA[23], MSSPWDATA[22], MSSPWDATA[21], MSSPWDATA[20], 
        MSSPWDATA[19], MSSPWDATA[18], MSSPWDATA[17], MSSPWDATA[16], 
        MSSPWDATA[15], MSSPWDATA[14], MSSPWDATA[13], MSSPWDATA[12], 
        MSSPWDATA[11], MSSPWDATA[10], MSSPWDATA[9], MSSPWDATA[8], 
        MSSPWDATA[7], MSSPWDATA[6], MSSPWDATA[5], MSSPWDATA[4], 
        MSSPWDATA[3], MSSPWDATA[2], MSSPWDATA[1], MSSPWDATA[0]}), 
        .MSSPWRITE(MSSPWRITE), .MSSPSEL(MSSPSEL), .MSSPENABLE(
        MSSPENABLE), .MSSPRDATA({MSSPRDATA[31], MSSPRDATA[30], 
        MSSPRDATA[29], MSSPRDATA[28], MSSPRDATA[27], MSSPRDATA[26], 
        MSSPRDATA[25], MSSPRDATA[24], MSSPRDATA[23], MSSPRDATA[22], 
        MSSPRDATA[21], MSSPRDATA[20], MSSPRDATA[19], MSSPRDATA[18], 
        MSSPRDATA[17], MSSPRDATA[16], MSSPRDATA[15], MSSPRDATA[14], 
        MSSPRDATA[13], MSSPRDATA[12], MSSPRDATA[11], MSSPRDATA[10], 
        MSSPRDATA[9], MSSPRDATA[8], MSSPRDATA[7], MSSPRDATA[6], 
        MSSPRDATA[5], MSSPRDATA[4], MSSPRDATA[3], MSSPRDATA[2], 
        MSSPRDATA[1], MSSPRDATA[0]}), .MSSPREADY(MSSPREADY), 
        .MSSPSLVERR(MSSPSLVERR), .FABPADDR({GND_net, GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
        GND_net}), .FABPWDATA({GND_net, GND_net, GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, GND_net})
        , .FABPWRITE(GND_net), .FABPSEL(GND_net), .FABPENABLE(GND_net), 
        .FABPRDATA({nc0, nc1, nc2, nc3, nc4, nc5, nc6, nc7, nc8, nc9, 
        nc10, nc11, nc12, nc13, nc14, nc15, nc16, nc17, nc18, nc19, 
        nc20, nc21, nc22, nc23, nc24, nc25, nc26, nc27, nc28, nc29, 
        nc30, nc31}), .FABPREADY(), .FABPSLVERR(), .SYNCCLKFDBK(
        FAB_CLK), .CALIBOUT(), .CALIBIN(GND_net), .FABINT(GND_net), 
        .MSSINT({nc32, nc33, nc34, nc35, nc36, nc37, nc38, nc39}), 
        .WDINT(), .F2MRESETn(VCC_net), .DMAREADY({GND_net, GND_net}), 
        .RXEV(GND_net), .VRON(GND_net), .M2FRESETn(M2F_RESET_N), 
        .DEEPSLEEP(), .SLEEP(), .TXEV(), .GPI({GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
        GND_net, GND_net}), .GPO({MSSINT_GPO_31_A, nc40, nc41, nc42, 
        nc43, nc44, nc45, nc46, nc47, nc48, nc49, nc50, nc51, nc52, 
        nc53, nc54, nc55, nc56, nc57, nc58, nc59, nc60, nc61, nc62, 
        nc63, nc64, nc65, nc66, nc67, nc68, nc69, nc70}), .UART0CTSn(
        GND_net), .UART0DSRn(GND_net), .UART0RIn(GND_net), .UART0DCDn(
        GND_net), .UART0RTSn(), .UART0DTRn(), .UART1CTSn(GND_net), 
        .UART1DSRn(GND_net), .UART1RIn(GND_net), .UART1DCDn(GND_net), 
        .UART1RTSn(), .UART1DTRn(), .I2C0SMBUSNI(GND_net), 
        .I2C0SMBALERTNI(GND_net), .I2C0BCLK(GND_net), .I2C0SMBUSNO(), 
        .I2C0SMBALERTNO(), .I2C1SMBUSNI(GND_net), .I2C1SMBALERTNI(
        GND_net), .I2C1BCLK(GND_net), .I2C1SMBUSNO(), .I2C1SMBALERTNO()
        , .MACM2FTXD({nc71, nc72}), .MACF2MRXD({GND_net, GND_net}), 
        .MACM2FTXEN(), .MACF2MCRSDV(GND_net), .MACF2MRXER(GND_net), 
        .MACF2MMDI(GND_net), .MACM2FMDO(), .MACM2FMDEN(), .MACM2FMDC(), 
        .FABSDD0D(GND_net), .FABSDD1D(GND_net), .FABSDD2D(GND_net), 
        .FABSDD0CLK(GND_net), .FABSDD1CLK(GND_net), .FABSDD2CLK(
        GND_net), .FABACETRIG(GND_net), .ACEFLAGS({nc73, nc74, nc75, 
        nc76, nc77, nc78, nc79, nc80, nc81, nc82, nc83, nc84, nc85, 
        nc86, nc87, nc88, nc89, nc90, nc91, nc92, nc93, nc94, nc95, 
        nc96, nc97, nc98, nc99, nc100, nc101, nc102, nc103, nc104}), 
        .CMP0(), .CMP1(), .CMP2(), .CMP3(), .CMP4(), .CMP5(), .CMP6(), 
        .CMP7(), .CMP8(), .CMP9(), .CMP10(), .CMP11(), .LVTTL0EN(
        GND_net), .LVTTL1EN(GND_net), .LVTTL2EN(GND_net), .LVTTL3EN(
        GND_net), .LVTTL4EN(GND_net), .LVTTL5EN(GND_net), .LVTTL6EN(
        GND_net), .LVTTL7EN(GND_net), .LVTTL8EN(GND_net), .LVTTL9EN(
        GND_net), .LVTTL10EN(GND_net), .LVTTL11EN(GND_net), .LVTTL0(), 
        .LVTTL1(), .LVTTL2(), .LVTTL3(), .LVTTL4(), .LVTTL5(), .LVTTL6(
        ), .LVTTL7(), .LVTTL8(), .LVTTL9(), .LVTTL10(), .LVTTL11(), 
        .PUFABn(), .VCC15GOOD(), .VCC33GOOD(), .FCLK(
        MSS_ADLIB_INST_FCLK), .MACCLKCCC(MSS_ADLIB_INST_MACCLKCCC), 
        .RCOSC(GND_net), .MACCLK(MSS_ADLIB_INST_MACCLK), .PLLLOCK(
        MSS_ADLIB_INST_PLLLOCK), .MSSRESETn(MSS_RESET_0_MSS_RESET_N_Y), 
        .GPOE({nc105, nc106, nc107, nc108, nc109, nc110, nc111, nc112, 
        nc113, nc114, nc115, nc116, nc117, nc118, nc119, nc120, nc121, 
        nc122, nc123, nc124, nc125, nc126, nc127, nc128, nc129, nc130, 
        nc131, nc132, nc133, nc134, nc135, nc136}), .SPI0DO(), 
        .SPI0DOE(), .SPI0DI(GND_net), .SPI0CLKI(GND_net), .SPI0CLKO(), 
        .SPI0MODE(), .SPI0SSI(GND_net), .SPI0SSO({nc137, nc138, nc139, 
        nc140, nc141, nc142, nc143, nc144}), .UART0TXD(
        MSS_UART_0_TXD_D), .UART0RXD(MSS_UART_0_RXD_Y), .I2C0SDAI(
        GND_net), .I2C0SDAO(), .I2C0SCLI(GND_net), .I2C0SCLO(), 
        .SPI1DO(), .SPI1DOE(), .SPI1DI(GND_net), .SPI1CLKI(GND_net), 
        .SPI1CLKO(), .SPI1MODE(), .SPI1SSI(GND_net), .SPI1SSO({nc145, 
        nc146, nc147, nc148, nc149, nc150, nc151, nc152}), .UART1TXD(
        MSS_UART_1_TXD_D), .UART1RXD(MSS_UART_1_RXD_Y), .I2C1SDAI(
        GND_net), .I2C1SDAO(), .I2C1SCLI(GND_net), .I2C1SCLO(), 
        .MACTXD({nc153, nc154}), .MACRXD({GND_net, GND_net}), .MACTXEN(
        ), .MACCRSDV(GND_net), .MACRXER(GND_net), .MACMDI(GND_net), 
        .MACMDO(), .MACMDEN(), .MACMDC(), .EMCCLK(
        MSS_ADLIB_INST_EMCCLK), .EMCCLKRTN(MSS_ADLIB_INST_EMCCLK), 
        .EMCRDB({GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
        GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
        GND_net, GND_net, GND_net}), .EMCAB({nc155, nc156, nc157, 
        nc158, nc159, nc160, nc161, nc162, nc163, nc164, nc165, nc166, 
        nc167, nc168, nc169, nc170, nc171, nc172, nc173, nc174, nc175, 
        nc176, nc177, nc178, nc179, nc180}), .EMCWDB({nc181, nc182, 
        nc183, nc184, nc185, nc186, nc187, nc188, nc189, nc190, nc191, 
        nc192, nc193, nc194, nc195, nc196}), .EMCRWn(), .EMCCS0n(), 
        .EMCCS1n(), .EMCOEN0n(), .EMCOEN1n(), .EMCBYTEN({nc197, nc198})
        , .EMCDBOE(), .ADC0(GND_net), .ADC1(GND_net), .ADC2(GND_net), 
        .ADC3(GND_net), .ADC4(GND_net), .ADC5(MSS_ACE_0_ADC5_Y), .ADC6(
        GND_net), .ADC7(GND_net), .ADC8(GND_net), .ADC9(GND_net), 
        .ADC10(GND_net), .ADC11(GND_net), .SDD0(), .SDD1(), .SDD2(), 
        .ABPS0(GND_net), .ABPS1(GND_net), .ABPS2(GND_net), .ABPS3(
        GND_net), .ABPS4(GND_net), .ABPS5(GND_net), .ABPS6(GND_net), 
        .ABPS7(GND_net), .ABPS8(GND_net), .ABPS9(GND_net), .ABPS10(
        GND_net), .ABPS11(GND_net), .TM0(GND_net), .TM1(GND_net), .TM2(
        GND_net), .TM3(GND_net), .TM4(GND_net), .TM5(GND_net), .CM0(
        GND_net), .CM1(GND_net), .CM2(GND_net), .CM3(GND_net), .CM4(
        GND_net), .CM5(GND_net), .GNDTM0(GND_net), .GNDTM1(GND_net), 
        .GNDTM2(GND_net), .VAREF0(GND_net), .VAREF1(MSS_ACE_0_VAREF1_Y)
        , .VAREF2(GND_net), .VAREFOUT(), .GNDVAREF(GND_net), .PUn(
        GND_net));
    OUTBUF_MSS #( .ACT_CONFIG(0), .ACT_PIN("Y22") )  MSS_UART_0_TXD (
        .D(MSS_UART_0_TXD_D), .PAD(UART_0_TXD));
    INBUF_MSS #( .ACT_CONFIG(0), .ACT_PIN("U18") )  MSS_UART_0_RXD (
        .PAD(UART_0_RXD), .Y(MSS_UART_0_RXD_Y));
    final_mss_tmp_MSS_CCC_0_MSS_CCC MSS_CCC_0 (.CLKA(GND_net), 
        .CLKA_PAD(GND_net), .CLKA_PADP(GND_net), .CLKA_PADN(GND_net), 
        .CLKB(GND_net), .CLKB_PAD(GND_net), .CLKB_PADP(GND_net), 
        .CLKB_PADN(GND_net), .CLKC(GND_net), .CLKC_PAD(GND_net), 
        .CLKC_PADP(GND_net), .CLKC_PADN(GND_net), .GLA(), .GLB(), .GLC(
        ), .FAB_CLK(FAB_CLK), .YB(), .YC(), .MAINXIN(GND_net), .LPXIN(
        GND_net), .FAB_LOCK(), .MAC_CLK(GND_net), .RCOSC_CLKOUT(), 
        .MAINXIN_CLKOUT(), .LPXIN_CLKOUT(), .GLA0(MSS_ADLIB_INST_FCLK), 
        .MSS_LOCK(MSS_ADLIB_INST_PLLLOCK), .MAC_CLK_CCC(
        MSS_ADLIB_INST_MACCLKCCC), .MAC_CLK_IO(MSS_ADLIB_INST_MACCLK));
    INBUF_MSS #( .ACT_CONFIG(0), .ACT_PIN("R1") )  
        MSS_RESET_0_MSS_RESET_N (.PAD(MSS_RESET_N), .Y(
        MSS_RESET_0_MSS_RESET_N_Y));
    INBUF_A MSS_ACE_0_ADC5 (.PAD(ADCDirectInput_0), .Y(
        MSS_ACE_0_ADC5_Y));
    
endmodule
