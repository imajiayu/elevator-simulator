module FMS(clk,irst,input_bool,comparator_result,orst,oinput_en,oupdate_dir,oupdate_dir_en,oupdate_now_en,oupdate_des_en,rst_des_en,is_move,ostate);

    input clk;
    input irst;//复位
    input [2:0] comparator_result;//比较器结果
    input input_bool;//是否有输入

    output reg orst;
    output reg oinput_en;
    output reg oupdate_dir;
    output reg oupdate_dir_en;
    output reg oupdate_now_en;
    output reg oupdate_des_en;
    output reg rst_des_en;
    output reg is_move;

    reg [3:0] state;
    output [3:0] ostate;
    assign ostate=state;
    parameter init=4'b0000,get_input=4'b0001,update_des=4'b0010,update_dir=4'b0011,start=4'b0100,update_now=4'b0101,stop=4'b0110,rst_des=4'b0111,idle=4'b1000;
    

//++++++++++++++++++++++++++++++++++++++
// 定时器1 开始
// 时长：1秒
//++++++++++++++++++++++++++++++++++++++
parameter TIMER1_VAL = 10;      // 50M/50M = 1s
 
reg        timer1_enable=1'b0;
reg [25:0] timer1_cnt;
wire       timer1_done;
 
always @(posedge clk)
  if (~timer1_enable) 
    timer1_cnt <= 0;
  else if (~timer1_done) 
    timer1_cnt <= timer1_cnt + 1'b1;
     
assign timer1_done = (timer1_cnt == TIMER1_VAL - 1);
//--------------------------------------
// 定时器1 结束
//--------------------------------------
 
 
//++++++++++++++++++++++++++++++++++++++
// 定时器2 开始
// 时长：4秒
//++++++++++++++++++++++++++++++++++++++
parameter TIMER2_VAL = 100;     // 200M/50M = 4s
 
reg        timer2_enable;
reg [27:0] timer2_cnt;
wire       timer2_done;
 
always @(posedge clk)
  if (~timer2_enable) 
    timer2_cnt <= 0;
  else if (~timer2_done) 
    timer2_cnt <= timer2_cnt + 1'b1;
     
assign timer2_done = (timer2_cnt == TIMER2_VAL - 1);
//--------------------------------------
// 定时器2 结束
//--------------------------------------


    always @ (posedge clk or posedge irst)
    begin
        if(irst==1'b1)
        begin    
            state<=init;
        end
        else
        begin
            case(state)
            init:begin 
                    state<=idle;
                end
            get_input:begin
                    if(input_bool==1'b1)
                        state<=update_des;
                    else 
                        state<=idle;  
                end
            idle:begin
                    state<=get_input;
                end
            update_des:begin
                    if(comparator_result==3'b010)
                        state<=stop;
                    else
                        state<=update_dir;
                end
            update_dir:begin
                   state<=start;     
                end
            start:begin
                    timer1_enable = 1'b1;
                    if(timer1_done)
                    begin
                        state<=update_now;
                        timer1_enable=1'b0;
                    end
                end
            update_now:begin
                    if(comparator_result==3'b010)
                        state<=stop;
                    else
                        state<=start;
                end
            stop:begin
                    state<=rst_des;
                end
            rst_des:begin
                    state<=idle;                
                end
            default:begin
                    state<=init;
                end
            endcase
        end  
    end

    always @ (state)
    begin
        case(state)
            init:begin 
                orst<=1'b1;
                oinput_en<=1'b0;
                oupdate_dir<=1'b1;
                oupdate_dir_en<=1'b0;
                oupdate_now_en<=1'b0;
                oupdate_des_en<=1'b0;
                rst_des_en<=1'b0;
                is_move<=1'b0;
                end
            idle:begin
                orst<=1'b0;
                oinput_en<=1'b0;
                oupdate_dir_en<=1'b0;
                oupdate_now_en<=1'b0;
                oupdate_des_en<=1'b0;
                rst_des_en<=1'b0;
                end
            get_input:begin
                orst<=1'b0;
                oinput_en<=1'b1;
                oupdate_dir_en<=1'b0;
                oupdate_now_en<=1'b0;
                oupdate_des_en<=1'b0;
                rst_des_en<=1'b0;
                is_move<=1'b0;
                end
            update_des:begin
                orst<=1'b0;
                oinput_en<=1'b0;
                oupdate_dir_en<=1'b0;
                oupdate_now_en<=1'b0;
                oupdate_des_en<=1'b1;
                rst_des_en<=1'b0;
                is_move<=1'b0;
                end
            update_dir:begin
                if(comparator_result==3'b100)
                    oupdate_dir<=1'b1;
                else 
                    oupdate_dir<=1'b0;

                orst<=1'b0;
                oinput_en<=1'b0;
                oupdate_dir_en<=1'b1;
                oupdate_now_en<=1'b0;
                oupdate_des_en<=1'b0;
                rst_des_en<=1'b0;
                is_move<=1'b0;
                end
            start:begin
                orst<=1'b0;
                oinput_en<=1'b0;
                oupdate_dir_en<=1'b0;
                oupdate_now_en<=1'b0;
                oupdate_des_en<=1'b0;
                rst_des_en<=1'b0;
                is_move<=1'b1;
                end
            update_now:begin
                orst<=1'b0;
                oinput_en<=1'b0;
                oupdate_dir_en<=1'b0;
                oupdate_now_en<=1'b1;
                oupdate_des_en<=1'b0;
                rst_des_en<=1'b0;
                is_move<=1'b1;
                end
            stop:begin
                orst<=1'b0;
                oinput_en<=1'b0;
                oupdate_dir_en<=1'b0;
                oupdate_now_en<=1'b0;
                oupdate_des_en<=1'b0;
                rst_des_en<=1'b0;
                is_move<=1'b0;
                end
            rst_des:begin
                orst<=1'b0;
                oinput_en<=1'b0;
                oupdate_dir_en<=1'b0;
                oupdate_now_en<=1'b0;
                oupdate_des_en<=1'b0;
                rst_des_en<=1'b1;
                is_move<=1'b0;
                end
            default:begin
                orst<=1'b1;
                oinput_en<=1'b0;
                oupdate_dir<=1'b1;
                oupdate_dir_en<=1'b0;
                oupdate_now_en<=1'b0;
                oupdate_des_en<=1'b0;
                rst_des_en<=1'b0;
                is_move<=1'b0;
                end
        endcase
    end

endmodule