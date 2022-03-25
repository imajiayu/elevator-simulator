module controller(clk,rst,input_in,input_out,onow,ostate,output_in,output_out,oData);

    input clk;
    input rst;
    input [5:0] input_in;
    input [9:0] input_out;

    output [2:0] onow;
    output [3:0] ostate;
    output [5:0] output_in;
    output [9:0] output_out;
    output [6:0] oData;
    
    wire [5:0] input_module_in;
    wire [9:0] input_module_out;
    wire FMS_rst;
    wire FMS_input_en;
    wire FMS_dir;
    wire FMS_dir_en;
    wire FMS_now_en;
    wire FMS_des_en;
    wire FMS_rst_des_en;
    wire [2:0] comparator_result;
    wire [2:0] main_mem_now;
    wire [2:0] main_mem_des;
    wire [5:0] main_mem_in;
    wire [9:0] main_mem_out;
    wire main_mem_dir;
    wire [2:0] des_compute_des;
    wire des_compute_bool;
    wire divider_oclk;

    Divider Divider_uut(.I_CLK(clk),.rst(rst),.O_CLK(divider_oclk));
    input_module input_module_uut(.rst(~(FMS_input_en)),.input_in(input_in),.input_out(input_out),.output_in(input_module_in),.output_out(input_module_out));
    FMS FMS_uut(.clk(divider_oclk),.irst(rst),.input_bool(des_compute_bool),.comparator_result(comparator_result),.orst(FMS_rst),.oinput_en(FMS_input_en),.oupdate_dir(FMS_dir),.oupdate_dir_en(FMS_dir_en),.oupdate_now_en(FMS_now_en),.oupdate_des_en(FMS_des_en),.rst_des_en(FMS_rst_des_en),.is_move(),.ostate(ostate));
    main_mem main_mem_uut(.input_in(input_module_in),.input_out(input_module_out),.input_en(FMS_input_en),.update_des(des_compute_des),.update_des_en(FMS_des_en),.update_now_en(FMS_now_en),.update_dir(FMS_dir),.update_dir_en(FMS_dir_en),.rst_des_en(FMS_rst_des_en),.output_in(main_mem_in),.output_out(main_mem_out),.output_now(main_mem_now),.output_des(main_mem_des),.output_dir(main_mem_dir),.rst(FMS_rst));
    comparator comparator_uut(.now(main_mem_now),.des(main_mem_des),.result(comparator_result));
    des_compute des_compute_uut(.input_in(main_mem_in),.input_out(main_mem_out),.input_dir(main_mem_dir),.input_now(main_mem_now),.output_des(des_compute_des),.output_bool(des_compute_bool));
    output_module output_module_uut(.now(main_mem_now),.input_in(main_mem_in),.input_out(main_mem_out),.oData(oData),.output_in(output_in),.output_out(output_out),.onow(onow));

endmodule