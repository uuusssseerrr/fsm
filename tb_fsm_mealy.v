`timescale 1ns / 1ps

module tb_fsm_mealy();

    reg clk;
    reg rst;
    reg din_bit;

    wire dout_bit;

    fsm_mealy dut(
        .clk(clk),
        .rst(rst),
        .din_bit(din_bit),
        .dout_bit(dout_bit)
    );

    always #5 clk = ~ clk;

    initial begin
        clk = 0;
        rst = 1;
        din_bit = 0;

        #15 rst = 0;

        #5 din_bit = 1;
        #30 din_bit = 0;
        #10 din_bit = 1;
        #20 din_bit = 0;
        #40 din_bit = 1;
        #10 din_bit = 0;
        #30 din_bit = 1;
        #40 din_bit = 0;
        #10 din_bit = 1;
        #10 din_bit = 0;
        #30 din_bit = 1;
        #20 din_bit = 0;
        #100 $finish;
    end
endmodule
