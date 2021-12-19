
//=======================================================
//  MODULE Definition
//=======================================================

module WB_SYSTEM_ALIENS (

//////////// INPUTS //////////
	WB_SYSTEM_ALIENS_CLOCK_50,
	WB_SYSTEM_ALIENS_RESET_InLow,
	WB_SYSTEM_ALIENS_START_InLow,
	
	WB_SYSTEM_ALIENS_SHOOT_FILA7,
	WB_SYSTEM_ALIENS_SHOOT_FILA6,
	WB_SYSTEM_ALIENS_SHOOT_FILA5,
	WB_SYSTEM_ALIENS_SHOOT_FILA4,
	WB_SYSTEM_ALIENS_SHOOT_FILA3,
	WB_SYSTEM_ALIENS_SHOOT_FILA2,
	WB_SYSTEM_ALIENS_SHOOT_FILA1,
	WB_SYSTEM_ALIENS_NAVE_FILA0,
	
//////////// OUTPUTS //////////
	WB_SYSTEM_ALIENS_STATEBULLET,

	WB_SYSTEM_ALIENS_NCS,
	WB_SYSTEM_ALIENS_CLK,
	WB_SYSTEM_ALIENS_DIN

);
//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
	
input	WB_SYSTEM_ALIENS_CLOCK_50;
input WB_SYSTEM_ALIENS_RESET_InLow;
input	WB_SYSTEM_ALIENS_START_InLow;

input [7:0] WB_SYSTEM_ALIENS_SHOOT_FILA7;
input [7:0] WB_SYSTEM_ALIENS_SHOOT_FILA6;
input [7:0] WB_SYSTEM_ALIENS_SHOOT_FILA5;
input [7:0] WB_SYSTEM_ALIENS_SHOOT_FILA4;
input [7:0] WB_SYSTEM_ALIENS_SHOOT_FILA3;
input [7:0] WB_SYSTEM_ALIENS_SHOOT_FILA2;
input [7:0] WB_SYSTEM_ALIENS_SHOOT_FILA1;
input [7:0] WB_SYSTEM_ALIENS_NAVE_FILA0;

output WB_SYSTEM_ALIENS_STATEBULLET;

output WB_SYSTEM_ALIENS_NCS;
output WB_SYSTEM_ALIENS_CLK;
output WB_SYSTEM_ALIENS_DIN;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================

wire [7:0] mux_register_bus7;
wire [7:0] mux_register_bus6;
wire [7:0] mux_register_bus5;
wire [7:0] mux_register_bus4;
wire [7:0] mux_register_bus3;
wire [7:0] mux_register_bus2;
wire [7:0] mux_register_bus1;

wire [7:0] alien_joiner_bus_fila7;
wire [7:0] alien_joiner_bus_fila6;
wire [7:0] alien_joiner_bus_fila5;
wire [7:0] alien_joiner_bus_fila4;
wire [7:0] alien_joiner_bus_fila3;
wire [7:0] alien_joiner_bus_fila2;
wire [7:0] alien_joiner_bus_fila1;
wire [7:0] alien_joiner_bus_fila0;

wire [7:0] joiner_selector_bus_fila7;
wire [7:0] joiner_selector_bus_fila6;
wire [7:0] joiner_selector_bus_fila5;
wire [7:0] joiner_selector_bus_fila4;
wire [7:0] joiner_selector_bus_fila3;
wire [7:0] joiner_selector_bus_fila2;
wire [7:0] joiner_selector_bus_fila1;
wire [7:0] joiner_selector_bus_fila0;

wire [7:0] transition_selector_bus_fila7;
wire [7:0] transition_selector_bus_fila6;
wire [7:0] transition_selector_bus_fila5;
wire [7:0] transition_selector_bus_fila4;
wire [7:0] transition_selector_bus_fila3;
wire [7:0] transition_selector_bus_fila2;
wire [7:0] transition_selector_bus_fila1;
wire [7:0] transition_selector_bus_fila0;

wire [7:0] selector_img_bus_fila7;
wire [7:0] selector_img_bus_fila6;
wire [7:0] selector_img_bus_fila5;
wire [7:0] selector_img_bus_fila4;
wire [7:0] selector_img_bus_fila3;
wire [7:0] selector_img_bus_fila2;
wire [7:0] selector_img_bus_fila1;
wire [7:0] selector_img_bus_fila0;

wire machine_reg_aliens_load;
wire machine_reg_aliens_clear;
wire [1:0] machine_reg_aliens_shift;

wire comparator_machine_lose;

wire select_machine_to_selector;

wire [2:0] machine_transition;

wire counta_machine;
wire counta1_mux41al;
wire counta2_mux41al;
wire counta3_mux41al;

wire [1:0] machine_countlevel_count;

wire machine_enable_countma;
wire countma_machine;
wire countma1_mux;
wire countma2_mux;

wire machine_counter4ma_countup;
wire machine_counter4ma_clearcount;
wire [1:0] count4ma_machine;

wire enable_countra_machine;
wire countra_machine;

wire [2:0] selec_4mux21_statemachie;

wire statebullet_wire;

wire demux_counta1;
wire demux_counta2;
wire demux_counta3;

wire [7:0] data_max;
wire [2:0] add_max;

//=======================================================
//  Structural coding
//=======================================================

SI_STATEMACHINE_ALIENS SMA_u0	//Máquina de estados que controla a los aliens
(

.SI_STATEMACHINE_ALIENS_CLOCK_50(WB_SYSTEM_ALIENS_CLOCK_50),
.SI_STATEMACHINE_ALIENS_RESET_InLow(WB_SYSTEM_ALIENS_RESET_InLow),
.SI_STATEMACHINE_ALIENS_START_InLow(WB_SYSTEM_ALIENS_START_InLow),
.SI_STATEMACHINE_ALIENS_WIN_InLow(counta_machine),
.SI_STATEMACHINE_ALIENS_COUNTMA_InLow(countma_machine),
.SI_STATEMACHINE_ALIENS_COUNTRA_InLow(countra_machine),
.SI_STATEMACHINE_ALIENS_COUNT4MA_InLow(count4ma_machine),
.SI_STATEMACHINE_ALIENS_COUNTLEVEL_InLow(machine_countlevel_count),
.SI_STATEMACHINE_ALIENS_LOSE_InLow(comparator_machine_lose),
.SI_STATEMACHINE_ALIENS_STATEBULLET_InLow(statebullet_wire),
	
.SI_STATEMACHINE_ALIENS_CLEAR_OUT(machine_reg_aliens_clear),
.SI_STATEMACHINE_ALIENS_LOAD_OUT(machine_reg_aliens_load),
.SI_STATEMACHINE_ALIENS_SHIFT_BUS(machine_reg_aliens_shift),
.SI_STATEMACHINE_ALIENS_TRANSITION_BUS(machine_transition),
.SI_STATEMACHINE_ALIENS_SELECT_OUT(select_machine_to_selector),
.SI_STATEMACHINE_ALIENS_ENABLE_COUNTMA(machine_enable_countma),
.SI_STATEMACHINE_ALIENS_COUNTUP_COUNT4MA(machine_counter4ma_countup),
.SI_STATEMACHINE_ALIENS_CLEARCOUNT_COUNT4MA(machine_counter4ma_clearcount),
.SI_STATEMACHINE_ALIENS_ENABLE_COUNTRA(enable_countra_machine),
.SI_STATEMACHINE_ALIENS_SELECT_4MUX21(selec_4mux21_statemachie)

);

SI_REGISTER_ALIENS RSA_u0	//Arreglo de registros con la información de los aliens
(

.REGISTER_ALIENS_CLOCK_50(WB_SYSTEM_ALIENS_CLOCK_50),
.REGISTER_ALIENS_RESET_InLow(WB_SYSTEM_ALIENS_RESET_InLow),
.REGISTER_ALIENS_shiftselection_InBus(machine_reg_aliens_shift),	
.REGISTER_ALIENS_Load_InLow(machine_reg_aliens_load),
.REGISTER_ALIENS_Clear_InLow(machine_reg_aliens_clear),
.REGISTER_ALIENS_DataIn7_InBus(mux_register_bus7),
.REGISTER_ALIENS_DataIn6_InBus(mux_register_bus6),
.REGISTER_ALIENS_DataIn5_InBus(mux_register_bus5),
.REGISTER_ALIENS_DataIn4_InBus(mux_register_bus4),
.REGISTER_ALIENS_DataIn3_InBus(mux_register_bus3),
.REGISTER_ALIENS_DataIn2_InBus(mux_register_bus2),
.REGISTER_ALIENS_DataIn1_InBus(mux_register_bus1),
.REGISTER_ALIENS_FILA7_BUS(alien_joiner_bus_fila7),
.REGISTER_ALIENS_FILA6_BUS(alien_joiner_bus_fila6),
.REGISTER_ALIENS_FILA5_BUS(alien_joiner_bus_fila5),
.REGISTER_ALIENS_FILA4_BUS(alien_joiner_bus_fila4),
.REGISTER_ALIENS_FILA3_BUS(alien_joiner_bus_fila3),
.REGISTER_ALIENS_FILA2_BUS(alien_joiner_bus_fila2),
.REGISTER_ALIENS_FILA1_BUS(alien_joiner_bus_fila1),
.REGISTER_ALIENS_FILA0_BUS(alien_joiner_bus_fila0)

);

CC_4MUX21 MUX21_u0	//Mux con información inicial de los aliens para cargarla al registro
(

.CC_4MUX21_select_InLow(selec_4mux21_statemachie),
.CC_4MUX21_data7_InBUS(joiner_selector_bus_fila7),
.CC_4MUX21_data6_InBUS(joiner_selector_bus_fila6),
.CC_4MUX21_data5_InBUS(joiner_selector_bus_fila5),
.CC_4MUX21_data4_InBUS(joiner_selector_bus_fila4),
.CC_4MUX21_data3_InBUS(joiner_selector_bus_fila3),
.CC_4MUX21_data2_InBUS(joiner_selector_bus_fila2),
.CC_4MUX21_data1_InBUS(joiner_selector_bus_fila1),
.CC_4MUX21_Out_Bus7(mux_register_bus7),
.CC_4MUX21_Out_Bus6(mux_register_bus6),
.CC_4MUX21_Out_Bus5(mux_register_bus5),
.CC_4MUX21_Out_Bus4(mux_register_bus4),
.CC_4MUX21_Out_Bus3(mux_register_bus3),
.CC_4MUX21_Out_Bus2(mux_register_bus2),
.CC_4MUX21_Out_Bus1(mux_register_bus1)

);

CC_MUX21VEL MUX21VEL_u0 //Multiplexor para la velocidad de los aliens en cada nivel
( 

.CC_MUX21VEL_select_InLow(machine_countlevel_count[0]),
.CC_MUX21VEL_IN1(countma1_mux),
.CC_MUX21VEL_IN2(countma2_mux),
.CC_MUX21VEL_Out(countma_machine)
	
);

CC_MUX41AL MUX41AL_u0 //Multiplexor para la cantidad de aliens en cada nivel
(

.CC_MUX41AL_select_InLow(machine_countlevel_count),
.CC_MUX41AL_IN1(counta1_mux41al),
.CC_MUX41AL_IN2(counta2_mux41al),
.CC_MUX41AL_IN3(counta3_mux41al),
.CC_MUX41AL_IN4(),
.CC_MUX41AL_Out(counta_machine)

);

CC_DEMUX_14 DEMUX14_u0
(

.CC_DEMUX_14_SLC(machine_countlevel_count),
.CC_DEMUX_14_In(statebullet_wire),
.CC_DEMUX_14_Out1(demux_counta1),
.CC_DEMUX_14_Out2(demux_counta2),
.CC_DEMUX_14_Out3(demux_counta3),
.CC_DEMUX_14_Out4()

);

SC_COUNTERA1 CNTA1_u0	//Cuenta la cantidad de aliens muertos en nivel 1 para saber si ganó el nivel
(

.SC_COUNTER_CLOCK_50(WB_SYSTEM_ALIENS_CLOCK_50),
.SC_COUNTER_RESET_InLow(WB_SYSTEM_ALIENS_RESET_InLow),
.SC_COUNTER_count_InLow(demux_counta1),
.SC_COUNTER_regcount_OutBus(),
.SC_COUNTER_eoc_OutLow(counta1_mux41al)
	
);

SC_COUNTERA2 CNTA2_u0	//Cuenta la cantidad de aliens muertos en nivel 2 para saber si ganó el nivel
(

.SC_COUNTER_CLOCK_50(WB_SYSTEM_ALIENS_CLOCK_50),
.SC_COUNTER_RESET_InLow(WB_SYSTEM_ALIENS_RESET_InLow),
.SC_COUNTER_count_InLow(demux_counta2),
.SC_COUNTER_regcount_OutBus(),
.SC_COUNTER_eoc_OutLow(counta2_mux41al)
	
);

SC_COUNTERA3 CNTA3_u0	//Cuenta la cantidad de aliens muertos en nivel 3 para saber si ganó el juego
(

.SC_COUNTER_CLOCK_50(WB_SYSTEM_ALIENS_CLOCK_50),
.SC_COUNTER_RESET_InLow(WB_SYSTEM_ALIENS_RESET_InLow),
.SC_COUNTER_count_InLow(demux_counta3),
.SC_COUNTER_regcount_OutBus(),
.SC_COUNTER_eoc_OutLow(counta3_mux41al)
	
);

SC_COUNTERMA1 CNTMA1_u0	//Contador para la velocidad de movimiento de los aliens en nivel 1
(

.SC_COUNTER_CLOCK_50(WB_SYSTEM_ALIENS_CLOCK_50),
.SC_COUNTER_RESET_InLow(WB_SYSTEM_ALIENS_RESET_InLow),
.SC_COUNTER_count_InLow(machine_enable_countma),
.SC_COUNTER_eoc_OutLow(countma1_mux)
	
);

SC_COUNTERMA2 CNTMA2_u0	//Contador para la velocidad de movimiento de los aliens en nivel 2
(

.SC_COUNTER_CLOCK_50(WB_SYSTEM_ALIENS_CLOCK_50),
.SC_COUNTER_RESET_InLow(WB_SYSTEM_ALIENS_RESET_InLow),
.SC_COUNTER_count_InLow(machine_enable_countma),
.SC_COUNTER_eoc_OutLow(countma2_mux)
	
);

SC_COUNTER4MA CNT4MA_u0 //Contador para el descenso de los aliens cuando llegan a los bordes
(

.SC_COUNTER_CLOCK_50(WB_SYSTEM_ALIENS_CLOCK_50),
.SC_COUNTER_RESET_InLow(WB_SYSTEM_ALIENS_RESET_InLow),
.SC_COUNTER_countup_InLow(machine_counter4ma_countup),
.SC_COUNTER_CLEARCOUNT_InLow(machine_counter4ma_clearcount),
.SC_COUNTER_eoc_OutLow(count4ma_machine)
	
);

SC_COUNTERLEVEL CNTLEVEL_u0	//Cuenta el nivel del juego
(

.SC_COUNTER_CLOCK_50(WB_SYSTEM_ALIENS_CLOCK_50),
.SC_COUNTER_RESET_InLow(WB_SYSTEM_ALIENS_RESET_InLow),
.SC_COUNTER_count_InLow(counta_machine),
.SC_COUNTER_regcount_OutBus(machine_countlevel_count)
	
);

SC_COUNTERTRANSITION CNTTR_u0	//Contador para el tiempo que debe durar las transiciones de pantalla
(

.SC_COUNTER_CLOCK_50(WB_SYSTEM_ALIENS_CLOCK_50),
.SC_COUNTER_RESET_InLow(WB_SYSTEM_ALIENS_RESET_InLow),
.SC_COUNTER_count_InLow(enable_countra_machine),
.SC_COUNTER_eoc_OutLow(countra_machine)
	
);

SI_TRANSITION TRNS_u0	//Componente con la información de las transiciones de pantalla
(

.transition_statemachine_aliens_ctl(machine_transition),
.transition_selector_fila7_bus_out(transition_selector_bus_fila7),
.transition_selector_fila6_bus_out(transition_selector_bus_fila6),
.transition_selector_fila5_bus_out(transition_selector_bus_fila5),
.transition_selector_fila4_bus_out(transition_selector_bus_fila4),
.transition_selector_fila3_bus_out(transition_selector_bus_fila3),
.transition_selector_fila2_bus_out(transition_selector_bus_fila2),
.transition_selector_fila1_bus_out(transition_selector_bus_fila1),
.transition_selector_fila0_bus_out(transition_selector_bus_fila0)

);

CC_JOINER JN_u0 //Módulo para unir los aliens, el disparo y la nave
(

.CC_JOINER_shoot_fila7_bus_in(WB_SYSTEM_ALIENS_SHOOT_FILA7),
.CC_JOINER_shoot_fila6_bus_in(WB_SYSTEM_ALIENS_SHOOT_FILA6),
.CC_JOINER_shoot_fila5_bus_in(WB_SYSTEM_ALIENS_SHOOT_FILA5),
.CC_JOINER_shoot_fila4_bus_in(WB_SYSTEM_ALIENS_SHOOT_FILA4),
.CC_JOINER_shoot_fila3_bus_in(WB_SYSTEM_ALIENS_SHOOT_FILA3),
.CC_JOINER_shoot_fila2_bus_in(WB_SYSTEM_ALIENS_SHOOT_FILA2),
.CC_JOINER_shoot_fila1_bus_in(WB_SYSTEM_ALIENS_SHOOT_FILA1),
.CC_JOINER_nave_fila0_bus_in(WB_SYSTEM_ALIENS_NAVE_FILA0),

.CC_JOINER_aliens_fila7_bus_in(alien_joiner_bus_fila7),
.CC_JOINER_aliens_fila6_bus_in(alien_joiner_bus_fila6),
.CC_JOINER_aliens_fila5_bus_in(alien_joiner_bus_fila5),
.CC_JOINER_aliens_fila4_bus_in(alien_joiner_bus_fila4),
.CC_JOINER_aliens_fila3_bus_in(alien_joiner_bus_fila3),
.CC_JOINER_aliens_fila2_bus_in(alien_joiner_bus_fila2),
.CC_JOINER_aliens_fila1_bus_in(alien_joiner_bus_fila1),
.CC_JOINER_aliens_fila0_bus_in(alien_joiner_bus_fila0),

.CC_JOINER_fila7_bus_out(joiner_selector_bus_fila7),
.CC_JOINER_fila6_bus_out(joiner_selector_bus_fila6),
.CC_JOINER_fila5_bus_out(joiner_selector_bus_fila5),
.CC_JOINER_fila4_bus_out(joiner_selector_bus_fila4),
.CC_JOINER_fila3_bus_out(joiner_selector_bus_fila3),
.CC_JOINER_fila2_bus_out(joiner_selector_bus_fila2),
.CC_JOINER_fila1_bus_out(joiner_selector_bus_fila1),
.CC_JOINER_fila0_bus_out(joiner_selector_bus_fila0)

);

CC_COMPARATOR_XOR COMPX_u0  //Módulo para comparar el estado de la bala y si los aliens llegaron a bajo
(

.CC_COMPARATOR_aliens_fila7_bus_in(alien_joiner_bus_fila7),
.CC_COMPARATOR_aliens_fila6_bus_in(alien_joiner_bus_fila6),
.CC_COMPARATOR_aliens_fila5_bus_in(alien_joiner_bus_fila5),
.CC_COMPARATOR_aliens_fila4_bus_in(alien_joiner_bus_fila4),
.CC_COMPARATOR_aliens_fila3_bus_in(alien_joiner_bus_fila3),
.CC_COMPARATOR_aliens_fila2_bus_in(alien_joiner_bus_fila2),
.CC_COMPARATOR_aliens_fila1_bus_in(alien_joiner_bus_fila1),
.CC_COMPARATOR_nave_fila0_bus_in(WB_SYSTEM_ALIENS_NAVE_FILA0),

.CC_COMPARATOR_joiner_fila7_bus_in(joiner_selector_bus_fila7),
.CC_COMPARATOR_joiner_fila6_bus_in(joiner_selector_bus_fila6),
.CC_COMPARATOR_joiner_fila5_bus_in(joiner_selector_bus_fila5),
.CC_COMPARATOR_joiner_fila4_bus_in(joiner_selector_bus_fila4),
.CC_COMPARATOR_joiner_fila3_bus_in(joiner_selector_bus_fila3),
.CC_COMPARATOR_joiner_fila2_bus_in(joiner_selector_bus_fila2),
.CC_COMPARATOR_joiner_fila1_bus_in(joiner_selector_bus_fila1),
.CC_COMPARATOR_joiner_fila0_bus_in(joiner_selector_bus_fila0),

.CC_COMPARATOR_lose(comparator_machine_lose),
.CC_COMPARATOR_statebullet(statebullet_wire)

);

SI_SELECTOR_SCREEN SLT_u0	//Selector de pantallas para elegir entre el juego o la transición
(

.selector_mux_screen(select_machine_to_selector),

.selector_transition_fila7_bus_in(transition_selector_bus_fila7),
.selector_transition_fila6_bus_in(transition_selector_bus_fila6),
.selector_transition_fila5_bus_in(transition_selector_bus_fila5),
.selector_transition_fila4_bus_in(transition_selector_bus_fila4),
.selector_transition_fila3_bus_in(transition_selector_bus_fila3),
.selector_transition_fila2_bus_in(transition_selector_bus_fila2),
.selector_transition_fila1_bus_in(transition_selector_bus_fila1),
.selector_transition_fila0_bus_in(transition_selector_bus_fila0),

.selector_joiner_fila7_bus_in(joiner_selector_bus_fila7),
.selector_joiner_fila6_bus_in(joiner_selector_bus_fila6),
.selector_joiner_fila5_bus_in(joiner_selector_bus_fila5),
.selector_joiner_fila4_bus_in(joiner_selector_bus_fila4),
.selector_joiner_fila3_bus_in(joiner_selector_bus_fila3),
.selector_joiner_fila2_bus_in(joiner_selector_bus_fila2),
.selector_joiner_fila1_bus_in(joiner_selector_bus_fila1),
.selector_joiner_fila0_bus_in(joiner_selector_bus_fila0),

.selector_img_fila7_bus_out(selector_img_bus_fila7),
.selector_img_fila6_bus_out(selector_img_bus_fila6),
.selector_img_fila5_bus_out(selector_img_bus_fila5),
.selector_img_fila4_bus_out(selector_img_bus_fila4),
.selector_img_fila3_bus_out(selector_img_bus_fila3),
.selector_img_fila2_bus_out(selector_img_bus_fila2),
.selector_img_fila1_bus_out(selector_img_bus_fila1),
.selector_img_fila0_bus_out(selector_img_bus_fila0)

);

IMAGEN IMG_u0	//Módulo utilizado para funcionamiento de la matriz
(

.img_select_add(add_max),
.img_fila7_bus_in(selector_img_bus_fila7),
.img_fila6_bus_in(selector_img_bus_fila6),
.img_fila5_bus_in(selector_img_bus_fila5),
.img_fila4_bus_in(selector_img_bus_fila4),
.img_fila3_bus_in(selector_img_bus_fila3),
.img_fila2_bus_in(selector_img_bus_fila2),
.img_fila1_bus_in(selector_img_bus_fila1),
.img_fila0_bus_in(selector_img_bus_fila0),
.img_data_max_in(data_max)

);

matrix_ctrl MAXC_u0	//Módulo de control de la matriz
(

.max7219_din(WB_SYSTEM_ALIENS_DIN),//max7219_din 
.max7219_ncs(WB_SYSTEM_ALIENS_NCS),//max7219_ncs 
.max7219_clk(WB_SYSTEM_ALIENS_CLK),//max7219_clk
.disp_data(data_max), 
.disp_addr(add_max),
.intensity(4'hA),
.clk(WB_SYSTEM_ALIENS_CLOCK_50),
.reset(~WB_SYSTEM_ALIENS_RESET_InLow) 

);

assign WB_SYSTEM_ALIENS_STATEBULLET = statebullet_wire;

endmodule
