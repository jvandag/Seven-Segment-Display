module sevenSegmentBehavioral(
	input logic [3:0] binary_coded_decimal,
	output logic a,b,c,d,e,f,g);

	logic B0,B1,B2,B3;

	assign B3 = binary_coded_decimal[3];
	assign B2 = binary_coded_decimal[2];
	assign B1 = binary_coded_decimal[1];
	assign B0 = binary_coded_decimal[0];

	assign a = (B0|B1|~B2)&(~B0|B1|B2|B3);
	assign b = ~((~B0&B1&B2)|(B0&~B1&B2));
	assign c = B0|~B1|B2;
	assign d = ~((B0&~B1&~B2&~B3)|(~B0&~B1&B2)|(B0&B1&B2));
	assign e = ~B0&(B1|~B2);
	assign f = (~B1|(B2&~B0))&(~B0|B2|B3);
	assign g = B3|(B1&~B2)|(~B0&B2)|(B0&~B1&B2);
endmodule
