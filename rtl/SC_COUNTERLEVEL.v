//##########################################################################
//######					G0B1T HDL EXAMPLES											####
//######	Fredy Enrique Segura-Quijano fsegura@uniandes.edu.co				####   
//######																						####   
//######				MODIFICADO: Marzo de 2018 - FES								####   
//##########################################################################
//# G0B1T
//# Copyright (C) 2018 Bogotá, Colombia
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
//# along with this program.  If not, see <http://www.gnu.org/licenses/>.
//#/
//###########################################################################

//=======================================================
//  MODULE Definition
//=======================================================

module SC_COUNTERLEVEL #(parameter COUNTER_DATAWIDTH_BUS=2)(
//////////// OUTPUTS //////////
	SC_COUNTER_regcount_OutBus,
//////////// INPUTS //////////
	SC_COUNTER_CLOCK_50,
	SC_COUNTER_RESET_InLow,
	SC_COUNTER_count_InLow
);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
	output   [COUNTER_DATAWIDTH_BUS-1:0] SC_COUNTER_regcount_OutBus;
	input		SC_COUNTER_CLOCK_50;
	input		SC_COUNTER_RESET_InLow;
	input 	SC_COUNTER_count_InLow;
//=======================================================
//  REG/WIRE declarations
//=======================================================
	reg [COUNTER_DATAWIDTH_BUS-1:0] COUNTER_Register;
	reg [COUNTER_DATAWIDTH_BUS-1:0] COUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL
	always @ (*)
	if (SC_COUNTER_count_InLow == 1'b1)	
		COUNTER_Signal = COUNTER_Register;
	else 
		COUNTER_Signal = COUNTER_Register + 1'b1;

		// REGISTER : SEQUENTIAL
	always @ ( posedge SC_COUNTER_CLOCK_50 , negedge SC_COUNTER_RESET_InLow)
	if (SC_COUNTER_RESET_InLow == 0)
		COUNTER_Register <= 2'b00;
	else
		COUNTER_Register <= COUNTER_Signal;
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL
			
	assign SC_COUNTER_regcount_OutBus = COUNTER_Register;	
			
endmodule
