class env extends uvm_env;
	`uvm_component_utils(env)
	agent agent_inst;
	top_reg_block regmodel;
	top_adapter adapter_inst;
	uvm_reg_predictor #(trans) predictor_inst;
	//scoreboard sc;
	function new(string name="env",uvm_component parent);
		super.new(name,parent);
	endfunction
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		agent_inst=agent::type_id::create("agent_inst",this);
		regmodel=top_reg_block::type_id::create("regmodel");
		regmodel.build();
		adapter_inst=top_adapter::type_id::create("adapter_inst");
		predictor_inst=uvm_reg_predictor #(trans)::type_id::create("predictor_inst",this);
	endfunction
	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);

		regmodel.default_map.set_sequencer(.sequencer(agent_inst.seqr),.adapter(adapter_inst));
		regmodel.default_map.set_base_addr(0);
		predictor_inst.map=regmodel.default_map;
		predictor_inst.adapter=adapter_inst;
		agent_inst.mon.mon_ap.connect(predictor_inst.bus_in);
		regmodel.default_map.set_auto_predict(0);
	endfunction
endclass

