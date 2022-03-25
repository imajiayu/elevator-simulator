`timescale 1ns / 1ns
module des_compute_tb;
    reg [5:0] input_in;//电梯内�?�按钮�?�共六层
    reg [9:0] input_out;//外呼按钮 9六层�??? 8五层�??? 7五层�??? 6四层�??? 5四层�??? 4三层�??? 3三层�??? 2二层�??? 1二层�??? 0�???层上
    reg [2:0] input_now;
    reg input_dir;

    wire output_bool;
    wire [2:0] output_des;//目标�???

    initial
    begin
        input_in=6'b0;
        input_out=10'b0;
        input_dir=1'b0;
        input_now=3'b001;
    end

    initial
    begin
        #50 input_in=6'b010000;
        input_out=10'b0000101000;
    end

    des_compute uut(
        .input_in(input_in),
        .input_out(input_out),
        .input_now(input_now),
        .input_dir(input_dir),
        .output_des(output_des),
        .output_bool(output_bool)
    );
endmodule