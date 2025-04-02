class apb_agt_driver  extends uvm_driver #(read_xtn);

	`uvm_component_utils(apb_agt_driver)

	virtual apb_if.DRV_MP vif;

	apb_agt_config m_cfg;

	extern function new(string name = "apb_agt_driver",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
	extern task send_to_dut();

endclass

function apb_agt_driver::new(string name = "apb_agt_driver", uvm_component parent);
	super.new(name,parent);
endfunction

function void apb_agt_driver::build_phase(uvm_phase phase);
	super.build_phase(phase);

	if(!uvm_config_db #(apb_agt_config)::get(this,"","apb_agt_config",m_cfg))
	`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")
endfunction

function void apb_agt_driver::connect_phase(uvm_phase phase);
	vif=m_cfg.vif;
endfunction

task apb_agt_driver::run_phase(uvm_phase phase);
forever
begin
	send_to_dut();
end
endtask

task apb_agt_driver::send_to_dut();
while(vif.DRV_CB.Pselx==0)
@(vif.DRV_CB);

if(vif.DRV_CB.Pwrite==0)
vif.DRV_CB.Prdata<=$random;

repeat(2)
@(vif.DRV_CB);
endtask
