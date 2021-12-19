
//=======================================================
//  MODULE Definition
//=======================================================

module WB_SYSTEM_NAVE 
(

//////////// INPUTS //////////
	WB_SYSTEM_NAVE_CLOCK_50,
	WB_SYSTEM_NAVE_RESET_InLow,
	WB_SYSTEM_NAVE_START_InLow,
	WB_SYSTEM_NAVE_RIGHT_InLow,
	WB_SYSTEM_NAVE_LEFT_InLow,
	WB_SYSTEM_NAVE_SHOOT_InLow,
	WB_SYSTEM_NAVE_STATE_BULLET,
	
//////// OUTPUTS //////////// 	
	WB_SYSTEM_NAVE_START,
	WB_SYSTEM_NAVE_FILA0,
	WB_SYSTEM_NAVE_FILA1,
	WB_SYSTEM_NAVE_FILA2,
	WB_SYSTEM_NAVE_FILA3,
	WB_SYSTEM_NAVE_FILA4,
	WB_SYSTEM_NAVE_FILA5,
	WB_SYSTEM_NAVE_FILA6,
	WB_SYSTEM_NAVE_FILA7
	
);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
	
input	WB_SYSTEM_NAVE_CLOCK_50;
input WB_SYSTEM_NAVE_RESET_InLow;
input	WB_SYSTEM_NAVE_START_InLow;
input	WB_SYSTEM_NAVE_RIGHT_InLow;
input WB_SYSTEM_NAVE_LEFT_InLow;
input WB_SYSTEM_NAVE_SHOOT_InLow;
input WB_SYSTEM_NAVE_STATE_BULLET;

output 		 WB_SYSTEM_NAVE_START;
output [7:0] WB_SYSTEM_NAVE_FILA0;
output [7:0] WB_SYSTEM_NAVE_FILA1;
output [7:0] WB_SYSTEM_NAVE_FILA2;
output [7:0] WB_SYSTEM_NAVE_FILA3;
output [7:0] WB_SYSTEM_NAVE_FILA4;
output [7:0] WB_SYSTEM_NAVE_FILA5;
output [7:0] WB_SYSTEM_NAVE_FILA6;
output [7:0] WB_SYSTEM_NAVE_FILA7;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================

wire SYSTEM_RIGHT_InLow_wire;
wire SYSTEM_LEFT_InLow_wire;
wire SYSTEM_SHOOT_InLow_wire;

wire clear_shift_nave; 
wire load_shift_nave;
wire [1:0] shift_selection_nave;
wire [1:0] ind_comparator_nave;

wire end_of_count1_tomachine;
wire end_of_count7_tomachine;
wire machine_enable_count1;
wire control_statemachine_mux_shoot;
wire [7:0] bus_register_shoot;
wire clear_shift_shoot; 
wire load_shift_shoot;

//=======================================================
//  Structural coding
//=======================================================

SI_STATEMACHINE_NAVE SMN_u0	//Máquina de estados para controlar la nave
(

.SI_STATEMACHINE_NAVE_CLOCK_50(WB_SYSTEM_NAVE_CLOCK_50),
.SI_STATEMACHINE_NAVE_RESET_InLow(WB_SYSTEM_NAVE_RESET_InLow),
.SI_STATEMACHINE_NAVE_START_InLow(WB_SYSTEM_NAVE_START),
.SI_STATEMACHINE_NAVE_RIGHT_InLow(SYSTEM_RIGHT_InLow_wire),
.SI_STATEMACHINE_NAVE_LEFT_InLow(SYSTEM_LEFT_InLow_wire),
.SI_STATEMACHINE_NAVE_INDICATOR_InBus(ind_comparator_nave),

.SI_STATEMACHINE_NAVE_CLEAR_OUT(clear_shift_nave),
.SI_STATEMACHINE_NAVE_LOAD_OUT(load_shift_nave),
.SI_STATEMACHINE_NAVE_SHIFT_BUS(shift_selection_nave)

);

SI_REGSHIFTER_NAVE RSN_u0	//Registro con información de la nave
(

.SC_RegSHIFTER_CLOCK_50(WB_SYSTEM_NAVE_CLOCK_50),
.SC_RegSHIFTER_RESET_InLow(WB_SYSTEM_NAVE_RESET_InLow),
.SC_RegSHIFTER_clear_InLow(clear_shift_nave), 
.SC_RegSHIFTER_load_InLow(load_shift_nave),
 
.SC_RegSHIFTER_shiftselection_In(shift_selection_nave),
.SC_RegSHIFTER_data_OutBUS(WB_SYSTEM_NAVE_FILA0)

);

SI_COMPARATOR_NAVE CMP_u0	//Módulo que compara la posición de la nave para saber si llegó a un borde
(

.SI_COMPARATOR_NAVE_BUS_IN(WB_SYSTEM_NAVE_FILA0),
.SI_COMPARATOR_NAVE_IND_BUS(ind_comparator_nave)

);

SI_STATEMACHINE_SHOOT SMSH_u0	//Máquina de estados para controlar los disparos
(

.SI_STATEMACHINE_SHOOT_CLOCK_50(WB_SYSTEM_NAVE_CLOCK_50),
.SI_STATEMACHINE_SHOOT_RESET_InLow(WB_SYSTEM_NAVE_RESET_InLow),
.SI_STATEMACHINE_SHOOT_START_InLow(WB_SYSTEM_NAVE_START),
.SI_STATEMACHINE_SHOOT_SHOOT_InLow(SYSTEM_SHOOT_InLow_wire),
.SI_STATEMACHINE_SHOOT_COUNT1_InLow(end_of_count1_tomachine),
.SI_STATEMACHINE_SHOOT_COUNT7_InLow(end_of_count7_tomachine),
.SI_STATEMACHINE_SHOOT_BULLET_InLow(WB_SYSTEM_NAVE_STATE_BULLET),
	
.SI_STATEMACHINE_SHOOT_ENABLEC_OUT(machine_enable_count1),
.SI_STATEMACHINE_SHOOT_LOAD_OUT(load_shift_shoot),
.SI_STATEMACHINE_SHOOT_CLEAR_OUT(clear_shift_shoot),
.SI_STATEMACHINE_SHOOT_CTLMUX_OUT(control_statemachine_mux_shoot)

);

SI_REGISTER_SHOOT RSS_u0	//Arreglo de registros con información de la bala
(

.REGISTER_SHOOT_CLOCK_50(WB_SYSTEM_NAVE_CLOCK_50),
.REGISTER_SHOOT_RESET_InLow(WB_SYSTEM_NAVE_RESET_InLow),
.REGISTER_SHOOT_Load_InLow(load_shift_shoot),
.REGISTER_SHOOT_Clear_InLow(clear_shift_shoot),
.REGISTER_SHOOT_DataIn_InBus(bus_register_shoot),

.REGISTER_SHOOT_FILA7_BUS(WB_SYSTEM_NAVE_FILA7),
.REGISTER_SHOOT_FILA6_BUS(WB_SYSTEM_NAVE_FILA6),
.REGISTER_SHOOT_FILA5_BUS(WB_SYSTEM_NAVE_FILA5),
.REGISTER_SHOOT_FILA4_BUS(WB_SYSTEM_NAVE_FILA4),
.REGISTER_SHOOT_FILA3_BUS(WB_SYSTEM_NAVE_FILA3),
.REGISTER_SHOOT_FILA2_BUS(WB_SYSTEM_NAVE_FILA2),
.REGISTER_SHOOT_FILA1_BUS(WB_SYSTEM_NAVE_FILA1)

);

CC_MUX21 MUX_u0	//Múltiplexor para el desplazamiento de la bala
(

.CC_MUX21_z_Out_Bus(bus_register_shoot),
.CC_MUX21_select_InLow(control_statemachine_mux_shoot),
.CC_MUX21_data_InBUS(WB_SYSTEM_NAVE_FILA0)

);

SC_COUNTER1 CNTVELBULLET_u0	//Contador para la velocidad de la bala
(

.SC_COUNTER_CLOCK_50(WB_SYSTEM_NAVE_CLOCK_50),
.SC_COUNTER_RESET_InLow(WB_SYSTEM_NAVE_RESET_InLow),
.SC_COUNTER_count_InLow(machine_enable_count1),
.SC_COUNTER_eoc_OutLow(end_of_count1_tomachine)
	
);

SC_COUNTER7 CNTADVANCEBULLET_u0	//Contador para el tiempo entre disparos
(

.SC_COUNTER_CLOCK_50(WB_SYSTEM_NAVE_CLOCK_50),
.SC_COUNTER_RESET_InLow(WB_SYSTEM_NAVE_RESET_InLow),
.SC_COUNTER_count_InLow(machine_enable_count1),
.SC_COUNTER_eoc_OutLow(end_of_count7_tomachine)
	
);

SI_DEBOUNCE DB_START_u0	//Antirrebotes para todos los botones
(

.SI_DEBOUNCE1_CLOCK_50(WB_SYSTEM_NAVE_CLOCK_50), 
.SI_DEBOUNCE1_RESET_InLow(WB_SYSTEM_NAVE_RESET_InLow), 
.SI_DEBOUNCE1_button_In(WB_SYSTEM_NAVE_START_InLow),
.SI_DEBOUNCE1_button_Out(WB_SYSTEM_NAVE_START)	

);

SI_DEBOUNCE DB_RIGHT_u0
(

.SI_DEBOUNCE1_CLOCK_50(WB_SYSTEM_NAVE_CLOCK_50), 
.SI_DEBOUNCE1_RESET_InLow(WB_SYSTEM_NAVE_RESET_InLow), 
.SI_DEBOUNCE1_button_In(WB_SYSTEM_NAVE_RIGHT_InLow),
.SI_DEBOUNCE1_button_Out(SYSTEM_RIGHT_InLow_wire)	

);

SI_DEBOUNCE DB_LEFT_u0
(

.SI_DEBOUNCE1_CLOCK_50(WB_SYSTEM_NAVE_CLOCK_50), 
.SI_DEBOUNCE1_RESET_InLow(WB_SYSTEM_NAVE_RESET_InLow), 
.SI_DEBOUNCE1_button_In(WB_SYSTEM_NAVE_LEFT_InLow),
.SI_DEBOUNCE1_button_Out(SYSTEM_LEFT_InLow_wire)	

);

SI_DEBOUNCE DB_SHOOT_u0
(

.SI_DEBOUNCE1_CLOCK_50(WB_SYSTEM_NAVE_CLOCK_50), 
.SI_DEBOUNCE1_RESET_InLow(WB_SYSTEM_NAVE_RESET_InLow), 
.SI_DEBOUNCE1_button_In(WB_SYSTEM_NAVE_SHOOT_InLow),
.SI_DEBOUNCE1_button_Out(SYSTEM_SHOOT_InLow_wire)	

);

endmodule
