module output_module(now,input_in,input_out,oData,output_in,output_out,onow);
    input [2:0] now;//当前层
    input [5:0] input_in;
    input [9:0] input_out;

    output reg [6:0] oData;
    output reg [5:0] output_in;
    output reg [9:0] output_out;
    output reg [2:0] onow;

    always @(*) 
    begin
        onow=now;
        output_in=input_in;
        output_out=input_out; 
        case(now)
        3'b001:oData=7'b1111001;
        3'b010:oData=7'b0100100;
        3'b011:oData=7'b0110000;
        3'b100:oData=7'b0011001;
        3'b101:oData=7'b0010010;
        3'b110:oData=7'b0000010;
        default:oData=7'b1000000;
        endcase
    end

endmodule