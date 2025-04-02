class apb_agt_sequencer extends uvm_sequencer #(read_xtn);
	
	`uvm_component_utils(apb_agt_sequencer)
	
	extern function new(string name = "apb_agt_sequencer", uvm_component parent);
endclass

function apb_agt_sequencer::new(string name = "apb_agt_sequencer",uvm_component parent);
	super.new(name,parent);
endfunction
