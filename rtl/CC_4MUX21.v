//# Copyright (C) 2018. F.E.Segura-Quijano (FES) fsegura@uniandes.edu.co
//# 
//# This program is free software: you can redistribute it and/or modify
//# it under the terms of the GNU General Public License as published by
//# the Free Software Foundation, version 3 of the License.
//#
//# This program is distributed in the hope that it will be useful,
//# but WITHOUT ANY WARRANTY; without even the implied warranty of
//# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//# GNU General Public License for more details.
//#
//# You should have received a copy of the GNU General Public License
//# along with this program.  If not, see <http://www.gnu.org/licenses/>
//####################################################################*/
//=======================================================
//  MODULE Definition
//=======================================================

module CC_4MUX21 (

//////////// INPUTS //////////
	CC_4MUX21_select_InLow,
	CC_4MUX21_data7_InBUS,
	CC_4MUX21_data6_InBUS,
	CC_4MUX21_data5_InBUS,
	CC_4MUX21_data4_InBUS,
	CC_4MUX21_data3_InBUS,
	CC_4MUX21_data2_InBUS,
	CC_4MUX21_data1_InBUS,

//////////// OUTPUTS //////////
	CC_4MUX21_Out_Bus7,
	CC_4MUX21_Out_Bus6,
	CC_4MUX21_Out_Bus5,
	CC_4MUX21_Out_Bus4,
	CC_4MUX21_Out_Bus3,
	CC_4MUX21_Out_Bus2,
	CC_4MUX21_Out_Bus1
	
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

input 	[2:0] CC_4MUX21_select_InLow;

input 	[7:0] CC_4MUX21_data7_InBUS;
input 	[7:0] CC_4MUX21_data6_InBUS;
input 	[7:0] CC_4MUX21_data5_InBUS;
input 	[7:0] CC_4MUX21_data4_InBUS;
input 	[7:0] CC_4MUX21_data3_InBUS;
input 	[7:0] CC_4MUX21_data2_InBUS;
input 	[7:0] CC_4MUX21_data1_InBUS;

output	[7:0] CC_4MUX21_Out_Bus7;
output	[7:0] CC_4MUX21_Out_Bus6;
output	[7:0] CC_4MUX21_Out_Bus5;
output	[7:0] CC_4MUX21_Out_Bus4;
output	[7:0] CC_4MUX21_Out_Bus3;
output	[7:0] CC_4MUX21_Out_Bus2;
output	[7:0] CC_4MUX21_Out_Bus1;

//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
																			  
assign CC_4MUX21_Out_Bus7 = (CC_4MUX21_select_InLow==2'b000)?8'b11110000:
									 (CC_4MUX21_select_InLow==2'b001)?CC_4MUX21_data7_InBUS:
									 (CC_4MUX21_select_InLow==2'b010)?8'b00000000:
									 (CC_4MUX21_select_InLow==2'b011)?8'b11110000:
																				 8'b01000010;

assign CC_4MUX21_Out_Bus6 = (CC_4MUX21_select_InLow==2'b000)?8'b11110000:
									 (CC_4MUX21_select_InLow==2'b001)?CC_4MUX21_data6_InBUS:
									 (CC_4MUX21_select_InLow==2'b010)?CC_4MUX21_data7_InBUS:
									 (CC_4MUX21_select_InLow==2'b011)?8'b11110000:
																				 8'b00111100;
																			  
assign CC_4MUX21_Out_Bus5 = (CC_4MUX21_select_InLow==2'b000)?8'b11110000:
									 (CC_4MUX21_select_InLow==2'b001)?CC_4MUX21_data5_InBUS:
									 (CC_4MUX21_select_InLow==2'b010)?CC_4MUX21_data6_InBUS:
									 (CC_4MUX21_select_InLow==2'b011)?8'b11110000:
																				 8'b00111100;
																			  
assign CC_4MUX21_Out_Bus4 = (CC_4MUX21_select_InLow==2'b000)?8'b11110000:
									 (CC_4MUX21_select_InLow==2'b001)?CC_4MUX21_data4_InBUS:
									 (CC_4MUX21_select_InLow==2'b010)?CC_4MUX21_data5_InBUS:
									 (CC_4MUX21_select_InLow==2'b011)?8'b00000000:
																				 8'b01000010;
																			
assign CC_4MUX21_Out_Bus3 = (CC_4MUX21_select_InLow==2'b000)?8'b00000000:
									 (CC_4MUX21_select_InLow==2'b001)?CC_4MUX21_data3_InBUS:
									 (CC_4MUX21_select_InLow==2'b010)?CC_4MUX21_data4_InBUS:
									 (CC_4MUX21_select_InLow==2'b011)?8'b00000000:
																				 8'b01100110; 
																			
assign CC_4MUX21_Out_Bus2 = (CC_4MUX21_select_InLow==2'b000)?8'b00000000:
									 (CC_4MUX21_select_InLow==2'b001)?CC_4MUX21_data2_InBUS:
									 (CC_4MUX21_select_InLow==2'b010)?CC_4MUX21_data3_InBUS:
									 (CC_4MUX21_select_InLow==2'b011)?8'b00000000:
																				 8'b00000000; 
																			
assign CC_4MUX21_Out_Bus1 = (CC_4MUX21_select_InLow==2'b000)?8'b00000000:
									 (CC_4MUX21_select_InLow==2'b001)?CC_4MUX21_data1_InBUS:
									 (CC_4MUX21_select_InLow==2'b010)?CC_4MUX21_data2_InBUS:
									 (CC_4MUX21_select_InLow==2'b011)?8'b00000000:
																				 8'b00000000; 	
																			  
																			  
endmodule
