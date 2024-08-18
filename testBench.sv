//Adapted from Alexander Maso's Seven Segment Display Digit Test Bench

module seven_segment_digit_test();
	// Internal Signals
	logic   		    	a, b, c, d, e, f, g; 
    	logic   		    	golden_a, golden_b, golden_c, golden_d, golden_e, golden_f, golden_g; 
	logic   [3:0]			binary_coded_decimal;

	// Instantiate behavior module
/*
	sevenSegmentBehavioral dut(.binary_coded_decimal(binary_coded_decimal),
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.e(e),
		.f(f),
		.g(g));

*/

	//Instantiate structural module
	sevenSegmentStructural dut(.binary_coded_decimal(binary_coded_decimal),
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.e(e),
		.f(f),
		.g(g));
	initial 
	begin

		// Test all inputs from 0 to 9
		for (int i=0; i<10; i++)
        begin
		#10 //to ensure signal has settled
			binary_coded_decimal = i;
            case (i) // Do I need a begin?
                0: {golden_a, golden_b, golden_c, golden_d, golden_e, golden_f, golden_g} = 7'b1111110;
                1: {golden_a, golden_b, golden_c, golden_d, golden_e, golden_f, golden_g} = 7'b0110000;
                2: {golden_a, golden_b, golden_c, golden_d, golden_e, golden_f, golden_g} = 7'b1101101;
                3: {golden_a, golden_b, golden_c, golden_d, golden_e, golden_f, golden_g} = 7'b1111001;
                4: {golden_a, golden_b, golden_c, golden_d, golden_e, golden_f, golden_g} = 7'b0110011;
                5: {golden_a, golden_b, golden_c, golden_d, golden_e, golden_f, golden_g} = 7'b1011011;
                6: {golden_a, golden_b, golden_c, golden_d, golden_e, golden_f, golden_g} = 7'b1011111;
                7: {golden_a, golden_b, golden_c, golden_d, golden_e, golden_f, golden_g} = 7'b1110000;
                8: {golden_a, golden_b, golden_c, golden_d, golden_e, golden_f, golden_g} = 7'b1111111;
                9: {golden_a, golden_b, golden_c, golden_d, golden_e, golden_f, golden_g} = 7'b1111011;
            endcase
			#250; //large number to ensure output is settled
			if ({a, b, c, d, e, f, g}=={golden_a,golden_b,golden_c,golden_d,golden_e,golden_f,golden_g})
			begin
				$display("PASS | Input = %d  | Golden = %7b |  {a,b,c,d,e,f,g} = %7b", binary_coded_decimal, {golden_a,golden_b,golden_c,golden_d,golden_e,golden_f,golden_g}, {a,b,c,d,e,f,g});
			end
			else
			begin
				$display("FAIL | Input = %d  | Golden = %7b |  {a,b,c,d,e,f,g} = %7b", binary_coded_decimal, {golden_a,golden_b,golden_c,golden_d,golden_e,golden_f,golden_g}, {a,b,c,d,e,f,g});
			end
		#1;	
		end
	end

endmodule
