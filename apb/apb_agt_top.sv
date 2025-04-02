class apb_agt_top extends uvm_env;

	`uvm_component_utils(apb_agt_top)

	apb_agent apb_agnth;
	env_config e_cfg;

	extern function new(string name = "apb_agt_top", uvm_component parent);
	extern function void build_phase(uvm_phase phase);
endclass

function apb_agt_top::new(string name = "apb_agt_top", uvm_component parent);
	super.new(name,parent);
endfunction

function void apb_agt_top::build_phase(uvm_phase phase);
	super.build_phase(phase);

	if(!uvm_config_db #(env_config)::get(this,"","env_config",e_cfg))
	`uvm_fatal("APB AGT TOP ERROR","Unable to get() it? have you set() it?")

	if(e_cfg.has_apb_agent)
		begin
			apb_agnth=apb_agent::type_id::create("apb_agnth",this);
			uvm_config_db #(apb_agt_config)::set(this,"*","apb_agt_config",e_cfg.m_apb_agt_cfg);
		end
endfunction
