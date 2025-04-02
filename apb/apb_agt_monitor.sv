class apb_agt_monitor extends uvm_monitor;

	`uvm_component_utils(apb_agt_monitor)

	virtual apb_if.MON_MP vif;

	apb_agt_config m_cfg;
	
	read_xtn xtn;

	uvm_analysis_port #(read_xtn) monitor_port;

	extern function new(string name = "apb_agt_monitor", uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
	extern task collect_data();

endclass

function apb_agt_monitor::new(string name = "apb_agt_monitor", uvm_component parent);
	super.new(name,parent);
	monitor_port = new("monitor_port",this);
endfunction

function void apb_agt_monitor::build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(!uvm_config_db #(apb_agt_config)::get(this,"","apb_agt_config",m_cfg))
	`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
endfunction

function void apb_agt_monitor::connect_phase(uvm_phase phase);
vif=m_cfg.vif;
endfunction

task apb_agt_monitor::run_phase(uvm_phase phase);
forever
begin
	collect_data();
end
endtask

task apb_agt_monitor::collect_data();
xtn=read_xtn::type_id::create("xtn");

while(!vif.MON_CB.Penable)
@(vif.MON_CB);

xtn.Pwrite=vif.MON_CB.Pwrite;
xtn.Paddr=vif.MON_CB.Paddr;

if(xtn.Pwrite)
xtn.Pwdata=vif.MON_CB.Pwdata;
else
xtn.Prdata=vif.MON_CB.Prdata;

//repeat(2)
@(vif.MON_CB)
	`uvm_info("APB_AGT_MONITOR",$sformatf("printing from monitor \n %s", xtn.sprint()),UVM_LOW)
	monitor_port.write(xtn);
endtask
