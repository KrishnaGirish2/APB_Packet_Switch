class top_reg_seq extends uvm_sequence;
	`uvm_object_utils(top_reg_seq);
	top_reg_block regmodel;
	int pass,fail;
	function new(string name="top_reg_seq");
		super.new(name);
	endfunction
	task chk_reg(string name,uvm_reg_data_t got, bit[31:0] exp);
		if(got[31:0]==exp) begin
			pass++;
			`uvm_info("SEQ",$sformatf("PASS %s=%h",name,got[31:0]),UVM_NONE);
		end
		else begin
			fail++;
			`uvm_error("SEQ",$sformatf("FAIL %s=%h expected=%h",name,got[31:0],exp));
		end
	endtask
	task bd_chk(uvm_reg r,string name);
		uvm_status_e status;
		uvm_reg_data_t fd,bd;
		r.read(status,fd,UVM_FRONTDOOR);
		r.peek(status,bd);
		if(fd[31:0]===bd[31:0]) begin
			pass++;
			`uvm_info("SEQ",$sformatf("PASS BD %s frontdoor=%h backdoor=%h",name,fd[31:0],bd[31:0]),UVM_NONE);
		end
		else begin
			fail++;
			`uvm_error("SEQ",$sformatf("FAIL BD %s frontdoor=%h backdoor=%h",name,fd[31:0],bd[31:0]));
		end
	endtask
	task bd_poke(uvm_reg r,string name,bit [31:0] val,bit [31:0] exp);
		uvm_status_e status;
		uvm_reg_data_t fd;
		r.poke(status,val);
		r.read(status,fd,UVM_FRONTDOOR);
		if(fd[31:0]===exp) begin
			pass++;
			`uvm_info("SEQ",$sformatf("PASS POKE %s poked=%h frontdoor=%h",name,val,fd[31:0]),UVM_NONE);
		end
		else begin
			fail++;
			`uvm_error("SEQ",$sformatf("FAIL POKE %s poked=%h frontdoor=%h expected=%h",name,val,fd[31:0],exp));
		end
	endtask


	task body;
		uvm_status_e status;
		uvm_reg_data_t data;
		`uvm_info("SEQ",$sformatf("*************RESET VALUES**********"),UVM_NONE);
		regmodel.device_id_inst.read(status,data);
		chk_reg("DEVICE_ID",data,32'h02A55357);
		`uvm_info("SEQ",$sformatf("DEVICE_ID =%h",data),UVM_NONE);
		regmodel.version_inst.read(status,data);
		chk_reg("VERSION",data,32'h00010200);
		`uvm_info("SEQ",$sformatf("VERSION=%h",data),UVM_NONE);
		regmodel.switch_status_inst.read(status,data);
		chk_reg("SWITCH_STATUS",data,32'h000000F9);
		`uvm_info("SEQ",$sformatf("SWITCH_STATUS=%h",data),UVM_NONE);
		regmodel.port_status_inst.read(status,data);
		chk_reg("PORT_STATUS",data,32'h00000000);
		`uvm_info("SEQ",$sformatf("PORT_STATUS=%h",data),UVM_NONE);
		regmodel.gen_status_inst.read(status,data);
		chk_reg("GEN_STATUS",data,32'h00000000);
		`uvm_info("SEQ",$sformatf("GEN_STATUS=%h",data),UVM_NONE);
		regmodel.stat_rx_inst.read(status,data);
		chk_reg("STAT_RX",data,32'h00000000);
		`uvm_info("SEQ",$sformatf("STAT_RX=%h",data),UVM_NONE);
		regmodel.stat_tx_inst.read(status,data);
		chk_reg("STAT_TX",data,32'h00000000);
		`uvm_info("SEQ",$sformatf("STAT_TX=%h",data),UVM_NONE);
		regmodel.stat_drop_inst.read(status,data);
		chk_reg("STAT_DROP",data,32'h00000000);
		`uvm_info("SEQ",$sformatf("STAT_DROP=%h",data),UVM_NONE);
		regmodel.switch_ctrl_inst.read(status,data);
		chk_reg("SWITCH_CTRL",data,32'h00000000);
		regmodel.port_enable_inst.read(status,data);
		chk_reg("PORT_ENABLE",data,32'h0000000F);
		regmodel.fwd_enable_inst.read(status,data);
		chk_reg("FWD_ENABLE",data,32'h0000000F);
		regmodel.gen_ctrl_inst.read(status,data);
		chk_reg("GEN_CTRL",data,32'h00000000);
		regmodel.gen_pkt_cfg_inst.read(status,data);
		chk_reg("GEN_PKT_CFG",data,32'h00000401);
		regmodel.gen_interval_inst.read(status,data);
		chk_reg("GEN_INTERVAL",data,32'h00000002);
		regmodel.gen_count_inst.read(status,data);
		chk_reg("GEN_COUNT",data,32'h00000004);
		regmodel.irq_status_inst.read(status,data);
		chk_reg("IRQ_STATUS",data,32'h00000000);
		regmodel.irq_enable_inst.read(status,data);
		chk_reg("IRQ_ENABLE",data,32'h00000000);
		regmodel.irq_force_inst.read(status,data);
		chk_reg("IRQ_FORCE",data,32'h00000000);
		regmodel.err_status_inst.read(status,data);
		chk_reg("ERR_STATUS",data,32'h00000000);
		regmodel.err_enable_inst.read(status,data);
		chk_reg("ERR_ENABLE",data,32'h00000000);
		regmodel.err_inject_inst.read(status,data);
		chk_reg("ERR_INJECT",data,32'h00000000);
		regmodel.err_count_inst.read(status,data);
		chk_reg("ERR_COUNT",data,32'h00000000);
		regmodel.err_info_inst.read(status,data);
		chk_reg("ERR_INFO",data,32'h00000000);
		regmodel.lock_inst.read(status,data);
		chk_reg("LOCK",data,32'h00000001);
		regmodel.soft_reset_inst.read(status,data);
		chk_reg("SOFT_RESET",data,32'h00000000);


		`uvm_info("SEQ",$sformatf("****Programming Example****"),UVM_NONE);
		regmodel.lock_inst.write(status,32'hA5A5C3C3);	
		regmodel.lock_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("LOCK=%h",data),UVM_NONE);
		regmodel.port_enable_inst.write(status,32'hF);
		regmodel.port_enable_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("PORT_ENABLE=%h",data),UVM_NONE);
		regmodel.fwd_enable_inst.write(status,32'hF);
		regmodel.fwd_enable_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("SWITCH_CTRL=%h",data),UVM_NONE);
		regmodel.switch_ctrl_inst.write(status,32'h9);
		regmodel.switch_ctrl_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("SWITCH_CTRL=%h",data),UVM_NONE);
		regmodel.gen_pkt_cfg_inst.write(status,32'h00100401);
		regmodel.gen_pkt_cfg_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("GEN_PKT_CFG=%h",data),UVM_NONE);
		regmodel.gen_interval_inst.write(status,32'h2);
		regmodel.gen_interval_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("GEN_INTERVAL=%h",data),UVM_NONE);
		regmodel.gen_count_inst.write(status,32'h4);
		regmodel.gen_count_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("SWITCH_CTRL=%h",data),UVM_NONE);
		regmodel.irq_enable_inst.write(status,32'h41);
		regmodel.irq_enable_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("IRQ_ENABLE=%h",data),UVM_NONE);
		regmodel.gen_ctrl_inst.write(status,32'h3);
		regmodel.gen_ctrl_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("GEN_CTRL=%h",data),UVM_NONE);

		regmodel.switch_status_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("SWITCH_STATUS=%h",data),UVM_NONE);
		regmodel.port_status_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("PORT_STATUS=%h",data),UVM_NONE);
		regmodel.gen_status_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("GEN_STATUS=%h",data),UVM_NONE);
		regmodel.stat_rx_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("STAT_RX=%h",data),UVM_NONE);
		regmodel.stat_tx_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("STAT_TX=%h",data),UVM_NONE);
		regmodel.stat_drop_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("STAT_DROP=%h",data),UVM_NONE);
		regmodel.irq_status_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("IRQ_STATUS=%h",data),UVM_NONE);
		
		regmodel.port_enable_inst.write(status,32'hF);
		regmodel.port_enable_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("PORT_ENABLE=%h",data),UVM_NONE);
		regmodel.switch_ctrl_inst.write(status,32'hB);
		regmodel.switch_ctrl_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("SWITCH_CTRL=%h",data),UVM_NONE);
		regmodel.fwd_enable_inst.write(status,32'h1);
		regmodel.fwd_enable_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("FWD_ENABLE=%h",data),UVM_NONE);
		regmodel.gen_ctrl_inst.write(status,32'h3);
		regmodel.gen_ctrl_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("GEN_CTRL=%h",data),UVM_NONE);
		regmodel.stat_drop_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("STAT_DROP=%h",data),UVM_NONE);
		regmodel.stat_rx_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("STAT_RX=%h",data),UVM_NONE);
		regmodel.stat_tx_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("STAT_TX=%h",data),UVM_NONE);
		regmodel.err_status_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("ERR_STATUS=%h",data),UVM_NONE);
		regmodel.err_count_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("ERR_COUNT=%h",data),UVM_NONE);
		regmodel.irq_status_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("IRQ_STATUS=%h",data),UVM_NONE);

		regmodel.irq_force_inst.write(status,32'hFF);
		regmodel.irq_force_inst.read(status,data);
                `uvm_info("SEQ",$sformatf("IRQ_FORCE=%h",data),UVM_NONE);

		regmodel.irq_status_inst.read(status,data);
		`uvm_info("SEQ",$sformatf("IRQ_STATUS=%h",data),UVM_NONE);

		regmodel.irq_status_inst.write(status,32'hFF);
                regmodel.irq_status_inst.read(status,data);
                `uvm_info("SEQ",$sformatf("IRQ_STATUS=%h",data),UVM_NONE);
                regmodel.err_enable_inst.write(status,32'h02);
                regmodel.irq_status_inst.read(status,data);
                `uvm_info("SEQ",$sformatf("IRQ_STATUS=%h",data),UVM_NONE);

		regmodel.lock_inst.write(status,32'h12345678);
		regmodel.lock_inst.read(status,data);
                `uvm_info("SEQ",$sformatf("LOCK=%h",data),UVM_NONE);
		regmodel.err_enable_inst.write(status,32'h0F);
                regmodel.err_enable_inst.read(status,data);
                `uvm_info("SEQ",$sformatf("ERR_ENABLE=%h",data),UVM_NONE);
		regmodel.err_status_inst.read(status,data);
                `uvm_info("SEQ",$sformatf("ERR_STATUS=%h",data),UVM_NONE);
                regmodel.irq_status_inst.read(status,data);
                `uvm_info("SEQ",$sformatf("IRQ_STATUS=%h",data),UVM_NONE);

		regmodel.lock_inst.write(status,32'hA5A5C3C3);
                regmodel.lock_inst.read(status,data);
                `uvm_info("SEQ",$sformatf("LOCK=%h",data),UVM_NONE);
                regmodel.err_enable_inst.write(status,32'hFF);
                regmodel.err_enable_inst.read(status,data);
                `uvm_info("SEQ",$sformatf("ERR_ENABLE=%h",data),UVM_NONE);
		regmodel.err_status_inst.read(status,data);
                `uvm_info("SEQ",$sformatf("ERR_STATUS=%h",data),UVM_NONE);
		regmodel.irq_status_inst.read(status,data);
                `uvm_info("SEQ",$sformatf("IRQ_STATUS=%h",data),UVM_NONE);

		regmodel.err_status_inst.write(status,32'h00);
                regmodel.err_status_inst.read(status,data);
                `uvm_info("SEQ",$sformatf("ERR_STATUS=%h",data),UVM_NONE);
		regmodel.err_status_inst.write(status,32'hFF);
                regmodel.err_status_inst.read(status,data);
                `uvm_info("SEQ",$sformatf("ERR_STATUS=%h",data),UVM_NONE);
	 
		regmodel.err_inject_inst.write(status,32'hFF);
                regmodel.err_inject_inst.read(status,data);
                `uvm_info("SEQ",$sformatf("ERR_INJECT=%h",data),UVM_NONE);
		regmodel.err_status_inst.read(status,data);
                `uvm_info("SEQ",$sformatf("ERR_STATUS=%h",data),UVM_NONE);
		regmodel.err_count_inst.read(status,data);
                `uvm_info("SEQ",$sformatf("ERR_COUNT=%h",data),UVM_NONE);
		regmodel.err_info_inst.read(status,data);
                `uvm_info("SEQ",$sformatf("ERR_INFO=%h",data),UVM_NONE);


		//regmodel.soft_reset_inst.write(status,32'h01);

		`uvm_info("SEQ",$sformatf("**********Write FFFFFFFF *******"),UVM_NONE);
		regmodel.device_id_inst.write(status,32'hFFFFFFFF);
		regmodel.version_inst.write(status,32'hFFFFFFFF);
		regmodel.switch_status_inst.write(status,32'hFFFFFFFF);
		regmodel.port_status_inst.write(status,32'hFFFFFFFF);
		regmodel.gen_status_inst.write(status,32'hFFFFFFFF);
		regmodel.stat_rx_inst.write(status,32'hFFFFFFFF);
		regmodel.stat_tx_inst.write(status,32'hFFFFFFFF);
		regmodel.stat_drop_inst.write(status,32'hFFFFFFFF);
		regmodel.switch_ctrl_inst.write(status,32'hFFFFFFFF);
		regmodel.port_enable_inst.write(status,32'hFFFFFFFF);
		regmodel.fwd_enable_inst.write(status,32'hFFFFFFFF);
		regmodel.gen_ctrl_inst.write(status,32'hFFFFFFFF);
		regmodel.gen_pkt_cfg_inst.write(status,32'hFFFFFFFF);
		regmodel.gen_interval_inst.write(status,32'hFFFFFFFF);
		regmodel.gen_count_inst.write(status,32'hFFFFFFFF);
		regmodel.irq_status_inst.write(status,32'hFFFFFFFF);
		regmodel.irq_enable_inst.write(status,32'hFFFFFFFF);
		regmodel.irq_force_inst.write(status,32'hFFFFFFFF);
		regmodel.err_status_inst.write(status,32'hFFFFFFFF);
		regmodel.err_enable_inst.write(status,32'hFFFFFFFF);
		regmodel.err_inject_inst.write(status,32'hFFFFFFFF);
		regmodel.err_count_inst.write(status,32'hFFFFFFFF);
		regmodel.err_info_inst.write(status,32'hFFFFFFFF);

		regmodel.device_id_inst.read(status,data);
		chk_reg("DEVICE_ID",data,32'h02A55357);
		regmodel.version_inst.read(status,data);
		chk_reg("VERSION",data,32'h00010200);
		regmodel.switch_status_inst.read(status,data);
		chk_reg("SWITCH_STATUS",data,32'h000002F5);
		regmodel.port_status_inst.read(status,data);
		chk_reg("PORT_STATUS",data,32'h00000000);
		regmodel.gen_status_inst.read(status,data);
		chk_reg("GEN_STATUS",data,32'h00000000);
		regmodel.stat_rx_inst.read(status,data);
		chk_reg("STAT_RX",data,32'h00000000);
		regmodel.stat_tx_inst.read(status,data);
		chk_reg("STAT_TX",data,32'h00000000);
		regmodel.stat_drop_inst.read(status,data);
		chk_reg("STAT_DROP",data,32'h00000000);
		regmodel.switch_ctrl_inst.read(status,data);
		chk_reg("SWITCH_CTRL",data,32'h00000009);
		regmodel.port_enable_inst.read(status,data);
		chk_reg("PORT_ENABLE",data,32'h0000000F);
		regmodel.fwd_enable_inst.read(status,data);
		chk_reg("FWD_ENABLE",data,32'h0000000F);
		regmodel.gen_ctrl_inst.read(status,data);
		chk_reg("GEN_CTRL",data,32'h00000009);
		regmodel.gen_pkt_cfg_inst.read(status,data);
		chk_reg("GEN_PKT_CFG",data,32'h00FFFF0F);
		regmodel.gen_interval_inst.read(status,data);
		chk_reg("GEN_INTERVAL",data,32'h0000FFFF);
		regmodel.gen_count_inst.read(status,data);
		chk_reg("GEN_COUNT",data,32'h0000FFFF);
		regmodel.irq_status_inst.read(status,data);
		chk_reg("IRQ_STATUS",data,32'h000000FF);
		regmodel.irq_enable_inst.read(status,data);
		chk_reg("IRQ_ENABLE",data,32'h000000FF);
		regmodel.irq_force_inst.read(status,data);
		chk_reg("IRQ_FORCE",data,32'h00000000);
		regmodel.err_status_inst.read(status,data);
		chk_reg("ERR_STATUS",data,32'h000000FF);
		regmodel.err_enable_inst.read(status,data);
		chk_reg("ERR_ENABLE",data,32'h000000FF);
		regmodel.err_inject_inst.read(status,data);
		chk_reg("ERR_INJECT",data,32'h00000000);
		regmodel.err_count_inst.read(status,data);
		chk_reg("ERR_COUNT",data,32'h00000000);
		regmodel.err_info_inst.read(status,data);
		chk_reg("ERR_INFO",data,32'h00000000);
		regmodel.lock_inst.read(status,data);
		chk_reg("LOCK",data,32'h00000000);
		regmodel.soft_reset_inst.read(status,data);
		chk_reg("SOFT_RESET",data,32'h00000000);
		

		`uvm_info("SEQ",$sformatf("*******Soft Reset *******"),UVM_NONE);
		regmodel.soft_reset_inst.write(status,32'h01);

		regmodel.device_id_inst.read(status,data);
		chk_reg("DEVICE_ID",data,32'h02A55357);
		regmodel.version_inst.read(status,data);
		chk_reg("VERSION",data,32'h00010200);
		regmodel.switch_status_inst.read(status,data);
		chk_reg("SWITCH_STATUS",data,32'h000000F9);
		regmodel.port_status_inst.read(status,data);
		chk_reg("PORT_STATUS",data,32'h00000000);
		regmodel.gen_status_inst.read(status,data);
		chk_reg("GEN_STATUS",data,32'h00000000);
		regmodel.stat_rx_inst.read(status,data);
		chk_reg("STAT_RX",data,32'h00000000);
		regmodel.stat_tx_inst.read(status,data);
		chk_reg("STAT_TX",data,32'h00000000);
		regmodel.stat_drop_inst.read(status,data);
		chk_reg("STAT_DROP",data,32'h00000000);
		regmodel.switch_ctrl_inst.read(status,data);
		chk_reg("SWITCH_CTRL",data,32'h00000000);
		regmodel.port_enable_inst.read(status,data);
		chk_reg("PORT_ENABLE",data,32'h0000000F);
		regmodel.fwd_enable_inst.read(status,data);
		chk_reg("FWD_ENABLE",data,32'h0000000F);
		regmodel.gen_ctrl_inst.read(status,data);
		chk_reg("GEN_CTRL",data,32'h00000000);
		regmodel.gen_pkt_cfg_inst.read(status,data);
		chk_reg("GEN_PKT_CFG",data,32'h00000401);
		regmodel.gen_interval_inst.read(status,data);
		chk_reg("GEN_INTERVAL",data,32'h00000002);
		regmodel.gen_count_inst.read(status,data);
		chk_reg("GEN_COUNT",data,32'h00000004);
		regmodel.irq_status_inst.read(status,data);
		chk_reg("IRQ_STATUS",data,32'h00000000);
		regmodel.irq_enable_inst.read(status,data);
		chk_reg("IRQ_ENABLE",data,32'h00000000);
		regmodel.irq_force_inst.read(status,data);
		chk_reg("IRQ_FORCE",data,32'h00000000);
		regmodel.err_status_inst.read(status,data);
		chk_reg("ERR_STATUS",data,32'h00000000);
		regmodel.err_enable_inst.read(status,data);
		chk_reg("ERR_ENABLE",data,32'h00000000);
		regmodel.err_inject_inst.read(status,data);
		chk_reg("ERR_INJECT",data,32'h00000000);
		regmodel.err_count_inst.read(status,data);
		chk_reg("ERR_COUNT",data,32'h00000000);
		regmodel.err_info_inst.read(status,data);
		chk_reg("ERR_INFO",data,32'h00000000);
		regmodel.lock_inst.read(status,data);
		chk_reg("LOCK",data,32'h00000001);
		regmodel.soft_reset_inst.read(status,data);
		chk_reg("SOFT_RESET",data,32'h00000000);

		`uvm_info("SEQ",$sformatf("*******BACKDOOR peek and poke ********"),UVM_NONE);
                 bd_chk(regmodel.switch_status_inst,"SWITCH_STATUS");
                bd_chk(regmodel.gen_status_inst,"GEN_STATUS");
                bd_chk(regmodel.port_status_inst,"PORT_STATUS");
                bd_chk(regmodel.stat_rx_inst,"STAT_RX");
                bd_chk(regmodel.stat_tx_inst,"STAT_TX");
                bd_chk(regmodel.stat_drop_inst,"STAT_DROP");
                bd_chk(regmodel.switch_ctrl_inst,"SWITCH_CTRL");
                bd_chk(regmodel.port_enable_inst,"PORT_ENABLE");
                bd_chk(regmodel.fwd_enable_inst,"FWD_ENABLE");
                bd_chk(regmodel.gen_ctrl_inst,"GEN_CTRL");
                bd_chk(regmodel.gen_pkt_cfg_inst,"GEN_PKT_CFG");
                bd_chk(regmodel.gen_interval_inst,"GEN_INTERVAL");
                bd_chk(regmodel.gen_count_inst,"GEN_COUNT");
                bd_chk(regmodel.irq_status_inst,"IRQ_STATUS");
                bd_chk(regmodel.irq_enable_inst,"IRQ_ENABLE");
                bd_chk(regmodel.err_status_inst,"ERR_STATUS");
                bd_chk(regmodel.err_enable_inst,"ERR_ENABLE");
                bd_chk(regmodel.err_count_inst,"ERR_COUNT");
                bd_chk(regmodel.err_info_inst,"ERR_INFO");
                bd_chk(regmodel.lock_inst,"LOCK");
                bd_poke(regmodel.switch_ctrl_inst,"SWITCH_CTRL",32'h00000009,32'h00000009);
                bd_poke(regmodel.port_enable_inst,"PORT_ENABLE",32'h00000005,32'h00000005);
                bd_poke(regmodel.fwd_enable_inst,"FWD_ENABLE",32'h0000000A,32'h0000000A);
                bd_poke(regmodel.gen_ctrl_inst,"GEN_CTRL",32'h00000008,32'h00000008);
                bd_poke(regmodel.gen_pkt_cfg_inst,"GEN_PKT_CFG",32'h00A50A05,32'h00A50A05);
                bd_poke(regmodel.gen_interval_inst,"GEN_INTERVAL",32'h00001234,32'h00001234);
                bd_poke(regmodel.gen_count_inst,"GEN_COUNT",32'h00005678,32'h00005678);
                bd_poke(regmodel.irq_enable_inst,"IRQ_ENABLE",32'h000000A5,32'h000000A5);
                bd_poke(regmodel.err_enable_inst,"ERR_ENABLE",32'h0000005A,32'h0000005A);
                bd_poke(regmodel.stat_rx_inst,"STAT_RX",32'h00001111,32'h00001111);
                bd_poke(regmodel.stat_tx_inst,"STAT_TX",32'h00002222,32'h00002222);
                bd_poke(regmodel.stat_drop_inst,"STAT_DROP",32'h00003333,32'h00003333);
                bd_poke(regmodel.err_count_inst,"ERR_COUNT",32'h00000042,32'h00000042);
                bd_poke(regmodel.err_info_inst,"ERR_INFO",32'h00010203,32'h00010203);
                bd_poke(regmodel.lock_inst,"LOCK",32'h00000000,32'h00000000);
                bd_poke(regmodel.lock_inst,"LOCK",32'h00000001,32'h00000001);


                                          

		`uvm_info("SEQ",$sformatf("SUMMARY pass=%0d fail=%0d",pass,fail),UVM_NONE);

	endtask
endclass

