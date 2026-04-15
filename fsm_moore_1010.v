`timescale 1ns / 1ps

module fsm_moore_1010 (
    input  clk,
    input  rst,
    input  din_bit,
    output dout_bit
);

    reg [2:0] state_reg, next_state;
    reg out;
    assign dout_bit = out;

    parameter STATE_A = 3'b000, STATE_B = 3'b001, STATE_C = 3'b010, STATE_D = 3'b011, STATE_E = 3'b100;

    always @(*) begin
        case (state_reg)
            STATE_A:
            if (din_bit == 1) begin
                next_state = STATE_B;
            end else begin
                next_state = STATE_A;
            end
            STATE_B:
            if (din_bit == 0) begin
                next_state = STATE_C;
            end else begin
                next_state = STATE_B;
            end
            STATE_C:
            if (din_bit == 1) begin
                next_state = STATE_D;
            end else begin
                next_state = STATE_A;
            end
            STATE_D:
            if (din_bit == 0) begin
                next_state = STATE_E;
            end else begin
                next_state = STATE_B;
            end
            STATE_E:
            if (din_bit == 0) begin
                next_state = STATE_A;
            end else begin
                next_state = STATE_B;
            end
            default: next_state = STATE_A;
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst == 1) begin
            state_reg <= STATE_A;
        end else begin
            state_reg <= next_state;
        end
    end

    always @(*) begin
        case (state_reg)
            STATE_A: out = 0;
            STATE_B: out = 0;
            STATE_C: out = 0;
            STATE_D: out = 0;
            STATE_E: out = 1;
            default: out = 0;
        endcase
    end

endmodule
