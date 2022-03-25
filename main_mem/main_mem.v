module main_mem(input_in,input_out,input_en,update_des,update_des_en,update_now_en,update_dir,update_dir_en,rst_des_en,output_in,output_out,output_now,output_des,output_dir,rst);
    input [5:0] input_in;//电梯内选按钮、共六层
    input [9:0] input_out;//外呼按钮 9六层下 8五层上 7五层下 6四层上 5四层下 4三层上 3三层下 2二层上 1二层下 0一层上
    input input_en; //按钮输入允许
    input [2:0] update_des;//更新目标层
    input update_des_en;//更新目标层允许
    input update_now_en;//更新当前层允许
    input update_dir;
    input update_dir_en;//设置方向允许
    input rst_des_en;//重置到达目标层按钮

    input rst;

    output [5:0] output_in;//内选状态输出
    output [9:0] output_out;//外呼状态输出
    output [2:0] output_now;//当前层
    output [2:0] output_des;//目标层
    output output_dir;
    
    reg [5:0] in;
    reg [9:0] out;

    reg [2:0] now;
    reg [2:0] des;

    reg dir;//1上0下

    assign output_in=in;
    assign output_out=out;
    assign output_now=now;
    assign output_des=des;
    assign output_dir=dir;

    always @(posedge input_en or posedge rst_des_en or posedge rst) 
    begin
        if(rst)
        begin
            in<=6'b0;
            out<=10'b0;
        end
        else if(input_en)
        begin
        in<=in|input_in;
        out<=out|input_out;
        end
        else
        begin
            case(des)
        3'b001:begin
            in[0]<=1'b0;
            out[0]<=1'b0;
        end
        3'b010:begin
            in[1]=1'b0;
            if(dir==1'b1)
                out[2]<=1'b0;
            else
                out[1]<=1'b0;
        end
        3'b011:begin
            in[2]=1'b0;
            if(dir==1'b1)
                out[4]<=1'b0;
            else
                out[3]<=1'b0;
        end
        3'b100:begin
            in[3]=1'b0;
            if(dir==1'b1)
                out[6]<=1'b0;
            else
                out[5]<=1'b0;
        end
        3'b101:begin
            in[4]=1'b0;
            if(dir==1'b1)
                out[8]<=1'b0;
            else
                out[7]<=1'b0;
        end
        3'b110:begin
            in[5]<=1'b0;
            out[9]<=1'b0;
        end
        default:begin end
        endcase
        end
    end

    always @(posedge update_des_en or posedge rst) 
    begin
        if(rst)
        begin
            des<=3'b000;
        end
        else
        begin
            des<=update_des;
        end
    end

    always @(posedge update_dir_en or posedge rst)
    begin
        if(rst)
        begin
            dir<=1'b1;
        end
        else
        begin
            dir=update_dir;
        end
    end

    always @(posedge update_now_en or posedge rst) 
    begin
        if(rst)
        begin
            now<=3'b001;
        end
        else
        case(dir)
        1'b0:begin now<=now-1;end
        1'b1:begin now<=now+1;end
        endcase
    end

endmodule