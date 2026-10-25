class top_adapter extends uvm_reg_adapter;
	`uvm_object_utils(top_adapter);
	function new(string name="top_adapter");
		super.new(name);
	endfunction
	function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
		trans tr;
		tr=trans::type_id::create("tr");
		tr.pwrite=(rw.kind==UVM_WRITE);
		tr.paddr=rw.addr;
		if(tr.pwrite==1) tr.pwdata=rw.data;
		return tr;
	endfunction
	function void bus2reg(uvm_sequence_item bus_item,ref uvm_reg_bus_op rw);
		trans tr;
		assert($cast(tr,bus_item));
		rw.kind=(tr.pwrite==1'b1) ? UVM_WRITE:UVM_READ;
		rw.addr=tr.paddr;
		if(rw.kind==UVM_WRITE)
			rw.data=tr.pwdata;
		else
			rw.data=tr.prdata;
		rw.status=(tr.pslverr) ? UVM_NOT_OK:UVM_IS_OK;
	endfunction
endclass

