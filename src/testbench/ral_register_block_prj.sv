class top_reg_block extends uvm_reg_block;
        `uvm_object_utils(top_reg_block)
        rand reg_device_id device_id_inst;
	rand reg_version version_inst;
	rand reg_switch_status switch_status_inst;
	rand reg_port_status port_status_inst;
	rand reg_gen_status gen_status_inst;
	rand reg_stat_rx stat_rx_inst;
	rand reg_stat_tx stat_tx_inst;
	rand reg_stat_drop stat_drop_inst;
	rand reg_switch_ctrl switch_ctrl_inst;
	rand reg_port_enable port_enable_inst;
	rand reg_fwd_enable fwd_enable_inst;
	rand reg_gen_ctrl gen_ctrl_inst;
	rand reg_gen_pkt_cfg gen_pkt_cfg_inst;
	rand reg_gen_interval gen_interval_inst;
	rand reg_gen_count gen_count_inst;
	rand reg_irq_status irq_status_inst;
	rand reg_irq_enable irq_enable_inst;
	rand reg_irq_force irq_force_inst;
	rand reg_err_status err_status_inst;
	rand reg_err_enable err_enable_inst;
	rand reg_err_inject err_inject_inst;
	rand reg_err_count err_count_inst;
	rand reg_err_info err_info_inst;
	rand reg_lock lock_inst;
	rand reg_soft_reset soft_reset_inst;	

        function new (string name="top_reg_block");
                super.new(name,build_coverage(UVM_NO_COVERAGE));
        endfunction
        function void build();
		add_hdl_path("tb.dut","RTL");
                device_id_inst=reg_device_id::type_id::create("device_id_inst");
                device_id_inst.build();
                device_id_inst.configure(this);
		device_id_inst.set_coverage(UVM_CVR_FIELD_VALS);
		

		version_inst=reg_version::type_id::create("version_inst");
		version_inst.build();
		version_inst.configure(this);
		version_inst.set_coverage(UVM_CVR_FIELD_VALS);


		switch_status_inst=reg_switch_status::type_id::create("switch_status_inst");
                switch_status_inst.build();
                switch_status_inst.configure(this);
		switch_status_inst.set_coverage(UVM_CVR_FIELD_VALS);
		switch_status_inst.add_hdl_path_slice("switch_status_r",0,32);

		port_status_inst=reg_port_status::type_id::create("port_status_inst");
		port_status_inst.build();
		port_status_inst.configure(this);
		port_status_inst.set_coverage(UVM_CVR_FIELD_VALS);
		port_status_inst.add_hdl_path_slice("port_status_r",0,32);
	

		gen_status_inst=reg_gen_status::type_id::create("gen_status_inst");
                gen_status_inst.build();
                gen_status_inst.configure(this);
		gen_status_inst.set_coverage(UVM_CVR_FIELD_VALS);
		gen_status_inst.add_hdl_path_slice("gen_status_r",0,32);
		
		stat_rx_inst=reg_stat_rx::type_id::create("stat_rx_inst");
		stat_rx_inst.build();
		stat_rx_inst.configure(this);
		stat_rx_inst.set_coverage(UVM_CVR_FIELD_VALS);
		stat_rx_inst.add_hdl_path_slice("stat_rx",0,16);
		
		stat_tx_inst=reg_stat_tx::type_id::create("stat_tx_inst");
                stat_tx_inst.build();
                stat_tx_inst.configure(this);
		stat_tx_inst.set_coverage(UVM_CVR_FIELD_VALS);
		stat_tx_inst.add_hdl_path_slice("stat_tx",0,16);
		
		stat_drop_inst=reg_stat_drop::type_id::create("stat_drop_inst");
		stat_drop_inst.build();
		stat_drop_inst.configure(this);
		stat_drop_inst.set_coverage(UVM_CVR_FIELD_VALS);
		stat_drop_inst.add_hdl_path_slice("stat_drop",0,16);

		switch_ctrl_inst=reg_switch_ctrl::type_id::create("switch_ctrl_inst");
                switch_ctrl_inst.build();
                switch_ctrl_inst.configure(this);
		switch_ctrl_inst.set_coverage(UVM_CVR_FIELD_VALS);
		switch_ctrl_inst.add_hdl_path_slice("switch_ctrl_q",0,32);
		
		port_enable_inst=reg_port_enable::type_id::create("port_enable_inst");
		port_enable_inst.build();
		port_enable_inst.configure(this);
		port_enable_inst.set_coverage(UVM_CVR_FIELD_VALS);
		port_enable_inst.add_hdl_path_slice("port_enable_q",0,4);
	
		fwd_enable_inst=reg_fwd_enable::type_id::create("fwd_enable_inst");
                fwd_enable_inst.build();
                fwd_enable_inst.configure(this);
		fwd_enable_inst.set_coverage(UVM_CVR_FIELD_VALS);
		fwd_enable_inst.add_hdl_path_slice("fwd_enable_q",0,4);	
		
		gen_ctrl_inst=reg_gen_ctrl::type_id::create("gen_ctrl_inst");
		gen_ctrl_inst.build();
		gen_ctrl_inst.configure(this);
		gen_ctrl_inst.set_coverage(UVM_CVR_FIELD_VALS);
		gen_ctrl_inst.add_hdl_path_slice("gen_ctrl_q",0,32);

		gen_pkt_cfg_inst=reg_gen_pkt_cfg::type_id::create("gen_pkt_cfg_inst");
                gen_pkt_cfg_inst.build();
                gen_pkt_cfg_inst.configure(this);
		gen_pkt_cfg_inst.set_coverage(UVM_CVR_FIELD_VALS);
		gen_pkt_cfg_inst.add_hdl_path_slice("gen_pkt_cfg_q",0,32);

		gen_interval_inst=reg_gen_interval::type_id::create("gen_interval_inst");
		gen_interval_inst.build();
		gen_interval_inst.configure(this);
		gen_interval_inst.set_coverage(UVM_CVR_FIELD_VALS);
		gen_interval_inst.add_hdl_path_slice("gen_interval_q",0,16);

		gen_count_inst=reg_gen_count::type_id::create("gen_count_inst");
        	gen_count_inst.build();
                gen_count_inst.configure(this);
		gen_count_inst.set_coverage(UVM_CVR_FIELD_VALS);
		gen_count_inst.add_hdl_path_slice("gen_count_q",0,16);

		irq_status_inst=reg_irq_status::type_id::create("irq_status_inst");
		irq_status_inst.build();
		irq_status_inst.configure(this);
		irq_status_inst.set_coverage(UVM_CVR_FIELD_VALS);
		irq_status_inst.add_hdl_path_slice("irq_status_q",0,8);

		irq_enable_inst=reg_irq_enable::type_id::create("irq_enable_inst");
		irq_enable_inst.build();
		irq_enable_inst.configure(this);
		irq_enable_inst.set_coverage(UVM_CVR_FIELD_VALS);
		irq_enable_inst.add_hdl_path_slice("irq_enable_q",0,8);

		irq_force_inst=reg_irq_force::type_id::create("irq_force_inst");
                irq_force_inst.build();
                irq_force_inst.configure(this);
		irq_force_inst.set_coverage(UVM_CVR_FIELD_VALS);
		irq_force_inst.add_hdl_path_slice("irq_force_w",0,8);

		err_status_inst=reg_err_status::type_id::create("err_status_inst");
		err_status_inst.build();
		err_status_inst.configure(this);
		err_status_inst.set_coverage(UVM_CVR_FIELD_VALS);
		err_status_inst.add_hdl_path_slice("err_status_q",0,8);

		err_enable_inst=reg_err_enable::type_id::create("err_enable_inst");
                err_enable_inst.build();
                err_enable_inst.configure(this);
		err_enable_inst.set_coverage(UVM_CVR_FIELD_VALS);
		err_enable_inst.add_hdl_path_slice("err_enable_q",0,8);	
	
		err_inject_inst=reg_err_inject::type_id::create("err_inject_inst");
		err_inject_inst.build();
		err_inject_inst.configure(this);
		err_inject_inst.set_coverage(UVM_CVR_FIELD_VALS);
		err_inject_inst.add_hdl_path_slice("err_clr_count",31,1);

		err_count_inst=reg_err_count::type_id::create("err_count_inst");
                err_count_inst.build();
                err_count_inst.configure(this);
		err_count_inst.set_coverage(UVM_CVR_FIELD_VALS);
		err_count_inst.add_hdl_path_slice("err_count_q",0,16);

		err_info_inst=reg_err_info::type_id::create("err_info_inst");
		err_info_inst.build();
		err_info_inst.configure(this);
		err_info_inst.set_coverage(UVM_CVR_FIELD_VALS);
		err_info_inst.add_hdl_path_slice("err_info_q",0,32);

		lock_inst=reg_lock::type_id::create("lock_inst");
                lock_inst.build();
                lock_inst.configure(this);
		lock_inst.set_coverage(UVM_CVR_FIELD_VALS);
		lock_inst.add_hdl_path_slice("locked",0,1);

		soft_reset_inst=reg_soft_reset::type_id::create("soft_reset_inst");
		soft_reset_inst.build();
		soft_reset_inst.configure(this);
		soft_reset_inst.set_coverage(UVM_CVR_FIELD_VALS);
		soft_reset_inst.add_hdl_path_slice("srst_pulse",0,1);

                default_map=create_map("default_map",'h0,4,UVM_LITTLE_ENDIAN,0);
                default_map.add_reg(device_id_inst,'h0,"RO");
		default_map.add_reg(version_inst,'h04,"RO");
		default_map.add_reg(switch_status_inst,'h08,"RO");
		default_map.add_reg(port_status_inst,'h0C,"RO");
		default_map.add_reg(gen_status_inst,'h10,"RO");
		default_map.add_reg(stat_rx_inst,'h14,"RO");
		default_map.add_reg(stat_tx_inst,'h18,"RO");
		default_map.add_reg(stat_drop_inst,'h1C,"RO");
		default_map.add_reg(switch_ctrl_inst,'h20,"RW");
		default_map.add_reg(port_enable_inst,'h24,"RW");
		default_map.add_reg(fwd_enable_inst,'h28,"RW");
		default_map.add_reg(gen_ctrl_inst,'h2C,"RW");
		default_map.add_reg(gen_pkt_cfg_inst,'h30,"RW");
		default_map.add_reg(gen_interval_inst,'h34,"RW");
		default_map.add_reg(gen_count_inst,'h38,"RW");
		default_map.add_reg(irq_status_inst,'h3C,"RW");
		default_map.add_reg(irq_enable_inst,'h40,"RW");
		default_map.add_reg(irq_force_inst,'h44,"WO");
		default_map.add_reg(err_status_inst,'h48,"RW");
		default_map.add_reg(err_enable_inst,'h4C,"RW");
		default_map.add_reg(err_inject_inst,'h50,"WO");
		default_map.add_reg(err_count_inst,'h54,"RO");
		default_map.add_reg(err_info_inst,'h58,"RO");
		default_map.add_reg(lock_inst,'h5C,"RW");
		default_map.add_reg(soft_reset_inst,'h60,"WO");
		
                default_map.set_auto_predict(0);
                lock_model();
        endfunction
endclass

