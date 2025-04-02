class read_xtn extends uvm_sequence_item;

	`uvm_object_utils(read_xtn)
	
	bit Penable;
	bit Pwrite;
	logic [31:0]Pwdata;
	rand logic [31:0]Prdata;
	logic [31:0]Paddr;
	bit [3:0]Pselx;

	extern function new(string name = "read_xtn");
	extern function void do_print(uvm_printer printer);
endclass

function read_xtn::new(string name = "read_xtn");
	super.new(name);
endfunction

function void read_xtn::do_print(uvm_printer printer);
super.do_print(printer);

printer.print_field("Penable",     this.Penable,    1,  UVM_DEC);
printer.print_field("Pwdata",      this.Pwdata,     32, UVM_HEX);
printer.print_field("Prdata",      this.Prdata,     32, UVM_HEX);
printer.print_field("Pwrite",     this.Pwrite,      1,  UVM_DEC);
printer.print_field("Paddr",      this.Paddr,       32,  UVM_DEC);
printer.print_field("Pselx",       this.Pselx,      4,   UVM_DEC);

endfunction
