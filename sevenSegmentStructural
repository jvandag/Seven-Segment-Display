module sevenSegmentStructural(	
	input logic [3:0] binary_coded_decimal,
	output logic a,b,c,d,e,f,g);

	logic B0,B1,B2,B3;

	assign B3 = binary_coded_decimal[3];
	assign B2 = binary_coded_decimal[2];
	assign B1 = binary_coded_decimal[1];
	assign B0 = binary_coded_decimal[0];

	int notDelay = 29;
	int orDelay = 36;
	int andDelay = 30;
	//Logic for output a
	wire aG1, aG2, aG3, aG4, aG5;
	not #notDelay
		U1a0(aG1, B2),
		U1a1(aG2, B0);
	or #orDelay
		U2a0(aG3, aG1, B0, B1),
		U2a1(aG4, B1, B2, B3),
		U2a2(aG5, aG2, aG4);//or gates available only have 3 inputs
	and #andDelay
		U3a0(a, aG3, aG5);
		
	//Logic for output b
	wire bG1, bG2, bG3, bG4, bG5;
	not #notDelay
		U1b0(bG1, B0),
		U1b1(bG2, B1);
	and #andDelay
		U3b0(bG3, bG1, B1, B2),
		U3b1(bG4, bG2, B0, B2);
	or #orDelay
		U2b0(bG5, bG3, bG4);
	not #notDelay
		U1b2(b, bG5);

	//Logic for output c
	wire cG1;
	not #notDelay
		U1c0(cG1, B1);
	or #orDelay
		U2c0(c, B0, B2, cG1);

	//Logic for output d
	wire dG1, dG2, dG3, dG4, dG5, dG6, dG7, dG8, dG9;
	or #orDelay
		U2d0(dG1, B1, B2, B3),
		U2d1(dG2, B0, B1);
	not #notDelay
		U1d0(dG3, dG1),
		U1d1(dG4, dG2);
	and #andDelay
		U3d0(dG5, dG3, B0),
		U3d1(dG6, dG4, B2),
		U3d2(dG7, B0, B1, B2);
	or #orDelay
		U2d2(dG8, dG5, dG6),
		U2d3(dG9, dG7, dG8);
	not #notDelay
		U1d2(d, dG9);

	//Logic for output e
	wire eG1, eG2, eG3;
	not #notDelay
		U1e0(eG1, B0),
		U1e1(eG2, B2);
	or #orDelay
		U2e0(eG3, B1, eG2);
	and #andDelay
		U3e0(e, eG1, eG3);

	//Logic for output f
	wire fG1, fG2, fG3, fG4, fG5;
	not #notDelay
		U1f0(fG1, B1),
		U1f1(fG2, B0);//shared in structural but not behavioral
	and #andDelay
		U3f0(fG3, B2, fG2);
	or #orDelay
		U2f0(fG4, fG1, fG3),
		U2f1(fG5, fG2, B2, B3);
	and #andDelay
		U3f1(f, fG4, fG5);

	//Logic for output g
	wire gG1, gG2, gG3, gG4, gG5, gG6, gG7, gG8;
	not #notDelay
		U1g0(gG1, B2),
		U1g1(gG2, B0),
		U1g2(gG3, B1);
	and #andDelay
		U3g0(gG4, gG1, B1),
		U3g1(gG5, gG2, B2),
		U3g2(gG6, gG3, B0, B2);
	or #orDelay
		U2g0(gG7, B3, gG4),
		U2g1(gG8, gG5, gG7),
		U2g2(g, gG6, gG8);	
endmodule
