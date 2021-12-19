
//=======================================================
//  MODULE Definition
//=======================================================

module SI_REGISTER_ALIENS (

REGISTER_ALIENS_CLOCK_50,
REGISTER_ALIENS_RESET_InLow,	
REGISTER_ALIENS_Load_InLow,
REGISTER_ALIENS_Clear_InLow,
REGISTER_ALIENS_shiftselection_InBus,

//REGISTER_ALIENS_DataIn7_InBus,
//REGISTER_ALIENS_DataIn6_InBus,
//REGISTER_ALIENS_DataIn5_InBus,
//REGISTER_ALIENS_DataIn4_InBus,

REGISTER_ALIENS_DataIn7_InBus,
REGISTER_ALIENS_DataIn6_InBus,
REGISTER_ALIENS_DataIn5_InBus,
REGISTER_ALIENS_DataIn4_InBus,
REGISTER_ALIENS_DataIn3_InBus,
REGISTER_ALIENS_DataIn2_InBus,
REGISTER_ALIENS_DataIn1_InBus,

REGISTER_ALIENS_FILA7_BUS,
REGISTER_ALIENS_FILA6_BUS,
REGISTER_ALIENS_FILA5_BUS,
REGISTER_ALIENS_FILA4_BUS,
REGISTER_ALIENS_FILA3_BUS,
REGISTER_ALIENS_FILA2_BUS,
REGISTER_ALIENS_FILA1_BUS,
REGISTER_ALIENS_FILA0_BUS

);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

input REGISTER_ALIENS_CLOCK_50;
input REGISTER_ALIENS_RESET_InLow;
input REGISTER_ALIENS_Load_InLow; 
input REGISTER_ALIENS_Clear_InLow;	
input [1:0] REGISTER_ALIENS_shiftselection_InBus;

//input [7:0] REGISTER_ALIENS_DataIn7_InBus;
//input [7:0] REGISTER_ALIENS_DataIn6_InBus;
//input [7:0] REGISTER_ALIENS_DataIn5_InBus;
//input [7:0] REGISTER_ALIENS_DataIn4_InBus;

input [7:0] REGISTER_ALIENS_DataIn7_InBus;
input [7:0] REGISTER_ALIENS_DataIn6_InBus;
input [7:0] REGISTER_ALIENS_DataIn5_InBus;
input [7:0] REGISTER_ALIENS_DataIn4_InBus;
input [7:0] REGISTER_ALIENS_DataIn3_InBus;
input [7:0] REGISTER_ALIENS_DataIn2_InBus;
input [7:0] REGISTER_ALIENS_DataIn1_InBus;

output [7:0] REGISTER_ALIENS_FILA7_BUS;
output [7:0] REGISTER_ALIENS_FILA6_BUS;
output [7:0] REGISTER_ALIENS_FILA5_BUS;
output [7:0] REGISTER_ALIENS_FILA4_BUS;
output [7:0] REGISTER_ALIENS_FILA3_BUS;
output [7:0] REGISTER_ALIENS_FILA2_BUS;
output [7:0] REGISTER_ALIENS_FILA1_BUS;
output [7:0] REGISTER_ALIENS_FILA0_BUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================

//=======================================================
//  Structural coding
//=======================================================

SI_REGSHIFTER_ALIEN RGSH_FILAO
(

.SC_RegSHIFTER_data_OutBUS(REGISTER_ALIENS_FILA0_BUS),
.SC_RegSHIFTER_CLOCK_50(REGISTER_ALIENS_CLOCK_50),
.SC_RegSHIFTER_RESET_InLow(REGISTER_ALIENS_RESET_InLow),
.SC_RegSHIFTER_clear_InLow(REGISTER_ALIENS_Clear_InLow), 
.SC_RegSHIFTER_load_InLow(REGISTER_ALIENS_Load_InLow), 
.SC_RegSHIFTER_shiftselection_In(REGISTER_ALIENS_shiftselection_InBus),
.SC_RegSHIFTER_DataIn_InBus(REGISTER_ALIENS_FILA1_BUS)

);

SI_REGSHIFTER_ALIEN RGSH_FILA1
(

.SC_RegSHIFTER_data_OutBUS(REGISTER_ALIENS_FILA1_BUS),
.SC_RegSHIFTER_CLOCK_50(REGISTER_ALIENS_CLOCK_50),
.SC_RegSHIFTER_RESET_InLow(REGISTER_ALIENS_RESET_InLow),
.SC_RegSHIFTER_clear_InLow(REGISTER_ALIENS_Clear_InLow), 
.SC_RegSHIFTER_load_InLow(REGISTER_ALIENS_Load_InLow), 
.SC_RegSHIFTER_shiftselection_In(REGISTER_ALIENS_shiftselection_InBus),
.SC_RegSHIFTER_DataIn_InBus(REGISTER_ALIENS_DataIn1_InBus)//(REGISTER_ALIENS_FILA2_BUS)//

);

SI_REGSHIFTER_ALIEN RGSH_FILA2
(

.SC_RegSHIFTER_data_OutBUS(REGISTER_ALIENS_FILA2_BUS),
.SC_RegSHIFTER_CLOCK_50(REGISTER_ALIENS_CLOCK_50),
.SC_RegSHIFTER_RESET_InLow(REGISTER_ALIENS_RESET_InLow),
.SC_RegSHIFTER_clear_InLow(REGISTER_ALIENS_Clear_InLow), 
.SC_RegSHIFTER_load_InLow(REGISTER_ALIENS_Load_InLow), 
.SC_RegSHIFTER_shiftselection_In(REGISTER_ALIENS_shiftselection_InBus),
.SC_RegSHIFTER_DataIn_InBus(REGISTER_ALIENS_DataIn2_InBus)//REGISTER_ALIENS_DataIn2_InBus

);

SI_REGSHIFTER_ALIEN RGSH_FILA3
(

.SC_RegSHIFTER_data_OutBUS(REGISTER_ALIENS_FILA3_BUS),
.SC_RegSHIFTER_CLOCK_50(REGISTER_ALIENS_CLOCK_50),
.SC_RegSHIFTER_RESET_InLow(REGISTER_ALIENS_RESET_InLow),
.SC_RegSHIFTER_clear_InLow(REGISTER_ALIENS_Clear_InLow), 
.SC_RegSHIFTER_load_InLow(REGISTER_ALIENS_Load_InLow), 
.SC_RegSHIFTER_shiftselection_In(REGISTER_ALIENS_shiftselection_InBus),
.SC_RegSHIFTER_DataIn_InBus(REGISTER_ALIENS_DataIn3_InBus)//REGISTER_ALIENS_DataIn3_InBus

);

SI_REGSHIFTER_ALIEN RGSH_FILA4
(

.SC_RegSHIFTER_data_OutBUS(REGISTER_ALIENS_FILA4_BUS),
.SC_RegSHIFTER_CLOCK_50(REGISTER_ALIENS_CLOCK_50),
.SC_RegSHIFTER_RESET_InLow(REGISTER_ALIENS_RESET_InLow),
.SC_RegSHIFTER_clear_InLow(REGISTER_ALIENS_Clear_InLow), 
.SC_RegSHIFTER_load_InLow(REGISTER_ALIENS_Load_InLow), 
.SC_RegSHIFTER_shiftselection_In(REGISTER_ALIENS_shiftselection_InBus),
.SC_RegSHIFTER_DataIn_InBus(REGISTER_ALIENS_DataIn4_InBus)//REGISTER_ALIENS_DataIn4_InBus

);

SI_REGSHIFTER_ALIEN RGSH_FILA5
(

.SC_RegSHIFTER_data_OutBUS(REGISTER_ALIENS_FILA5_BUS),
.SC_RegSHIFTER_CLOCK_50(REGISTER_ALIENS_CLOCK_50),
.SC_RegSHIFTER_RESET_InLow(REGISTER_ALIENS_RESET_InLow),
.SC_RegSHIFTER_clear_InLow(REGISTER_ALIENS_Clear_InLow), 
.SC_RegSHIFTER_load_InLow(REGISTER_ALIENS_Load_InLow), 
.SC_RegSHIFTER_shiftselection_In(REGISTER_ALIENS_shiftselection_InBus),
.SC_RegSHIFTER_DataIn_InBus(REGISTER_ALIENS_DataIn5_InBus)//REGISTER_ALIENS_DataIn5_InBus

);

SI_REGSHIFTER_ALIEN RGSH_FILA6
(

.SC_RegSHIFTER_data_OutBUS(REGISTER_ALIENS_FILA6_BUS),
.SC_RegSHIFTER_CLOCK_50(REGISTER_ALIENS_CLOCK_50),
.SC_RegSHIFTER_RESET_InLow(REGISTER_ALIENS_RESET_InLow),
.SC_RegSHIFTER_clear_InLow(REGISTER_ALIENS_Clear_InLow), 
.SC_RegSHIFTER_load_InLow(REGISTER_ALIENS_Load_InLow), 
.SC_RegSHIFTER_shiftselection_In(REGISTER_ALIENS_shiftselection_InBus),
.SC_RegSHIFTER_DataIn_InBus(REGISTER_ALIENS_DataIn6_InBus)//REGISTER_ALIENS_DataIn6_InBus

);

SI_REGSHIFTER_ALIEN RGSH_FILA7
(

.SC_RegSHIFTER_data_OutBUS(REGISTER_ALIENS_FILA7_BUS),
.SC_RegSHIFTER_CLOCK_50(REGISTER_ALIENS_CLOCK_50),
.SC_RegSHIFTER_RESET_InLow(REGISTER_ALIENS_RESET_InLow),
.SC_RegSHIFTER_clear_InLow(REGISTER_ALIENS_Clear_InLow), 
.SC_RegSHIFTER_load_InLow(REGISTER_ALIENS_Load_InLow), 
.SC_RegSHIFTER_shiftselection_In(REGISTER_ALIENS_shiftselection_InBus),
.SC_RegSHIFTER_DataIn_InBus(REGISTER_ALIENS_DataIn7_InBus)//REGISTER_ALIENS_DataIn7_InBus

);

endmodule