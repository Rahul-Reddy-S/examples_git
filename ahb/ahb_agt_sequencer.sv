class ahb_agt_sequencer extends uvm_sequencer #(write_xtn);

	`uvm_component_utils(ahb_agt_sequencer)
	
	extern function new(string name = "ahb_agt_sequencer", uvm_component parent);
endclass

function ahb_agt_sequencer::new(string name = "ahb_agt_sequencer", uvm_component parent);
	super.new(name,parent);
endfunction
