class seq extends uvm_sequence #(trans);
        `uvm_object_utils(seq)
        trans tr;
        function new(string name="seq");
                super.new(name);
        endfunction
        task body();
                tr=trans::type_id::create("tr");
                wait_for_grant();
                assert(tr.randomize());
                `uvm_info("SEQ",$sformatf("Sending tx to seqr"),UVM_LOW);
                send_request(tr);
                wait_for_item_done();
                get_response(tr);
                `uvm_info("SEQ",$sformatf("After get response"),UVM_LOW);
        endtask
endclass
class illegal_seq extends uvm_sequence #(trans);
	`uvm_object_utils(illegal_seq)
	trans tr;
	function new(string name="seq");
		super.new(name);
	endfunction
	task body();
		tr=trans::type_id::create("tr");
		start_item(tr);
		assert(tr.randomize() with {paddr==16'h61;});
		`uvm_info("SEQ",$sformatf("Sending tx to seqr"),UVM_LOW);
                finish_item(tr);
                `uvm_info("SEQ",$sformatf("After get response"),UVM_LOW);
        endtask
endclass

