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
module SC_COUNTER4MA
(
//////////// OUTPUTS //////////
	SC_COUNTER_eoc_OutLow,
//////////// INPUTS //////////
	SC_COUNTER_CLOCK_50,
	SC_COUNTER_RESET_InLow,
	SC_COUNTER_CLEARCOUNT_InLow,
	SC_COUNTER_countup_InLow
	
);
//=======================================================
//  PARAMETER declarations
//=======================================================

parameter COUNTER_DATAWIDTH_BUS = 4;

parameter ST_0 = 4'b0000;
parameter ST_1 = 4'b0001;
parameter ST_2 = 4'b0010;
parameter ST_3 = 4'b0011;
parameter ST_4 = 4'b0100;
parameter ST_5 = 4'b0101;
parameter ST_6 = 4'b0110;
parameter ST_7 = 4'b0111;
parameter ST_8 = 4'b1000;
parameter ST_9 = 4'b1001;
parameter ST_10 = 4'b1010;

//=======================================================
//  PORT declarations
//=======================================================
	output reg [1:0] SC_COUNTER_eoc_OutLow;
	input		SC_COUNTER_CLOCK_50;
	input		SC_COUNTER_RESET_InLow;
	input 	SC_COUNTER_countup_InLow;
	input 	SC_COUNTER_CLEARCOUNT_InLow;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================
	reg [COUNTER_DATAWIDTH_BUS-1:0] COUNTER_Register;
	reg [COUNTER_DATAWIDTH_BUS-1:0] COUNTER_Signal;
//=======================================================
//  Structural coding
//=======================================================
//INPUT LOGIC: COMBINATIONAL

always @(*)

begin 
	
	case(COUNTER_Register)
			
	ST_0:  COUNTER_Signal = ST_1;	
			
	ST_1: if(SC_COUNTER_countup_InLow == 0)  
			COUNTER_Signal = ST_2;
			
			else
			COUNTER_Signal = COUNTER_Register;
		
	ST_2: if(SC_COUNTER_countup_InLow == 0)  
			COUNTER_Signal = ST_3;
			
			else
			COUNTER_Signal = COUNTER_Register;
			
	ST_3: if(SC_COUNTER_countup_InLow == 0)  
			COUNTER_Signal = ST_4;
			
			else
			COUNTER_Signal = COUNTER_Register;
			
	ST_4: if(SC_COUNTER_countup_InLow == 0)  
			COUNTER_Signal = ST_5;
			
			else
			COUNTER_Signal = COUNTER_Register;
			
	ST_5: if(SC_COUNTER_countup_InLow == 0)  
			COUNTER_Signal = ST_6;
			
			else
			COUNTER_Signal = COUNTER_Register;
			
	ST_6: if(SC_COUNTER_countup_InLow == 0)  
			COUNTER_Signal = ST_7;
			
			else
			COUNTER_Signal = COUNTER_Register;
	
	ST_7: if(SC_COUNTER_countup_InLow == 0)  
			COUNTER_Signal = ST_8;
			
			else
			COUNTER_Signal = COUNTER_Register;
			
	ST_8: if(SC_COUNTER_countup_InLow == 0)  
			COUNTER_Signal = ST_9;
			
			else
			COUNTER_Signal = COUNTER_Register;
					
	ST_9: if(SC_COUNTER_countup_InLow == 0)  
			COUNTER_Signal = ST_10;
			
			else
			COUNTER_Signal = COUNTER_Register;
		
	ST_10: if(SC_COUNTER_countup_InLow == 0)  
			COUNTER_Signal = ST_0;
			
			else
			COUNTER_Signal = COUNTER_Register;		
	
	endcase
end

		// REGISTER : SEQUENTIAL
	always @ ( posedge SC_COUNTER_CLOCK_50 , negedge SC_COUNTER_RESET_InLow, negedge SC_COUNTER_CLEARCOUNT_InLow )
	if (SC_COUNTER_RESET_InLow == 0 || SC_COUNTER_CLEARCOUNT_InLow == 0)
		COUNTER_Register <= 4'b0001;
	else
		COUNTER_Register <= COUNTER_Signal;
//=======================================================
//  Outputs
//=======================================================
// OUTPUT LOGIC : COMBINATIONAL

always @(*)
	
begin 
	
	case(COUNTER_Register)
	
	ST_0:
	begin
   SC_COUNTER_eoc_OutLow = 2'b01;
	end
	
	ST_1:
	begin
   SC_COUNTER_eoc_OutLow = 2'b01;
	end
	
	ST_2:
	begin
   SC_COUNTER_eoc_OutLow = 2'b01;
	end
	
	ST_3:
	begin
   SC_COUNTER_eoc_OutLow = 2'b01;
	end
	
	ST_4:
	begin
   SC_COUNTER_eoc_OutLow = 2'b01;
	end
	
	ST_5:
	begin
   SC_COUNTER_eoc_OutLow = 2'b00;
	end
	
	ST_6:
	begin
   SC_COUNTER_eoc_OutLow = 2'b10;
	end
	
	ST_7:
	begin
   SC_COUNTER_eoc_OutLow = 2'b10;
	end
	
	ST_8:
	begin
   SC_COUNTER_eoc_OutLow = 2'b10;
	end

	ST_9:
	begin
   SC_COUNTER_eoc_OutLow = 2'b10;
	end
	
	ST_10:
	begin
   SC_COUNTER_eoc_OutLow = 2'b00;
	end
	
	endcase
end
			
endmodule

