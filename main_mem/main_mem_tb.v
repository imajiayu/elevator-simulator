`timescale 1ns / 1ns

module main_mem_tb;
    reg [5:0] input_in;//电梯内选按钮、共六层
    reg [9:0] input_out;//外呼按钮 一层上 二层上 二层下······五层上 五层下 六层下
    reg input_en; //按钮输入允许
    reg update_des;//更新目标层
    reg update_des_en;//更新目标层允许
    reg update_now;//更新当前层
    reg update_now_en;//更新当前层允许

    reg rst;

    wire [5:0] output_in;//内选状态输出
    wire [9:0] output_out;//外呼状态输出
    wire [2:0] output_now;//当前层
    wire [2:0] output_des;//目标层

    initial 
    begin 
        #10 rst=1'b1;
        #10 rst=1'b0;


        input_in=6'b101010;
        input_out=10'b1010101010;

    end

    initial
    begin
        #50 input_en=1'b1;
    end

    main_mem uut(
        .input_in(input_in),
        .input_out(input_out),
        .input_en(input_en),
        .update_des(update_des),
        .update_des_en(update_des_en),
        .update_now(update_now),
        .update_now_en(update_now_en),
        .rst(rst),
        .output_in(output_in),
        .output_out(output_out),
        .output_now(output_now),
        .output_des(output_des)
    );
endmodule