class ahb_agt_driver extends uvm_driver #(write_xtn);

	`uvm_component_utils(ahb_agt_driver)

	
	
	ahb_agt_config m_cfg;

	extern function new(string name = "ahb_agt_driver", uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	;

endclass

function ahb_agt_driver::new(string name = "ahb_agt_driver", uvm_component parent);
	super.new(name,parent);
endfunction

function void ahb_agt_driver::build_phase(uvm_phase phase);
	super.build_phase(phase);
	
	if(!uvm_config_db #(ahb_agt_config)::get(this,"","ahb_agt_config",m_cfg))
		`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
endfunction


