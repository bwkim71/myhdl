module test(
    input clk,
    input rstn,
    input [3:0] in_val,
    output [3:0] out_val
);

assign out_val = (clk) ? in_val : rstn;

endmodule



module tb_test;

reg clk;
reg rstn;
reg [3:0] in_val;
wire [3:0] out;

test tb(.clk(clk), .rstn(rstn), .in_val(in_val), .out_val(out));

initial
    begin
      $dumpfile("assign_out.vcd");
      $dumpvars(-1,tb);
      $monitor("%b",out);
    end


always
begin
    #5;
    clk = ~clk;
    in_val = in_val +1;
end


initial
begin
    clk=0;
    rstn=0;
    in_val=0;
    #60;
    $finish;
end

endmodule
