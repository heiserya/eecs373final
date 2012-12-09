/******************************************************************************

    File Name:  timebase.v
      Version:  4.0
         Date:  July 14th, 2009
  Description:  Timebase module
  
  
  SVN Revision Information:
  SVN $Revision: 10769 $
  SVN $Date: 2009-11-05 15:38:11 -0800 (Thu, 05 Nov 2009) $  
  
  

 COPYRIGHT 2009 BY ACTEL 
 THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS 
 FROM ACTEL CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM 
 ACTEL FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND 
 NO BACK-UP OF THE FILE SHOULD BE MADE. 
 
FUNCTIONAL DESCRIPTION: 
Refer to the CorePWM Handbook.
******************************************************************************/
`timescale 1ns/1ns
module
timebase
#
(
parameter
APB_DWIDTH
=
8
)
(
input
PRESETN,
input
PCLK,
input
[
APB_DWIDTH
-
1
:
0
]
period_reg,
input
[
APB_DWIDTH
-
1
:
0
]
prescale_reg,
output
reg
[
APB_DWIDTH
-
1
:
0
]
period_cnt,
output
sync_pulse
)
;
reg
[
APB_DWIDTH
-
1
:
0
]
CPWMlIlI
;
always
@
(
negedge
PRESETN
or
posedge
PCLK
)
begin
if
(
!
PRESETN
)
begin
CPWMlIlI
<=
0
;
end
else
begin
if
(
CPWMlIlI
>=
prescale_reg
)
begin
CPWMlIlI
<=
0
;
end
else
begin
CPWMlIlI
<=
CPWMlIlI
+
1
;
end
end
end
always
@
(
negedge
PRESETN
or
posedge
PCLK
)
begin
if
(
!
PRESETN
)
begin
period_cnt
<=
0
;
end
else
begin
if
(
(
period_cnt
>=
period_reg
)
&&
(
CPWMlIlI
>=
prescale_reg
)
)
begin
period_cnt
<=
0
;
end
else
if
(
CPWMlIlI
==
prescale_reg
)
begin
period_cnt
<=
period_cnt
+
1
;
end
end
end
assign
sync_pulse
=
(
CPWMlIlI
>=
prescale_reg
)
?
1
'b
1
:
1
'b
0
;
endmodule
