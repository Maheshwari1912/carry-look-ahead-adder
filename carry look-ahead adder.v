module cla_4bit (
    input logic [3:0] A, B,
    input logic Cin,
    output logic [3:0] Sum,
    output logic Cout
);
    logic [3:0] P, G, C;

    // Generate & Propagate
    assign P = A ^ B; // Propagate
    assign G = A & B; // Generate

    // Carry Calculation
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign Cout = G[3] | (P[3] & C[3]);

    // Sum Calculation
    assign Sum = P ^ C;

endmodule
