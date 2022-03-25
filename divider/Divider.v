module Divider(I_CLK,rst,O_CLK);
    input I_CLK;
    input rst;
    output reg O_CLK=1'b0;
    
    parameter divNum=10;
    integer cnt=0;

    always @ (posedge I_CLK,posedge rst)
    begin
        if(rst)
        begin
            cnt<=0;
            O_CLK<=1'b0;
        end
        else if(cnt<divNum/2-1)                                                       
        begin
            cnt<=cnt+1;
            O_CLK<=O_CLK;
        end
        else
        begin
            cnt<=0;
            O_CLK<=~O_CLK;
        end
    end

    endmodule

