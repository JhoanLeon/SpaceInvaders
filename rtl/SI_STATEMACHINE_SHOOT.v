
//=======================================================
//  MODULE Definition
//=======================================================

module SI_STATEMACHINE_SHOOT
(

	SI_STATEMACHINE_SHOOT_CLOCK_50,
	SI_STATEMACHINE_SHOOT_RESET_InLow,
	SI_STATEMACHINE_SHOOT_START_InLow,
	SI_STATEMACHINE_SHOOT_SHOOT_InLow,
	SI_STATEMACHINE_SHOOT_COUNT1_InLow,
	SI_STATEMACHINE_SHOOT_COUNT7_InLow,
	SI_STATEMACHINE_SHOOT_BULLET_InLow,
	
	SI_STATEMACHINE_SHOOT_ENABLEC_OUT,
	SI_STATEMACHINE_SHOOT_LOAD_OUT,
	SI_STATEMACHINE_SHOOT_CLEAR_OUT,
	SI_STATEMACHINE_SHOOT_CTLMUX_OUT

);

//=======================================================
//  PARAMETER declarations
//=======================================================

	parameter St_Init   = 3'b000;
	parameter St_Wait	  = 3'b001;
	parameter St_Start  = 3'b010;
	parameter St_Ready  = 3'b011;
	parameter St_Shoot  = 3'b100;
	parameter St_Load0  = 3'b101;
	parameter St_Load1  = 3'b110;
	parameter St_N = 3'b111;
			
//=======================================================
//  PORT declarations
//=======================================================
 
input SI_STATEMACHINE_SHOOT_CLOCK_50;
input SI_STATEMACHINE_SHOOT_RESET_InLow;
input SI_STATEMACHINE_SHOOT_START_InLow;
input SI_STATEMACHINE_SHOOT_SHOOT_InLow;
input SI_STATEMACHINE_SHOOT_COUNT1_InLow;
input SI_STATEMACHINE_SHOOT_COUNT7_InLow;
input SI_STATEMACHINE_SHOOT_BULLET_InLow;
	
output reg SI_STATEMACHINE_SHOOT_ENABLEC_OUT;
output reg SI_STATEMACHINE_SHOOT_LOAD_OUT;
output reg SI_STATEMACHINE_SHOOT_CLEAR_OUT;
output reg SI_STATEMACHINE_SHOOT_CTLMUX_OUT;

//=======================================================
//  REG/WIRE declarations
//=======================================================

reg [2:0] St_Register;
reg [2:0] St_Signal;

//=======================================================
//  Structural coding
//=======================================================
	
//-------INPUT LOGIC: COMBINATIONAL-----------------------------
// NEXT STATE LOGIC : COMBINATIONAL
	
always @(*)

begin 
	
	case(St_Register)
	
   St_Init: St_Signal = St_Wait;

	St_Wait: if(SI_STATEMACHINE_SHOOT_START_InLow == 0)
	         St_Signal=St_Start;
				else 
				St_Signal=St_Wait;

	St_Start: St_Signal = St_Ready;

	St_Ready: if(SI_STATEMACHINE_SHOOT_SHOOT_InLow == 0 && SI_STATEMACHINE_SHOOT_COUNT7_InLow == 0)
				 St_Signal = St_Shoot;
			
				 else 
				 St_Signal = St_Ready;
	
	St_Shoot: St_Signal = St_Load0;
	
   St_Load0: if(SI_STATEMACHINE_SHOOT_COUNT1_InLow == 0)
	          St_Signal = St_Load1;
				 
				 else if (SI_STATEMACHINE_SHOOT_COUNT7_InLow == 0 || 	SI_STATEMACHINE_SHOOT_BULLET_InLow == 0) 
				 St_Signal = St_N; 
				 
				 else
				 St_Signal = St_Load0;
				 
	St_N: St_Signal = St_Ready;			 
	
	St_Load1: St_Signal = St_Load0; 
	
	default: St_Signal = St_Init;

	endcase
end
	
//-------STATE REGISTER : SEQUENTIAL----------------------------

always @ (posedge SI_STATEMACHINE_SHOOT_CLOCK_50,negedge SI_STATEMACHINE_SHOOT_RESET_InLow)
	
	if (SI_STATEMACHINE_SHOOT_RESET_InLow == 0)
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
	SI_STATEMACHINE_SHOOT_ENABLEC_OUT = 1;
	SI_STATEMACHINE_SHOOT_LOAD_OUT = 1;
	SI_STATEMACHINE_SHOOT_CLEAR_OUT = 1;
	SI_STATEMACHINE_SHOOT_CTLMUX_OUT = 1;
	end
	
	St_Wait:
	begin
	SI_STATEMACHINE_SHOOT_ENABLEC_OUT = 0;
	SI_STATEMACHINE_SHOOT_LOAD_OUT = 1;
	SI_STATEMACHINE_SHOOT_CLEAR_OUT = 0;
	SI_STATEMACHINE_SHOOT_CTLMUX_OUT = 1;
	end
	
	St_Start:
	begin
	SI_STATEMACHINE_SHOOT_ENABLEC_OUT = 0;
	SI_STATEMACHINE_SHOOT_LOAD_OUT = 1;
	SI_STATEMACHINE_SHOOT_CLEAR_OUT = 1;
	SI_STATEMACHINE_SHOOT_CTLMUX_OUT = 1;
	end
	
	St_Ready:
	begin
	SI_STATEMACHINE_SHOOT_ENABLEC_OUT = 0;
	SI_STATEMACHINE_SHOOT_LOAD_OUT = 1;
	SI_STATEMACHINE_SHOOT_CLEAR_OUT = 0;
	SI_STATEMACHINE_SHOOT_CTLMUX_OUT = 1;
	end
	
   St_N:
	begin
	SI_STATEMACHINE_SHOOT_ENABLEC_OUT = 0;
	SI_STATEMACHINE_SHOOT_LOAD_OUT = 1;
	SI_STATEMACHINE_SHOOT_CLEAR_OUT = 0;
	SI_STATEMACHINE_SHOOT_CTLMUX_OUT = 1;
	end
		
	St_Shoot:
	begin
	SI_STATEMACHINE_SHOOT_ENABLEC_OUT = 1;
	SI_STATEMACHINE_SHOOT_LOAD_OUT = 0;
	SI_STATEMACHINE_SHOOT_CLEAR_OUT = 1;
	SI_STATEMACHINE_SHOOT_CTLMUX_OUT = 0;
	end
	
	St_Load0:
	begin
	SI_STATEMACHINE_SHOOT_ENABLEC_OUT = 0;
	SI_STATEMACHINE_SHOOT_LOAD_OUT = 1;
	SI_STATEMACHINE_SHOOT_CLEAR_OUT = 1;
	SI_STATEMACHINE_SHOOT_CTLMUX_OUT = 1;
	end
	
	St_Load1:
	begin
	SI_STATEMACHINE_SHOOT_ENABLEC_OUT = 0;
	SI_STATEMACHINE_SHOOT_LOAD_OUT = 0;
	SI_STATEMACHINE_SHOOT_CLEAR_OUT = 1;
	SI_STATEMACHINE_SHOOT_CTLMUX_OUT = 1;
	end		
	
	default:
	begin
	SI_STATEMACHINE_SHOOT_ENABLEC_OUT = 1;
	SI_STATEMACHINE_SHOOT_LOAD_OUT = 1;
	SI_STATEMACHINE_SHOOT_CLEAR_OUT = 1;
	SI_STATEMACHINE_SHOOT_CTLMUX_OUT = 1;
	end
	
	
	endcase
end

	endmodule	
