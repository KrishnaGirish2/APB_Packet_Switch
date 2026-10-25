class test extends uvm_test;
	`uvm_component_utils(test)
	env env_inst;
	top_reg_seq seq;
	illegal_seq s1;
	function new(string name="test",uvm_component parent);
		super.new(name,parent);
	endfunction
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		env_inst=env::type_id::create("env_inst",this);
	endfunction
	task run_phase(uvm_phase phase);
		phase.raise_objection(this);	
		seq=top_reg_seq::type_id::create("seq");
		s1=illegal_seq::type_id::create("s1");
		seq.regmodel=env_inst.regmodel;
		seq.start(env_inst.agent_inst.seqr);
		s1.start(env_inst.agent_inst.seqr);
		#100;
		phase.drop_objection(this);
	endtask
endclass

