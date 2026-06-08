// SPDX-FileCopyrightText: 2026 SpaceLab UFSC
// SPDX-License-Identifier: GPL-2.0-only

module spi_cs_decoder (
    input  wire ss0_n,
    input  wire ss1_n,
    input  wire ss2_n,
    output wire cs0_n,
    output wire cs1_n,
    output wire cs2_n,
    output wire cs3_n,
    output wire cs4_n,
    output wire cs5_n,
    output wire cs6_n
);

    wire [2:0] ss_code;
    reg  [6:0] cs_n;

    assign ss_code = {ss2_n, ss1_n, ss0_n};
    assign cs0_n = cs_n[0];
    assign cs1_n = cs_n[1];
    assign cs2_n = cs_n[2];
    assign cs3_n = cs_n[3];
    assign cs4_n = cs_n[4];
    assign cs5_n = cs_n[5];
    assign cs6_n = cs_n[6];

    always @* begin
        cs_n = 7'b1111111;

        case (ss_code)
            3'b000: cs_n[0] = 1'b0;
            3'b001: cs_n[1] = 1'b0;
            3'b010: cs_n[2] = 1'b0;
            3'b011: cs_n[3] = 1'b0;
            3'b100: cs_n[4] = 1'b0;
            3'b101: cs_n[5] = 1'b0;
            3'b110: cs_n[6] = 1'b0;
            default: cs_n = 7'b1111111;
        endcase
    end

endmodule
