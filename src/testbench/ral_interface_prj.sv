interface top_if(input bit pclk,presetn);
	logic psel,penable,pwrite;
	logic [15:0]paddr;
	logic [31:0]pwdata;
	logic [31:0]prdata;
	logic pready,pslverr,irq;
endinterface

