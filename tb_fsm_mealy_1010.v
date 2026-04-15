`timescale 1ns / 1ps

module tb_fsm_mealy_1010();

    reg clk;
    reg rst;
    reg din_bit;
    wire dout_bit;

    fsm_mealy_1010 dut (
    .clk(clk),
    .rst(rst),
    .din_bit(din_bit),
    .dout_bit(dout_bit)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        din_bit = 0;

        #20;
        rst = 0;
        din_bit = 1; // a->b
        @(posedge clk); #1;

        din_bit = 1; // b->b
        @(posedge clk);
        
        din_bit = 0; // b->c
        @(posedge clk);
        
        din_bit = 1; //c->d
        @(posedge clk);
        
        din_bit = 0; // d->a, out=1
        @(posedge clk);

        din_bit = 1; //a->b
        @(posedge clk);
        
        din_bit = 0; // b->c
        @(posedge clk);
        
        din_bit = 0; // c->a
        @(posedge clk);
        #100;
        $finish;
    end

endmodule
