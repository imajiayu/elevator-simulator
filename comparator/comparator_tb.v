`timescale 1ns / 1ns

module comparator_tb;
    reg [2:0] now;
    reg [2:0] des;

    wire [2:0] result;

    initial 
    begin 
        now=3'b000;
        des=3'b000;
    end

    initial 
    begin 
        #100 now=3'b010;
        des=3'b001;

        #100 now=3'b010;
        des=3'b100;

        #100 now=3'b110;
        des=3'b110;
    end


    comparator uut(
        .now(now),
        .des(des),
        .result(result)
    );
endmodule