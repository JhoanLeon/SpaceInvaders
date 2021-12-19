
//=======================================================
//  MODULE Definition
//=======================================================

module CC_DEMUX_14
(

CC_DEMUX_14_SLC,

CC_DEMUX_14_In,

CC_DEMUX_14_Out1,
CC_DEMUX_14_Out2,
CC_DEMUX_14_Out3,
CC_DEMUX_14_Out4

);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

input [1:0] CC_DEMUX_14_SLC;
input CC_DEMUX_14_In;

output CC_DEMUX_14_Out1;
output CC_DEMUX_14_Out2;
output CC_DEMUX_14_Out3;
output CC_DEMUX_14_Out4;

//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================

assign CC_DEMUX_14_Out1	= (CC_DEMUX_14_SLC == 2'b00)? CC_DEMUX_14_In:
																	   1'b1;

assign CC_DEMUX_14_Out2	= (CC_DEMUX_14_SLC == 2'b01)? CC_DEMUX_14_In:
																	   1'b1;															

assign CC_DEMUX_14_Out3	= (CC_DEMUX_14_SLC == 2'b10)? CC_DEMUX_14_In:
																	   1'b1;
																	
assign CC_DEMUX_14_Out4	= (CC_DEMUX_14_SLC == 2'b11)? CC_DEMUX_14_In:
																	   1'b1;																	
																	
endmodule
