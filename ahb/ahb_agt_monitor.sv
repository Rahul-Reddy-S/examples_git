class ahb_agt_monitor extends uvm_monitor;

	`uvm_component_utils(ahb_agt_monitor)

	
		
	ahb_agt_config m_cfg;
	
	write_xtn xtn;

	uvm_analysis_port #(write_xtn) monitor_port;

	extern function new(string name = "ahb_agt_monitor", uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	
endclass

function ahb_agt_monitor::new(string name = "ahb_agt_monitor", uvm_component parent);
	super.new(name,parent);
	monitor_port = new("monitor_port",this);
endfunction

function void ahb_agt_monitor::build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(!uvm_config_db #(ahb_agt_config)::get(this,"", "ahb_agt_config", m_cfg))
		`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
endfunction


