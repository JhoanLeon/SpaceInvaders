
//=======================================================
//  MODULE Definition
//=======================================================

module BB_SYSTEM (

//////////// INPUTS ///////////
	
BB_SYSTEM_CLOCK_50,	//Clock de todo el sistema 50Mhz
BB_SYSTEM_RESET_InLow,
BB_SYSTEM_START_InLow,
BB_SYSTEM_RIGHT_InLow,
BB_SYSTEM_LEFT_InLow,
BB_SYSTEM_SHOOT_InLow,

//////////// OUTPUTS //////////

BB_SYSTEM_DIN_Out,	//Salidas para el control de la matriz de leds
BB_SYSTEM_NCS_Out,
BB_SYSTEM_CLK_Out

);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================
	
input	BB_SYSTEM_CLOCK_50;
input BB_SYSTEM_RESET_InLow;
input BB_SYSTEM_START_InLow;
input BB_SYSTEM_RIGHT_InLow;
input BB_SYSTEM_LEFT_InLow;
input BB_SYSTEM_SHOOT_InLow;

output BB_SYSTEM_DIN_Out;
output BB_SYSTEM_NCS_Out;
output BB_SYSTEM_CLK_Out;
	
//=======================================================
//  REG/WIRE declarations
//=======================================================

wire SYSTEM_START_InLow_wire; //Conexión de la señal Start para el módulo Aliens
wire SYSTEM_BULLET_InLow_wire; //Conexión del estado de la bala para la máquina
									  	 //de estados de shoot 

//Conexiones del registro nave y shoot con el módulo aliens																			
wire [7:0] NAVE_ALIENS_Fila0; 
wire [7:0] NAVE_ALIENS_Fila1;
wire [7:0] NAVE_ALIENS_Fila2;
wire [7:0] NAVE_ALIENS_Fila3;
wire [7:0] NAVE_ALIENS_Fila4;
wire [7:0] NAVE_ALIENS_Fila5;
wire [7:0] NAVE_ALIENS_Fila6;
wire [7:0] NAVE_ALIENS_Fila7;

//=======================================================
//  Structural coding
//=======================================================

WB_SYSTEM_NAVE NAVE //Módulo nave, contiene a la nave y a shoot
(

.WB_SYSTEM_NAVE_CLOCK_50(BB_SYSTEM_CLOCK_50),
.WB_SYSTEM_NAVE_RESET_InLow(~BB_SYSTEM_RESET_InLow),
.WB_SYSTEM_NAVE_START_InLow(~BB_SYSTEM_START_InLow), //porque los botones de la placa de pruebas están en pulldown (siempre en bajo)
.WB_SYSTEM_NAVE_RIGHT_InLow(~BB_SYSTEM_RIGHT_InLow),
.WB_SYSTEM_NAVE_LEFT_InLow(~BB_SYSTEM_LEFT_InLow),
.WB_SYSTEM_NAVE_SHOOT_InLow(~BB_SYSTEM_SHOOT_InLow),
.WB_SYSTEM_NAVE_STATE_BULLET(SYSTEM_BULLET_InLow_wire),
.WB_SYSTEM_NAVE_START(SYSTEM_START_InLow_wire),
.WB_SYSTEM_NAVE_FILA0(NAVE_ALIENS_Fila0),
.WB_SYSTEM_NAVE_FILA1(NAVE_ALIENS_Fila1),
.WB_SYSTEM_NAVE_FILA2(NAVE_ALIENS_Fila2),
.WB_SYSTEM_NAVE_FILA3(NAVE_ALIENS_Fila3),
.WB_SYSTEM_NAVE_FILA4(NAVE_ALIENS_Fila4),
.WB_SYSTEM_NAVE_FILA5(NAVE_ALIENS_Fila5),
.WB_SYSTEM_NAVE_FILA6(NAVE_ALIENS_Fila6),
.WB_SYSTEM_NAVE_FILA7(NAVE_ALIENS_Fila7)

);


WB_SYSTEM_ALIENS ALIENS //Módulo Aliens, contiene las transiciones y los aliens.
(

.WB_SYSTEM_ALIENS_CLOCK_50(BB_SYSTEM_CLOCK_50),
.WB_SYSTEM_ALIENS_RESET_InLow(~BB_SYSTEM_RESET_InLow),
.WB_SYSTEM_ALIENS_START_InLow(SYSTEM_START_InLow_wire),
.WB_SYSTEM_ALIENS_STATEBULLET(SYSTEM_BULLET_InLow_wire),
.WB_SYSTEM_ALIENS_SHOOT_FILA7(NAVE_ALIENS_Fila7),
.WB_SYSTEM_ALIENS_SHOOT_FILA6(NAVE_ALIENS_Fila6),
.WB_SYSTEM_ALIENS_SHOOT_FILA5(NAVE_ALIENS_Fila5),
.WB_SYSTEM_ALIENS_SHOOT_FILA4(NAVE_ALIENS_Fila4),
.WB_SYSTEM_ALIENS_SHOOT_FILA3(NAVE_ALIENS_Fila3),
.WB_SYSTEM_ALIENS_SHOOT_FILA2(NAVE_ALIENS_Fila2),
.WB_SYSTEM_ALIENS_SHOOT_FILA1(NAVE_ALIENS_Fila1),
.WB_SYSTEM_ALIENS_NAVE_FILA0(NAVE_ALIENS_Fila0),
.WB_SYSTEM_ALIENS_DIN(BB_SYSTEM_DIN_Out), 
.WB_SYSTEM_ALIENS_NCS(BB_SYSTEM_NCS_Out),
.WB_SYSTEM_ALIENS_CLK(BB_SYSTEM_CLK_Out)

);

endmodule
