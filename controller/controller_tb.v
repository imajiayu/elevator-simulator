`timescale 1ns / 1ns
module controller_tb;
    reg rst;
    reg clk;
    reg [5:0] input_in;
    reg [9:0] input_out;

    wire [2:0] onow;
    wire [3:0] ostate;

    initial
    begin
        clk=1'b0;
        rst=1'b1;
        input_in=6'b100000;
        input_out=10'b0;
        #30 rst=1'b1;
        #10 rst=1'b0;
    end

    initial
    begin
        #1560 input_in=6'b000001;
        input_out=10'b0100100000;
    end

    always
        #1 clk=~clk;

    controller uut(
        .clk(clk),
        .rst(rst),
        .input_out(input_out),
        .input_in(input_in),
        .onow(onow),
        .ostate(ostate)
    );
endmodule