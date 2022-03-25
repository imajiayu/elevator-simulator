module des_compute(input_in,input_out,input_dir,input_now,output_des,output_bool);
    input [5:0] input_in;//电梯内�?�按钮�?�共六层
    input [9:0] input_out;//外呼按钮 9六层�?? 8五层�?? 7五层�?? 6四层�?? 5四层�?? 4三层�?? 3三层�?? 2二层�?? 1二层�?? 0�??层上
    input [2:0] input_now;//当前�??
    input input_dir; //方向

    output reg [2:0] output_des;//目标层结�??
    output reg output_bool;//是否有输�??
    
    always @ (input_in or input_out or input_dir or input_now)
    begin
        if(input_in==6'b0&&input_out==10'b0)
            output_bool=1'b0;
        else
        begin
            output_bool=1'b1;
            if(input_dir==1'b1)
            begin
                case(input_now)
                3'b001:begin
                    if(input_in[0]==1'b1||input_out[0]==1'b1)
                        output_des=3'b001;
                    else if(input_in[1]==1'b1||input_out[2]==1'b1)
                        output_des=3'b010;
                    else if(input_in[2]==1'b1||input_out[4]==1'b1)
                        output_des=3'b011;
                    else if(input_in[3]==1'b1||input_out[6]==1'b1)
                        output_des=3'b100;
                    else if(input_in[4]==1'b1||input_out[8]==1'b1)
                        output_des=3'b101;
                    else if(input_in[5]==1'b1||input_out[9]==1'b1)
                        output_des=3'b110;
                    else if(input_out[7]==1'b1)
                        output_des=3'b101;
                    else if(input_out[5]==1'b1)
                        output_des=3'b100;
                    else if(input_out[3]==1'b1)
                        output_des=3'b011;
                    else if(input_out[1]==1'b1)
                        output_des=3'b010;
                    else begin end
                        
                    end
                3'b010:begin
                    if(input_in[1]==1'b1||input_out[2]==1'b1)
                        output_des=3'b010;
                    else if(input_in[2]==1'b1||input_out[4]==1'b1)
                        output_des=3'b011;
                    else if(input_in[3]==1'b1||input_out[6]==1'b1)
                        output_des=3'b100;
                    else if(input_in[4]==1'b1||input_out[8]==1'b1)
                        output_des=3'b101;
                    else if(input_in[5]==1'b1||input_out[9]==1'b1)
                        output_des=3'b110;
                    else if(input_out[5]==1'b1)
                        output_des=3'b100;
                    else if(input_out[3]==1'b1)
                        output_des=3'b011;
                    else if(input_out[1]==1'b1)
                        output_des=3'b010;
                    else if(input_in[0]==1'b1||input_out[0]==1'b1)
                        output_des=3'b001;
                    else    begin end
                        
                    end 
                3'b011:begin
                    if(input_in[2]==1'b1||input_out[4]==1'b1)
                        output_des=3'b011;
                    else if(input_in[3]==1'b1||input_out[6]==1'b1)
                        output_des=3'b100;
                    else if(input_in[4]==1'b1||input_out[8]==1'b1)
                        output_des=3'b101;
                    else if(input_in[5]==1'b1||input_out[9]==1'b1)
                        output_des=3'b110;
                    else if(input_out[7]==1'b1)
                        output_des=3'b101;
                    else if(input_out[5]==1'b1)
                        output_des=3'b100;
                    else if(input_out[3]==1'b1)
                        output_des=3'b011;
                    else if(input_in[1]==1'b1||input_out[1]==1'b1)
                        output_des=3'b010;
                    else if(input_in[0]==1'b1||input_out[0]==1'b1)
                        output_des=3'b001;
                    else if(input_out[2]==1'b1)
                        output_des=3'b010;
                    else    begin end
                        
                    end
                3'b100:begin
                    if(input_in[3]==1'b1||input_out[6]==1'b1)
                        output_des=3'b100;
                    else if(input_in[4]==1'b1||input_out[8]==1'b1)
                        output_des=3'b101;
                    else if(input_in[5]==1'b1||input_out[9]==1'b1)
                        output_des=3'b110;
                    else if(input_out[7]==1'b1)
                        output_des=3'b101;
                    else if(input_out[5]==1'b1)
                        output_des=3'b100;
                    else if(input_in[2]==1'b1||input_out[3]==1'b1)
                        output_des=3'b011;
                    else if(input_in[1]==1'b1||input_out[1]==1'b1)
                        output_des=3'b010;
                    else if(input_in[0]==1'b1||input_out[0]==1'b1)
                        output_des=3'b001;
                    else if(input_out[2]==1'b1)
                        output_des=3'b010;
                    else if(input_out[4]==1'b1)
                        output_des=3'b011;
                    else    begin end
                        
                    end
                3'b101:begin
                    if(input_in[4]==1'b1||input_out[8]==1'b1)
                        output_des=3'b101;
                    else if(input_in[5]==1'b1||input_out[9]==1'b1)
                        output_des=3'b110;
                    else if(input_out[7]==1'b1)
                        output_des=3'b101;
                    else if(input_in[3]==1'b1||input_out[5]==1'b1)
                        output_des=3'b100;
                    else if(input_in[2]==1'b1||input_out[3]==1'b1)
                        output_des=3'b011;
                    else if(input_in[1]==1'b1||input_out[1]==1'b1)
                        output_des=3'b010;
                    else if(input_in[0]==1'b1||input_out[0]==1'b1)
                        output_des=3'b001; 
                    else if(input_out[2]==1'b1)
                        output_des=3'b010;
                    else if(input_out[4]==1'b1)
                        output_des=3'b011;
                    else if(input_out[6]==1'b1)
                        output_des=3'b100;
                    else    begin end
                        
                    end
                3'b110:begin
                    if(input_in[5]==1'b1||input_out[9]==1'b1)
                        output_des=3'b110;
                    else if(input_in[4]==1'b1||input_out[7]==1'b1)
                        output_des=3'b101;
                    else if(input_in[3]==1'b1||input_out[5]==1'b1)
                        output_des=3'b100;
                    else if(input_in[2]==1'b1||input_out[3]==1'b1)
                        output_des=3'b011;
                    else if(input_in[1]==1'b1||input_out[1]==1'b1)
                        output_des=3'b010;
                    else if(input_in[0]==1'b1||input_out[0]==1'b1)
                        output_des=3'b001;
                    else if(input_out[2]==1'b1)
                        output_des=3'b010;
                    else if(input_out[4]==1'b1)
                        output_des=3'b011;
                    else if(input_out[6]==1'b1)
                        output_des=3'b100;
                    else if(input_out[8]==1'b1)
                        output_des=3'b101;
                    else    begin end
                        
                    end
                default:begin end
                endcase
            end
            else
            begin
                case(input_now)
                3'b001:begin
                    if(input_in[0]==1'b1||input_out[0]==1'b1)
                        output_des=3'b001;
                    else if(input_in[1]==1'b1||input_out[2]==1'b1)
                        output_des=3'b010;
                    else if(input_in[2]==1'b1||input_out[4]==1'b1)
                        output_des=3'b011;
                    else if(input_in[3]==1'b1||input_out[6]==1'b1)
                        output_des=3'b100;
                    else if(input_in[4]==1'b1||input_out[8]==1'b1)
                        output_des=3'b101;
                    else if(input_in[5]==1'b1||input_out[9]==1'b1)
                        output_des=3'b110;
                    else if(input_out[7]==1'b1)
                        output_des=3'b101;
                    else if(input_out[5]==1'b1)
                        output_des=3'b100;
                    else if(input_out[3]==1'b1)
                        output_des=3'b011;
                    else if(input_out[1]==1'b1)
                        output_des=3'b010;
                    else begin end
                    end
                3'b010:begin
                    if(input_in[1]==1'b1||input_out[1]==1'b1)
                        output_des=3'b010;
                    else if(input_in[0]==1'b1||input_out[0]==1'b1)
                        output_des=3'b001;
                    else if(input_out[2]==1'b1)
                        output_des=3'b010;
                    else if(input_in[2]||input_out[4]==1'b1)
                        output_des=3'b011;
                    else if(input_in[3]||input_out[6]==1'b1)
                        output_des=3'b100;
                    else if(input_in[4]||input_out[8]==1'b1)
                        output_des=3'b101;
                    else if(input_in[5]||input_out[9]==1'b1)
                        output_des=3'b110;
                    else if(input_out[7]==1'b1)
                        output_des=3'b101;
                    else if(input_out[5]==1'b1)
                        output_des=3'b100;
                    else if(input_out[3]==1'b1)
                        output_des=3'b011;
                    else begin end
                    end
                3'b011:begin
                    if(input_in[2]==1'b1||input_out[3]==1'b1)
                        output_des=3'b011;
                    else if(input_in[1]==1'b1||input_out[1]==1'b1)
                        output_des=3'b010;
                    else if(input_in[0]==1'b1||input_out[0]==1'b1)
                        output_des=3'b001;
                    else if(input_out[2]==1'b0)
                        output_des=3'b010;
                    else if(input_out[4]==1'b0)
                        output_des=3'b011;
                    else if(input_in[3]||input_out[6]==1'b1)
                        output_des=3'b100;
                    else if(input_in[4]||input_out[8]==1'b1)
                        output_des=3'b101;
                    else if(input_in[5]||input_out[9]==1'b1)
                        output_des=3'b110;
                    else if(input_out[7]==1'b1)
                        output_des=3'b101;
                    else if(input_out[5]==1'b1)
                        output_des=3'b100;
                    else begin end
                    end
                3'b100:begin
                    if(input_in[3]==1'b1||input_out[5]==1'b1)
                        output_des=3'b100;
                    else if(input_in[2]==1'b1||input_out[3]==1'b1)
                        output_des=3'b011;
                    else if(input_in[1]==1'b1||input_out[1]==1'b1)
                        output_des=3'b010;
                    else if(input_in[0]==1'b1||input_out[0]==1'b1)
                        output_des=3'b001;
                    else if(input_out[2]==1'b0)
                        output_des=3'b010;
                    else if(input_out[4]==1'b0)
                        output_des=3'b011;
                    else if(input_out[6]==1'b0)
                        output_des=3'b100;
                    else if(input_in[4]||input_out[8]==1'b1)
                        output_des=3'b101;
                    else if(input_in[5]||input_out[9]==1'b1)
                        output_des=3'b110;
                    else if(input_out[7]==1'b1)
                        output_des=3'b101;
                    end
                3'b101:begin
                    if(input_in[4]==1'b1||input_out[7]==1'b1)
                        output_des=3'b101;
                    else if(input_in[3]==1'b1||input_out[5]==1'b1)
                        output_des=3'b100;
                    else if(input_in[2]==1'b1||input_out[3]==1'b1)
                        output_des=3'b011;
                    else if(input_in[1]==1'b1||input_out[1]==1'b1)
                        output_des=3'b010;
                    else if(input_in[0]==1'b1||input_out[0]==1'b1)
                        output_des=3'b001;
                    else if(input_out[2]==1'b0)
                        output_des=3'b010;
                    else if(input_out[4]==1'b0)
                        output_des=3'b011;
                    else if(input_out[6]==1'b0)
                        output_des=3'b100;
                    else if(input_out[8]==1'b0)
                        output_des=3'b101;
                    else if(input_in[5]||input_out[9]==1'b1)
                        output_des=3'b110;
                    end
                3'b110:begin
                    if(input_in[5]==1'b1||input_out[9]==1'b1)
                        output_des=3'b110;
                    else if(input_in[4]==1'b1||input_out[7]==1'b1)
                        output_des=3'b101;
                    else if(input_in[3]==1'b1||input_out[5]==1'b1)
                        output_des=3'b100;
                    else if(input_in[2]==1'b1||input_out[3]==1'b1)
                        output_des=3'b011;
                    else if(input_in[1]==1'b1||input_out[1]==1'b1)
                        output_des=3'b010;
                    else if(input_in[0]==1'b1||input_out[0]==1'b1)
                        output_des=3'b001;
                    else if(input_out[2]==1'b1)
                        output_des=3'b010;
                    else if(input_out[4]==1'b1)
                        output_des=3'b011;
                    else if(input_out[6]==1'b1)
                        output_des=3'b100;
                    else if(input_out[8]==1'b1)
                        output_des=3'b101;
                    else begin end
                    end
                default:begin end
                endcase  
            end
        end
    end
endmodule