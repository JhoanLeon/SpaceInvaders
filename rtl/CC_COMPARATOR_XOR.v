
//=======================================================
//  MODULE Definition
//=======================================================

module CC_COMPARATOR_XOR
(

CC_COMPARATOR_aliens_fila7_bus_in,
CC_COMPARATOR_aliens_fila6_bus_in,
CC_COMPARATOR_aliens_fila5_bus_in,
CC_COMPARATOR_aliens_fila4_bus_in,
CC_COMPARATOR_aliens_fila3_bus_in,
CC_COMPARATOR_aliens_fila2_bus_in,
CC_COMPARATOR_aliens_fila1_bus_in,
CC_COMPARATOR_nave_fila0_bus_in,

CC_COMPARATOR_joiner_fila7_bus_in,
CC_COMPARATOR_joiner_fila6_bus_in,
CC_COMPARATOR_joiner_fila5_bus_in,
CC_COMPARATOR_joiner_fila4_bus_in,
CC_COMPARATOR_joiner_fila3_bus_in,
CC_COMPARATOR_joiner_fila2_bus_in,
CC_COMPARATOR_joiner_fila1_bus_in,
CC_COMPARATOR_joiner_fila0_bus_in,

CC_COMPARATOR_lose,
CC_COMPARATOR_statebullet

);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

input [7:0] CC_COMPARATOR_aliens_fila7_bus_in;
input [7:0] CC_COMPARATOR_aliens_fila6_bus_in;
input [7:0] CC_COMPARATOR_aliens_fila5_bus_in;
input [7:0] CC_COMPARATOR_aliens_fila4_bus_in;
input [7:0] CC_COMPARATOR_aliens_fila3_bus_in;
input [7:0] CC_COMPARATOR_aliens_fila2_bus_in;
input [7:0] CC_COMPARATOR_aliens_fila1_bus_in;
input [7:0] CC_COMPARATOR_nave_fila0_bus_in;

input [7:0] CC_COMPARATOR_joiner_fila7_bus_in;
input [7:0] CC_COMPARATOR_joiner_fila6_bus_in;
input [7:0] CC_COMPARATOR_joiner_fila5_bus_in;
input [7:0] CC_COMPARATOR_joiner_fila4_bus_in;
input [7:0] CC_COMPARATOR_joiner_fila3_bus_in;
input [7:0] CC_COMPARATOR_joiner_fila2_bus_in;
input [7:0] CC_COMPARATOR_joiner_fila1_bus_in;
input [7:0] CC_COMPARATOR_joiner_fila0_bus_in;

output CC_COMPARATOR_lose;
output CC_COMPARATOR_statebullet;

//=======================================================
//  REG/WIRE declarations
//=======================================================

reg lose;

reg statebullet0;
reg statebullet1;
reg statebullet2;
reg statebullet3;
reg statebullet4;
reg statebullet5;
reg statebullet6;
reg statebullet7;

//=======================================================
//  Structural coding
//=======================================================

always @(*)
begin
if(CC_COMPARATOR_joiner_fila0_bus_in == CC_COMPARATOR_nave_fila0_bus_in)
	begin
		lose = 1;
	end

else 
	begin
		lose = 0;
	end
end


always@(*)
begin
if(CC_COMPARATOR_joiner_fila1_bus_in < CC_COMPARATOR_aliens_fila1_bus_in)
	begin 
		statebullet1 = 0;
	end

else
	begin 
		statebullet1 = 1;
	end
end

always@(*)
begin
if(CC_COMPARATOR_joiner_fila2_bus_in < CC_COMPARATOR_aliens_fila2_bus_in)
	begin
		statebullet2 = 0;
	end

else
	begin 
		statebullet2 = 1;
	end
end

always@(*)
begin
if(CC_COMPARATOR_joiner_fila3_bus_in < CC_COMPARATOR_aliens_fila3_bus_in)
	begin 
		statebullet3 = 0;
	end

else
	begin 
		statebullet3 = 1;
	end
end

always@(*)
begin
if(CC_COMPARATOR_joiner_fila4_bus_in < CC_COMPARATOR_aliens_fila4_bus_in)
	begin 
		statebullet4 = 0;
	end

else
	begin
		statebullet4 = 1;
	end
end

always@(*)
begin
if(CC_COMPARATOR_joiner_fila5_bus_in < CC_COMPARATOR_aliens_fila5_bus_in)
	begin
		statebullet5 = 0;
	end

else
	begin 
		statebullet5 = 1;
	end
end

always@(*)
begin
if(CC_COMPARATOR_joiner_fila6_bus_in < CC_COMPARATOR_aliens_fila6_bus_in)
	begin
		statebullet6 = 0;
	end

else
	begin
		statebullet6 = 1;
	end
end

always @(*)
begin
if(CC_COMPARATOR_joiner_fila7_bus_in < CC_COMPARATOR_aliens_fila7_bus_in)
	begin
		statebullet7 = 0;
	end

else
	begin 
		statebullet7 = 1;
	end

end

assign CC_COMPARATOR_lose = lose;
assign CC_COMPARATOR_statebullet = statebullet1 & statebullet2 & statebullet3 & statebullet4 & statebullet5 & statebullet6 & statebullet7;

endmodule
