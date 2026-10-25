class driver extends uvm_driver #(trans);
        `uvm_component_utils(driver)
        trans tr;
        virtual top_if tif;

        function new(string name="driver",uvm_component parent=null);
                super.new(name,parent);
        endfunction
        virtual function void build_phase(uvm_phase phase);
                super.build_phase(phase);
                if(!uvm_config_db#(virtual top_if):: get(this,"","tif",tif))
                        `uvm_error("drv","Unable to access interface");
        endfunction

        task drive_dut();
                @(posedge tif.pclk);
		tif.psel<=1;
		tif.penable<=0;
		tif.pwrite<=tr.pwrite;
		tif.paddr<=tr.paddr;
		tif.pwdata<=tr.pwdata;
		@(posedge tif.pclk);
		tif.penable<=1;
		@(posedge tif.pclk);
		tr.prdata=tif.prdata;
		tr.pslverr=tif.pslverr;
		$display("time=%0t PSEL=%b PENABLE=%b PREADY=%b PWRITE=%b PADDR=%h PWDATA=%h PRDATA=%h",
         $time, tif.psel, tif.penable, tif.pready,
         tif.pwrite, tif.paddr,tif.pwdata, tif.prdata);
		tif.psel<=0;
		tif.penable<=0;
	endtask
	virtual task run_phase(uvm_phase phase);
		tif.psel<=0;
		tif.penable<=0;
		forever begin
			seq_item_port.get_next_item(tr);
			drive_dut();
			seq_item_port.item_done();
		end
	endtask
endclass

