class trans extends uvm_sequence_item;
	rand bit pwrite;
	rand bit [15:0] paddr;
	rand bit [31:0] pwdata;
	bit psel,penable;
	bit [31:0]prdata;
	bit pready, pslverr, irq;
	`uvm_object_utils(trans)
	function new(string name="trans");
		super.new(name);
	endfunction
endclass

