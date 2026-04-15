`timescale 1ns / 1ps

module fsm_mealy_1010 (
    input  clk,
    input  rst,
    input  din_bit,
    output dout_bit
);

    reg [1:0] state_reg, next_state;
    reg out;
    assign dout_bit = out;

    parameter STATE_A = 2'b00, STATE_B = 2'b01, STATE_C = 2'b10, STATE_D = 2'b11;

    always @(*) begin
        case (state_reg)
            STATE_A:
            if (din_bit == 1) begin
                next_state = STATE_B;
                out = 0;
            end else begin
                next_state = STATE_A;
                out = 0;
            end
            STATE_B:
            if (din_bit == 0) begin
                next_state = STATE_C;
                out = 0;
            end else begin
                next_state = STATE_B;
                out = 0;
            end
            STATE_C:
            if (din_bit == 1) begin
                next_state = STATE_D;
                out = 0;
            end else begin
                next_state = STATE_A;
                out = 0;
            end
            STATE_D:
            if (din_bit == 0) begin
                next_state = STATE_A;
                out = 1;
            end else begin
                next_state = STATE_B;
                out = 0;
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

endmodule
