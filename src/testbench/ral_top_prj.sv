`include "uvm_macros.svh"
import uvm_pkg::*;
module tb;
	import ral_pkg_prj::*;
	bit pclk,presetn;
	top_if tif(pclk,presetn);
	apb_pkt_switch dut(.pclk(pclk),.presetn(presetn),.psel(tif.psel),.penable(tif.penable),.pwrite(tif.pwrite),.paddr(tif.paddr),.pwdata(tif.pwdata),.prdata(tif.prdata),.pready(tif.pready),.pslverr(tif.pslverr),.irq(tif.irq));
	initial begin
		pclk=0;
		presetn=0;
		tif.psel=0;
		tif.penable=0;
		tif.pwrite=0;
		tif.paddr=0;
		tif.pwdata=0;
		#20 presetn=1;
	end
	always #5 pclk=~pclk;
	initial begin
		uvm_config_db #(virtual top_if)::set(null,"*","tif",tif);
		run_test("test");
	end
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end
endmodule

