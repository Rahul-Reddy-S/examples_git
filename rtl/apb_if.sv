interface apb_if(input bit clk);

	bit Penable;
	bit Pwrite;
	logic [31:0]Pwdata;
	logic [31:0]Paddr;
	bit [31:0]Pselx;
	logic [31:0]Prdata;

modport DUV(input Prdata,output Penable,Pwrite,Pwdata,Paddr,Pselx);
 
clocking DRV_CB @(posedge clk);
default input #1 output #1;
	input Pselx;
	input Pwrite;
	output Prdata;
endclocking

clocking MON_CB @(posedge clk);
default input #1 output #1;
	input Penable;
	input Pwrite;
	input Pwdata;
	input Prdata;
	input Paddr;
	input Pselx;
endclocking

modport DRV_MP(clocking DRV_CB);
modport MON_MP(clocking MON_CB);

endinterface 
