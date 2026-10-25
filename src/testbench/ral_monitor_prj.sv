class monitor extends uvm_monitor;
	`uvm_component_utils(monitor);
	virtual top_if tif;
	uvm_analysis_port #(trans) mon_ap;
	trans tr;
	covergroup mon_cov;
		coverpoint tr.paddr{
			bins regs[]={[0:'h60]} with (item%4==0);
			bins illegal={[16'h61:16'hFFFF]};
		}
		coverpoint tr.pwrite{
			bins read={0};
			bins write={1};
		}
		coverpoint tr.pslverr{
			bins error={1};
			bins no_error={0};
		}
	endgroup
	function new(string name="monitor",uvm_component parent);
		super.new(name,parent);
		mon_cov=new();
	endfunction
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		mon_ap=new("mon_ap",this);
		if(!uvm_config_db #(virtual top_if)::get(this,"","tif",tif))
			`uvm_fatal("MON","MON failed");
	endfunction
	task run_phase(uvm_phase phase);
		forever begin
			@(posedge tif.pclk);
			if(tif.presetn && tif.psel && tif.penable) begin
				tr=trans::type_id::create("tr");
				tr.pwrite=tif.pwrite;
				tr.paddr=tif.paddr;
				tr.pwdata=tif.pwdata;
				tr.prdata=tif.prdata;
				tr.pslverr=tif.pslverr;
				`uvm_info("MON",$sformatf("t=%0t addr=%h write=%b slverr=%b",$time,tr.paddr,tr.pwrite,tr.pslverr),UVM_NONE);
				mon_cov.sample();
				mon_ap.write(tr);
			end
		end
	endtask
endclass

