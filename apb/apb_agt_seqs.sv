class apb_agt_seqs extends uvm_sequence #(read_xtn);

	`uvm_object_utils(apb_agt_seqs)

	extern function new(string name = "apb_agt_seqs");
endclass

function apb_agt_seqs::new(string name = "apb_agt_seqs");
	super.new(name);
endfunction

