module input_module(rst,input_in,input_out,output_in,output_out);
    input [5:0] input_in;//内选
    input [9:0] input_out;//外呼
    input rst;

    reg [5:0] reg_in=6'b0;
    reg [9:0] reg_out=10'b0;

    output [5:0] output_in;
    output [9:0] output_out;

    assign output_in=reg_in;
    assign output_out=reg_out;
    
    always @ (negedge rst)
    begin
        reg_in=6'b0;
        reg_out=10'b0;
    end

    always @ (input_in or input_out)
    begin
        reg_in=reg_in|input_in;
        reg_out=reg_out|input_out;
    end

endmodule