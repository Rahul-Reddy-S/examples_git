class ahb_agt_top extends uvm_env;

	`uvm_component_utils(ahb_agt_top)

	ahb_agent ahb_agnth;
	env_config m_cfg;

	extern function new(string name = "ahb_agt_top", uvm_component parent);
	extern function void build_phase(uvm_phase phase);
endclass

function ahb_agt_top::new(string name = "ahb_agt_top", uvm_component parent);
	super.new(name,parent);
endfunction

function void ahb_agt_top::build_phase(uvm_phase phase);
	super.build_phase(phase);
			if(!uvm_config_db #(env_config)::get(this,"","env_config",m_cfg))
	`uvm_fatal("AHB AGT TOP ERROR","Unable to get() it? have you set() it?")

	if(m_cfg.has_ahb_agent)
		begin
			ahb_agnth=ahb_agent::type_id::create("ahb_agnth",this);
			uvm_config_db #(ahb_agt_config)::set(this,"*","ahb_agt_config",m_cfg.m_ahb_agt_cfg);
		end
			
endfunction

