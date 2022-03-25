`timescale 1ns / 1ns

module FMS_tb;
    reg clk;
    reg irst;//复位
    reg [2:0] comparator_result;//比较器结果
    reg input_bool;//是否有输入

    wire orst;
    wire oinput_en;
    wire oupdate_dir;
    wire oupdate_dir_en;
    wire oupdate_now_en;
    wire oupdate_des_en;
    wire rst_des_en;
    wire is_move;
    wire [2:0] ostate;

    initial 
    begin 
        clk=1'b0;
        irst=1'b0;
        #10 irst=1'b1;
        #5 irst=1'b0;
        #100 input_bool=1'b1;
    end

    initial
        #500 comparator_result=3'b010;

    always
        #50 clk=~clk;

    FMS uut(
        .clk(clk),
        .irst(irst),
        .comparator_result(comparator_result),
        .input_bool(input_bool),
        .orst(orst),
        .oinput_en(oinput_en),
        .oupdate_dir(oupdate_dir),
        .oupdate_dir_en(oupdate_dir_en),
        .oupdate_des_en(oupdate_des_en),
        .oupdate_now_en(oupdate_now_en),
        .rst_des_en(rst_des_en),
        .is_move(is_move),
        .ostate(ostate)
    );
endmodule