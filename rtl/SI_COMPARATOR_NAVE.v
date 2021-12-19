
//=======================================================
//  MODULE Definition
//=======================================================

module SI_COMPARATOR_NAVE
(

SI_COMPARATOR_NAVE_BUS_IN,
SI_COMPARATOR_NAVE_IND_BUS

);

//=======================================================
//  PARAMETER declarations
//=======================================================

//=======================================================
//  PORT declarations
//=======================================================

input [7:0] SI_COMPARATOR_NAVE_BUS_IN;
output [1:0] SI_COMPARATOR_NAVE_IND_BUS;

//=======================================================
//  REG/WIRE declarations
//=======================================================

reg [1:0] bus_out_indicator; 

//=======================================================
//  Structural coding
//=======================================================

always @(*)

begin

if (SI_COMPARATOR_NAVE_BUS_IN == 8'b00000001)
bus_out_indicator = 2'b10;

else if (SI_COMPARATOR_NAVE_BUS_IN == 8'b10000000)
bus_out_indicator = 2'b01;

else 
bus_out_indicator = 2'b11;  

end

assign SI_COMPARATOR_NAVE_IND_BUS = bus_out_indicator; 

endmodule
