class write_xtn extends uvm_sequence_item;

	`uvm_object_utils(write_xtn)

	bit Hresetn;
	bit [31:0]Hrdata;
	rand bit [31:0]Haddr;
	rand bit Hwrite;
	rand bit [2:0]Hsize;
	rand bit [2:0]Hburst;
	rand bit [31:0]Hwdata;
	rand bit [1:0]Htrans;
	rand bit Hreadyin;
	bit Hreadyout;

	rand bit [7:0]len;
	
	constraint hsize_cnst{Hsize inside {[0:2]};}

     	constraint wr_rd_data {Hwrite==0 -> Hwdata ==0;}

	constraint haddr_cnst {Haddr inside {[32'h8000_0000:32'h8000_03ff],[32'h8400_0000:32'h8400_03ff],
                                     [32'h8800_0000:32'h8800_03ff],[32'h8c00_0000:32'h8c00_03ff]};}

	constraint half_wrd_addr_cnst {(Hsize ==1) -> (Haddr%2==0);}

	constraint wrd_addr_cnst5 {(Hsize ==2) -> (Haddr%2==0);}


	extern function new(string name = "write_xtn");
	extern function void do_print(uvm_printer printer);
endclass

function write_xtn::new(string name = "write_xtn");
	super.new(name);
endfunction

function void write_xtn::do_print(uvm_printer printer);
	super.do_print(printer);
	printer.print_field("Hrdata",this.Hrdata,32,UVM_HEX);
	printer.print_field("Haddr",this.Haddr,32,UVM_HEX);
	printer.print_field("Hwrite",this.Hwrite,1,UVM_DEC);
	printer.print_field("Hsize",this.Hsize,3,UVM_DEC);
	printer.print_field("Hburst",this.Hburst,3,UVM_DEC);
	printer.print_field("Hwdata",this.Hwdata,32,UVM_HEX);
	printer.print_field("Htrans",this.Htrans,2,UVM_DEC);
endfunction
