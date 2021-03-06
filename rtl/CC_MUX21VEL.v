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

module CC_MUX21VEL (

//////////// INPUTS //////////
	CC_MUX21VEL_select_InLow,
	CC_MUX21VEL_IN1,
	CC_MUX21VEL_IN2,

//////////// OUTPUTS //////////
	CC_MUX21VEL_Out
	
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

input	CC_MUX21VEL_select_InLow;
input	CC_MUX21VEL_IN1;
input	CC_MUX21VEL_IN2;

output CC_MUX21VEL_Out;

//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================
																			  
assign CC_MUX21VEL_Out = (CC_MUX21VEL_select_InLow == 1'b0)?CC_MUX21VEL_IN1:
																				CC_MUX21VEL_IN2;	
																			  
endmodule
