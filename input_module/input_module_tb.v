`timescale 1ns / 1ns

module input_module_tb;
    reg [5:0] input_in;//内选
    reg [9:0] input_out;//外呼
    reg rst;

    wire [5:0] output_in;
    wire [9:0] output_out;

    initial 
    begin 
        rst=1'b1;
        #30 input_in=6'b101010;
    end

    always
        #200 rst=~rst;

    input_module uut(
        .input_in(input_in),
        .input_out(input_out),
        .output_out(output_out),
        .output_in(output_in),
        .rst(rst)
    );
endmodule