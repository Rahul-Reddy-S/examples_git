interface ahb_if(input int clock);
	logic Hresetn;
	logic [1:0]Htrans;
	bit Hwrite;
	bit Hsel;
	logic Hreadyin;
	logic Hreadyout;
	logic [1:0]Hresp;
	logic [31:0]Hwdata;
	logic [31:0]Haddr;
	bit [2:0]Hsize;
	bit [31:0]Hrdata;

modport DUV(input Hresetn,Htrans,Hwrite,Hsel,Hreadyin,Hwdata,Haddr, output Hreadyout,Hresp,Hrdata);

clocking MDRV_CB@(posedge clock);
default input #1 output #1;
	input Hreadyout;
	input Hresp;
	output Hresetn;
	output Htrans;
	output Hwrite;
	output Hsel;
	output Hreadyin;
	output Hwdata;
	output Haddr;
	output Hsize;
endclocking

clocking MMON_CB@(posedge clock);
default input #1 output #1;
	input Hreadyout;
	input Hresp;
	input Hresetn;
	input Htrans;
	input Hwrite;
	input Hsel;
	input Hreadyin;
	input Hwdata;
	input Haddr;
	input Hrdata;
	input Hsize;
endclocking

modport MDRV_MP(clocking MDRV_CB);
modport MMON_MP(clocking MMON_CB);

endinterface


