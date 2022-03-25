`timescale 1ns / 1ns

module Divider_tb;
    reg I_CLK;
    reg rst;
    wire O_CLK;

    initial 
    begin 
       rst=1'b0;
       I_CLK=1'b0;
       #100 rst=1'b1;
       #20 rst=1'b0;
    end

    always
    #10 I_CLK=~I_CLK;   

    Divider uut(
        .I_CLK(I_CLK),
        .rst(rst),
        .O_CLK(O_CLK)
    );

endmodule
