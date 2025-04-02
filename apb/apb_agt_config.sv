class apb_agt_config extends uvm_object;
	
	`uvm_object_utils(apb_agt_config)

	uvm_active_passive_enum is_active = UVM_ACTIVE;
	
	virtual apb_if vif;

	extern function new(string name = "apb_agt_config");
endclass

function apb_agt_config::new(string name = "apb_agt_config");
	super.new(name);
endfunction
