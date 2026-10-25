class reg_device_id extends uvm_reg;
        `uvm_object_utils(reg_device_id)
        rand uvm_reg_field REVISION;
	rand uvm_reg_field VENDOR_ID;
	rand uvm_reg_field PRODUCT_ID;
	covergroup device_id_cov;
	option.per_instance=1;
		d_cp1:coverpoint REVISION.value[7:0]{
			bins val={[0:255]};
		}
		d_cp2:coverpoint VENDOR_ID.value[7:0]{
			bins val={[0:255]};
		}
		d_cp3:coverpoint PRODUCT_ID.value[15:0]{
			bins val={[0:$]};
		}	
	endgroup
		
        function new(string name="reg_device_id");
                super.new(name,32,UVM_CVR_FIELD_VALS);
		if(has_coverage(UVM_CVR_FIELD_VALS))	
			device_id_cov=new();
	
        endfunction
	virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
		sample_values();
	endfunction
	virtual function void sample_values();
		super.sample_values();
		device_id_cov.sample();
	endfunction
		
        function void build();
                REVISION=uvm_reg_field::type_id::create("REVISION");
       	REVISION.configure(.parent(this),.size(8),.lsb_pos(24),.access("RO"),.volatile(0),.reset(8'h02),.has_reset(1),.is_rand(1),.individually_accessible(0));

	VENDOR_ID=uvm_reg_field::type_id::create("VENDOR_ID");
     	VENDOR_ID.configure(.parent(this),.size(8),.lsb_pos(16),.access("RO"),.volatile(0),.reset(8'hA5),.has_reset(1),.is_rand(1),.individually_accessible(1));

	PRODUCT_ID=uvm_reg_field::type_id::create("PRODUCT_ID");
        	PRODUCT_ID.configure(.parent(this),.size(16),.lsb_pos(0),.access("RO"),.volatile(0),.reset(16'h5357),.has_reset(1),.is_rand(1),.individually_accessible(1));
        endfunction
endclass

class reg_version extends uvm_reg;
        `uvm_object_utils(reg_version)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field MAJOR;
	rand uvm_reg_field MINOR;
	rand uvm_reg_field PATCH;
	covergroup version_cov;
	option.per_instance=1;
		v_cp1: coverpoint RESERVED.value[7:0]{
			bins val={[0:$]};
		}
		v_cp2: coverpoint MAJOR.value[7:0]{
                        bins val1={[0:$]};
                }
		v_cp3: coverpoint MINOR.value[7:0]{
                        bins val2={[0:$]};
                }
		v_cp4: coverpoint PATCH.value[7:0]{
                        bins val3={[0:$]};
                }
	endgroup
       function new(string name="reg_version");
                super.new(name,32,UVM_CVR_FIELD_VALS);
		if(has_coverage(UVM_CVR_FIELD_VALS))	
			version_cov=new();
	
        endfunction
	virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                version_cov.sample();
        endfunction



        function void build();
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(8),.lsb_pos(24),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	MAJOR=uvm_reg_field::type_id::create("MAJOR");
     	MAJOR.configure(.parent(this),.size(8),.lsb_pos(16),.access("RO"),.volatile(0),.reset(1),.has_reset(1),.is_rand(1),.individually_accessible(1));

	MINOR=uvm_reg_field::type_id::create("MINOR");
        	MINOR.configure(.parent(this),.size(8),.lsb_pos(8),.access("RO"),.volatile(0),.reset(2),.has_reset(1),.is_rand(1),.individually_accessible(1));
	
	PATCH=uvm_reg_field::type_id::create("PATCH");
        	PATCH.configure(.parent(this),.size(8),.lsb_pos(0),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	
        endfunction
endclass

class reg_switch_status extends uvm_reg;
        `uvm_object_utils(reg_switch_status)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field GEN_FSM;
	rand uvm_reg_field RESERVED_2;
	rand uvm_reg_field ERR_PENDING;
	rand uvm_reg_field GEN_RUNNING;
	rand uvm_reg_field PORT_ENABLED;
	rand uvm_reg_field LOCKED;
	rand uvm_reg_field SWITCH_ENABLED;
	rand uvm_reg_field BUSY;
	rand uvm_reg_field READY;
	covergroup switch_status_cov;
        option.per_instance=1;
                s_cp1: coverpoint RESERVED.value[13:0]{
                        bins val={[0:$]};
                }
                s_cp2: coverpoint GEN_FSM.value[1:0]{
                        bins val1={[0:$]};
                }
		s_cp3:coverpoint RESERVED_2.value[5:0]{
			bins val2={[0:$]};
		}
                s_cp4: coverpoint ERR_PENDING.value{
                        bins val3={[0:$]};
                }
                s_cp5: coverpoint GEN_RUNNING.value{
                        bins val4={[0:$]};
                }
		s_cp6: coverpoint PORT_ENABLED.value[3:0]{
                        bins val5={[0:$]};
                }
                s_cp7: coverpoint LOCKED.value[2:0]{
                        bins val6={[0:$]};
                }
                s_cp8:coverpoint SWITCH_ENABLED.value{
                        bins val7={[0:$]};
                }
                s_cp9: coverpoint BUSY.value{
                        bins val8={[0:$]};
                }
                s_cp10: coverpoint READY.value{
                        bins val9={[0:$]};
                }

		
        endgroup
       function new(string name="reg_switch_status");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        switch_status_cov=new();

        endfunction
	virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
		`uvm_info("COV","version sampled",UVM_NONE);
                switch_status_cov.sample();
        endfunction

        function void build;
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(14),.lsb_pos(18),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	GEN_FSM=uvm_reg_field::type_id::create("GEN_FSM");
     	GEN_FSM.configure(.parent(this),.size(2),.lsb_pos(16),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	RESERVED_2=uvm_reg_field::type_id::create("RESERVED");
        	RESERVED_2.configure(.parent(this),.size(6),.lsb_pos(10),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	
	ERR_PENDING=uvm_reg_field::type_id::create("ERR_PENDING");
        	ERR_PENDING.configure(.parent(this),.size(1),.lsb_pos(9),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	GEN_RUNNING=uvm_reg_field::type_id::create("GEN_RUNNING");
       	GEN_RUNNING.configure(.parent(this),.size(1),.lsb_pos(8),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	PORT_ENABLED=uvm_reg_field::type_id::create("PORT_ENABLED");
       	PORT_ENABLED.configure(.parent(this),.size(4),.lsb_pos(4),.access("RO"),.volatile(1),.reset(8'hF),.has_reset(1),.is_rand(1),.individually_accessible(1));

	LOCKED=uvm_reg_field::type_id::create("LOCKED");
     	LOCKED.configure(.parent(this),.size(1),.lsb_pos(3),.access("RO"),.volatile(1),.reset(1),.has_reset(1),.is_rand(1),.individually_accessible(1));

	SWITCH_ENABLED=uvm_reg_field::type_id::create("SWITCH_ENABLED");
        	SWITCH_ENABLED.configure(.parent(this),.size(1),.lsb_pos(2),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	
	BUSY=uvm_reg_field::type_id::create("BUSY");
        	BUSY.configure(.parent(this),.size(1),.lsb_pos(1),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	READY=uvm_reg_field::type_id::create("READY");
       	READY.configure(.parent(this),.size(1),.lsb_pos(0),.access("RO"),.volatile(1),.reset(1),.has_reset(1),.is_rand(1),.individually_accessible(1));

	
        endfunction
endclass

class reg_port_status extends uvm_reg;
        `uvm_object_utils(reg_port_status)
        rand uvm_reg_field PORT3_LEVEL;
	rand uvm_reg_field PORT2_LEVEL;
	rand uvm_reg_field PORT1_LEVEL;
	rand uvm_reg_field PORT0_LEVEL;
	covergroup port_status_cov;
        option.per_instance=1;
                p_cp1:coverpoint PORT3_LEVEL.value[7:0]{
                        bins val={[0:255]};
                }
                p_cp2:coverpoint PORT2_LEVEL.value[7:0]{
                        bins val1={[0:255]};
                }
                p_cp3:coverpoint PORT1_LEVEL.value[7:0]{
                        bins val2={[0:$]};
                }
		p_cp4:coverpoint PORT0_LEVEL.value[7:0]{
                        bins val2={[0:$]};
                }

        endgroup

        function new(string name="reg_port_status");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        port_status_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                port_status_cov.sample();
        endfunction

        function void build;
                PORT3_LEVEL=uvm_reg_field::type_id::create("PORT3_LEVEL");
       	PORT3_LEVEL.configure(.parent(this),.size(8),.lsb_pos(24),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	PORT2_LEVEL=uvm_reg_field::type_id::create("PORT2_LEVEL");
     	PORT2_LEVEL.configure(.parent(this),.size(8),.lsb_pos(16),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	PORT1_LEVEL=uvm_reg_field::type_id::create("PORT1_LEVEL");
        	PORT1_LEVEL.configure(.parent(this),.size(8),.lsb_pos(8),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	
	PORT0_LEVEL=uvm_reg_field::type_id::create("PORT0_LEVEL");
        	PORT0_LEVEL.configure(.parent(this),.size(8),.lsb_pos(0),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	
        endfunction
endclass


class reg_gen_status extends uvm_reg;
        `uvm_object_utils(reg_gen_status)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field REMAINING;

	rand uvm_reg_field FSM;
	rand uvm_reg_field DONE;
	rand uvm_reg_field RUNNING;
	covergroup gen_status_cov;
        option.per_instance=1;
                g_cp1:coverpoint RESERVED.value[7:0]{
                        bins val={[0:255]};
                }
                g_cp2:coverpoint REMAINING.value[15:0]{
                        bins val1={[0:$]};
                }
                g_cp3:coverpoint RESERVED.value[3:0]{
                        bins val2={[0:$]};
                }
		g_cp4:coverpoint FSM.value[1:0]{
                        bins val3={[0:$]};
                }
                g_cp5:coverpoint DONE.value{
                        bins val4={[0:$]};
                }
                g_cp6:coverpoint RUNNING.value{
                        bins val5={[0:$]};
                }

        endgroup

        function new(string name="reg_gen_status");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        gen_status_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                gen_status_cov.sample();
        endfunction
        function void build;
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(8),.lsb_pos(24),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	REMAINING=uvm_reg_field::type_id::create("REMAINING");
     	REMAINING.configure(.parent(this),.size(16),.lsb_pos(8),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	RESERVED=uvm_reg_field::type_id::create("RESERVED");
        	RESERVED.configure(.parent(this),.size(4),.lsb_pos(4),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	
	FSM=uvm_reg_field::type_id::create("FSM");
        	FSM.configure(.parent(this),.size(2),.lsb_pos(2),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	DONE=uvm_reg_field::type_id::create("DONE");
        	DONE.configure(.parent(this),.size(1),.lsb_pos(1),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	
	RUNNING=uvm_reg_field::type_id::create("RUNNING");
        	RUNNING.configure(.parent(this),.size(1),.lsb_pos(0),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	
        endfunction
endclass

class reg_stat_rx extends uvm_reg;
        `uvm_object_utils(reg_stat_rx)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field RX_PACKETS;
        covergroup stat_rx_cov;
        option.per_instance=1;
                r_cp1:coverpoint RESERVED.value[15:0]{
                        bins val={[0:$]};
                }
                r_cp2:coverpoint RX_PACKETS.value[15:0]{
                        bins lower={[0:$]};
                }
                
        endgroup

        function new(string name="reg_stat_rx");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        stat_rx_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                stat_rx_cov.sample();
        endfunction

        function void build;
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(16),.lsb_pos(16),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	RX_PACKETS=uvm_reg_field::type_id::create("RX_PACKETS");
     	RX_PACKETS.configure(.parent(this),.size(16),.lsb_pos(0),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

        endfunction
endclass

class reg_stat_tx extends uvm_reg;
        `uvm_object_utils(reg_stat_tx)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field TX_PACKETS;
        covergroup stat_tx_cov;
        option.per_instance=1;
                r_cp1:coverpoint RESERVED.value[15:0]{
                        bins val={[0:$]};
                }
                r_cp2:coverpoint TX_PACKETS.value[15:0]{
                        bins val1={[0:$]};
                }

        endgroup

        function new(string name="reg_stat_tx");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        stat_tx_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                stat_tx_cov.sample();
        endfunction


        function void build;
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(16),.lsb_pos(16),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	TX_PACKETS=uvm_reg_field::type_id::create("TX_PACKETS");
     	TX_PACKETS.configure(.parent(this),.size(16),.lsb_pos(0),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

        endfunction
endclass

class reg_stat_drop extends uvm_reg;
        `uvm_object_utils(reg_stat_drop)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field DROPPED_PACKETS;
        covergroup stat_drop_cov;
        option.per_instance=1;
                sd_cp1:coverpoint RESERVED.value[15:0]{
                        bins val={[0:$]};
                }
                sd_cp2:coverpoint DROPPED_PACKETS.value[15:0]{
                        bins val1={[0:$]};
                }

        endgroup

        function new(string name="reg_stat_drop");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        stat_drop_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                stat_drop_cov.sample();
        endfunction


        function void build;
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(16),.lsb_pos(16),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	DROPPED_PACKETS=uvm_reg_field::type_id::create("DROPPED_PACKETS");
     	DROPPED_PACKETS.configure(.parent(this),.size(16),.lsb_pos(0),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

        endfunction
endclass

class reg_switch_ctrl extends uvm_reg;
        `uvm_object_utils(reg_switch_ctrl)
        rand uvm_reg_field RESERVED;
        rand uvm_reg_field IRQ_GLOBAL_EN;
	rand uvm_reg_field RESERVED_2;
	rand uvm_reg_field STAT_CLEAR;
	rand uvm_reg_field ENABLE;
        covergroup switch_ctrl_cov;
        option.per_instance=1;
                sc_cp1:coverpoint RESERVED.value[27:0]{
                        bins val={[0:$]};
                }
                sc_cp2:coverpoint IRQ_GLOBAL_EN.value{
                        bins val1={[0:$]};
                }
		sc_cp3:coverpoint RESERVED_2.value{
                        bins val2={[0:$]};
                }
                sc_cp4:coverpoint STAT_CLEAR.value{
                        bins val3={[0:$]};
                }
		sc_cp5: coverpoint ENABLE.value[0:0]{
			bins val4={[0:$]};
		}



        endgroup

        function new(string name="reg_switch_ctrl");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        switch_ctrl_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                switch_ctrl_cov.sample();
        endfunction


        function void build();
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
        RESERVED.configure(.parent(this),.size(28),.lsb_pos(4),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

        IRQ_GLOBAL_EN=uvm_reg_field::type_id::create("IRQ_GLOBAL_EN");
        IRQ_GLOBAL_EN.configure(.parent(this),.size(1),.lsb_pos(3),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	
	RESERVED_2=uvm_reg_field::type_id::create("RESERVED_2");
        RESERVED_2.configure(.parent(this),.size(1),.lsb_pos(2),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	STAT_CLEAR=uvm_reg_field::type_id::create("STAT_CLEAR");
        STAT_CLEAR.configure(.parent(this),.size(1),.lsb_pos(1),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	ENABLE=uvm_reg_field::type_id::create("ENABLE");
	ENABLE.configure(.parent(this),.size(1),.lsb_pos(0),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));


        endfunction
endclass


class reg_port_enable extends uvm_reg;
        `uvm_object_utils(reg_port_enable)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field PORT3_EN;
	rand uvm_reg_field PORT2_EN;
	rand uvm_reg_field PORT1_EN;
	rand uvm_reg_field PORT0_EN;
        covergroup port_enable_cov;
        option.per_instance=1;
                pe_cp1: coverpoint RESERVED.value[27:0]{
                        bins val={[0:$]};
                }
                pe_cp2: coverpoint PORT3_EN.value[0:0]{
                        bins val={[0:$]};
                }
                pe_cp3: coverpoint PORT2_EN.value[0:0]{
                        bins val={[0:$]};
                }
                pe_cp4: coverpoint PORT1_EN.value[0:0]{
                        bins val={[0:$]};
                }
                pe_cp5: coverpoint PORT0_EN.value[0:0]{
                        bins val={[0:$]};
                }
        endgroup

        function new(string name="reg_port_enable");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        port_enable_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                port_enable_cov.sample();
        endfunction

        function void build();
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(28),.lsb_pos(4),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	PORT3_EN=uvm_reg_field::type_id::create("PORT3_EN");
     	PORT3_EN.configure(.parent(this),.size(1),.lsb_pos(3),.access("RW"),.volatile(0),.reset(1),.has_reset(1),.is_rand(1),.individually_accessible(1));

	PORT2_EN=uvm_reg_field::type_id::create("PORT2_EN");
        	PORT2_EN.configure(.parent(this),.size(1),.lsb_pos(2),.access("RW"),.volatile(0),.reset(1),.has_reset(1),.is_rand(1),.individually_accessible(1));
	
	PORT1_EN=uvm_reg_field::type_id::create("PORT1_EN");
        	PORT1_EN.configure(.parent(this),.size(1),.lsb_pos(1),.access("RW"),.volatile(0),.reset(1),.has_reset(1),.is_rand(1),.individually_accessible(1));

	PORT0_EN=uvm_reg_field::type_id::create("PORT0_EN");
        	PORT0_EN.configure(.parent(this),.size(1),.lsb_pos(0),.access("RW"),.volatile(0),.reset(1),.has_reset(1),.is_rand(1),.individually_accessible(1));
	
        endfunction
endclass


class reg_fwd_enable extends uvm_reg;
        `uvm_object_utils(reg_fwd_enable)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field FWD3_EN;
	rand uvm_reg_field FWD2_EN;
	rand uvm_reg_field FWD1_EN;
	rand uvm_reg_field FWD0_EN;
        covergroup fwd_enable_cov;
        option.per_instance=1;
                fe_cp1: coverpoint RESERVED.value[27:0]{
                        bins val={[0:$]};
                }
                fe_cp2: coverpoint FWD3_EN.value[0:0]{
                        bins val={[0:$]};
                }
                fe_cp3: coverpoint FWD2_EN.value[0:0]{
                        bins val={[0:$]};
                }
                fe_cp4: coverpoint FWD1_EN.value[0:0]{
                        bins val={[0:$]};
                }
                fe_cp5: coverpoint FWD0_EN.value[0:0]{
                        bins val={[0:$]};
                }
        endgroup

        function new(string name="reg_fwd_enable");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        fwd_enable_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                fwd_enable_cov.sample();
        endfunction

        function void build;
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(28),.lsb_pos(4),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	FWD3_EN=uvm_reg_field::type_id::create("FWD3_EN");
     	FWD3_EN.configure(.parent(this),.size(1),.lsb_pos(3),.access("RW"),.volatile(0),.reset(1),.has_reset(1),.is_rand(1),.individually_accessible(1));

	FWD2_EN=uvm_reg_field::type_id::create("FWD2_EN");
        	FWD2_EN.configure(.parent(this),.size(1),.lsb_pos(2),.access("RW"),.volatile(0),.reset(1),.has_reset(1),.is_rand(1),.individually_accessible(1));
	
	FWD1_EN=uvm_reg_field::type_id::create("FWD1_EN");
        	FWD1_EN.configure(.parent(this),.size(1),.lsb_pos(1),.access("RW"),.volatile(0),.reset(1),.has_reset(1),.is_rand(1),.individually_accessible(1));

	FWD0_EN=uvm_reg_field::type_id::create("FWD0_EN");
        	FWD0_EN.configure(.parent(this),.size(1),.lsb_pos(0),.access("RW"),.volatile(0),.reset(1),.has_reset(1),.is_rand(1),.individually_accessible(1));
	
	
        endfunction
endclass

class reg_gen_ctrl extends uvm_reg;
        `uvm_object_utils(reg_gen_ctrl)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field CONTINUOUS;
	rand uvm_reg_field STOP;
	rand uvm_reg_field START;
	rand uvm_reg_field ENABLE;
        covergroup gen_ctrl_cov;
        option.per_instance=1;
                gc_cp1: coverpoint RESERVED.value[27:0]{
                        bins val={[0:$]};
                }
                gc_cp2: coverpoint CONTINUOUS.value[0:0]{
                        bins val1={[0:$]};
                }
                gc_cp3: coverpoint STOP.value[0:0]{
                        bins val2={[0:$]};
                }
                gc_cp4: coverpoint START.value[0:0]{
                        bins val3={[0:$]};
                }
                gc_cp5: coverpoint ENABLE.value[0:0]{
                        bins val4={[0:$]};
                }
        endgroup

        function new(string name="reg_gen_ctrl");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        gen_ctrl_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                gen_ctrl_cov.sample();
        endfunction
        function void build;
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(28),.lsb_pos(4),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	CONTINUOUS=uvm_reg_field::type_id::create("CONTINUOUS");
     	CONTINUOUS.configure(.parent(this),.size(1),.lsb_pos(3),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	STOP=uvm_reg_field::type_id::create("STOP");
        	STOP.configure(.parent(this),.size(1),.lsb_pos(2),.access("WO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	
	START=uvm_reg_field::type_id::create("START");
        	START.configure(.parent(this),.size(1),.lsb_pos(1),.access("WO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	ENABLE=uvm_reg_field::type_id::create("ENABLE");
        	ENABLE.configure(.parent(this),.size(1),.lsb_pos(0),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	
        endfunction
endclass

class reg_gen_pkt_cfg extends uvm_reg;
        `uvm_object_utils(reg_gen_pkt_cfg)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field SEED;
	rand uvm_reg_field LENGTH;
	rand uvm_reg_field RESERVED_2;
	rand uvm_reg_field SRC_PORT;
	rand uvm_reg_field DST_PORT;
        covergroup gen_pkt_cfg_cov;
        option.per_instance=1;
                gp_cp1: coverpoint RESERVED.value[7:0]{
                        bins val={[0:$]};
                }
                gp_cp2: coverpoint SEED.value[7:0]{
                        bins val1={[0:$]};
                }
                gp_cp3: coverpoint LENGTH.value[7:0]{
                        bins val2={[0:$]};
                }
                gp_cp4: coverpoint RESERVED_2.value[3:0]{
                        bins val3={[0:$]};
                }
                gp_cp5: coverpoint SRC_PORT.value[1:0]{
                        bins val4={[0:$]};
                }
                gp_cp6: coverpoint DST_PORT.value[1:0]{
                        bins val5={[0:$]};
                }
        endgroup

        function new(string name="reg_gen_pkt_cfg");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        gen_pkt_cfg_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                gen_pkt_cfg_cov.sample();
        endfunction

        function void build();
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(8),.lsb_pos(24),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	SEED=uvm_reg_field::type_id::create("SEED");
     	SEED.configure(.parent(this),.size(8),.lsb_pos(16),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	LENGTH=uvm_reg_field::type_id::create("LENGTH");
        	LENGTH.configure(.parent(this),.size(8),.lsb_pos(8),.access("RW"),.volatile(0),.reset(4),.has_reset(1),.is_rand(1),.individually_accessible(1));
	
	RESERVED_2=uvm_reg_field::type_id::create("RESERVED_2");
        	RESERVED_2.configure(.parent(this),.size(4),.lsb_pos(4),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	SRC_PORT=uvm_reg_field::type_id::create("SRC_PORT");
        	SRC_PORT.configure(.parent(this),.size(2),.lsb_pos(2),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	
	DST_PORT=uvm_reg_field::type_id::create("DST_PORT");
        	DST_PORT.configure(.parent(this),.size(2),.lsb_pos(0),.access("RW"),.volatile(0),.reset(1),.has_reset(1),.is_rand(1),.individually_accessible(1));

        endfunction
endclass


class reg_gen_interval extends uvm_reg;
        `uvm_object_utils(reg_gen_interval)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field INTERVAL;
        covergroup gen_interval_cov;
        option.per_instance=1;
                gi_cp1: coverpoint RESERVED.value[15:0]{
                        bins val={[0:$]};
                }
                gi_cp2: coverpoint INTERVAL.value[15:0]{
                        bins val1={[0:$]};
                }
        endgroup

        function new(string name="reg_gen_interval");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        gen_interval_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                gen_interval_cov.sample();
        endfunction

        function void build();
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(16),.lsb_pos(16),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	INTERVAL=uvm_reg_field::type_id::create("INTERVAL");
     	INTERVAL.configure(.parent(this),.size(16),.lsb_pos(0),.access("RW"),.volatile(0),.reset(2),.has_reset(1),.is_rand(1),.individually_accessible(1));

        endfunction
endclass


class reg_gen_count extends uvm_reg;
        `uvm_object_utils(reg_gen_count)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field PACKET_COUNT;
	covergroup gen_count_cov;
        option.per_instance=1;
                gn_cp1: coverpoint RESERVED.value[15:0]{
                        bins val={[0:$]};
                }
                gn_cp2: coverpoint PACKET_COUNT.value[15:0]{
                        bins val1={[0:$]};
                }
        endgroup

        function new(string name="reg_gen_count");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        gen_count_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                gen_count_cov.sample();
        endfunction
        function void build;
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(16),.lsb_pos(16),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	PACKET_COUNT=uvm_reg_field::type_id::create("PACKET_COUNT");
     	PACKET_COUNT.configure(.parent(this),.size(16),.lsb_pos(0),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

        endfunction
endclass

class reg_irq_status extends uvm_reg;
        `uvm_object_utils(reg_irq_status)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field SW_EVENT;
	rand uvm_reg_field START_ACK;
	rand uvm_reg_field QUEUE_ALMOST_FULL;
	rand uvm_reg_field PACKET_FORWARDED;
	rand uvm_reg_field PACKET_DROPPED;
	rand uvm_reg_field QUEUE_OVERFLOW;
	rand uvm_reg_field ERROR;
	rand uvm_reg_field GEN_DONE;
        covergroup irq_status_cov;
        option.per_instance=1;
                is_cp1: coverpoint RESERVED.value[23:0]{
                        bins val={[0:$]};
                }
                is_cp2: coverpoint SW_EVENT.value[0:0]{
                        bins val1={[0:$]};
                }
                is_cp3: coverpoint START_ACK.value[0:0]{
                        bins val2={[0:$]};
                }
                is_cp4: coverpoint QUEUE_ALMOST_FULL.value[0:0]{
                        bins val3={[0:$]};
                }
                is_cp5: coverpoint PACKET_FORWARDED.value[0:0]{
                        bins val4={[0:$]};
                }
                is_cp6: coverpoint PACKET_DROPPED.value[0:0]{
                        bins val5={[0:$]};
                }
                is_cp7: coverpoint QUEUE_OVERFLOW.value[0:0]{
                        bins val6={[0:$]};
                }
                is_cp8: coverpoint ERROR.value[0:0]{
                        bins val7={[0:$]};
                }
                is_cp9: coverpoint GEN_DONE.value[0:0]{
                        bins val8={[0:$]};
                }
        endgroup

        function new(string name="reg_irq_status");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        irq_status_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                irq_status_cov.sample();
        endfunction


        function void build();
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(24),.lsb_pos(8),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	SW_EVENT=uvm_reg_field::type_id::create("SW_EVENT");
     	SW_EVENT.configure(.parent(this),.size(1),.lsb_pos(7),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	START_ACK=uvm_reg_field::type_id::create("START_ACK");
       	START_ACK.configure(.parent(this),.size(1),.lsb_pos(6),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	 QUEUE_ALMOST_FULL=uvm_reg_field::type_id::create("QUEUE_ALMOST_FULL");
       	QUEUE_ALMOST_FULL.configure(.parent(this),.size(1),.lsb_pos(5),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	PACKET_FORWARDED=uvm_reg_field::type_id::create("PACKET_FORWARDED");
     	PACKET_FORWARDED.configure(.parent(this),.size(1),.lsb_pos(4),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	PACKET_DROPPED=uvm_reg_field::type_id::create("PACKET_DROPPED");
       	PACKET_DROPPED.configure(.parent(this),.size(1),.lsb_pos(3),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	 QUEUE_OVERFLOW=uvm_reg_field::type_id::create("QUEUE_OVERFLOW");
       	QUEUE_OVERFLOW.configure(.parent(this),.size(1),.lsb_pos(2),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	ERROR=uvm_reg_field::type_id::create("ERROR");
     	ERROR.configure(.parent(this),.size(1),.lsb_pos(1),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	GEN_DONE=uvm_reg_field::type_id::create("GEN_DONE");
       	GEN_DONE.configure(.parent(this),.size(1),.lsb_pos(0),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));



        endfunction
endclass




class reg_irq_enable extends uvm_reg;
        `uvm_object_utils(reg_irq_enable)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field SW_EVENT_EN;
	rand uvm_reg_field START_ACK_EN;
	rand uvm_reg_field QUEUE_AF_EN;
	rand uvm_reg_field PACKET_FWD_EN;
	rand uvm_reg_field PACKET_DROP_EN;
	rand uvm_reg_field OVERFLOW_EN;
	rand uvm_reg_field ERROR_EN;
	rand uvm_reg_field GEN_DONE_EN;
        covergroup irq_enable_cov;
        option.per_instance=1;
                ie_cp1: coverpoint RESERVED.value[23:0]{
                        bins val={[0:$]};
                }
                ie_cp2: coverpoint SW_EVENT_EN.value[0:0]{
                        bins val1={[0:$]};
                }
                ie_cp3: coverpoint START_ACK_EN.value[0:0]{
                        bins val2={[0:$]};
                }
                ie_cp4: coverpoint QUEUE_AF_EN.value[0:0]{
                        bins val3={[0:$]};
                }
                ie_cp5: coverpoint PACKET_FWD_EN.value[0:0]{
                        bins val4={[0:$]};
                }
                ie_cp6: coverpoint PACKET_DROP_EN.value[0:0]{
                        bins val5={[0:$]};
                }
                ie_cp7: coverpoint OVERFLOW_EN.value[0:0]{
                        bins val6={[0:$]};
                }
                ie_cp8: coverpoint ERROR_EN.value[0:0]{
                        bins val7={[0:$]};
                }
                ie_cp9: coverpoint GEN_DONE_EN.value[0:0]{
                        bins val8={[0:$]};
                }
        endgroup

        function new(string name="reg_irq_enable");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        irq_enable_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                irq_enable_cov.sample();
        endfunction

        function void build();
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(24),.lsb_pos(8),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	SW_EVENT_EN=uvm_reg_field::type_id::create("SW_EVENT");
     	SW_EVENT_EN.configure(.parent(this),.size(1),.lsb_pos(7),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	START_ACK_EN=uvm_reg_field::type_id::create("START_ACK");
       	START_ACK_EN.configure(.parent(this),.size(1),.lsb_pos(6),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	 QUEUE_AF_EN=uvm_reg_field::type_id::create("QUEUE_ALMOST_FULL");
       	QUEUE_AF_EN.configure(.parent(this),.size(1),.lsb_pos(5),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	PACKET_FWD_EN=uvm_reg_field::type_id::create("PACKET_FORWARDED");
     	PACKET_FWD_EN.configure(.parent(this),.size(1),.lsb_pos(4),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	PACKET_DROP_EN=uvm_reg_field::type_id::create("PACKET_DROP_EN");
       	PACKET_DROP_EN.configure(.parent(this),.size(1),.lsb_pos(3),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	 OVERFLOW_EN=uvm_reg_field::type_id::create("OVERFLOW_EN");
       	OVERFLOW_EN.configure(.parent(this),.size(1),.lsb_pos(2),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	ERROR_EN=uvm_reg_field::type_id::create("ERROR_EN");
     	ERROR_EN.configure(.parent(this),.size(1),.lsb_pos(1),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	GEN_DONE_EN=uvm_reg_field::type_id::create("GEN_DONE_EN");
       	GEN_DONE_EN.configure(.parent(this),.size(1),.lsb_pos(0),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

        endfunction
endclass

class reg_irq_force extends uvm_reg;
        `uvm_object_utils(reg_irq_force)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field FORCE;
        covergroup irq_force_cov;
        option.per_instance=1;
                ifc_cp1: coverpoint RESERVED.value[23:0]{
                        bins val={[0:$]};
                }
                ifc_cp2: coverpoint FORCE.value[7:0]{
                        bins val1={[0:$]};
                }
        endgroup

        function new(string name="reg_irq_force");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        irq_force_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                irq_force_cov.sample();
        endfunction

        function void build();
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(24),.lsb_pos(8),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	FORCE=uvm_reg_field::type_id::create("FORCE");
     	FORCE.configure(.parent(this),.size(8),.lsb_pos(0),.access("WO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

        endfunction
endclass


class reg_err_status extends uvm_reg;
        `uvm_object_utils(reg_err_status)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field INJECTED;
	rand uvm_reg_field LENGTH_ERROR;
	rand uvm_reg_field CRC_ERROR;
	rand uvm_reg_field PROTOCOL_ERROR;
	rand uvm_reg_field UNDERSIZE;
	rand uvm_reg_field QUEUE_OVERFLOW;
	rand uvm_reg_field DEST_ERROR;
	rand uvm_reg_field BUS_ERROR;
        covergroup err_status_cov;
        option.per_instance=1;
                es_cp1: coverpoint RESERVED.value[23:0]{
                        bins val={[0:$]};
                }
                es_cp2: coverpoint INJECTED.value[0:0]{
                        bins val1={[0:$]};
                }
                es_cp3: coverpoint LENGTH_ERROR.value[0:0]{
                        bins val2={[0:$]};
                }
                es_cp4: coverpoint CRC_ERROR.value[0:0]{
                        bins val3={[0:$]};
                }
                es_cp5: coverpoint PROTOCOL_ERROR.value[0:0]{
                        bins val4={[0:$]};
                }
                es_cp6: coverpoint UNDERSIZE.value[0:0]{
                        bins val5={[0:$]};
                }
                es_cp7: coverpoint QUEUE_OVERFLOW.value[0:0]{
                        bins val6={[0:$]};
                }
                es_cp8: coverpoint DEST_ERROR.value[0:0]{
                        bins val7={[0:$]};
                }
                es_cp9: coverpoint BUS_ERROR.value[0:0]{
                        bins val8={[0:$]};
                }
        endgroup

        function new(string name="reg_err_status");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        err_status_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                err_status_cov.sample();
        endfunction


        function void build();
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(24),.lsb_pos(8),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	INJECTED=uvm_reg_field::type_id::create("INJECTED");
     	INJECTED.configure(.parent(this),.size(1),.lsb_pos(7),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	LENGTH_ERROR=uvm_reg_field::type_id::create("LENGTH_ERROR");
       	LENGTH_ERROR.configure(.parent(this),.size(1),.lsb_pos(6),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	 CRC_ERROR=uvm_reg_field::type_id::create("CRC_ERROR");
       	CRC_ERROR.configure(.parent(this),.size(1),.lsb_pos(5),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	PROTOCOL_ERROR=uvm_reg_field::type_id::create("PROTOCOL_ERROR");
     	PROTOCOL_ERROR.configure(.parent(this),.size(1),.lsb_pos(4),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	UNDERSIZE=uvm_reg_field::type_id::create("UNDERSIZE");
       	UNDERSIZE.configure(.parent(this),.size(1),.lsb_pos(3),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	 QUEUE_OVERFLOW=uvm_reg_field::type_id::create("QUEUE_OVERFLOW");
       	QUEUE_OVERFLOW.configure(.parent(this),.size(1),.lsb_pos(2),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	DEST_ERROR=uvm_reg_field::type_id::create("DEST_ERROR");
     	DEST_ERROR.configure(.parent(this),.size(1),.lsb_pos(1),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	BUS_ERROR=uvm_reg_field::type_id::create("BUS_ERROR");
       	BUS_ERROR.configure(.parent(this),.size(1),.lsb_pos(0),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

        endfunction
endclass


class reg_err_enable extends uvm_reg;
        `uvm_object_utils(reg_err_enable)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field INJECTED_EN;
	rand uvm_reg_field LENGTH_EN;
	rand uvm_reg_field CRC_EN;
	rand uvm_reg_field PROTOCOL_EN;
	rand uvm_reg_field UNDERSIZE_EN;
	rand uvm_reg_field OVERFLOW_EN;
	rand uvm_reg_field DEST_EN;
	rand uvm_reg_field BUS_EN;
        covergroup err_enable_cov;
        option.per_instance=1;
                ee_cp1: coverpoint RESERVED.value[23:0]{
                        bins val={[0:$]};
                }
                ee_cp2: coverpoint INJECTED_EN.value[0:0]{
                        bins val1={[0:$]};
                }
                ee_cp3: coverpoint LENGTH_EN.value[0:0]{
                        bins val2={[0:$]};
                }
                ee_cp4: coverpoint CRC_EN.value[0:0]{
                        bins val3={[0:$]};
                }
                ee_cp5: coverpoint PROTOCOL_EN.value[0:0]{
                        bins val4={[0:$]};
                }
                ee_cp6: coverpoint UNDERSIZE_EN.value[0:0]{
                        bins val5={[0:$]};
                }
                ee_cp7: coverpoint OVERFLOW_EN.value[0:0]{
                        bins val6={[0:$]};
                }
                ee_cp8: coverpoint DEST_EN.value[0:0]{
                        bins val7={[0:$]};
                }
                ee_cp9: coverpoint BUS_EN.value[0:0]{
                        bins val8={[0:$]};
                }
        endgroup

        function new(string name="reg_err_enable");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        err_enable_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                err_enable_cov.sample();
        endfunction
        function void build();
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(24),.lsb_pos(8),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	INJECTED_EN=uvm_reg_field::type_id::create("INJECTED_EN");
     	INJECTED_EN.configure(.parent(this),.size(1),.lsb_pos(7),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	LENGTH_EN=uvm_reg_field::type_id::create("LENGTH_EN");
       	LENGTH_EN.configure(.parent(this),.size(1),.lsb_pos(6),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	 CRC_EN=uvm_reg_field::type_id::create("CRC_EN");
       	CRC_EN.configure(.parent(this),.size(1),.lsb_pos(5),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	PROTOCOL_EN=uvm_reg_field::type_id::create("PROTOCOL_EN");
     	PROTOCOL_EN.configure(.parent(this),.size(1),.lsb_pos(4),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	UNDERSIZE_EN=uvm_reg_field::type_id::create("UNDERSIZE_EN");
       	UNDERSIZE_EN.configure(.parent(this),.size(1),.lsb_pos(3),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	 OVERFLOW_EN=uvm_reg_field::type_id::create("OVERFLOW_EN");
       	OVERFLOW_EN.configure(.parent(this),.size(1),.lsb_pos(2),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	DEST_EN=uvm_reg_field::type_id::create("DEST_EN");
     	DEST_EN.configure(.parent(this),.size(1),.lsb_pos(1),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	BUS_EN=uvm_reg_field::type_id::create("BUS_EN");
       	BUS_EN.configure(.parent(this),.size(1),.lsb_pos(0),.access("RW"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

        endfunction
endclass


class reg_err_inject extends uvm_reg;
        `uvm_object_utils(reg_err_inject)
        rand uvm_reg_field CLEAR_COUNT;
	rand uvm_reg_field RESERVED;
	rand uvm_reg_field INJECTED;
	rand uvm_reg_field LENGTH;
	rand uvm_reg_field CRC;
	rand uvm_reg_field PROTOCOL;
	rand uvm_reg_field UNDERSIZE;
	rand uvm_reg_field OVERFLOW;
	rand uvm_reg_field DEST;
	rand uvm_reg_field BUS;
        covergroup err_inject_cov;
        option.per_instance=1;
                ei_cp1: coverpoint CLEAR_COUNT.value[0:0]{
                        bins val1={[0:$]};
                }
                ei_cp2: coverpoint RESERVED.value[22:0]{
                        bins val2={[0:$]};
                }
                ei_cp3: coverpoint INJECTED.value[0:0]{
                        bins val3={[0:$]};
                }
                ei_cp4: coverpoint LENGTH.value[0:0]{
                        bins val4={[0:$]};
                }
                ei_cp5: coverpoint CRC.value[0:0]{
                        bins val5={[0:$]};
                }
                ei_cp6: coverpoint PROTOCOL.value[0:0]{
                        bins val6={[0:$]};
                }
                ei_cp7: coverpoint UNDERSIZE.value[0:0]{
                        bins val7={[0:$]};
                }
                ei_cp8: coverpoint OVERFLOW.value[0:0]{
                        bins val8={[0:$]};
                }
                ei_cp9: coverpoint DEST.value[0:0]{
                        bins val9={[0:$]};
                }
                ei_cp10: coverpoint BUS.value[0:0]{
                        bins val10={[0:$]};
                }
        endgroup

        function new(string name="reg_err_inject");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        err_inject_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                err_inject_cov.sample();
        endfunction


        function void build();
                CLEAR_COUNT=uvm_reg_field::type_id::create("CLEAR_COUNT");
       	CLEAR_COUNT.configure(.parent(this),.size(1),.lsb_pos(31),.access("WO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	RESERVED=uvm_reg_field::type_id::create("RESERVED");
     	RESERVED.configure(.parent(this),.size(23),.lsb_pos(8),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	INJECTED=uvm_reg_field::type_id::create("INJECTED");
       	INJECTED.configure(.parent(this),.size(1),.lsb_pos(7),.access("WO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	 LENGTH=uvm_reg_field::type_id::create("LENGTH");
       	LENGTH.configure(.parent(this),.size(1),.lsb_pos(6),.access("WO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	CRC=uvm_reg_field::type_id::create("CRC");
     	CRC.configure(.parent(this),.size(1),.lsb_pos(5),.access("WO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	CRC=uvm_reg_field::type_id::create("CRC");
	PROTOCOL=uvm_reg_field::type_id::create("PROTOCOL");
       	PROTOCOL.configure(.parent(this),.size(1),.lsb_pos(4),.access("WO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	 UNDERSIZE=uvm_reg_field::type_id::create("UNDERSIZE");
       	UNDERSIZE.configure(.parent(this),.size(1),.lsb_pos(3),.access("WO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	OVERFLOW=uvm_reg_field::type_id::create("OVERFLOW");
     	OVERFLOW.configure(.parent(this),.size(1),.lsb_pos(2),.access("WO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	DEST=uvm_reg_field::type_id::create("DEST");
       	DEST.configure(.parent(this),.size(1),.lsb_pos(1),.access("WO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	
	BUS=uvm_reg_field::type_id::create("BUS");
       	BUS.configure(.parent(this),.size(1),.lsb_pos(0),.access("WO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

        endfunction
endclass

class reg_err_count extends uvm_reg;
        `uvm_object_utils(reg_err_count)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field ERROR_COUNT;
        covergroup err_count_cov;
        option.per_instance=1;
                ec_cp1: coverpoint RESERVED.value[15:0]{
                        bins val={[0:$]};
                }
                ec_cp2: coverpoint ERROR_COUNT.value[15:0]{
                        bins val1={[0:$]};
                }
        endgroup

        function new(string name="reg_err_count");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        err_count_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                err_count_cov.sample();
        endfunction

        function void build();
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(16),.lsb_pos(16),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	ERROR_COUNT=uvm_reg_field::type_id::create("ERROR_COUNT");
     	ERROR_COUNT.configure(.parent(this),.size(16),.lsb_pos(0),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

        endfunction
endclass


class reg_err_info extends uvm_reg;
        `uvm_object_utils(reg_err_info)
        rand uvm_reg_field TX_SNAPSHOT;
	rand uvm_reg_field RESERVED;
	rand uvm_reg_field DEST_PORT;
	rand uvm_reg_field SOURCE;
	rand uvm_reg_field LAST_CODE;
        covergroup err_info_cov;
        option.per_instance=1;
                eif_cp1: coverpoint TX_SNAPSHOT.value[11:0]{
                        bins val={[0:$]};
                }
                eif_cp2: coverpoint RESERVED.value[1:0]{
                        bins val1={[0:$]};
                }
                eif_cp3: coverpoint DEST_PORT.value[1:0]{
                        bins val2={[0:$]};
                }
                eif_cp4: coverpoint SOURCE.value[7:0]{
                        bins val3={[0:$]};
                }
                eif_cp5: coverpoint LAST_CODE.value[7:0]{
                        bins val4={[0:$]};
                }
        endgroup

        function new(string name="reg_err_info");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        err_info_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                err_info_cov.sample();
        endfunction

        function void build();
                TX_SNAPSHOT=uvm_reg_field::type_id::create("TX_SNAPSHOT");
       	TX_SNAPSHOT.configure(.parent(this),.size(12),.lsb_pos(20),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	RESERVED=uvm_reg_field::type_id::create("RESERVED");
     	RESERVED.configure(.parent(this),.size(2),.lsb_pos(18),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	DEST_PORT=uvm_reg_field::type_id::create("DEST_PORT");
     	DEST_PORT.configure(.parent(this),.size(2),.lsb_pos(16),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	
	SOURCE=uvm_reg_field::type_id::create("SOURCE");
     	SOURCE.configure(.parent(this),.size(8),.lsb_pos(8),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));
	LAST_CODE=uvm_reg_field::type_id::create("LAST_CODE");
     	LAST_CODE.configure(.parent(this),.size(8),.lsb_pos(0),.access("RO"),.volatile(1),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

        endfunction
endclass

class reg_lock extends uvm_reg;
        `uvm_object_utils(reg_lock)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field LOCKED;
        covergroup lock_cov;
        option.per_instance=1;
                l_cp1: coverpoint RESERVED.value[30:0]{
                        bins val={[0:$]};
                }
                l_cp2: coverpoint LOCKED.value[0:0]{
                        bins val1={[0:$]};
                }
        endgroup

        function new(string name="reg_lock");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        lock_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                lock_cov.sample();
        endfunction

        function void build();
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(31),.lsb_pos(1),.access("WO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	LOCKED=uvm_reg_field::type_id::create("LOCKED");
     	LOCKED.configure(.parent(this),.size(1),.lsb_pos(0),.access("RO"),.volatile(0),.reset(1),.has_reset(1),.is_rand(1),.individually_accessible(1));

        endfunction
endclass

class reg_soft_reset extends uvm_reg;
        `uvm_object_utils(reg_soft_reset)
        rand uvm_reg_field RESERVED;
	rand uvm_reg_field PULSE;
        covergroup soft_reset_cov;
        option.per_instance=1;
                sr_cp1: coverpoint RESERVED.value[30:0]{
                        bins val={[0:$]};
                }
                sr_cp2: coverpoint PULSE.value[0:0]{
                        bins val1={[0:$]};
                }
        endgroup

        function new(string name="reg_soft_reset");
                super.new(name,32,UVM_CVR_FIELD_VALS);
                if(has_coverage(UVM_CVR_FIELD_VALS))
                        soft_reset_cov=new();

        endfunction
        virtual function void sample(uvm_reg_data_t data, uvm_reg_data_t byte_en, bit is_read, uvm_reg_map map);
                sample_values();
        endfunction
        virtual function void sample_values();
                super.sample_values();
                soft_reset_cov.sample();
        endfunction

        function void build();
                RESERVED=uvm_reg_field::type_id::create("RESERVED");
       	RESERVED.configure(.parent(this),.size(31),.lsb_pos(1),.access("RO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

	PULSE=uvm_reg_field::type_id::create("PULSE");
     	PULSE.configure(.parent(this),.size(1),.lsb_pos(0),.access("WO"),.volatile(0),.reset(0),.has_reset(1),.is_rand(1),.individually_accessible(1));

        endfunction
endclass








