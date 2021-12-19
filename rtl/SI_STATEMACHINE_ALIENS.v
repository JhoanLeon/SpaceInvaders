
//=======================================================
//  MODULE Definition
//=======================================================

module SI_STATEMACHINE_ALIENS (

//////////// INPUTS //////////
	SI_STATEMACHINE_ALIENS_CLOCK_50,
	SI_STATEMACHINE_ALIENS_RESET_InLow,
	SI_STATEMACHINE_ALIENS_START_InLow,
   SI_STATEMACHINE_ALIENS_WIN_InLow,
	SI_STATEMACHINE_ALIENS_COUNTMA_InLow,
	SI_STATEMACHINE_ALIENS_COUNTRA_InLow,
	SI_STATEMACHINE_ALIENS_COUNT4MA_InLow,
	SI_STATEMACHINE_ALIENS_LOSE_InLow,
	SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow,
	SI_STATEMACHINE_ALIENS_STATEBULLET_InLow,
	
//////////// OUTPUTS //////////
	SI_STATEMACHINE_ALIENS_CLEAR_OUT,
	SI_STATEMACHINE_ALIENS_LOAD_OUT,
	SI_STATEMACHINE_ALIENS_SHIFT_BUS,
	SI_STATEMACHINE_ALIENS_TRANSITION_BUS,
	SI_STATEMACHINE_ALIENS_SELECT_OUT,
   SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA,
	SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA,
	SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA,
	SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA,
	SI_STATEMACHINE_ALIENS_SELECT_4MUX21
	
);

//=======================================================
//  PARAMETER declarations
//=======================================================

	parameter St_Init   = 4'b0000;
	parameter St_Wait	  = 4'b0001;
	parameter St_Start  = 4'b0010;
	parameter St_Level1  = 4'b0011;
	parameter St_MoveAR  = 4'b0100;
	parameter St_MoveAL  = 4'b0101;
	parameter St_Down  = 4'b0110;
	parameter St_Lose  = 4'b0111;
	parameter St_Tran2  = 4'b1000;
	parameter St_Level2  = 4'b1001;
	parameter St_Tran3  = 4'b1010;
	parameter St_Level3  = 4'b1011;
	parameter St_Win	 =	4'b1100;
	parameter St_ClearLevel2 = 4'b1101;
	parameter St_ClearLevel3 = 4'b1110;
	parameter St_Load = 4'b1111;
			
//=======================================================
//  PORT declarations
//=======================================================
 
input SI_STATEMACHINE_ALIENS_CLOCK_50;
input	SI_STATEMACHINE_ALIENS_RESET_InLow;
input	SI_STATEMACHINE_ALIENS_START_InLow;
input	SI_STATEMACHINE_ALIENS_WIN_InLow;
input	SI_STATEMACHINE_ALIENS_COUNTMA_InLow;
input	SI_STATEMACHINE_ALIENS_LOSE_InLow;
input	SI_STATEMACHINE_ALIENS_COUNTRA_InLow;
input [1:0]	SI_STATEMACHINE_ALIENS_COUNT4MA_InLow;
input [1:0] SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow;
input SI_STATEMACHINE_ALIENS_STATEBULLET_InLow;

output reg SI_STATEMACHINE_ALIENS_CLEAR_OUT;
output reg SI_STATEMACHINE_ALIENS_LOAD_OUT;
output reg [1:0] SI_STATEMACHINE_ALIENS_SHIFT_BUS;
output reg [2:0] SI_STATEMACHINE_ALIENS_TRANSITION_BUS;
output reg SI_STATEMACHINE_ALIENS_SELECT_OUT;
output reg SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA;
output reg SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA;
output reg SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA;
output reg [2:0] SI_STATEMACHINE_ALIENS_SELECT_4MUX21;
output reg SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA;

//=======================================================
//  REG/WIRE declarations
//=======================================================

reg [3:0] St_Register;
reg [3:0] St_Signal;

//=======================================================
//  Structural coding
//=======================================================
	
//-------INPUT LOGIC: COMBINATIONAL-----------------------------
// NEXT STATE LOGIC : COMBINATIONAL
	
always @(*)

begin 
	
	case(St_Register)
	
   St_Init: St_Signal = St_Wait;

	St_Wait: if(SI_STATEMACHINE_ALIENS_START_InLow == 0)
	         St_Signal = St_Start;
				else 
				St_Signal = St_Wait;

	St_Start: if(SI_STATEMACHINE_ALIENS_COUNTRA_InLow == 0)	
				 St_Signal = St_Level1;
				 else 
			    St_Signal = St_Start;	

	St_Level1: if(SI_STATEMACHINE_ALIENS_STATEBULLET_InLow == 0)
					St_Signal = St_Load;
	
				 else if(SI_STATEMACHINE_ALIENS_COUNTMA_InLow == 0 && SI_STATEMACHINE_ALIENS_COUNT4MA_InLow == 2'b01)
				  St_Signal = St_MoveAR;
			
				 else if(SI_STATEMACHINE_ALIENS_COUNTMA_InLow == 0 && SI_STATEMACHINE_ALIENS_COUNT4MA_InLow == 2'b10)
				 St_Signal = St_MoveAL;
				
		       else if(SI_STATEMACHINE_ALIENS_COUNTMA_InLow == 0 && SI_STATEMACHINE_ALIENS_COUNT4MA_InLow == 2'b00)	 
				 St_Signal = St_Down;
				 
				 else if(SI_STATEMACHINE_ALIENS_LOSE_InLow == 0)
				 St_Signal = St_Lose;
				 
				 else if(SI_STATEMACHINE_ALIENS_WIN_InLow == 0)
				 St_Signal = St_Tran2;
				 
				 else
				 St_Signal = St_Level1;
	
	St_Tran2: if(SI_STATEMACHINE_ALIENS_COUNTRA_InLow == 0)
				 St_Signal = St_ClearLevel2;
				 
				 else 
				 St_Signal = St_Tran2;
				 
	St_ClearLevel2: St_Signal = St_Level2;
				 
	St_Level2: if(SI_STATEMACHINE_ALIENS_STATEBULLET_InLow == 0)
					St_Signal = St_Load; 
	
				 else if(SI_STATEMACHINE_ALIENS_COUNTMA_InLow == 0 && SI_STATEMACHINE_ALIENS_COUNT4MA_InLow == 2'b01)
				  St_Signal = St_MoveAR;
			
				 else if(SI_STATEMACHINE_ALIENS_COUNTMA_InLow == 0 && SI_STATEMACHINE_ALIENS_COUNT4MA_InLow == 2'b10)
				 St_Signal = St_MoveAL;	
				
		       else if(SI_STATEMACHINE_ALIENS_COUNTMA_InLow == 0 && SI_STATEMACHINE_ALIENS_COUNT4MA_InLow == 2'b00)	 
				 St_Signal = St_Down;
				 
				 else if(SI_STATEMACHINE_ALIENS_LOSE_InLow == 0)
				 St_Signal = St_Lose;
				 
				 else if(SI_STATEMACHINE_ALIENS_WIN_InLow == 0)
				 St_Signal = St_Tran3;
				 
				 else
				 St_Signal = St_Level2;		 
				 
	St_Tran3: if(SI_STATEMACHINE_ALIENS_COUNTRA_InLow == 0)
	          St_Signal = St_ClearLevel3;
				 
				 else 
				 St_Signal = St_Tran3;
				 
	St_ClearLevel3: St_Signal = St_Level3;

	St_Level3: if(SI_STATEMACHINE_ALIENS_STATEBULLET_InLow == 0)
					St_Signal = St_Load;
				
		       else if(SI_STATEMACHINE_ALIENS_COUNTMA_InLow == 0)	 
				 St_Signal = St_Down;
				 
				 else if(SI_STATEMACHINE_ALIENS_LOSE_InLow == 0)
				 St_Signal = St_Lose;
				 
				 else if(SI_STATEMACHINE_ALIENS_WIN_InLow == 0)
				 St_Signal = St_Win;
				 
				 else
				 St_Signal = St_Level3;	
				 
	St_Load: if(SI_STATEMACHINE_ALIENS_WIN_InLow == 0 && SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow == 2'b00)
				 St_Signal = St_Tran2;
				 
				else if(SI_STATEMACHINE_ALIENS_WIN_InLow == 0 && SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow == 2'b01)
				 St_Signal = St_Tran3;
				 
				else if(SI_STATEMACHINE_ALIENS_WIN_InLow == 0 && SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow == 2'b10)
				 St_Signal = St_Win;
	
				else if(SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow == 2'b00)
					St_Signal = St_Level1;
					
				else if(SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow == 2'b01)
					St_Signal = St_Level2;
					
				else if(SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow == 2'b10)
					St_Signal = St_Level3;
					
				else
					St_Signal = St_Level1;
				 
	St_MoveAR: if(SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow == 2'b00)
					St_Signal = St_Level1;
					
				else if(SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow == 2'b01)
					St_Signal = St_Level2;
					
				else if(SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow == 2'b10)
					St_Signal = St_Level3;
					
				else
					St_Signal = St_Level1;
	
   St_MoveAL: if(SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow == 2'b00)
					St_Signal = St_Level1;
					
				else if(SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow == 2'b01)
					St_Signal = St_Level2;
					
				else if(SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow == 2'b10)
					St_Signal = St_Level3;
					
				else
					St_Signal = St_Level1;
	
	St_Down: if(SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow == 2'b00)
					St_Signal = St_Level1;
					
				else if(SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow == 2'b01)
					St_Signal = St_Level2;
					
				else if(SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow == 2'b10)
					St_Signal = St_Level3;
					
				else
					St_Signal = St_Level1;
	
	St_Lose: if(SI_STATEMACHINE_ALIENS_COUNTRA_InLow == 0)
	          St_Signal = St_Init;
				 
				 else
				 St_Signal = St_Lose; 
				
	St_Win: if(SI_STATEMACHINE_ALIENS_COUNTRA_InLow == 0)
	          St_Signal = St_Init;
				 
				 else
				 St_Signal = St_Win; 	
	endcase
	
end
	
//-------STATE REGISTER : SEQUENTIAL----------------------------

always @(posedge SI_STATEMACHINE_ALIENS_CLOCK_50, negedge SI_STATEMACHINE_ALIENS_RESET_InLow)
	
	if (SI_STATEMACHINE_ALIENS_RESET_InLow == 0)
		St_Register <= St_Init;
	else
		St_Register <= St_Signal;
	
//=======================================================
//  Outputs
//=======================================================
//-----------OUTPUT LOGIC : COMBINATIONAL -------------------------	
	
always @(*)
	
begin 
	
	case(St_Register)
	
	St_Init:
	begin
   SI_STATEMACHINE_ALIENS_CLEAR_OUT = 1;
   SI_STATEMACHINE_ALIENS_LOAD_OUT = 0;
   SI_STATEMACHINE_ALIENS_SHIFT_BUS = 2'b11;
   SI_STATEMACHINE_ALIENS_TRANSITION_BUS = 3'b001;
   SI_STATEMACHINE_ALIENS_SELECT_OUT = 1;
   SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA = 1;
	SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA = 1; 
	SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA = 1;
	SI_STATEMACHINE_ALIENS_SELECT_4MUX21 = 3'b000;
	SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA = 0;
	end
	
	St_Wait:
	begin
   SI_STATEMACHINE_ALIENS_CLEAR_OUT = 1;
   SI_STATEMACHINE_ALIENS_LOAD_OUT = 1;
   SI_STATEMACHINE_ALIENS_SHIFT_BUS = 2'b11;
   SI_STATEMACHINE_ALIENS_TRANSITION_BUS = 3'b001;
   SI_STATEMACHINE_ALIENS_SELECT_OUT = 1;
   SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA = 0;
	SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA = 1;
	SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA = 1;
	SI_STATEMACHINE_ALIENS_SELECT_4MUX21 = 3'b000;
	SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA = 1;
	end
	
	St_Start:
	begin
   SI_STATEMACHINE_ALIENS_CLEAR_OUT = 1;
   SI_STATEMACHINE_ALIENS_LOAD_OUT = 1;
   SI_STATEMACHINE_ALIENS_SHIFT_BUS = 2'b11;
   SI_STATEMACHINE_ALIENS_TRANSITION_BUS = 3'b010;
   SI_STATEMACHINE_ALIENS_SELECT_OUT = 1;
   SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA = 0;
	SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA = 1;
	SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA = 0;
	SI_STATEMACHINE_ALIENS_SELECT_4MUX21 = 3'b000;
	SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA = 1;
	end
	
	St_Level1:
	begin
   SI_STATEMACHINE_ALIENS_CLEAR_OUT = 1;
   SI_STATEMACHINE_ALIENS_LOAD_OUT = 1;
   SI_STATEMACHINE_ALIENS_SHIFT_BUS = 2'b11;
   SI_STATEMACHINE_ALIENS_TRANSITION_BUS = 3'b111;
   SI_STATEMACHINE_ALIENS_SELECT_OUT = 0;
   SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA = 0;
	SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA = 1;
	SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA = 1;
	SI_STATEMACHINE_ALIENS_SELECT_4MUX21 = 3'b000;
	SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA = 1;
	end

	St_Tran2:
	begin
   SI_STATEMACHINE_ALIENS_CLEAR_OUT = 0;
   SI_STATEMACHINE_ALIENS_LOAD_OUT = 1;
   SI_STATEMACHINE_ALIENS_SHIFT_BUS = 2'b11;
   SI_STATEMACHINE_ALIENS_TRANSITION_BUS = 3'b011;
   SI_STATEMACHINE_ALIENS_SELECT_OUT = 1;
   SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA = 1;
	SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA = 1;
	SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA = 0;
	SI_STATEMACHINE_ALIENS_SELECT_4MUX21 = 3'b000;
	SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA = 0;
	end
	
	St_ClearLevel2:
	begin
   SI_STATEMACHINE_ALIENS_CLEAR_OUT = 1;
   SI_STATEMACHINE_ALIENS_LOAD_OUT = 0;
   SI_STATEMACHINE_ALIENS_SHIFT_BUS = 2'b11;
   SI_STATEMACHINE_ALIENS_TRANSITION_BUS = 3'b011;
   SI_STATEMACHINE_ALIENS_SELECT_OUT = 1;
   SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA = 1;
	SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA = 1;
	SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA = 1;
	SI_STATEMACHINE_ALIENS_SELECT_4MUX21 = 3'b011;
	SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA = 0;
	end
	
	St_Level2:
	begin
   SI_STATEMACHINE_ALIENS_CLEAR_OUT = 1;
   SI_STATEMACHINE_ALIENS_LOAD_OUT = 1;
   SI_STATEMACHINE_ALIENS_SHIFT_BUS = 2'b11;
   SI_STATEMACHINE_ALIENS_TRANSITION_BUS = 3'b111;
   SI_STATEMACHINE_ALIENS_SELECT_OUT = 0;
   SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA = 0;
	SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA = 1;
	SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA = 1;
	SI_STATEMACHINE_ALIENS_SELECT_4MUX21 = 3'b000;
	SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA = 1;
	end
	
	St_Tran3:
	begin
   SI_STATEMACHINE_ALIENS_CLEAR_OUT = 0;
   SI_STATEMACHINE_ALIENS_LOAD_OUT = 1;
   SI_STATEMACHINE_ALIENS_SHIFT_BUS = 2'b11;
   SI_STATEMACHINE_ALIENS_TRANSITION_BUS = 3'b100;
   SI_STATEMACHINE_ALIENS_SELECT_OUT = 1;
   SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA = 1;
	SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA = 1;
	SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA = 0;
	SI_STATEMACHINE_ALIENS_SELECT_4MUX21 = 3'b000;
	SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA = 0;
	end

	St_ClearLevel3:
	begin
   SI_STATEMACHINE_ALIENS_CLEAR_OUT = 1;
   SI_STATEMACHINE_ALIENS_LOAD_OUT = 0;
   SI_STATEMACHINE_ALIENS_SHIFT_BUS = 2'b11;
   SI_STATEMACHINE_ALIENS_TRANSITION_BUS = 3'b100;
   SI_STATEMACHINE_ALIENS_SELECT_OUT = 1;
   SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA = 1;
	SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA = 1;
	SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA = 1;
	SI_STATEMACHINE_ALIENS_SELECT_4MUX21 = 3'b100;
	SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA = 0;
	end	
	
	St_Level3:
	begin
   SI_STATEMACHINE_ALIENS_CLEAR_OUT = 1;
   SI_STATEMACHINE_ALIENS_LOAD_OUT = 1;
   SI_STATEMACHINE_ALIENS_SHIFT_BUS = 2'b11;
   SI_STATEMACHINE_ALIENS_TRANSITION_BUS = 3'b111;
   SI_STATEMACHINE_ALIENS_SELECT_OUT = 0;
   SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA = 0;
	SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA = 1;
	SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA = 1;
	SI_STATEMACHINE_ALIENS_SELECT_4MUX21 = 3'b000;
	SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA = 1;
	end
	
	St_Load:
	begin
   SI_STATEMACHINE_ALIENS_CLEAR_OUT = 1;
   SI_STATEMACHINE_ALIENS_LOAD_OUT = 0;
   SI_STATEMACHINE_ALIENS_SHIFT_BUS = 2'b11;
   SI_STATEMACHINE_ALIENS_TRANSITION_BUS = 3'b001;
   SI_STATEMACHINE_ALIENS_SELECT_OUT = 1;
   SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA = 0;
	SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA = 1; 
	SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA = 1;
	SI_STATEMACHINE_ALIENS_SELECT_4MUX21 = 3'b001;
	SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA = 1;
	end

	St_MoveAR:
	begin
   SI_STATEMACHINE_ALIENS_CLEAR_OUT = 1;
   SI_STATEMACHINE_ALIENS_LOAD_OUT = 1;
   SI_STATEMACHINE_ALIENS_SHIFT_BUS = 2'b10;
   SI_STATEMACHINE_ALIENS_TRANSITION_BUS = 3'b111;
   SI_STATEMACHINE_ALIENS_SELECT_OUT = 0;
   SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA = 0;
	SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA = 0;
	SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA = 1;
	SI_STATEMACHINE_ALIENS_SELECT_4MUX21 = 3'b000;
	SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA = 1;
	end
	
	St_MoveAL:
	begin
   SI_STATEMACHINE_ALIENS_CLEAR_OUT = 1;
   SI_STATEMACHINE_ALIENS_LOAD_OUT = 1;
   SI_STATEMACHINE_ALIENS_SHIFT_BUS = 2'b01;
   SI_STATEMACHINE_ALIENS_TRANSITION_BUS = 3'b111;
   SI_STATEMACHINE_ALIENS_SELECT_OUT = 0;
   SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA = 0;
	SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA = 0;
	SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA = 1;
	SI_STATEMACHINE_ALIENS_SELECT_4MUX21 = 3'b000;
	SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA = 1;
	end
	
	St_Down:
	begin
   SI_STATEMACHINE_ALIENS_CLEAR_OUT = 1;
   SI_STATEMACHINE_ALIENS_LOAD_OUT = 0;
   SI_STATEMACHINE_ALIENS_SHIFT_BUS = 2'b11;
   SI_STATEMACHINE_ALIENS_TRANSITION_BUS = 3'b111;
   SI_STATEMACHINE_ALIENS_SELECT_OUT = 0;
   SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA = 0;
	SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA = 0;
	SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA = 1;
	SI_STATEMACHINE_ALIENS_SELECT_4MUX21 = 3'b010;
	SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA = 1;
	end	
	
	St_Win:
	begin
   SI_STATEMACHINE_ALIENS_CLEAR_OUT = 0;
   SI_STATEMACHINE_ALIENS_LOAD_OUT = 1;
   SI_STATEMACHINE_ALIENS_SHIFT_BUS = 2'b11;
   SI_STATEMACHINE_ALIENS_TRANSITION_BUS = 3'b110;
   SI_STATEMACHINE_ALIENS_SELECT_OUT = 1;
   SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA = 1;
	SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA = 1;
	SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA = 0;
	SI_STATEMACHINE_ALIENS_SELECT_4MUX21 = 3'b000;
	SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA = 0;
	end	
	
	St_Lose:
	begin
   SI_STATEMACHINE_ALIENS_CLEAR_OUT = 0;
   SI_STATEMACHINE_ALIENS_LOAD_OUT = 1;
   SI_STATEMACHINE_ALIENS_SHIFT_BUS = 2'b11;
   SI_STATEMACHINE_ALIENS_TRANSITION_BUS = 3'b101;
   SI_STATEMACHINE_ALIENS_SELECT_OUT = 1;
   SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA = 1;
	SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA = 1;
	SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA = 0;
	SI_STATEMACHINE_ALIENS_SELECT_4MUX21 = 3'b000;
	SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA = 0;
	end	
	
	endcase
end
	
endmodule	