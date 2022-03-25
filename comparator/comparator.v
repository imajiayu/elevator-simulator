module comparator(now,des,result);
    input [2:0] now;//当前�?
    input [2:0] des;//目标�?

    output reg [2:0] result;
    
    always @ (now or des)
    begin
        if(now>des)
            result=3'b001;
        else if(now<des)
            result=3'b100;
        else
            result=3'b010;
    end

endmodule