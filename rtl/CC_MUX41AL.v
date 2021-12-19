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
module CC_MUX41AL (

//////////// INPUTS //////////
	CC_MUX41AL_select_InLow,
	CC_MUX41AL_IN1,
	CC_MUX41AL_IN2,
	CC_MUX41AL_IN3,
	CC_MUX41AL_IN4,

//////////// OUTPUTS //////////
	CC_MUX41AL_Out
	
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

input [1:0]	CC_MUX41AL_select_InLow;
input	CC_MUX41AL_IN1;
input	CC_MUX41AL_IN2;
input	CC_MUX41AL_IN3;
input	CC_MUX41AL_IN4;
	
output	CC_MUX41AL_Out;

//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
																			  
assign CC_MUX41AL_Out = (CC_MUX41AL_select_InLow == 2'b00)?CC_MUX41AL_IN1:
								(CC_MUX41AL_select_InLow == 2'b01)?CC_MUX41AL_IN2:
								(CC_MUX41AL_select_InLow == 2'b10)?CC_MUX41AL_IN3:
																			  CC_MUX41AL_IN4;	
																			  
endmodule
