

module test
(

);

  reg CLK;
  reg RST;
  wire [32-1:0] maxi_awaddr;
  wire [8-1:0] maxi_awlen;
  wire [3-1:0] maxi_awsize;
  wire [2-1:0] maxi_awburst;
  wire [1-1:0] maxi_awlock;
  wire [4-1:0] maxi_awcache;
  wire [3-1:0] maxi_awprot;
  wire [4-1:0] maxi_awqos;
  wire [2-1:0] maxi_awuser;
  wire maxi_awvalid;
  reg maxi_awready;
  wire [32-1:0] maxi_wdata;
  wire [4-1:0] maxi_wstrb;
  wire maxi_wlast;
  wire maxi_wvalid;
  reg maxi_wready;
  reg [2-1:0] maxi_bresp;
  reg maxi_bvalid;
  wire maxi_bready;
  wire [32-1:0] maxi_araddr;
  wire [8-1:0] maxi_arlen;
  wire [3-1:0] maxi_arsize;
  wire [2-1:0] maxi_arburst;
  wire [1-1:0] maxi_arlock;
  wire [4-1:0] maxi_arcache;
  wire [3-1:0] maxi_arprot;
  wire [4-1:0] maxi_arqos;
  wire [2-1:0] maxi_aruser;
  wire maxi_arvalid;
  reg maxi_arready;
  reg [32-1:0] maxi_rdata;
  reg [2-1:0] maxi_rresp;
  reg maxi_rlast;
  reg maxi_rvalid;
  wire maxi_rready;
  reg [32-1:0] saxi_awaddr;
  reg [4-1:0] saxi_awcache;
  reg [3-1:0] saxi_awprot;
  reg saxi_awvalid;
  wire saxi_awready;
  reg [32-1:0] saxi_wdata;
  reg [4-1:0] saxi_wstrb;
  reg saxi_wvalid;
  wire saxi_wready;
  wire [2-1:0] saxi_bresp;
  wire saxi_bvalid;
  reg saxi_bready;
  reg [32-1:0] saxi_araddr;
  reg [4-1:0] saxi_arcache;
  reg [3-1:0] saxi_arprot;
  reg saxi_arvalid;
  wire saxi_arready;
  wire [32-1:0] saxi_rdata;
  wire [2-1:0] saxi_rresp;
  wire saxi_rvalid;
  reg saxi_rready;
  wire [32-1:0] memory_awaddr;
  wire [8-1:0] memory_awlen;
  wire [3-1:0] memory_awsize;
  wire [2-1:0] memory_awburst;
  wire [1-1:0] memory_awlock;
  wire [4-1:0] memory_awcache;
  wire [3-1:0] memory_awprot;
  wire [4-1:0] memory_awqos;
  wire [2-1:0] memory_awuser;
  wire memory_awvalid;
  reg memory_awready;
  wire [32-1:0] memory_wdata;
  wire [4-1:0] memory_wstrb;
  wire memory_wlast;
  wire memory_wvalid;
  reg memory_wready;
  wire [2-1:0] memory_bresp;
  reg memory_bvalid;
  wire memory_bready;
  wire [32-1:0] memory_araddr;
  wire [8-1:0] memory_arlen;
  wire [3-1:0] memory_arsize;
  wire [2-1:0] memory_arburst;
  wire [1-1:0] memory_arlock;
  wire [4-1:0] memory_arcache;
  wire [3-1:0] memory_arprot;
  wire [4-1:0] memory_arqos;
  wire [2-1:0] memory_aruser;
  wire memory_arvalid;
  reg memory_arready;
  reg [32-1:0] memory_rdata;
  wire [2-1:0] memory_rresp;
  reg memory_rlast;
  reg memory_rvalid;
  wire memory_rready;
  assign memory_bresp = 0;
  assign memory_rresp = 0;
  reg [32-1:0] _memory_waddr_fsm;
  localparam _memory_waddr_fsm_init = 0;
  reg [32-1:0] _memory_wdata_fsm;
  localparam _memory_wdata_fsm_init = 0;
  reg [32-1:0] _memory_raddr_fsm;
  localparam _memory_raddr_fsm_init = 0;
  reg [32-1:0] _memory_rdata_fsm;
  localparam _memory_rdata_fsm_init = 0;
  wire _memory_wreq_fifo_enq;
  wire [41-1:0] _memory_wreq_fifo_wdata;
  wire _memory_wreq_fifo_full;
  wire _memory_wreq_fifo_almost_full;
  wire _memory_wreq_fifo_deq;
  wire [41-1:0] _memory_wreq_fifo_rdata;
  wire _memory_wreq_fifo_empty;
  wire _memory_wreq_fifo_almost_empty;

  _memory_wreq_fifo
  inst__memory_wreq_fifo
  (
    .CLK(CLK),
    .RST(RST),
    ._memory_wreq_fifo_enq(_memory_wreq_fifo_enq),
    ._memory_wreq_fifo_wdata(_memory_wreq_fifo_wdata),
    ._memory_wreq_fifo_full(_memory_wreq_fifo_full),
    ._memory_wreq_fifo_almost_full(_memory_wreq_fifo_almost_full),
    ._memory_wreq_fifo_deq(_memory_wreq_fifo_deq),
    ._memory_wreq_fifo_rdata(_memory_wreq_fifo_rdata),
    ._memory_wreq_fifo_empty(_memory_wreq_fifo_empty),
    ._memory_wreq_fifo_almost_empty(_memory_wreq_fifo_almost_empty)
  );

  reg [4-1:0] count__memory_wreq_fifo;
  wire _memory_rreq_fifo_enq;
  wire [41-1:0] _memory_rreq_fifo_wdata;
  wire _memory_rreq_fifo_full;
  wire _memory_rreq_fifo_almost_full;
  wire _memory_rreq_fifo_deq;
  wire [41-1:0] _memory_rreq_fifo_rdata;
  wire _memory_rreq_fifo_empty;
  wire _memory_rreq_fifo_almost_empty;

  _memory_rreq_fifo
  inst__memory_rreq_fifo
  (
    .CLK(CLK),
    .RST(RST),
    ._memory_rreq_fifo_enq(_memory_rreq_fifo_enq),
    ._memory_rreq_fifo_wdata(_memory_rreq_fifo_wdata),
    ._memory_rreq_fifo_full(_memory_rreq_fifo_full),
    ._memory_rreq_fifo_almost_full(_memory_rreq_fifo_almost_full),
    ._memory_rreq_fifo_deq(_memory_rreq_fifo_deq),
    ._memory_rreq_fifo_rdata(_memory_rreq_fifo_rdata),
    ._memory_rreq_fifo_empty(_memory_rreq_fifo_empty),
    ._memory_rreq_fifo_almost_empty(_memory_rreq_fifo_almost_empty)
  );

  reg [4-1:0] count__memory_rreq_fifo;
  reg [8-1:0] _memory_mem [0:2**20-1];

  initial begin
    $readmemh("memimg_GEMM_multicore_2_multi_ram_szie4.out", _memory_mem);
  end

  reg [33-1:0] _write_count;
  reg [32-1:0] _write_addr;
  reg [33-1:0] _read_count;
  reg [32-1:0] _read_addr;
  wire [32-1:0] pack_write_req_global_addr_0;
  wire [9-1:0] pack_write_req_size_1;
  assign pack_write_req_global_addr_0 = memory_awaddr;
  assign pack_write_req_size_1 = memory_awlen + 1;
  wire [41-1:0] pack_write_req_packed_2;
  assign pack_write_req_packed_2 = { pack_write_req_global_addr_0, pack_write_req_size_1 };
  assign _memory_wreq_fifo_wdata = ((_memory_waddr_fsm == 1) && memory_awvalid && memory_awready)? pack_write_req_packed_2 : 'hx;
  assign _memory_wreq_fifo_enq = ((_memory_waddr_fsm == 1) && memory_awvalid && memory_awready)? (_memory_waddr_fsm == 1) && memory_awvalid && memory_awready && !_memory_wreq_fifo_almost_full : 0;
  localparam _tmp_3 = 1;
  wire [_tmp_3-1:0] _tmp_4;
  assign _tmp_4 = !_memory_wreq_fifo_almost_full;
  reg [_tmp_3-1:0] __tmp_4_1;
  wire [32-1:0] unpack_write_req_global_addr_5;
  wire [9-1:0] unpack_write_req_size_6;
  assign unpack_write_req_global_addr_5 = _memory_wreq_fifo_rdata[40:9];
  assign unpack_write_req_size_6 = _memory_wreq_fifo_rdata[8:0];
  assign _memory_wreq_fifo_deq = ((_memory_wdata_fsm == 0) && !_memory_wreq_fifo_empty && !_memory_wreq_fifo_empty)? 1 : 0;
  wire [32-1:0] pack_read_req_global_addr_7;
  wire [9-1:0] pack_read_req_size_8;
  assign pack_read_req_global_addr_7 = memory_araddr;
  assign pack_read_req_size_8 = memory_arlen + 1;
  wire [41-1:0] pack_read_req_packed_9;
  assign pack_read_req_packed_9 = { pack_read_req_global_addr_7, pack_read_req_size_8 };
  assign _memory_rreq_fifo_wdata = ((_memory_raddr_fsm == 1) && memory_arvalid && memory_arready)? pack_read_req_packed_9 : 'hx;
  assign _memory_rreq_fifo_enq = ((_memory_raddr_fsm == 1) && memory_arvalid && memory_arready)? (_memory_raddr_fsm == 1) && memory_arvalid && memory_arready && !_memory_rreq_fifo_almost_full : 0;
  localparam _tmp_10 = 1;
  wire [_tmp_10-1:0] _tmp_11;
  assign _tmp_11 = !_memory_rreq_fifo_almost_full;
  reg [_tmp_10-1:0] __tmp_11_1;
  wire [32-1:0] unpack_read_req_global_addr_12;
  wire [9-1:0] unpack_read_req_size_13;
  assign unpack_read_req_global_addr_12 = _memory_rreq_fifo_rdata[40:9];
  assign unpack_read_req_size_13 = _memory_rreq_fifo_rdata[8:0];
  assign _memory_rreq_fifo_deq = ((_memory_rdata_fsm == 0) && !_memory_rreq_fifo_empty && !_memory_rreq_fifo_empty)? 1 : 0;
  reg [32-1:0] _d1__memory_rdata_fsm;
  reg __memory_rdata_fsm_cond_1_0_1;
  assign memory_awaddr = maxi_awaddr;
  assign memory_awlen = maxi_awlen;
  assign memory_awsize = maxi_awsize;
  assign memory_awburst = maxi_awburst;
  assign memory_awlock = maxi_awlock;
  assign memory_awcache = maxi_awcache;
  assign memory_awprot = maxi_awprot;
  assign memory_awqos = maxi_awqos;
  assign memory_awuser = maxi_awuser;
  assign memory_awvalid = maxi_awvalid;
  wire _tmp_14;
  assign _tmp_14 = memory_awready;

  always @(*) begin
    maxi_awready = _tmp_14;
  end

  assign memory_wdata = maxi_wdata;
  assign memory_wstrb = maxi_wstrb;
  assign memory_wlast = maxi_wlast;
  assign memory_wvalid = maxi_wvalid;
  wire _tmp_15;
  assign _tmp_15 = memory_wready;

  always @(*) begin
    maxi_wready = _tmp_15;
  end

  wire [2-1:0] _tmp_16;
  assign _tmp_16 = memory_bresp;

  always @(*) begin
    maxi_bresp = _tmp_16;
  end

  wire _tmp_17;
  assign _tmp_17 = memory_bvalid;

  always @(*) begin
    maxi_bvalid = _tmp_17;
  end

  assign memory_bready = maxi_bready;
  assign memory_araddr = maxi_araddr;
  assign memory_arlen = maxi_arlen;
  assign memory_arsize = maxi_arsize;
  assign memory_arburst = maxi_arburst;
  assign memory_arlock = maxi_arlock;
  assign memory_arcache = maxi_arcache;
  assign memory_arprot = maxi_arprot;
  assign memory_arqos = maxi_arqos;
  assign memory_aruser = maxi_aruser;
  assign memory_arvalid = maxi_arvalid;
  wire _tmp_18;
  assign _tmp_18 = memory_arready;

  always @(*) begin
    maxi_arready = _tmp_18;
  end

  wire [32-1:0] _tmp_19;
  assign _tmp_19 = memory_rdata;

  always @(*) begin
    maxi_rdata = _tmp_19;
  end

  wire [2-1:0] _tmp_20;
  assign _tmp_20 = memory_rresp;

  always @(*) begin
    maxi_rresp = _tmp_20;
  end

  wire _tmp_21;
  assign _tmp_21 = memory_rlast;

  always @(*) begin
    maxi_rlast = _tmp_21;
  end

  wire _tmp_22;
  assign _tmp_22 = memory_rvalid;

  always @(*) begin
    maxi_rvalid = _tmp_22;
  end

  assign memory_rready = maxi_rready;
  reg [32-1:0] _saxi_awaddr;
  wire [4-1:0] _saxi_awcache;
  wire [3-1:0] _saxi_awprot;
  reg _saxi_awvalid;
  wire _saxi_awready;
  reg [32-1:0] _saxi_wdata;
  reg [4-1:0] _saxi_wstrb;
  reg _saxi_wvalid;
  wire _saxi_wready;
  wire [2-1:0] _saxi_bresp;
  wire _saxi_bvalid;
  wire _saxi_bready;
  reg [32-1:0] _saxi_araddr;
  wire [4-1:0] _saxi_arcache;
  wire [3-1:0] _saxi_arprot;
  reg _saxi_arvalid;
  wire _saxi_arready;
  wire [32-1:0] _saxi_rdata;
  wire [2-1:0] _saxi_rresp;
  wire _saxi_rvalid;
  wire _saxi_rready;
  assign _saxi_awcache = 3;
  assign _saxi_awprot = 0;
  assign _saxi_bready = 1;
  assign _saxi_arcache = 3;
  assign _saxi_arprot = 0;
  reg [3-1:0] outstanding_wcount_23;
  wire [32-1:0] _tmp_24;
  assign _tmp_24 = _saxi_awaddr;

  always @(*) begin
    saxi_awaddr = _tmp_24;
  end

  wire [4-1:0] _tmp_25;
  assign _tmp_25 = _saxi_awcache;

  always @(*) begin
    saxi_awcache = _tmp_25;
  end

  wire [3-1:0] _tmp_26;
  assign _tmp_26 = _saxi_awprot;

  always @(*) begin
    saxi_awprot = _tmp_26;
  end

  wire _tmp_27;
  assign _tmp_27 = _saxi_awvalid;

  always @(*) begin
    saxi_awvalid = _tmp_27;
  end

  assign _saxi_awready = saxi_awready;
  wire [32-1:0] _tmp_28;
  assign _tmp_28 = _saxi_wdata;

  always @(*) begin
    saxi_wdata = _tmp_28;
  end

  wire [4-1:0] _tmp_29;
  assign _tmp_29 = _saxi_wstrb;

  always @(*) begin
    saxi_wstrb = _tmp_29;
  end

  wire _tmp_30;
  assign _tmp_30 = _saxi_wvalid;

  always @(*) begin
    saxi_wvalid = _tmp_30;
  end

  assign _saxi_wready = saxi_wready;
  assign _saxi_bresp = saxi_bresp;
  assign _saxi_bvalid = saxi_bvalid;
  wire _tmp_31;
  assign _tmp_31 = _saxi_bready;

  always @(*) begin
    saxi_bready = _tmp_31;
  end

  wire [32-1:0] _tmp_32;
  assign _tmp_32 = _saxi_araddr;

  always @(*) begin
    saxi_araddr = _tmp_32;
  end

  wire [4-1:0] _tmp_33;
  assign _tmp_33 = _saxi_arcache;

  always @(*) begin
    saxi_arcache = _tmp_33;
  end

  wire [3-1:0] _tmp_34;
  assign _tmp_34 = _saxi_arprot;

  always @(*) begin
    saxi_arprot = _tmp_34;
  end

  wire _tmp_35;
  assign _tmp_35 = _saxi_arvalid;

  always @(*) begin
    saxi_arvalid = _tmp_35;
  end

  assign _saxi_arready = saxi_arready;
  assign _saxi_rdata = saxi_rdata;
  assign _saxi_rresp = saxi_rresp;
  assign _saxi_rvalid = saxi_rvalid;
  wire _tmp_36;
  assign _tmp_36 = _saxi_rready;

  always @(*) begin
    saxi_rready = _tmp_36;
  end

  reg [32-1:0] counter;
  reg [32-1:0] th_ctrl;
  localparam th_ctrl_init = 0;
  reg signed [32-1:0] _th_ctrl_i_16;
  reg signed [32-1:0] _th_ctrl_awaddr_17;
  reg __saxi_cond_0_1;
  reg __saxi_cond_1_1;
  reg __saxi_cond_2_1;
  reg __saxi_cond_3_1;
  reg __saxi_cond_4_1;
  reg __saxi_cond_5_1;
  reg __saxi_cond_6_1;
  reg __saxi_cond_7_1;
  reg signed [32-1:0] _th_ctrl_start_time_18;
  reg __saxi_cond_8_1;
  reg __saxi_cond_9_1;
  reg signed [32-1:0] _th_ctrl_araddr_19;
  reg __saxi_cond_10_1;
  reg signed [32-1:0] axim_rdata_37;
  assign _saxi_rready = th_ctrl == 34;
  reg signed [32-1:0] _th_ctrl_busy_20;
  reg signed [32-1:0] _th_ctrl_end_time_21;
  reg signed [32-1:0] _th_ctrl_time_22;
  reg signed [32-1:0] _th_ctrl_all_ok_23;
  reg signed [32-1:0] rdata_38;
  reg signed [32-1:0] _th_ctrl_v_24;
  reg signed [32-1:0] _th_ctrl_y_25;
  reg signed [32-1:0] _th_ctrl_x_26;
  reg signed [32-1:0] rdata_39;

  blinkled
  uut
  (
    .CLK(CLK),
    .RST(RST),
    .maxi_awaddr(maxi_awaddr),
    .maxi_awlen(maxi_awlen),
    .maxi_awsize(maxi_awsize),
    .maxi_awburst(maxi_awburst),
    .maxi_awlock(maxi_awlock),
    .maxi_awcache(maxi_awcache),
    .maxi_awprot(maxi_awprot),
    .maxi_awqos(maxi_awqos),
    .maxi_awuser(maxi_awuser),
    .maxi_awvalid(maxi_awvalid),
    .maxi_awready(maxi_awready),
    .maxi_wdata(maxi_wdata),
    .maxi_wstrb(maxi_wstrb),
    .maxi_wlast(maxi_wlast),
    .maxi_wvalid(maxi_wvalid),
    .maxi_wready(maxi_wready),
    .maxi_bresp(maxi_bresp),
    .maxi_bvalid(maxi_bvalid),
    .maxi_bready(maxi_bready),
    .maxi_araddr(maxi_araddr),
    .maxi_arlen(maxi_arlen),
    .maxi_arsize(maxi_arsize),
    .maxi_arburst(maxi_arburst),
    .maxi_arlock(maxi_arlock),
    .maxi_arcache(maxi_arcache),
    .maxi_arprot(maxi_arprot),
    .maxi_arqos(maxi_arqos),
    .maxi_aruser(maxi_aruser),
    .maxi_arvalid(maxi_arvalid),
    .maxi_arready(maxi_arready),
    .maxi_rdata(maxi_rdata),
    .maxi_rresp(maxi_rresp),
    .maxi_rlast(maxi_rlast),
    .maxi_rvalid(maxi_rvalid),
    .maxi_rready(maxi_rready),
    .saxi_awaddr(saxi_awaddr),
    .saxi_awcache(saxi_awcache),
    .saxi_awprot(saxi_awprot),
    .saxi_awvalid(saxi_awvalid),
    .saxi_awready(saxi_awready),
    .saxi_wdata(saxi_wdata),
    .saxi_wstrb(saxi_wstrb),
    .saxi_wvalid(saxi_wvalid),
    .saxi_wready(saxi_wready),
    .saxi_bresp(saxi_bresp),
    .saxi_bvalid(saxi_bvalid),
    .saxi_bready(saxi_bready),
    .saxi_araddr(saxi_araddr),
    .saxi_arcache(saxi_arcache),
    .saxi_arprot(saxi_arprot),
    .saxi_arvalid(saxi_arvalid),
    .saxi_arready(saxi_arready),
    .saxi_rdata(saxi_rdata),
    .saxi_rresp(saxi_rresp),
    .saxi_rvalid(saxi_rvalid),
    .saxi_rready(saxi_rready)
  );


  initial begin
    $dumpfile("uut.vcd");
    $dumpvars(0, uut);
  end


  initial begin
    CLK = 0;
    forever begin
      #5 CLK = !CLK;
    end
  end


  initial begin
    RST = 0;
    memory_awready = 0;
    memory_wready = 0;
    memory_bvalid = 0;
    memory_arready = 0;
    memory_rdata = 0;
    memory_rlast = 0;
    memory_rvalid = 0;
    _memory_waddr_fsm = _memory_waddr_fsm_init;
    _memory_wdata_fsm = _memory_wdata_fsm_init;
    _memory_raddr_fsm = _memory_raddr_fsm_init;
    _memory_rdata_fsm = _memory_rdata_fsm_init;
    count__memory_wreq_fifo = 0;
    count__memory_rreq_fifo = 0;
    _write_count = 0;
    _write_addr = 0;
    _read_count = 0;
    _read_addr = 0;
    __tmp_4_1 = 0;
    __tmp_11_1 = 0;
    _d1__memory_rdata_fsm = _memory_rdata_fsm_init;
    __memory_rdata_fsm_cond_1_0_1 = 0;
    _saxi_awaddr = 0;
    _saxi_awvalid = 0;
    _saxi_wdata = 0;
    _saxi_wstrb = 0;
    _saxi_wvalid = 0;
    _saxi_araddr = 0;
    _saxi_arvalid = 0;
    outstanding_wcount_23 = 0;
    counter = 0;
    th_ctrl = th_ctrl_init;
    _th_ctrl_i_16 = 0;
    _th_ctrl_awaddr_17 = 0;
    __saxi_cond_0_1 = 0;
    __saxi_cond_1_1 = 0;
    __saxi_cond_2_1 = 0;
    __saxi_cond_3_1 = 0;
    __saxi_cond_4_1 = 0;
    __saxi_cond_5_1 = 0;
    __saxi_cond_6_1 = 0;
    __saxi_cond_7_1 = 0;
    _th_ctrl_start_time_18 = 0;
    __saxi_cond_8_1 = 0;
    __saxi_cond_9_1 = 0;
    _th_ctrl_araddr_19 = 0;
    __saxi_cond_10_1 = 0;
    axim_rdata_37 = 0;
    _th_ctrl_busy_20 = 0;
    _th_ctrl_end_time_21 = 0;
    _th_ctrl_time_22 = 0;
    _th_ctrl_all_ok_23 = 0;
    rdata_38 = 0;
    _th_ctrl_v_24 = 0;
    _th_ctrl_y_25 = 0;
    _th_ctrl_x_26 = 0;
    rdata_39 = 0;
    #100;
    RST = 1;
    #100;
    RST = 0;
    #1000000;
    $finish;
  end


  always @(posedge CLK) begin
    if((_memory_wdata_fsm == 1) && memory_wvalid && memory_wready && memory_wstrb[0]) begin
      _memory_mem[_write_addr + 0] <= memory_wdata[7:0];
    end 
    if((_memory_wdata_fsm == 1) && memory_wvalid && memory_wready && memory_wstrb[1]) begin
      _memory_mem[_write_addr + 1] <= memory_wdata[15:8];
    end 
    if((_memory_wdata_fsm == 1) && memory_wvalid && memory_wready && memory_wstrb[2]) begin
      _memory_mem[_write_addr + 2] <= memory_wdata[23:16];
    end 
    if((_memory_wdata_fsm == 1) && memory_wvalid && memory_wready && memory_wstrb[3]) begin
      _memory_mem[_write_addr + 3] <= memory_wdata[31:24];
    end 
  end

  localparam _memory_waddr_fsm_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      _memory_waddr_fsm <= _memory_waddr_fsm_init;
      memory_awready <= 0;
    end else begin
      case(_memory_waddr_fsm)
        _memory_waddr_fsm_init: begin
          memory_awready <= 0;
          if(memory_awvalid) begin
            _memory_waddr_fsm <= _memory_waddr_fsm_1;
          end 
        end
        _memory_waddr_fsm_1: begin
          if(!_memory_wreq_fifo_almost_full) begin
            memory_awready <= 1;
          end 
          if(memory_awvalid && memory_awready) begin
            memory_awready <= 0;
          end 
          if(!memory_awvalid) begin
            _memory_waddr_fsm <= _memory_waddr_fsm_init;
          end 
          if(memory_awvalid && memory_awready) begin
            _memory_waddr_fsm <= _memory_waddr_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam _memory_wdata_fsm_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      _memory_wdata_fsm <= _memory_wdata_fsm_init;
      memory_bvalid <= 0;
      _write_addr <= 0;
      _write_count <= 0;
      memory_wready <= 0;
    end else begin
      case(_memory_wdata_fsm)
        _memory_wdata_fsm_init: begin
          memory_bvalid <= 0;
          if(!_memory_wreq_fifo_empty) begin
            _write_addr <= unpack_write_req_global_addr_5;
            _write_count <= unpack_write_req_size_6;
            memory_wready <= 1;
          end 
          if(!_memory_wreq_fifo_empty) begin
            _memory_wdata_fsm <= _memory_wdata_fsm_1;
          end 
        end
        _memory_wdata_fsm_1: begin
          if(memory_wvalid && memory_wready) begin
            _write_addr <= _write_addr + 4;
            _write_count <= _write_count - 1;
          end 
          if(memory_wvalid && memory_wready && (_write_count == 1)) begin
            memory_wready <= 0;
            memory_bvalid <= 1;
          end 
          if(memory_wvalid && memory_wready && memory_wlast) begin
            memory_wready <= 0;
            memory_bvalid <= 1;
          end 
          if(memory_wvalid && memory_wready && (_write_count == 1)) begin
            _memory_wdata_fsm <= _memory_wdata_fsm_init;
          end 
          if(memory_wvalid && memory_wready && memory_wlast) begin
            _memory_wdata_fsm <= _memory_wdata_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam _memory_raddr_fsm_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      _memory_raddr_fsm <= _memory_raddr_fsm_init;
      memory_arready <= 0;
    end else begin
      case(_memory_raddr_fsm)
        _memory_raddr_fsm_init: begin
          memory_arready <= 0;
          if(memory_arvalid) begin
            _memory_raddr_fsm <= _memory_raddr_fsm_1;
          end 
        end
        _memory_raddr_fsm_1: begin
          if(!_memory_rreq_fifo_almost_full) begin
            memory_arready <= 1;
          end 
          if(memory_arvalid && memory_arready) begin
            memory_arready <= 0;
          end 
          if(!memory_arvalid) begin
            _memory_raddr_fsm <= _memory_raddr_fsm_init;
          end 
          if(memory_arvalid && memory_arready) begin
            _memory_raddr_fsm <= _memory_raddr_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam _memory_rdata_fsm_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      _memory_rdata_fsm <= _memory_rdata_fsm_init;
      _d1__memory_rdata_fsm <= _memory_rdata_fsm_init;
      _read_addr <= 0;
      _read_count <= 0;
      memory_rdata[7:0] <= (0 >> 0) & { 8{ 1'd1 } };
      memory_rdata[15:8] <= (0 >> 8) & { 8{ 1'd1 } };
      memory_rdata[23:16] <= (0 >> 16) & { 8{ 1'd1 } };
      memory_rdata[31:24] <= (0 >> 24) & { 8{ 1'd1 } };
      memory_rvalid <= 0;
      memory_rlast <= 0;
      __memory_rdata_fsm_cond_1_0_1 <= 0;
      memory_rdata <= 0;
    end else begin
      _d1__memory_rdata_fsm <= _memory_rdata_fsm;
      case(_d1__memory_rdata_fsm)
        _memory_rdata_fsm_1: begin
          if(__memory_rdata_fsm_cond_1_0_1) begin
            memory_rvalid <= 0;
            memory_rlast <= 0;
          end 
        end
      endcase
      case(_memory_rdata_fsm)
        _memory_rdata_fsm_init: begin
          if(!_memory_rreq_fifo_empty) begin
            _read_addr <= unpack_read_req_global_addr_12;
            _read_count <= unpack_read_req_size_13;
          end 
          if(!_memory_rreq_fifo_empty) begin
            _memory_rdata_fsm <= _memory_rdata_fsm_1;
          end 
        end
        _memory_rdata_fsm_1: begin
          if(memory_rready | !memory_rvalid) begin
            memory_rdata[7:0] <= _memory_mem[_read_addr + 0];
          end 
          if(memory_rready | !memory_rvalid) begin
            memory_rdata[15:8] <= _memory_mem[_read_addr + 1];
          end 
          if(memory_rready | !memory_rvalid) begin
            memory_rdata[23:16] <= _memory_mem[_read_addr + 2];
          end 
          if(memory_rready | !memory_rvalid) begin
            memory_rdata[31:24] <= _memory_mem[_read_addr + 3];
          end 
          if((_read_count > 0) && memory_rready | !memory_rvalid) begin
            memory_rvalid <= 1;
            _read_addr <= _read_addr + 4;
            _read_count <= _read_count - 1;
          end 
          if((_read_count == 1) && memory_rready | !memory_rvalid) begin
            memory_rlast <= 1;
          end 
          __memory_rdata_fsm_cond_1_0_1 <= 1;
          if(memory_rvalid && !memory_rready) begin
            memory_rvalid <= memory_rvalid;
            memory_rdata <= memory_rdata;
            memory_rlast <= memory_rlast;
          end 
          if(memory_rvalid && memory_rready && (_read_count == 0)) begin
            _memory_rdata_fsm <= _memory_rdata_fsm_init;
          end 
        end
      endcase
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      count__memory_wreq_fifo <= 0;
      __tmp_4_1 <= 0;
    end else begin
      if(_memory_wreq_fifo_enq && !_memory_wreq_fifo_full && (_memory_wreq_fifo_deq && !_memory_wreq_fifo_empty)) begin
        count__memory_wreq_fifo <= count__memory_wreq_fifo;
      end else if(_memory_wreq_fifo_enq && !_memory_wreq_fifo_full) begin
        count__memory_wreq_fifo <= count__memory_wreq_fifo + 1;
      end else if(_memory_wreq_fifo_deq && !_memory_wreq_fifo_empty) begin
        count__memory_wreq_fifo <= count__memory_wreq_fifo - 1;
      end 
      __tmp_4_1 <= _tmp_4;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      count__memory_rreq_fifo <= 0;
      __tmp_11_1 <= 0;
    end else begin
      if(_memory_rreq_fifo_enq && !_memory_rreq_fifo_full && (_memory_rreq_fifo_deq && !_memory_rreq_fifo_empty)) begin
        count__memory_rreq_fifo <= count__memory_rreq_fifo;
      end else if(_memory_rreq_fifo_enq && !_memory_rreq_fifo_full) begin
        count__memory_rreq_fifo <= count__memory_rreq_fifo + 1;
      end else if(_memory_rreq_fifo_deq && !_memory_rreq_fifo_empty) begin
        count__memory_rreq_fifo <= count__memory_rreq_fifo - 1;
      end 
      __tmp_11_1 <= _tmp_11;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      outstanding_wcount_23 <= 0;
      _saxi_awaddr <= 0;
      _saxi_awvalid <= 0;
      __saxi_cond_0_1 <= 0;
      _saxi_wdata <= 0;
      _saxi_wvalid <= 0;
      _saxi_wstrb <= 0;
      __saxi_cond_1_1 <= 0;
      __saxi_cond_2_1 <= 0;
      __saxi_cond_3_1 <= 0;
      __saxi_cond_4_1 <= 0;
      __saxi_cond_5_1 <= 0;
      __saxi_cond_6_1 <= 0;
      __saxi_cond_7_1 <= 0;
      __saxi_cond_8_1 <= 0;
      __saxi_cond_9_1 <= 0;
      _saxi_araddr <= 0;
      _saxi_arvalid <= 0;
      __saxi_cond_10_1 <= 0;
    end else begin
      if(__saxi_cond_0_1) begin
        _saxi_awvalid <= 0;
      end 
      if(__saxi_cond_1_1) begin
        _saxi_wvalid <= 0;
      end 
      if(__saxi_cond_2_1) begin
        _saxi_awvalid <= 0;
      end 
      if(__saxi_cond_3_1) begin
        _saxi_wvalid <= 0;
      end 
      if(__saxi_cond_4_1) begin
        _saxi_awvalid <= 0;
      end 
      if(__saxi_cond_5_1) begin
        _saxi_wvalid <= 0;
      end 
      if(__saxi_cond_6_1) begin
        _saxi_awvalid <= 0;
      end 
      if(__saxi_cond_7_1) begin
        _saxi_wvalid <= 0;
      end 
      if(__saxi_cond_8_1) begin
        _saxi_awvalid <= 0;
      end 
      if(__saxi_cond_9_1) begin
        _saxi_wvalid <= 0;
      end 
      if(__saxi_cond_10_1) begin
        _saxi_arvalid <= 0;
      end 
      if(_saxi_wvalid && _saxi_wready && !(_saxi_bvalid && _saxi_bready) && (outstanding_wcount_23 < 7)) begin
        outstanding_wcount_23 <= outstanding_wcount_23 + 1;
      end 
      if(!(_saxi_wvalid && _saxi_wready) && (_saxi_bvalid && _saxi_bready) && (outstanding_wcount_23 > 0)) begin
        outstanding_wcount_23 <= outstanding_wcount_23 - 1;
      end 
      if((th_ctrl == 6) && ((outstanding_wcount_23 < 6) && (_saxi_awready || !_saxi_awvalid))) begin
        _saxi_awaddr <= _th_ctrl_awaddr_17;
        _saxi_awvalid <= 1;
      end 
      __saxi_cond_0_1 <= 1;
      if(_saxi_awvalid && !_saxi_awready) begin
        _saxi_awvalid <= _saxi_awvalid;
      end 
      if((th_ctrl == 8) && ((outstanding_wcount_23 < 6) && (_saxi_wready || !_saxi_wvalid))) begin
        _saxi_wdata <= 32;
        _saxi_wvalid <= 1;
        _saxi_wstrb <= { 4{ 1'd1 } };
      end 
      __saxi_cond_1_1 <= 1;
      if(_saxi_wvalid && !_saxi_wready) begin
        _saxi_wvalid <= _saxi_wvalid;
      end 
      if((th_ctrl == 11) && ((outstanding_wcount_23 < 6) && (_saxi_awready || !_saxi_awvalid))) begin
        _saxi_awaddr <= _th_ctrl_awaddr_17;
        _saxi_awvalid <= 1;
      end 
      __saxi_cond_2_1 <= 1;
      if(_saxi_awvalid && !_saxi_awready) begin
        _saxi_awvalid <= _saxi_awvalid;
      end 
      if((th_ctrl == 13) && ((outstanding_wcount_23 < 6) && (_saxi_wready || !_saxi_wvalid))) begin
        _saxi_wdata <= 0;
        _saxi_wvalid <= 1;
        _saxi_wstrb <= { 4{ 1'd1 } };
      end 
      __saxi_cond_3_1 <= 1;
      if(_saxi_wvalid && !_saxi_wready) begin
        _saxi_wvalid <= _saxi_wvalid;
      end 
      if((th_ctrl == 16) && ((outstanding_wcount_23 < 6) && (_saxi_awready || !_saxi_awvalid))) begin
        _saxi_awaddr <= _th_ctrl_awaddr_17;
        _saxi_awvalid <= 1;
      end 
      __saxi_cond_4_1 <= 1;
      if(_saxi_awvalid && !_saxi_awready) begin
        _saxi_awvalid <= _saxi_awvalid;
      end 
      if((th_ctrl == 18) && ((outstanding_wcount_23 < 6) && (_saxi_wready || !_saxi_wvalid))) begin
        _saxi_wdata <= 4096;
        _saxi_wvalid <= 1;
        _saxi_wstrb <= { 4{ 1'd1 } };
      end 
      __saxi_cond_5_1 <= 1;
      if(_saxi_wvalid && !_saxi_wready) begin
        _saxi_wvalid <= _saxi_wvalid;
      end 
      if((th_ctrl == 21) && ((outstanding_wcount_23 < 6) && (_saxi_awready || !_saxi_awvalid))) begin
        _saxi_awaddr <= _th_ctrl_awaddr_17;
        _saxi_awvalid <= 1;
      end 
      __saxi_cond_6_1 <= 1;
      if(_saxi_awvalid && !_saxi_awready) begin
        _saxi_awvalid <= _saxi_awvalid;
      end 
      if((th_ctrl == 23) && ((outstanding_wcount_23 < 6) && (_saxi_wready || !_saxi_wvalid))) begin
        _saxi_wdata <= 8192;
        _saxi_wvalid <= 1;
        _saxi_wstrb <= { 4{ 1'd1 } };
      end 
      __saxi_cond_7_1 <= 1;
      if(_saxi_wvalid && !_saxi_wready) begin
        _saxi_wvalid <= _saxi_wvalid;
      end 
      if((th_ctrl == 27) && ((outstanding_wcount_23 < 6) && (_saxi_awready || !_saxi_awvalid))) begin
        _saxi_awaddr <= _th_ctrl_awaddr_17;
        _saxi_awvalid <= 1;
      end 
      __saxi_cond_8_1 <= 1;
      if(_saxi_awvalid && !_saxi_awready) begin
        _saxi_awvalid <= _saxi_awvalid;
      end 
      if((th_ctrl == 29) && ((outstanding_wcount_23 < 6) && (_saxi_wready || !_saxi_wvalid))) begin
        _saxi_wdata <= 1;
        _saxi_wvalid <= 1;
        _saxi_wstrb <= { 4{ 1'd1 } };
      end 
      __saxi_cond_9_1 <= 1;
      if(_saxi_wvalid && !_saxi_wready) begin
        _saxi_wvalid <= _saxi_wvalid;
      end 
      if((th_ctrl == 32) && (_saxi_arready || !_saxi_arvalid)) begin
        _saxi_araddr <= _th_ctrl_araddr_19;
        _saxi_arvalid <= 1;
      end 
      __saxi_cond_10_1 <= 1;
      if(_saxi_arvalid && !_saxi_arready) begin
        _saxi_arvalid <= _saxi_arvalid;
      end 
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      counter <= 0;
    end else begin
      counter <= counter + 1;
    end
  end

  localparam th_ctrl_1 = 1;
  localparam th_ctrl_2 = 2;
  localparam th_ctrl_3 = 3;
  localparam th_ctrl_4 = 4;
  localparam th_ctrl_5 = 5;
  localparam th_ctrl_6 = 6;
  localparam th_ctrl_7 = 7;
  localparam th_ctrl_8 = 8;
  localparam th_ctrl_9 = 9;
  localparam th_ctrl_10 = 10;
  localparam th_ctrl_11 = 11;
  localparam th_ctrl_12 = 12;
  localparam th_ctrl_13 = 13;
  localparam th_ctrl_14 = 14;
  localparam th_ctrl_15 = 15;
  localparam th_ctrl_16 = 16;
  localparam th_ctrl_17 = 17;
  localparam th_ctrl_18 = 18;
  localparam th_ctrl_19 = 19;
  localparam th_ctrl_20 = 20;
  localparam th_ctrl_21 = 21;
  localparam th_ctrl_22 = 22;
  localparam th_ctrl_23 = 23;
  localparam th_ctrl_24 = 24;
  localparam th_ctrl_25 = 25;
  localparam th_ctrl_26 = 26;
  localparam th_ctrl_27 = 27;
  localparam th_ctrl_28 = 28;
  localparam th_ctrl_29 = 29;
  localparam th_ctrl_30 = 30;
  localparam th_ctrl_31 = 31;
  localparam th_ctrl_32 = 32;
  localparam th_ctrl_33 = 33;
  localparam th_ctrl_34 = 34;
  localparam th_ctrl_35 = 35;
  localparam th_ctrl_36 = 36;
  localparam th_ctrl_37 = 37;
  localparam th_ctrl_38 = 38;
  localparam th_ctrl_39 = 39;
  localparam th_ctrl_40 = 40;
  localparam th_ctrl_41 = 41;
  localparam th_ctrl_42 = 42;
  localparam th_ctrl_43 = 43;
  localparam th_ctrl_44 = 44;
  localparam th_ctrl_45 = 45;
  localparam th_ctrl_46 = 46;
  localparam th_ctrl_47 = 47;
  localparam th_ctrl_48 = 48;
  localparam th_ctrl_49 = 49;
  localparam th_ctrl_50 = 50;
  localparam th_ctrl_51 = 51;
  localparam th_ctrl_52 = 52;
  localparam th_ctrl_53 = 53;
  localparam th_ctrl_54 = 54;
  localparam th_ctrl_55 = 55;
  localparam th_ctrl_56 = 56;
  localparam th_ctrl_57 = 57;
  localparam th_ctrl_58 = 58;
  localparam th_ctrl_59 = 59;
  localparam th_ctrl_60 = 60;
  localparam th_ctrl_61 = 61;
  localparam th_ctrl_62 = 62;
  localparam th_ctrl_63 = 63;
  localparam th_ctrl_64 = 64;
  localparam th_ctrl_65 = 65;
  localparam th_ctrl_66 = 66;
  localparam th_ctrl_67 = 67;
  localparam th_ctrl_68 = 68;

  always @(posedge CLK) begin
    if(RST) begin
      th_ctrl <= th_ctrl_init;
      _th_ctrl_i_16 <= 0;
      _th_ctrl_awaddr_17 <= 0;
      _th_ctrl_start_time_18 <= 0;
      _th_ctrl_araddr_19 <= 0;
      axim_rdata_37 <= 0;
      _th_ctrl_busy_20 <= 0;
      _th_ctrl_end_time_21 <= 0;
      _th_ctrl_time_22 <= 0;
      _th_ctrl_all_ok_23 <= 0;
      rdata_38 <= 0;
      _th_ctrl_v_24 <= 0;
      _th_ctrl_y_25 <= 0;
      _th_ctrl_x_26 <= 0;
      rdata_39 <= 0;
    end else begin
      case(th_ctrl)
        th_ctrl_init: begin
          th_ctrl <= th_ctrl_1;
        end
        th_ctrl_1: begin
          _th_ctrl_i_16 <= 0;
          th_ctrl <= th_ctrl_2;
        end
        th_ctrl_2: begin
          if(_th_ctrl_i_16 < 100) begin
            th_ctrl <= th_ctrl_3;
          end else begin
            th_ctrl <= th_ctrl_4;
          end
        end
        th_ctrl_3: begin
          _th_ctrl_i_16 <= _th_ctrl_i_16 + 1;
          th_ctrl <= th_ctrl_2;
        end
        th_ctrl_4: begin
          _th_ctrl_awaddr_17 <= 8;
          th_ctrl <= th_ctrl_5;
        end
        th_ctrl_5: begin
          $display("# matrix_size = %d", 32);
          th_ctrl <= th_ctrl_6;
        end
        th_ctrl_6: begin
          if((outstanding_wcount_23 < 6) && (_saxi_awready || !_saxi_awvalid)) begin
            th_ctrl <= th_ctrl_7;
          end 
        end
        th_ctrl_7: begin
          th_ctrl <= th_ctrl_8;
        end
        th_ctrl_8: begin
          if(_saxi_wready || !_saxi_wvalid) begin
            th_ctrl <= th_ctrl_9;
          end 
        end
        th_ctrl_9: begin
          _th_ctrl_awaddr_17 <= 12;
          th_ctrl <= th_ctrl_10;
        end
        th_ctrl_10: begin
          $display("# a_offset = %d", 0);
          th_ctrl <= th_ctrl_11;
        end
        th_ctrl_11: begin
          if((outstanding_wcount_23 < 6) && (_saxi_awready || !_saxi_awvalid)) begin
            th_ctrl <= th_ctrl_12;
          end 
        end
        th_ctrl_12: begin
          th_ctrl <= th_ctrl_13;
        end
        th_ctrl_13: begin
          if(_saxi_wready || !_saxi_wvalid) begin
            th_ctrl <= th_ctrl_14;
          end 
        end
        th_ctrl_14: begin
          _th_ctrl_awaddr_17 <= 16;
          th_ctrl <= th_ctrl_15;
        end
        th_ctrl_15: begin
          $display("# b_offset = %d", 4096);
          th_ctrl <= th_ctrl_16;
        end
        th_ctrl_16: begin
          if((outstanding_wcount_23 < 6) && (_saxi_awready || !_saxi_awvalid)) begin
            th_ctrl <= th_ctrl_17;
          end 
        end
        th_ctrl_17: begin
          th_ctrl <= th_ctrl_18;
        end
        th_ctrl_18: begin
          if(_saxi_wready || !_saxi_wvalid) begin
            th_ctrl <= th_ctrl_19;
          end 
        end
        th_ctrl_19: begin
          _th_ctrl_awaddr_17 <= 20;
          th_ctrl <= th_ctrl_20;
        end
        th_ctrl_20: begin
          $display("# c_offset = %d", 8192);
          th_ctrl <= th_ctrl_21;
        end
        th_ctrl_21: begin
          if((outstanding_wcount_23 < 6) && (_saxi_awready || !_saxi_awvalid)) begin
            th_ctrl <= th_ctrl_22;
          end 
        end
        th_ctrl_22: begin
          th_ctrl <= th_ctrl_23;
        end
        th_ctrl_23: begin
          if(_saxi_wready || !_saxi_wvalid) begin
            th_ctrl <= th_ctrl_24;
          end 
        end
        th_ctrl_24: begin
          _th_ctrl_awaddr_17 <= 0;
          th_ctrl <= th_ctrl_25;
        end
        th_ctrl_25: begin
          _th_ctrl_start_time_18 <= counter;
          th_ctrl <= th_ctrl_26;
        end
        th_ctrl_26: begin
          $display("# start time = %d", _th_ctrl_start_time_18);
          th_ctrl <= th_ctrl_27;
        end
        th_ctrl_27: begin
          if((outstanding_wcount_23 < 6) && (_saxi_awready || !_saxi_awvalid)) begin
            th_ctrl <= th_ctrl_28;
          end 
        end
        th_ctrl_28: begin
          th_ctrl <= th_ctrl_29;
        end
        th_ctrl_29: begin
          if(_saxi_wready || !_saxi_wvalid) begin
            th_ctrl <= th_ctrl_30;
          end 
        end
        th_ctrl_30: begin
          _th_ctrl_araddr_19 <= 4;
          th_ctrl <= th_ctrl_31;
        end
        th_ctrl_31: begin
          if(1) begin
            th_ctrl <= th_ctrl_32;
          end else begin
            th_ctrl <= th_ctrl_39;
          end
        end
        th_ctrl_32: begin
          if(_saxi_arready || !_saxi_arvalid) begin
            th_ctrl <= th_ctrl_33;
          end 
        end
        th_ctrl_33: begin
          th_ctrl <= th_ctrl_34;
        end
        th_ctrl_34: begin
          if(_saxi_rvalid) begin
            axim_rdata_37 <= _saxi_rdata;
          end 
          if(_saxi_rvalid) begin
            th_ctrl <= th_ctrl_35;
          end 
        end
        th_ctrl_35: begin
          _th_ctrl_busy_20 <= axim_rdata_37;
          th_ctrl <= th_ctrl_36;
        end
        th_ctrl_36: begin
          if(!_th_ctrl_busy_20) begin
            th_ctrl <= th_ctrl_37;
          end else begin
            th_ctrl <= th_ctrl_38;
          end
        end
        th_ctrl_37: begin
          th_ctrl <= th_ctrl_39;
        end
        th_ctrl_38: begin
          th_ctrl <= th_ctrl_31;
        end
        th_ctrl_39: begin
          _th_ctrl_end_time_21 <= counter;
          th_ctrl <= th_ctrl_40;
        end
        th_ctrl_40: begin
          $display("# end time = %d", _th_ctrl_end_time_21);
          th_ctrl <= th_ctrl_41;
        end
        th_ctrl_41: begin
          _th_ctrl_time_22 <= _th_ctrl_end_time_21 - _th_ctrl_start_time_18;
          th_ctrl <= th_ctrl_42;
        end
        th_ctrl_42: begin
          $display("# core_num = %d, par = %d, exec_time = %d", 2, 2, _th_ctrl_time_22);
          th_ctrl <= th_ctrl_43;
        end
        th_ctrl_43: begin
          _th_ctrl_all_ok_23 <= 1;
          th_ctrl <= th_ctrl_44;
        end
        th_ctrl_44: begin
          _th_ctrl_i_16 <= 0;
          th_ctrl <= th_ctrl_45;
        end
        th_ctrl_45: begin
          if(_th_ctrl_i_16 < 16) begin
            th_ctrl <= th_ctrl_46;
          end else begin
            th_ctrl <= th_ctrl_49;
          end
        end
        th_ctrl_46: begin
          if(th_ctrl == 46) begin
            rdata_38 <= { _memory_mem[8192 + ((_th_ctrl_i_16 << 5) >>> 3) + 3], _memory_mem[8192 + ((_th_ctrl_i_16 << 5) >>> 3) + 2], _memory_mem[8192 + ((_th_ctrl_i_16 << 5) >>> 3) + 1], _memory_mem[8192 + ((_th_ctrl_i_16 << 5) >>> 3) + 0] };
          end 
          th_ctrl <= th_ctrl_47;
        end
        th_ctrl_47: begin
          _th_ctrl_v_24 <= rdata_38;
          th_ctrl <= th_ctrl_48;
        end
        th_ctrl_48: begin
          _th_ctrl_i_16 <= _th_ctrl_i_16 + 1;
          th_ctrl <= th_ctrl_45;
        end
        th_ctrl_49: begin
          _th_ctrl_y_25 <= 0;
          th_ctrl <= th_ctrl_50;
        end
        th_ctrl_50: begin
          if(_th_ctrl_y_25 < 32) begin
            th_ctrl <= th_ctrl_51;
          end else begin
            th_ctrl <= th_ctrl_63;
          end
        end
        th_ctrl_51: begin
          _th_ctrl_x_26 <= 0;
          th_ctrl <= th_ctrl_52;
        end
        th_ctrl_52: begin
          if(_th_ctrl_x_26 < 32) begin
            th_ctrl <= th_ctrl_53;
          end else begin
            th_ctrl <= th_ctrl_62;
          end
        end
        th_ctrl_53: begin
          if(th_ctrl == 53) begin
            rdata_39 <= { _memory_mem[8192 + (((_th_ctrl_y_25 << 5) + _th_ctrl_x_26 << 5) >>> 3) + 3], _memory_mem[8192 + (((_th_ctrl_y_25 << 5) + _th_ctrl_x_26 << 5) >>> 3) + 2], _memory_mem[8192 + (((_th_ctrl_y_25 << 5) + _th_ctrl_x_26 << 5) >>> 3) + 1], _memory_mem[8192 + (((_th_ctrl_y_25 << 5) + _th_ctrl_x_26 << 5) >>> 3) + 0] };
          end 
          th_ctrl <= th_ctrl_54;
        end
        th_ctrl_54: begin
          _th_ctrl_v_24 <= rdata_39;
          th_ctrl <= th_ctrl_55;
        end
        th_ctrl_55: begin
          if((_th_ctrl_y_25 == _th_ctrl_x_26) && (_th_ctrl_v_24 !== (_th_ctrl_y_25 + 1 << 1))) begin
            th_ctrl <= th_ctrl_56;
          end else begin
            th_ctrl <= th_ctrl_58;
          end
        end
        th_ctrl_56: begin
          _th_ctrl_all_ok_23 <= 0;
          th_ctrl <= th_ctrl_57;
        end
        th_ctrl_57: begin
          $display("NG [%d,%d] = %d", _th_ctrl_y_25, _th_ctrl_x_26, _th_ctrl_v_24);
          th_ctrl <= th_ctrl_58;
        end
        th_ctrl_58: begin
          if((_th_ctrl_y_25 != _th_ctrl_x_26) && (_th_ctrl_v_24 !== 0)) begin
            th_ctrl <= th_ctrl_59;
          end else begin
            th_ctrl <= th_ctrl_61;
          end
        end
        th_ctrl_59: begin
          _th_ctrl_all_ok_23 <= 0;
          th_ctrl <= th_ctrl_60;
        end
        th_ctrl_60: begin
          $display("NG [%d,%d] = %d", _th_ctrl_y_25, _th_ctrl_x_26, _th_ctrl_v_24);
          th_ctrl <= th_ctrl_61;
        end
        th_ctrl_61: begin
          _th_ctrl_x_26 <= _th_ctrl_x_26 + 1;
          th_ctrl <= th_ctrl_52;
        end
        th_ctrl_62: begin
          _th_ctrl_y_25 <= _th_ctrl_y_25 + 1;
          th_ctrl <= th_ctrl_50;
        end
        th_ctrl_63: begin
          if(_th_ctrl_all_ok_23) begin
            th_ctrl <= th_ctrl_64;
          end else begin
            th_ctrl <= th_ctrl_66;
          end
        end
        th_ctrl_64: begin
          $display("# verify: PASSED");
          th_ctrl <= th_ctrl_65;
        end
        th_ctrl_65: begin
          th_ctrl <= th_ctrl_67;
        end
        th_ctrl_66: begin
          $display("# verify: FAILED");
          th_ctrl <= th_ctrl_67;
        end
        th_ctrl_67: begin
          $finish;
          th_ctrl <= th_ctrl_68;
        end
      endcase
    end
  end


endmodule



module _memory_wreq_fifo
(
  input CLK,
  input RST,
  input _memory_wreq_fifo_enq,
  input [41-1:0] _memory_wreq_fifo_wdata,
  output _memory_wreq_fifo_full,
  output _memory_wreq_fifo_almost_full,
  input _memory_wreq_fifo_deq,
  output [41-1:0] _memory_wreq_fifo_rdata,
  output _memory_wreq_fifo_empty,
  output _memory_wreq_fifo_almost_empty
);

  reg [41-1:0] mem [0:8-1];
  reg [3-1:0] head;
  reg [3-1:0] tail;
  wire is_empty;
  wire is_almost_empty;
  wire is_full;
  wire is_almost_full;
  assign is_empty = head == tail;
  assign is_almost_empty = head == (tail + 1 & 7);
  assign is_full = (head + 1 & 7) == tail;
  assign is_almost_full = (head + 2 & 7) == tail;
  wire [41-1:0] rdata;
  assign _memory_wreq_fifo_full = is_full;
  assign _memory_wreq_fifo_almost_full = is_almost_full || is_full;
  assign _memory_wreq_fifo_empty = is_empty;
  assign _memory_wreq_fifo_almost_empty = is_almost_empty || is_empty;
  assign rdata = mem[tail];
  assign _memory_wreq_fifo_rdata = rdata;

  always @(posedge CLK) begin
    if(RST) begin
      head <= 0;
      tail <= 0;
    end else begin
      if(_memory_wreq_fifo_enq && !is_full) begin
        mem[head] <= _memory_wreq_fifo_wdata;
        head <= head + 1;
      end 
      if(_memory_wreq_fifo_deq && !is_empty) begin
        tail <= tail + 1;
      end 
    end
  end


endmodule



module _memory_rreq_fifo
(
  input CLK,
  input RST,
  input _memory_rreq_fifo_enq,
  input [41-1:0] _memory_rreq_fifo_wdata,
  output _memory_rreq_fifo_full,
  output _memory_rreq_fifo_almost_full,
  input _memory_rreq_fifo_deq,
  output [41-1:0] _memory_rreq_fifo_rdata,
  output _memory_rreq_fifo_empty,
  output _memory_rreq_fifo_almost_empty
);

  reg [41-1:0] mem [0:8-1];
  reg [3-1:0] head;
  reg [3-1:0] tail;
  wire is_empty;
  wire is_almost_empty;
  wire is_full;
  wire is_almost_full;
  assign is_empty = head == tail;
  assign is_almost_empty = head == (tail + 1 & 7);
  assign is_full = (head + 1 & 7) == tail;
  assign is_almost_full = (head + 2 & 7) == tail;
  wire [41-1:0] rdata;
  assign _memory_rreq_fifo_full = is_full;
  assign _memory_rreq_fifo_almost_full = is_almost_full || is_full;
  assign _memory_rreq_fifo_empty = is_empty;
  assign _memory_rreq_fifo_almost_empty = is_almost_empty || is_empty;
  assign rdata = mem[tail];
  assign _memory_rreq_fifo_rdata = rdata;

  always @(posedge CLK) begin
    if(RST) begin
      head <= 0;
      tail <= 0;
    end else begin
      if(_memory_rreq_fifo_enq && !is_full) begin
        mem[head] <= _memory_rreq_fifo_wdata;
        head <= head + 1;
      end 
      if(_memory_rreq_fifo_deq && !is_empty) begin
        tail <= tail + 1;
      end 
    end
  end


endmodule



module blinkled
(
  input CLK,
  input RST,
  output reg [32-1:0] maxi_awaddr,
  output reg [8-1:0] maxi_awlen,
  output [3-1:0] maxi_awsize,
  output [2-1:0] maxi_awburst,
  output [1-1:0] maxi_awlock,
  output [4-1:0] maxi_awcache,
  output [3-1:0] maxi_awprot,
  output [4-1:0] maxi_awqos,
  output [2-1:0] maxi_awuser,
  output reg maxi_awvalid,
  input maxi_awready,
  output reg [32-1:0] maxi_wdata,
  output reg [4-1:0] maxi_wstrb,
  output reg maxi_wlast,
  output reg maxi_wvalid,
  input maxi_wready,
  input [2-1:0] maxi_bresp,
  input maxi_bvalid,
  output maxi_bready,
  output reg [32-1:0] maxi_araddr,
  output reg [8-1:0] maxi_arlen,
  output [3-1:0] maxi_arsize,
  output [2-1:0] maxi_arburst,
  output [1-1:0] maxi_arlock,
  output [4-1:0] maxi_arcache,
  output [3-1:0] maxi_arprot,
  output [4-1:0] maxi_arqos,
  output [2-1:0] maxi_aruser,
  output reg maxi_arvalid,
  input maxi_arready,
  input [32-1:0] maxi_rdata,
  input [2-1:0] maxi_rresp,
  input maxi_rlast,
  input maxi_rvalid,
  output maxi_rready,
  input [32-1:0] saxi_awaddr,
  input [4-1:0] saxi_awcache,
  input [3-1:0] saxi_awprot,
  input saxi_awvalid,
  output saxi_awready,
  input [32-1:0] saxi_wdata,
  input [4-1:0] saxi_wstrb,
  input saxi_wvalid,
  output saxi_wready,
  output [2-1:0] saxi_bresp,
  output reg saxi_bvalid,
  input saxi_bready,
  input [32-1:0] saxi_araddr,
  input [4-1:0] saxi_arcache,
  input [3-1:0] saxi_arprot,
  input saxi_arvalid,
  output saxi_arready,
  output reg [32-1:0] saxi_rdata,
  output [2-1:0] saxi_rresp,
  output reg saxi_rvalid,
  input saxi_rready
);

  wire [20-1:0] ram_c_0_0_addr;
  wire [32-1:0] ram_c_0_0_rdata;
  wire [32-1:0] ram_c_0_0_wdata;
  wire ram_c_0_0_wenable;
  wire ram_c_0_0_enable;

  ram_c_0
  inst_ram_c_0
  (
    .CLK(CLK),
    .ram_c_0_0_addr(ram_c_0_0_addr),
    .ram_c_0_0_rdata(ram_c_0_0_rdata),
    .ram_c_0_0_wdata(ram_c_0_0_wdata),
    .ram_c_0_0_wenable(ram_c_0_0_wenable),
    .ram_c_0_0_enable(ram_c_0_0_enable)
  );

  wire [20-1:0] ram_c_1_0_addr;
  wire [32-1:0] ram_c_1_0_rdata;
  wire [32-1:0] ram_c_1_0_wdata;
  wire ram_c_1_0_wenable;
  wire ram_c_1_0_enable;

  ram_c_1
  inst_ram_c_1
  (
    .CLK(CLK),
    .ram_c_1_0_addr(ram_c_1_0_addr),
    .ram_c_1_0_rdata(ram_c_1_0_rdata),
    .ram_c_1_0_wdata(ram_c_1_0_wdata),
    .ram_c_1_0_wenable(ram_c_1_0_wenable),
    .ram_c_1_0_enable(ram_c_1_0_enable)
  );

  wire [20-1:0] ram_a0_0_0_addr;
  wire [32-1:0] ram_a0_0_0_rdata;
  wire [32-1:0] ram_a0_0_0_wdata;
  wire ram_a0_0_0_wenable;
  wire ram_a0_0_0_enable;

  ram_a0_0
  inst_ram_a0_0
  (
    .CLK(CLK),
    .ram_a0_0_0_addr(ram_a0_0_0_addr),
    .ram_a0_0_0_rdata(ram_a0_0_0_rdata),
    .ram_a0_0_0_wdata(ram_a0_0_0_wdata),
    .ram_a0_0_0_wenable(ram_a0_0_0_wenable),
    .ram_a0_0_0_enable(ram_a0_0_0_enable)
  );

  wire [20-1:0] ram_a0_1_0_addr;
  wire [32-1:0] ram_a0_1_0_rdata;
  wire [32-1:0] ram_a0_1_0_wdata;
  wire ram_a0_1_0_wenable;
  wire ram_a0_1_0_enable;

  ram_a0_1
  inst_ram_a0_1
  (
    .CLK(CLK),
    .ram_a0_1_0_addr(ram_a0_1_0_addr),
    .ram_a0_1_0_rdata(ram_a0_1_0_rdata),
    .ram_a0_1_0_wdata(ram_a0_1_0_wdata),
    .ram_a0_1_0_wenable(ram_a0_1_0_wenable),
    .ram_a0_1_0_enable(ram_a0_1_0_enable)
  );

  wire [20-1:0] ram_b0_0_0_addr;
  wire [32-1:0] ram_b0_0_0_rdata;
  wire [32-1:0] ram_b0_0_0_wdata;
  wire ram_b0_0_0_wenable;
  wire ram_b0_0_0_enable;

  ram_b0_0
  inst_ram_b0_0
  (
    .CLK(CLK),
    .ram_b0_0_0_addr(ram_b0_0_0_addr),
    .ram_b0_0_0_rdata(ram_b0_0_0_rdata),
    .ram_b0_0_0_wdata(ram_b0_0_0_wdata),
    .ram_b0_0_0_wenable(ram_b0_0_0_wenable),
    .ram_b0_0_0_enable(ram_b0_0_0_enable)
  );

  wire [20-1:0] ram_b0_1_0_addr;
  wire [32-1:0] ram_b0_1_0_rdata;
  wire [32-1:0] ram_b0_1_0_wdata;
  wire ram_b0_1_0_wenable;
  wire ram_b0_1_0_enable;

  ram_b0_1
  inst_ram_b0_1
  (
    .CLK(CLK),
    .ram_b0_1_0_addr(ram_b0_1_0_addr),
    .ram_b0_1_0_rdata(ram_b0_1_0_rdata),
    .ram_b0_1_0_wdata(ram_b0_1_0_wdata),
    .ram_b0_1_0_wenable(ram_b0_1_0_wenable),
    .ram_b0_1_0_enable(ram_b0_1_0_enable)
  );

  wire [20-1:0] ram_a1_0_0_addr;
  wire [32-1:0] ram_a1_0_0_rdata;
  wire [32-1:0] ram_a1_0_0_wdata;
  wire ram_a1_0_0_wenable;
  wire ram_a1_0_0_enable;

  ram_a1_0
  inst_ram_a1_0
  (
    .CLK(CLK),
    .ram_a1_0_0_addr(ram_a1_0_0_addr),
    .ram_a1_0_0_rdata(ram_a1_0_0_rdata),
    .ram_a1_0_0_wdata(ram_a1_0_0_wdata),
    .ram_a1_0_0_wenable(ram_a1_0_0_wenable),
    .ram_a1_0_0_enable(ram_a1_0_0_enable)
  );

  wire [20-1:0] ram_a1_1_0_addr;
  wire [32-1:0] ram_a1_1_0_rdata;
  wire [32-1:0] ram_a1_1_0_wdata;
  wire ram_a1_1_0_wenable;
  wire ram_a1_1_0_enable;

  ram_a1_1
  inst_ram_a1_1
  (
    .CLK(CLK),
    .ram_a1_1_0_addr(ram_a1_1_0_addr),
    .ram_a1_1_0_rdata(ram_a1_1_0_rdata),
    .ram_a1_1_0_wdata(ram_a1_1_0_wdata),
    .ram_a1_1_0_wenable(ram_a1_1_0_wenable),
    .ram_a1_1_0_enable(ram_a1_1_0_enable)
  );

  wire [20-1:0] ram_b1_0_0_addr;
  wire [32-1:0] ram_b1_0_0_rdata;
  wire [32-1:0] ram_b1_0_0_wdata;
  wire ram_b1_0_0_wenable;
  wire ram_b1_0_0_enable;

  ram_b1_0
  inst_ram_b1_0
  (
    .CLK(CLK),
    .ram_b1_0_0_addr(ram_b1_0_0_addr),
    .ram_b1_0_0_rdata(ram_b1_0_0_rdata),
    .ram_b1_0_0_wdata(ram_b1_0_0_wdata),
    .ram_b1_0_0_wenable(ram_b1_0_0_wenable),
    .ram_b1_0_0_enable(ram_b1_0_0_enable)
  );

  wire [20-1:0] ram_b1_1_0_addr;
  wire [32-1:0] ram_b1_1_0_rdata;
  wire [32-1:0] ram_b1_1_0_wdata;
  wire ram_b1_1_0_wenable;
  wire ram_b1_1_0_enable;

  ram_b1_1
  inst_ram_b1_1
  (
    .CLK(CLK),
    .ram_b1_1_0_addr(ram_b1_1_0_addr),
    .ram_b1_1_0_rdata(ram_b1_1_0_rdata),
    .ram_b1_1_0_wdata(ram_b1_1_0_wdata),
    .ram_b1_1_0_wenable(ram_b1_1_0_wenable),
    .ram_b1_1_0_enable(ram_b1_1_0_enable)
  );

  assign maxi_awsize = 2;
  assign maxi_awburst = 1;
  assign maxi_awlock = 0;
  assign maxi_awcache = 3;
  assign maxi_awprot = 0;
  assign maxi_awqos = 0;
  assign maxi_awuser = 0;
  assign maxi_bready = 1;
  assign maxi_arsize = 2;
  assign maxi_arburst = 1;
  assign maxi_arlock = 0;
  assign maxi_arcache = 3;
  assign maxi_arprot = 0;
  assign maxi_arqos = 0;
  assign maxi_aruser = 0;
  reg [3-1:0] outstanding_wcount_0;
  reg _maxi_read_start;
  reg [8-1:0] _maxi_read_op_sel;
  reg [32-1:0] _maxi_read_global_addr;
  reg [33-1:0] _maxi_read_global_size;
  reg [32-1:0] _maxi_read_local_addr;
  reg [32-1:0] _maxi_read_local_stride;
  reg [33-1:0] _maxi_read_local_size;
  reg [32-1:0] _maxi_read_local_blocksize;
  wire _maxi_read_req_fifo_enq;
  wire [137-1:0] _maxi_read_req_fifo_wdata;
  wire _maxi_read_req_fifo_full;
  wire _maxi_read_req_fifo_almost_full;
  wire _maxi_read_req_fifo_deq;
  wire [137-1:0] _maxi_read_req_fifo_rdata;
  wire _maxi_read_req_fifo_empty;
  wire _maxi_read_req_fifo_almost_empty;

  _maxi_read_req_fifo
  inst__maxi_read_req_fifo
  (
    .CLK(CLK),
    .RST(RST),
    ._maxi_read_req_fifo_enq(_maxi_read_req_fifo_enq),
    ._maxi_read_req_fifo_wdata(_maxi_read_req_fifo_wdata),
    ._maxi_read_req_fifo_full(_maxi_read_req_fifo_full),
    ._maxi_read_req_fifo_almost_full(_maxi_read_req_fifo_almost_full),
    ._maxi_read_req_fifo_deq(_maxi_read_req_fifo_deq),
    ._maxi_read_req_fifo_rdata(_maxi_read_req_fifo_rdata),
    ._maxi_read_req_fifo_empty(_maxi_read_req_fifo_empty),
    ._maxi_read_req_fifo_almost_empty(_maxi_read_req_fifo_almost_empty)
  );

  reg [4-1:0] count__maxi_read_req_fifo;
  wire [8-1:0] _maxi_read_op_sel_fifo;
  wire [32-1:0] _maxi_read_local_addr_fifo;
  wire [32-1:0] _maxi_read_local_stride_fifo;
  wire [33-1:0] _maxi_read_local_size_fifo;
  wire [32-1:0] _maxi_read_local_blocksize_fifo;
  wire [8-1:0] unpack_read_req_op_sel_1;
  wire [32-1:0] unpack_read_req_local_addr_2;
  wire [32-1:0] unpack_read_req_local_stride_3;
  wire [33-1:0] unpack_read_req_local_size_4;
  wire [32-1:0] unpack_read_req_local_blocksize_5;
  assign unpack_read_req_op_sel_1 = _maxi_read_req_fifo_rdata[136:129];
  assign unpack_read_req_local_addr_2 = _maxi_read_req_fifo_rdata[128:97];
  assign unpack_read_req_local_stride_3 = _maxi_read_req_fifo_rdata[96:65];
  assign unpack_read_req_local_size_4 = _maxi_read_req_fifo_rdata[64:32];
  assign unpack_read_req_local_blocksize_5 = _maxi_read_req_fifo_rdata[31:0];
  assign _maxi_read_op_sel_fifo = unpack_read_req_op_sel_1;
  assign _maxi_read_local_addr_fifo = unpack_read_req_local_addr_2;
  assign _maxi_read_local_stride_fifo = unpack_read_req_local_stride_3;
  assign _maxi_read_local_size_fifo = unpack_read_req_local_size_4;
  assign _maxi_read_local_blocksize_fifo = unpack_read_req_local_blocksize_5;
  reg [8-1:0] _maxi_read_op_sel_buf;
  reg [32-1:0] _maxi_read_local_addr_buf;
  reg [32-1:0] _maxi_read_local_stride_buf;
  reg [33-1:0] _maxi_read_local_size_buf;
  reg [32-1:0] _maxi_read_local_blocksize_buf;
  reg _maxi_read_req_idle;
  reg _maxi_read_data_idle;
  wire _maxi_read_idle;
  assign _maxi_read_idle = !_maxi_read_start && _maxi_read_req_idle && _maxi_read_req_fifo_empty && _maxi_read_data_idle;
  reg _maxi_write_start;
  reg [8-1:0] _maxi_write_op_sel;
  reg [32-1:0] _maxi_write_global_addr;
  reg [33-1:0] _maxi_write_global_size;
  reg [32-1:0] _maxi_write_local_addr;
  reg [32-1:0] _maxi_write_local_stride;
  reg [33-1:0] _maxi_write_local_size;
  reg [32-1:0] _maxi_write_local_blocksize;
  wire _maxi_write_req_fifo_enq;
  wire [137-1:0] _maxi_write_req_fifo_wdata;
  wire _maxi_write_req_fifo_full;
  wire _maxi_write_req_fifo_almost_full;
  wire _maxi_write_req_fifo_deq;
  wire [137-1:0] _maxi_write_req_fifo_rdata;
  wire _maxi_write_req_fifo_empty;
  wire _maxi_write_req_fifo_almost_empty;

  _maxi_write_req_fifo
  inst__maxi_write_req_fifo
  (
    .CLK(CLK),
    .RST(RST),
    ._maxi_write_req_fifo_enq(_maxi_write_req_fifo_enq),
    ._maxi_write_req_fifo_wdata(_maxi_write_req_fifo_wdata),
    ._maxi_write_req_fifo_full(_maxi_write_req_fifo_full),
    ._maxi_write_req_fifo_almost_full(_maxi_write_req_fifo_almost_full),
    ._maxi_write_req_fifo_deq(_maxi_write_req_fifo_deq),
    ._maxi_write_req_fifo_rdata(_maxi_write_req_fifo_rdata),
    ._maxi_write_req_fifo_empty(_maxi_write_req_fifo_empty),
    ._maxi_write_req_fifo_almost_empty(_maxi_write_req_fifo_almost_empty)
  );

  reg [4-1:0] count__maxi_write_req_fifo;
  wire [8-1:0] _maxi_write_op_sel_fifo;
  wire [32-1:0] _maxi_write_local_addr_fifo;
  wire [32-1:0] _maxi_write_local_stride_fifo;
  wire [33-1:0] _maxi_write_size_fifo;
  wire [32-1:0] _maxi_write_local_blocksize_fifo;
  wire [8-1:0] unpack_write_req_op_sel_6;
  wire [32-1:0] unpack_write_req_local_addr_7;
  wire [32-1:0] unpack_write_req_local_stride_8;
  wire [33-1:0] unpack_write_req_size_9;
  wire [32-1:0] unpack_write_req_local_blocksize_10;
  assign unpack_write_req_op_sel_6 = _maxi_write_req_fifo_rdata[136:129];
  assign unpack_write_req_local_addr_7 = _maxi_write_req_fifo_rdata[128:97];
  assign unpack_write_req_local_stride_8 = _maxi_write_req_fifo_rdata[96:65];
  assign unpack_write_req_size_9 = _maxi_write_req_fifo_rdata[64:32];
  assign unpack_write_req_local_blocksize_10 = _maxi_write_req_fifo_rdata[31:0];
  assign _maxi_write_op_sel_fifo = unpack_write_req_op_sel_6;
  assign _maxi_write_local_addr_fifo = unpack_write_req_local_addr_7;
  assign _maxi_write_local_stride_fifo = unpack_write_req_local_stride_8;
  assign _maxi_write_size_fifo = unpack_write_req_size_9;
  assign _maxi_write_local_blocksize_fifo = unpack_write_req_local_blocksize_10;
  reg [8-1:0] _maxi_write_op_sel_buf;
  reg [32-1:0] _maxi_write_local_addr_buf;
  reg [32-1:0] _maxi_write_local_stride_buf;
  reg [33-1:0] _maxi_write_size_buf;
  reg [32-1:0] _maxi_write_local_blocksize_buf;
  reg _maxi_write_req_idle;
  reg _maxi_write_data_idle;
  wire _maxi_write_idle;
  assign _maxi_write_idle = !_maxi_write_start && _maxi_write_req_idle && _maxi_write_req_fifo_empty && _maxi_write_data_idle;
  assign saxi_bresp = 0;
  assign saxi_rresp = 0;
  reg signed [32-1:0] _saxi_register_0;
  reg signed [32-1:0] _saxi_register_1;
  reg signed [32-1:0] _saxi_register_2;
  reg signed [32-1:0] _saxi_register_3;
  reg signed [32-1:0] _saxi_register_4;
  reg signed [32-1:0] _saxi_register_5;
  reg signed [32-1:0] _saxi_register_6;
  reg signed [32-1:0] _saxi_register_7;
  reg _saxi_flag_0;
  reg _saxi_flag_1;
  reg _saxi_flag_2;
  reg _saxi_flag_3;
  reg _saxi_flag_4;
  reg _saxi_flag_5;
  reg _saxi_flag_6;
  reg _saxi_flag_7;
  reg signed [32-1:0] _saxi_resetval_0;
  reg signed [32-1:0] _saxi_resetval_1;
  reg signed [32-1:0] _saxi_resetval_2;
  reg signed [32-1:0] _saxi_resetval_3;
  reg signed [32-1:0] _saxi_resetval_4;
  reg signed [32-1:0] _saxi_resetval_5;
  reg signed [32-1:0] _saxi_resetval_6;
  reg signed [32-1:0] _saxi_resetval_7;
  localparam _saxi_maskwidth = 3;
  localparam _saxi_mask = { _saxi_maskwidth{ 1'd1 } };
  localparam _saxi_shift = 2;
  reg [32-1:0] _saxi_register_fsm;
  localparam _saxi_register_fsm_init = 0;
  reg [32-1:0] addr_11;
  reg writevalid_12;
  reg readvalid_13;
  reg prev_awvalid_14;
  reg prev_arvalid_15;
  assign saxi_awready = (_saxi_register_fsm == 0) && (!writevalid_12 && !readvalid_13 && !saxi_bvalid && prev_awvalid_14);
  assign saxi_arready = (_saxi_register_fsm == 0) && (!readvalid_13 && !writevalid_12 && prev_arvalid_15 && !prev_awvalid_14);
  reg [_saxi_maskwidth-1:0] axis_maskaddr_16;
  wire signed [32-1:0] axislite_rdata_17;
  assign axislite_rdata_17 = (axis_maskaddr_16 == 0)? _saxi_register_0 : 
                             (axis_maskaddr_16 == 1)? _saxi_register_1 : 
                             (axis_maskaddr_16 == 2)? _saxi_register_2 : 
                             (axis_maskaddr_16 == 3)? _saxi_register_3 : 
                             (axis_maskaddr_16 == 4)? _saxi_register_4 : 
                             (axis_maskaddr_16 == 5)? _saxi_register_5 : 
                             (axis_maskaddr_16 == 6)? _saxi_register_6 : 
                             (axis_maskaddr_16 == 7)? _saxi_register_7 : 'hx;
  wire axislite_flag_18;
  assign axislite_flag_18 = (axis_maskaddr_16 == 0)? _saxi_flag_0 : 
                            (axis_maskaddr_16 == 1)? _saxi_flag_1 : 
                            (axis_maskaddr_16 == 2)? _saxi_flag_2 : 
                            (axis_maskaddr_16 == 3)? _saxi_flag_3 : 
                            (axis_maskaddr_16 == 4)? _saxi_flag_4 : 
                            (axis_maskaddr_16 == 5)? _saxi_flag_5 : 
                            (axis_maskaddr_16 == 6)? _saxi_flag_6 : 
                            (axis_maskaddr_16 == 7)? _saxi_flag_7 : 'hx;
  wire signed [32-1:0] axislite_resetval_19;
  assign axislite_resetval_19 = (axis_maskaddr_16 == 0)? _saxi_resetval_0 : 
                                (axis_maskaddr_16 == 1)? _saxi_resetval_1 : 
                                (axis_maskaddr_16 == 2)? _saxi_resetval_2 : 
                                (axis_maskaddr_16 == 3)? _saxi_resetval_3 : 
                                (axis_maskaddr_16 == 4)? _saxi_resetval_4 : 
                                (axis_maskaddr_16 == 5)? _saxi_resetval_5 : 
                                (axis_maskaddr_16 == 6)? _saxi_resetval_6 : 
                                (axis_maskaddr_16 == 7)? _saxi_resetval_7 : 'hx;
  reg _saxi_cond_0_1;
  assign saxi_wready = _saxi_register_fsm == 2;
  reg _mystream_stream_ivalid;
  wire _mystream_stream_oready;
  wire _mystream_stream_internal_oready;
  assign _mystream_stream_internal_oready = 1;
  assign _mystream_stream_oready = _mystream_stream_internal_oready;
  reg [32-1:0] _mystream_fsm;
  localparam _mystream_fsm_init = 0;
  wire _mystream_run_flag;
  reg _mystream_source_start;
  wire _mystream_source_stop;
  reg _mystream_source_busy;
  wire _mystream_sink_start;
  wire _mystream_sink_stop;
  wire _mystream_sink_busy;
  wire _mystream_busy;
  reg _mystream_busy_reg;
  wire _mystream_is_root;
  assign _mystream_is_root = 1;
  reg [32-1:0] _mystream_size_next_parameter_data;
  reg _mystream_a00_idle;
  reg [33-1:0] _mystream_a00_source_count;
  reg [5-1:0] _mystream_a00_source_mode;
  reg [16-1:0] _mystream_a00_source_generator_id;
  reg [32-1:0] _mystream_a00_source_offset;
  reg [33-1:0] _mystream_a00_source_size;
  reg [32-1:0] _mystream_a00_source_stride;
  reg [32-1:0] _mystream_a00_source_offset_buf;
  reg [33-1:0] _mystream_a00_source_size_buf;
  reg [32-1:0] _mystream_a00_source_stride_buf;
  reg [8-1:0] _mystream_a00_source_sel;
  reg [32-1:0] _mystream_a00_source_ram_raddr;
  reg _mystream_a00_source_ram_renable;
  wire [32-1:0] _mystream_a00_source_ram_rdata;
  reg _mystream_a00_source_fifo_deq;
  wire [32-1:0] _mystream_a00_source_fifo_rdata;
  reg [32-1:0] _mystream_a00_source_empty_data;
  reg _mystream_a01_idle;
  reg [33-1:0] _mystream_a01_source_count;
  reg [5-1:0] _mystream_a01_source_mode;
  reg [16-1:0] _mystream_a01_source_generator_id;
  reg [32-1:0] _mystream_a01_source_offset;
  reg [33-1:0] _mystream_a01_source_size;
  reg [32-1:0] _mystream_a01_source_stride;
  reg [32-1:0] _mystream_a01_source_offset_buf;
  reg [33-1:0] _mystream_a01_source_size_buf;
  reg [32-1:0] _mystream_a01_source_stride_buf;
  reg [8-1:0] _mystream_a01_source_sel;
  reg [32-1:0] _mystream_a01_source_ram_raddr;
  reg _mystream_a01_source_ram_renable;
  wire [32-1:0] _mystream_a01_source_ram_rdata;
  reg _mystream_a01_source_fifo_deq;
  wire [32-1:0] _mystream_a01_source_fifo_rdata;
  reg [32-1:0] _mystream_a01_source_empty_data;
  reg _mystream_a10_idle;
  reg [33-1:0] _mystream_a10_source_count;
  reg [5-1:0] _mystream_a10_source_mode;
  reg [16-1:0] _mystream_a10_source_generator_id;
  reg [32-1:0] _mystream_a10_source_offset;
  reg [33-1:0] _mystream_a10_source_size;
  reg [32-1:0] _mystream_a10_source_stride;
  reg [32-1:0] _mystream_a10_source_offset_buf;
  reg [33-1:0] _mystream_a10_source_size_buf;
  reg [32-1:0] _mystream_a10_source_stride_buf;
  reg [8-1:0] _mystream_a10_source_sel;
  reg [32-1:0] _mystream_a10_source_ram_raddr;
  reg _mystream_a10_source_ram_renable;
  wire [32-1:0] _mystream_a10_source_ram_rdata;
  reg _mystream_a10_source_fifo_deq;
  wire [32-1:0] _mystream_a10_source_fifo_rdata;
  reg [32-1:0] _mystream_a10_source_empty_data;
  reg _mystream_a11_idle;
  reg [33-1:0] _mystream_a11_source_count;
  reg [5-1:0] _mystream_a11_source_mode;
  reg [16-1:0] _mystream_a11_source_generator_id;
  reg [32-1:0] _mystream_a11_source_offset;
  reg [33-1:0] _mystream_a11_source_size;
  reg [32-1:0] _mystream_a11_source_stride;
  reg [32-1:0] _mystream_a11_source_offset_buf;
  reg [33-1:0] _mystream_a11_source_size_buf;
  reg [32-1:0] _mystream_a11_source_stride_buf;
  reg [8-1:0] _mystream_a11_source_sel;
  reg [32-1:0] _mystream_a11_source_ram_raddr;
  reg _mystream_a11_source_ram_renable;
  wire [32-1:0] _mystream_a11_source_ram_rdata;
  reg _mystream_a11_source_fifo_deq;
  wire [32-1:0] _mystream_a11_source_fifo_rdata;
  reg [32-1:0] _mystream_a11_source_empty_data;
  reg _mystream_b00_idle;
  reg [33-1:0] _mystream_b00_source_count;
  reg [5-1:0] _mystream_b00_source_mode;
  reg [16-1:0] _mystream_b00_source_generator_id;
  reg [32-1:0] _mystream_b00_source_offset;
  reg [33-1:0] _mystream_b00_source_size;
  reg [32-1:0] _mystream_b00_source_stride;
  reg [32-1:0] _mystream_b00_source_offset_buf;
  reg [33-1:0] _mystream_b00_source_size_buf;
  reg [32-1:0] _mystream_b00_source_stride_buf;
  reg [8-1:0] _mystream_b00_source_sel;
  reg [32-1:0] _mystream_b00_source_ram_raddr;
  reg _mystream_b00_source_ram_renable;
  wire [32-1:0] _mystream_b00_source_ram_rdata;
  reg _mystream_b00_source_fifo_deq;
  wire [32-1:0] _mystream_b00_source_fifo_rdata;
  reg [32-1:0] _mystream_b00_source_empty_data;
  reg _mystream_b01_idle;
  reg [33-1:0] _mystream_b01_source_count;
  reg [5-1:0] _mystream_b01_source_mode;
  reg [16-1:0] _mystream_b01_source_generator_id;
  reg [32-1:0] _mystream_b01_source_offset;
  reg [33-1:0] _mystream_b01_source_size;
  reg [32-1:0] _mystream_b01_source_stride;
  reg [32-1:0] _mystream_b01_source_offset_buf;
  reg [33-1:0] _mystream_b01_source_size_buf;
  reg [32-1:0] _mystream_b01_source_stride_buf;
  reg [8-1:0] _mystream_b01_source_sel;
  reg [32-1:0] _mystream_b01_source_ram_raddr;
  reg _mystream_b01_source_ram_renable;
  wire [32-1:0] _mystream_b01_source_ram_rdata;
  reg _mystream_b01_source_fifo_deq;
  wire [32-1:0] _mystream_b01_source_fifo_rdata;
  reg [32-1:0] _mystream_b01_source_empty_data;
  reg _mystream_b10_idle;
  reg [33-1:0] _mystream_b10_source_count;
  reg [5-1:0] _mystream_b10_source_mode;
  reg [16-1:0] _mystream_b10_source_generator_id;
  reg [32-1:0] _mystream_b10_source_offset;
  reg [33-1:0] _mystream_b10_source_size;
  reg [32-1:0] _mystream_b10_source_stride;
  reg [32-1:0] _mystream_b10_source_offset_buf;
  reg [33-1:0] _mystream_b10_source_size_buf;
  reg [32-1:0] _mystream_b10_source_stride_buf;
  reg [8-1:0] _mystream_b10_source_sel;
  reg [32-1:0] _mystream_b10_source_ram_raddr;
  reg _mystream_b10_source_ram_renable;
  wire [32-1:0] _mystream_b10_source_ram_rdata;
  reg _mystream_b10_source_fifo_deq;
  wire [32-1:0] _mystream_b10_source_fifo_rdata;
  reg [32-1:0] _mystream_b10_source_empty_data;
  reg _mystream_b11_idle;
  reg [33-1:0] _mystream_b11_source_count;
  reg [5-1:0] _mystream_b11_source_mode;
  reg [16-1:0] _mystream_b11_source_generator_id;
  reg [32-1:0] _mystream_b11_source_offset;
  reg [33-1:0] _mystream_b11_source_size;
  reg [32-1:0] _mystream_b11_source_stride;
  reg [32-1:0] _mystream_b11_source_offset_buf;
  reg [33-1:0] _mystream_b11_source_size_buf;
  reg [32-1:0] _mystream_b11_source_stride_buf;
  reg [8-1:0] _mystream_b11_source_sel;
  reg [32-1:0] _mystream_b11_source_ram_raddr;
  reg _mystream_b11_source_ram_renable;
  wire [32-1:0] _mystream_b11_source_ram_rdata;
  reg _mystream_b11_source_fifo_deq;
  wire [32-1:0] _mystream_b11_source_fifo_rdata;
  reg [32-1:0] _mystream_b11_source_empty_data;
  reg [33-1:0] _mystream_sum_list0_sink_count;
  reg [5-1:0] _mystream_sum_list0_sink_mode;
  reg [16-1:0] _mystream_sum_list0_sink_generator_id;
  reg [32-1:0] _mystream_sum_list0_sink_offset;
  reg [33-1:0] _mystream_sum_list0_sink_size;
  reg [32-1:0] _mystream_sum_list0_sink_stride;
  reg [32-1:0] _mystream_sum_list0_sink_offset_buf;
  reg [33-1:0] _mystream_sum_list0_sink_size_buf;
  reg [32-1:0] _mystream_sum_list0_sink_stride_buf;
  reg [8-1:0] _mystream_sum_list0_sink_sel;
  reg [32-1:0] _mystream_sum_list0_sink_waddr;
  reg _mystream_sum_list0_sink_wenable;
  reg [32-1:0] _mystream_sum_list0_sink_wdata;
  reg _mystream_sum_list0_sink_fifo_enq;
  reg [32-1:0] _mystream_sum_list0_sink_fifo_wdata;
  reg [32-1:0] _mystream_sum_list0_sink_immediate;
  reg [33-1:0] _mystream_sum_valid_list0_sink_count;
  reg [5-1:0] _mystream_sum_valid_list0_sink_mode;
  reg [16-1:0] _mystream_sum_valid_list0_sink_generator_id;
  reg [32-1:0] _mystream_sum_valid_list0_sink_offset;
  reg [33-1:0] _mystream_sum_valid_list0_sink_size;
  reg [32-1:0] _mystream_sum_valid_list0_sink_stride;
  reg [32-1:0] _mystream_sum_valid_list0_sink_offset_buf;
  reg [33-1:0] _mystream_sum_valid_list0_sink_size_buf;
  reg [32-1:0] _mystream_sum_valid_list0_sink_stride_buf;
  reg [8-1:0] _mystream_sum_valid_list0_sink_sel;
  reg [32-1:0] _mystream_sum_valid_list0_sink_waddr;
  reg _mystream_sum_valid_list0_sink_wenable;
  reg [1-1:0] _mystream_sum_valid_list0_sink_wdata;
  reg _mystream_sum_valid_list0_sink_fifo_enq;
  reg [1-1:0] _mystream_sum_valid_list0_sink_fifo_wdata;
  reg [1-1:0] _mystream_sum_valid_list0_sink_immediate;
  reg [33-1:0] _mystream_sum_list1_sink_count;
  reg [5-1:0] _mystream_sum_list1_sink_mode;
  reg [16-1:0] _mystream_sum_list1_sink_generator_id;
  reg [32-1:0] _mystream_sum_list1_sink_offset;
  reg [33-1:0] _mystream_sum_list1_sink_size;
  reg [32-1:0] _mystream_sum_list1_sink_stride;
  reg [32-1:0] _mystream_sum_list1_sink_offset_buf;
  reg [33-1:0] _mystream_sum_list1_sink_size_buf;
  reg [32-1:0] _mystream_sum_list1_sink_stride_buf;
  reg [8-1:0] _mystream_sum_list1_sink_sel;
  reg [32-1:0] _mystream_sum_list1_sink_waddr;
  reg _mystream_sum_list1_sink_wenable;
  reg [32-1:0] _mystream_sum_list1_sink_wdata;
  reg _mystream_sum_list1_sink_fifo_enq;
  reg [32-1:0] _mystream_sum_list1_sink_fifo_wdata;
  reg [32-1:0] _mystream_sum_list1_sink_immediate;
  reg [33-1:0] _mystream_sum_valid_list1_sink_count;
  reg [5-1:0] _mystream_sum_valid_list1_sink_mode;
  reg [16-1:0] _mystream_sum_valid_list1_sink_generator_id;
  reg [32-1:0] _mystream_sum_valid_list1_sink_offset;
  reg [33-1:0] _mystream_sum_valid_list1_sink_size;
  reg [32-1:0] _mystream_sum_valid_list1_sink_stride;
  reg [32-1:0] _mystream_sum_valid_list1_sink_offset_buf;
  reg [33-1:0] _mystream_sum_valid_list1_sink_size_buf;
  reg [32-1:0] _mystream_sum_valid_list1_sink_stride_buf;
  reg [8-1:0] _mystream_sum_valid_list1_sink_sel;
  reg [32-1:0] _mystream_sum_valid_list1_sink_waddr;
  reg _mystream_sum_valid_list1_sink_wenable;
  reg [1-1:0] _mystream_sum_valid_list1_sink_wdata;
  reg _mystream_sum_valid_list1_sink_fifo_enq;
  reg [1-1:0] _mystream_sum_valid_list1_sink_fifo_wdata;
  reg [1-1:0] _mystream_sum_valid_list1_sink_immediate;
  reg [32-1:0] th_matmul;
  localparam th_matmul_init = 0;
  reg signed [32-1:0] _th_matmul_matrix_size_0;
  reg signed [32-1:0] _th_matmul_a_offset_1;
  reg signed [32-1:0] _th_matmul_b_offset_2;
  reg signed [32-1:0] _th_matmul_c_offset_3;
  reg signed [32-1:0] _th_matmul_offset_4;
  reg signed [32-1:0] _th_matmul_matrix_size_a_5;
  reg signed [32-1:0] _th_matmul_matrix_size_b_6;
  reg signed [32-1:0] _th_matmul_matrix_size_k_7;
  reg signed [32-1:0] _th_matmul_c_offset_8;
  reg signed [32-1:0] _th_matmul_i_9;
  wire [32-1:0] _dma_read_packed_high_local_size_20;
  assign _dma_read_packed_high_local_size_20 = _th_matmul_matrix_size_a_5 >> 1;
  wire [1-1:0] _dma_read_packed_low_local_size_21;
  assign _dma_read_packed_low_local_size_21 = _th_matmul_matrix_size_a_5 & { 1{ 1'd1 } };
  wire [32-1:0] _dma_read_packed_local_packed_size_22;
  assign _dma_read_packed_local_packed_size_22 = (_dma_read_packed_low_local_size_21 > 0)? _dma_read_packed_high_local_size_20 + 1 : _dma_read_packed_high_local_size_20;
  wire [32-1:0] mask_addr_shifted_23;
  assign mask_addr_shifted_23 = 0 + ((_th_matmul_i_9 << 5) << 2) >> 2;
  wire [32-1:0] mask_addr_masked_24;
  assign mask_addr_masked_24 = mask_addr_shifted_23 << 2;
  reg [32-1:0] _maxi_read_req_fsm;
  localparam _maxi_read_req_fsm_init = 0;
  reg [33-1:0] _maxi_read_cur_global_size;
  reg _maxi_read_cont;
  wire [8-1:0] pack_read_req_op_sel_25;
  wire [32-1:0] pack_read_req_local_addr_26;
  wire [32-1:0] pack_read_req_local_stride_27;
  wire [33-1:0] pack_read_req_local_size_28;
  wire [32-1:0] pack_read_req_local_blocksize_29;
  assign pack_read_req_op_sel_25 = _maxi_read_op_sel;
  assign pack_read_req_local_addr_26 = _maxi_read_local_addr;
  assign pack_read_req_local_stride_27 = _maxi_read_local_stride;
  assign pack_read_req_local_size_28 = _maxi_read_local_size;
  assign pack_read_req_local_blocksize_29 = _maxi_read_local_blocksize;
  wire [137-1:0] pack_read_req_packed_30;
  assign pack_read_req_packed_30 = { pack_read_req_op_sel_25, pack_read_req_local_addr_26, pack_read_req_local_stride_27, pack_read_req_local_size_28, pack_read_req_local_blocksize_29 };
  assign _maxi_read_req_fifo_wdata = ((_maxi_read_req_fsm == 0) && _maxi_read_start && !_maxi_read_req_fifo_almost_full)? pack_read_req_packed_30 : 'hx;
  assign _maxi_read_req_fifo_enq = ((_maxi_read_req_fsm == 0) && _maxi_read_start && !_maxi_read_req_fifo_almost_full)? (_maxi_read_req_fsm == 0) && _maxi_read_start && !_maxi_read_req_fifo_almost_full && !_maxi_read_req_fifo_almost_full : 0;
  localparam _tmp_31 = 1;
  wire [_tmp_31-1:0] _tmp_32;
  assign _tmp_32 = !_maxi_read_req_fifo_almost_full;
  reg [_tmp_31-1:0] __tmp_32_1;
  wire [32-1:0] mask_addr_shifted_33;
  assign mask_addr_shifted_33 = _maxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_34;
  assign mask_addr_masked_34 = mask_addr_shifted_33 << 2;
  wire [32-1:0] mask_addr_shifted_35;
  assign mask_addr_shifted_35 = _maxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_36;
  assign mask_addr_masked_36 = mask_addr_shifted_35 << 2;
  wire [32-1:0] mask_addr_shifted_37;
  assign mask_addr_shifted_37 = _maxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_38;
  assign mask_addr_masked_38 = mask_addr_shifted_37 << 2;
  wire [32-1:0] mask_addr_shifted_39;
  assign mask_addr_shifted_39 = _maxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_40;
  assign mask_addr_masked_40 = mask_addr_shifted_39 << 2;
  wire [32-1:0] mask_addr_shifted_41;
  assign mask_addr_shifted_41 = _maxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_42;
  assign mask_addr_masked_42 = mask_addr_shifted_41 << 2;
  wire [32-1:0] mask_addr_shifted_43;
  assign mask_addr_shifted_43 = _maxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_44;
  assign mask_addr_masked_44 = mask_addr_shifted_43 << 2;
  reg _maxi_cond_0_1;
  reg [32-1:0] _maxi_read_data_narrow_fsm;
  localparam _maxi_read_data_narrow_fsm_init = 0;
  reg [64-1:0] _maxi_read_narrow_wdata_45;
  reg _maxi_read_narrow_wvalid_46;
  reg [1-1:0] _maxi_read_narrow_count_47;
  reg [32-1:0] write_burst_packed_fsm_0;
  localparam write_burst_packed_fsm_0_init = 0;
  reg [21-1:0] write_burst_packed_addr_48;
  reg [21-1:0] write_burst_packed_stride_49;
  reg [33-1:0] write_burst_packed_length_50;
  reg write_burst_packed_done_51;
  wire [20-1:0] write_burst_packed_ram_addr_52;
  assign write_burst_packed_ram_addr_52 = write_burst_packed_addr_48 >> 1;
  wire [32-1:0] write_burst_packed_ram_wdata_53;
  assign write_burst_packed_ram_wdata_53 = _maxi_read_narrow_wdata_45 >> 0;
  assign ram_a0_0_0_wdata = ((write_burst_packed_fsm_0 == 1) && _maxi_read_narrow_wvalid_46)? write_burst_packed_ram_wdata_53 : 'hx;
  assign ram_a0_0_0_wenable = ((write_burst_packed_fsm_0 == 1) && _maxi_read_narrow_wvalid_46)? 1'd1 : 0;
  wire [20-1:0] write_burst_packed_ram_addr_54;
  assign write_burst_packed_ram_addr_54 = write_burst_packed_addr_48 >> 1;
  wire [32-1:0] write_burst_packed_ram_wdata_55;
  assign write_burst_packed_ram_wdata_55 = _maxi_read_narrow_wdata_45 >> 32;
  assign ram_a0_1_0_wdata = ((write_burst_packed_fsm_0 == 1) && _maxi_read_narrow_wvalid_46)? write_burst_packed_ram_wdata_55 : 'hx;
  assign ram_a0_1_0_wenable = ((write_burst_packed_fsm_0 == 1) && _maxi_read_narrow_wvalid_46)? 1'd1 : 0;
  wire [32-1:0] _dma_read_packed_high_local_size_56;
  assign _dma_read_packed_high_local_size_56 = _th_matmul_matrix_size_a_5 >> 1;
  wire [1-1:0] _dma_read_packed_low_local_size_57;
  assign _dma_read_packed_low_local_size_57 = _th_matmul_matrix_size_a_5 & { 1{ 1'd1 } };
  wire [32-1:0] _dma_read_packed_local_packed_size_58;
  assign _dma_read_packed_local_packed_size_58 = (_dma_read_packed_low_local_size_57 > 0)? _dma_read_packed_high_local_size_56 + 1 : _dma_read_packed_high_local_size_56;
  wire [32-1:0] mask_addr_shifted_59;
  assign mask_addr_shifted_59 = 0 + ((_th_matmul_i_9 << 5) << 2) >> 2;
  wire [32-1:0] mask_addr_masked_60;
  assign mask_addr_masked_60 = mask_addr_shifted_59 << 2;
  reg [64-1:0] _maxi_read_narrow_wdata_61;
  reg _maxi_read_narrow_wvalid_62;
  reg [1-1:0] _maxi_read_narrow_count_63;
  reg [32-1:0] write_burst_packed_fsm_1;
  localparam write_burst_packed_fsm_1_init = 0;
  reg [21-1:0] write_burst_packed_addr_64;
  reg [21-1:0] write_burst_packed_stride_65;
  reg [33-1:0] write_burst_packed_length_66;
  reg write_burst_packed_done_67;
  wire [20-1:0] write_burst_packed_ram_addr_68;
  assign write_burst_packed_ram_addr_68 = write_burst_packed_addr_64 >> 1;
  wire [32-1:0] write_burst_packed_ram_wdata_69;
  assign write_burst_packed_ram_wdata_69 = _maxi_read_narrow_wdata_61 >> 0;
  assign ram_a1_0_0_wdata = ((write_burst_packed_fsm_1 == 1) && _maxi_read_narrow_wvalid_62)? write_burst_packed_ram_wdata_69 : 'hx;
  assign ram_a1_0_0_wenable = ((write_burst_packed_fsm_1 == 1) && _maxi_read_narrow_wvalid_62)? 1'd1 : 0;
  wire [20-1:0] write_burst_packed_ram_addr_70;
  assign write_burst_packed_ram_addr_70 = write_burst_packed_addr_64 >> 1;
  wire [32-1:0] write_burst_packed_ram_wdata_71;
  assign write_burst_packed_ram_wdata_71 = _maxi_read_narrow_wdata_61 >> 32;
  assign ram_a1_1_0_wdata = ((write_burst_packed_fsm_1 == 1) && _maxi_read_narrow_wvalid_62)? write_burst_packed_ram_wdata_71 : 'hx;
  assign ram_a1_1_0_wenable = ((write_burst_packed_fsm_1 == 1) && _maxi_read_narrow_wvalid_62)? 1'd1 : 0;
  reg signed [32-1:0] _th_matmul_j_10;
  wire [32-1:0] _dma_read_packed_high_local_size_72;
  assign _dma_read_packed_high_local_size_72 = _th_matmul_matrix_size_b_6 >> 1;
  wire [1-1:0] _dma_read_packed_low_local_size_73;
  assign _dma_read_packed_low_local_size_73 = _th_matmul_matrix_size_b_6 & { 1{ 1'd1 } };
  wire [32-1:0] _dma_read_packed_local_packed_size_74;
  assign _dma_read_packed_local_packed_size_74 = (_dma_read_packed_low_local_size_73 > 0)? _dma_read_packed_high_local_size_72 + 1 : _dma_read_packed_high_local_size_72;
  wire [32-1:0] mask_addr_shifted_75;
  assign mask_addr_shifted_75 = _th_matmul_matrix_size_b_6 * 0 * 4 + (4096 + (((_th_matmul_j_10 << 1) << 5) << 2)) >> 2;
  wire [32-1:0] mask_addr_masked_76;
  assign mask_addr_masked_76 = mask_addr_shifted_75 << 2;
  reg [64-1:0] _maxi_read_narrow_wdata_77;
  reg _maxi_read_narrow_wvalid_78;
  reg [1-1:0] _maxi_read_narrow_count_79;
  reg [32-1:0] write_burst_packed_fsm_2;
  localparam write_burst_packed_fsm_2_init = 0;
  reg [21-1:0] write_burst_packed_addr_80;
  reg [21-1:0] write_burst_packed_stride_81;
  reg [33-1:0] write_burst_packed_length_82;
  reg write_burst_packed_done_83;
  wire [20-1:0] write_burst_packed_ram_addr_84;
  assign write_burst_packed_ram_addr_84 = write_burst_packed_addr_80 >> 1;
  wire [32-1:0] write_burst_packed_ram_wdata_85;
  assign write_burst_packed_ram_wdata_85 = _maxi_read_narrow_wdata_77 >> 0;
  assign ram_b0_0_0_wdata = ((write_burst_packed_fsm_2 == 1) && _maxi_read_narrow_wvalid_78)? write_burst_packed_ram_wdata_85 : 'hx;
  assign ram_b0_0_0_wenable = ((write_burst_packed_fsm_2 == 1) && _maxi_read_narrow_wvalid_78)? 1'd1 : 0;
  wire [20-1:0] write_burst_packed_ram_addr_86;
  assign write_burst_packed_ram_addr_86 = write_burst_packed_addr_80 >> 1;
  wire [32-1:0] write_burst_packed_ram_wdata_87;
  assign write_burst_packed_ram_wdata_87 = _maxi_read_narrow_wdata_77 >> 32;
  assign ram_b0_1_0_wdata = ((write_burst_packed_fsm_2 == 1) && _maxi_read_narrow_wvalid_78)? write_burst_packed_ram_wdata_87 : 'hx;
  assign ram_b0_1_0_wenable = ((write_burst_packed_fsm_2 == 1) && _maxi_read_narrow_wvalid_78)? 1'd1 : 0;
  wire [32-1:0] _dma_read_packed_high_local_size_88;
  assign _dma_read_packed_high_local_size_88 = _th_matmul_matrix_size_b_6 >> 1;
  wire [1-1:0] _dma_read_packed_low_local_size_89;
  assign _dma_read_packed_low_local_size_89 = _th_matmul_matrix_size_b_6 & { 1{ 1'd1 } };
  wire [32-1:0] _dma_read_packed_local_packed_size_90;
  assign _dma_read_packed_local_packed_size_90 = (_dma_read_packed_low_local_size_89 > 0)? _dma_read_packed_high_local_size_88 + 1 : _dma_read_packed_high_local_size_88;
  wire [32-1:0] mask_addr_shifted_91;
  assign mask_addr_shifted_91 = _th_matmul_matrix_size_b_6 * 1 * 4 + (4096 + (((_th_matmul_j_10 << 1) << 5) << 2)) >> 2;
  wire [32-1:0] mask_addr_masked_92;
  assign mask_addr_masked_92 = mask_addr_shifted_91 << 2;
  assign _maxi_read_req_fifo_deq = ((_maxi_read_data_narrow_fsm == 0) && (_maxi_read_data_idle && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 4)) && !_maxi_read_req_fifo_empty)? 1 : 
                                   ((_maxi_read_data_narrow_fsm == 0) && (_maxi_read_data_idle && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 3)) && !_maxi_read_req_fifo_empty)? 1 : 
                                   ((_maxi_read_data_narrow_fsm == 0) && (_maxi_read_data_idle && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 2)) && !_maxi_read_req_fifo_empty)? 1 : 
                                   ((_maxi_read_data_narrow_fsm == 0) && (_maxi_read_data_idle && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 1)) && !_maxi_read_req_fifo_empty)? 1 : 0;
  reg [64-1:0] _maxi_read_narrow_wdata_93;
  reg _maxi_read_narrow_wvalid_94;
  reg [1-1:0] _maxi_read_narrow_count_95;
  reg [32-1:0] write_burst_packed_fsm_3;
  localparam write_burst_packed_fsm_3_init = 0;
  reg [21-1:0] write_burst_packed_addr_96;
  reg [21-1:0] write_burst_packed_stride_97;
  reg [33-1:0] write_burst_packed_length_98;
  reg write_burst_packed_done_99;
  wire [20-1:0] write_burst_packed_ram_addr_100;
  assign write_burst_packed_ram_addr_100 = write_burst_packed_addr_96 >> 1;
  wire [32-1:0] write_burst_packed_ram_wdata_101;
  assign write_burst_packed_ram_wdata_101 = _maxi_read_narrow_wdata_93 >> 0;
  assign ram_b1_0_0_wdata = ((write_burst_packed_fsm_3 == 1) && _maxi_read_narrow_wvalid_94)? write_burst_packed_ram_wdata_101 : 'hx;
  assign ram_b1_0_0_wenable = ((write_burst_packed_fsm_3 == 1) && _maxi_read_narrow_wvalid_94)? 1'd1 : 0;
  wire [20-1:0] write_burst_packed_ram_addr_102;
  assign write_burst_packed_ram_addr_102 = write_burst_packed_addr_96 >> 1;
  wire [32-1:0] write_burst_packed_ram_wdata_103;
  assign write_burst_packed_ram_wdata_103 = _maxi_read_narrow_wdata_93 >> 32;
  assign ram_b1_1_0_wdata = ((write_burst_packed_fsm_3 == 1) && _maxi_read_narrow_wvalid_94)? write_burst_packed_ram_wdata_103 : 'hx;
  assign ram_b1_1_0_wenable = ((write_burst_packed_fsm_3 == 1) && _maxi_read_narrow_wvalid_94)? 1'd1 : 0;
  assign maxi_rready = (_maxi_read_data_narrow_fsm == 2) || (_maxi_read_data_narrow_fsm == 2) || (_maxi_read_data_narrow_fsm == 2) || (_maxi_read_data_narrow_fsm == 2);
  reg signed [32-1:0] _th_matmul_size_11;
  reg signed [32-1:0] _th_matmul_offset_12;
  reg signed [32-1:0] _th_matmul_indexa_13;
  reg signed [32-1:0] _th_matmul_indexb_14;
  reg signed [32-1:0] _th_matmul__size_15;
  wire signed [32-1:0] mystream_size_data;
  wire signed [32-1:0] mystream_a00_data;
  wire signed [32-1:0] mystream_a01_data;
  wire signed [32-1:0] mystream_a10_data;
  wire signed [32-1:0] mystream_a11_data;
  wire signed [32-1:0] mystream_b00_data;
  wire signed [32-1:0] mystream_b01_data;
  wire signed [32-1:0] mystream_b10_data;
  wire signed [32-1:0] mystream_b11_data;
  wire [1-1:0] mystream__reduce_reset_data;
  reg __mystream_stream_ivalid_1;
  reg __mystream_stream_ivalid_2;
  reg __mystream_stream_ivalid_3;
  reg __mystream_stream_ivalid_4;
  reg __mystream_stream_ivalid_5;
  wire signed [64-1:0] _times_mul_odata_9;
  reg signed [64-1:0] _times_mul_odata_reg_9;
  wire signed [32-1:0] _times_data_9;
  assign _times_data_9 = _times_mul_odata_reg_9;
  wire _times_mul_update_9;
  assign _times_mul_update_9 = _mystream_stream_oready;

  multiplier_0
  _times_mul_9
  (
    .CLK(CLK),
    .update(_times_mul_update_9),
    .a(mystream_a00_data),
    .b(mystream_b00_data),
    .c(_times_mul_odata_9)
  );

  wire signed [64-1:0] _times_mul_odata_10;
  reg signed [64-1:0] _times_mul_odata_reg_10;
  wire signed [32-1:0] _times_data_10;
  assign _times_data_10 = _times_mul_odata_reg_10;
  wire _times_mul_update_10;
  assign _times_mul_update_10 = _mystream_stream_oready;

  multiplier_1
  _times_mul_10
  (
    .CLK(CLK),
    .update(_times_mul_update_10),
    .a(mystream_a01_data),
    .b(mystream_b01_data),
    .c(_times_mul_odata_10)
  );

  wire signed [64-1:0] _times_mul_odata_11;
  reg signed [64-1:0] _times_mul_odata_reg_11;
  wire signed [32-1:0] _times_data_11;
  assign _times_data_11 = _times_mul_odata_reg_11;
  wire _times_mul_update_11;
  assign _times_mul_update_11 = _mystream_stream_oready;

  multiplier_2
  _times_mul_11
  (
    .CLK(CLK),
    .update(_times_mul_update_11),
    .a(mystream_a10_data),
    .b(mystream_b10_data),
    .c(_times_mul_odata_11)
  );

  wire signed [64-1:0] _times_mul_odata_12;
  reg signed [64-1:0] _times_mul_odata_reg_12;
  wire signed [32-1:0] _times_data_12;
  assign _times_data_12 = _times_mul_odata_reg_12;
  wire _times_mul_update_12;
  assign _times_mul_update_12 = _mystream_stream_oready;

  multiplier_3
  _times_mul_12
  (
    .CLK(CLK),
    .update(_times_mul_update_12),
    .a(mystream_a11_data),
    .b(mystream_b11_data),
    .c(_times_mul_odata_12)
  );

  reg signed [32-1:0] __delay_data_24__variable_0;
  reg [1-1:0] __delay_data_28__variable_15;
  reg signed [32-1:0] __delay_data_25__delay_24__variable_0;
  reg [1-1:0] __delay_data_29__delay_28__variable_15;
  reg signed [32-1:0] __delay_data_26__delay_25__delay_24__variable_0;
  reg [1-1:0] __delay_data_30__delay_29__delay_28__variable_15;
  reg signed [32-1:0] __plusn_data_13;
  reg signed [32-1:0] __plusn_data_14;
  reg signed [32-1:0] __delay_data_27__delay_26__delay_25__delay_24__variable_0;
  reg [1-1:0] __delay_data_31__delay_30__delay_29__delay_28__variable_15;
  reg signed [32-1:0] _reduceadd_data_16;
  reg [33-1:0] _reduceadd_count_16;
  reg _reduceadd_prev_count_max_16;
  wire _reduceadd_reset_cond_16;
  assign _reduceadd_reset_cond_16 = __delay_data_31__delay_30__delay_29__delay_28__variable_15 || _reduceadd_prev_count_max_16;
  wire [33-1:0] _reduceadd_current_count_16;
  assign _reduceadd_current_count_16 = (_reduceadd_reset_cond_16)? 0 : _reduceadd_count_16;
  wire signed [32-1:0] _reduceadd_current_data_16;
  assign _reduceadd_current_data_16 = (_reduceadd_reset_cond_16)? 1'sd0 : _reduceadd_data_16;
  reg [1-1:0] _pulse_data_18;
  reg [33-1:0] _pulse_count_18;
  reg _pulse_prev_count_max_18;
  wire _pulse_reset_cond_18;
  assign _pulse_reset_cond_18 = __delay_data_31__delay_30__delay_29__delay_28__variable_15 || _pulse_prev_count_max_18;
  wire [33-1:0] _pulse_current_count_18;
  assign _pulse_current_count_18 = (_pulse_reset_cond_18)? 0 : _pulse_count_18;
  wire [1-1:0] _pulse_current_data_18;
  assign _pulse_current_data_18 = (_pulse_reset_cond_18)? 1'sd0 : _pulse_data_18;
  reg signed [32-1:0] _reduceadd_data_20;
  reg [33-1:0] _reduceadd_count_20;
  reg _reduceadd_prev_count_max_20;
  wire _reduceadd_reset_cond_20;
  assign _reduceadd_reset_cond_20 = __delay_data_31__delay_30__delay_29__delay_28__variable_15 || _reduceadd_prev_count_max_20;
  wire [33-1:0] _reduceadd_current_count_20;
  assign _reduceadd_current_count_20 = (_reduceadd_reset_cond_20)? 0 : _reduceadd_count_20;
  wire signed [32-1:0] _reduceadd_current_data_20;
  assign _reduceadd_current_data_20 = (_reduceadd_reset_cond_20)? 1'sd0 : _reduceadd_data_20;
  reg [1-1:0] _pulse_data_22;
  reg [33-1:0] _pulse_count_22;
  reg _pulse_prev_count_max_22;
  wire _pulse_reset_cond_22;
  assign _pulse_reset_cond_22 = __delay_data_31__delay_30__delay_29__delay_28__variable_15 || _pulse_prev_count_max_22;
  wire [33-1:0] _pulse_current_count_22;
  assign _pulse_current_count_22 = (_pulse_reset_cond_22)? 0 : _pulse_count_22;
  wire [1-1:0] _pulse_current_data_22;
  assign _pulse_current_data_22 = (_pulse_reset_cond_22)? 1'sd0 : _pulse_data_22;
  wire signed [32-1:0] mystream_sum_list0_data;
  assign mystream_sum_list0_data = _reduceadd_data_16;
  wire [1-1:0] mystream_sum_valid_list0_data;
  assign mystream_sum_valid_list0_data = _pulse_data_18;
  wire signed [32-1:0] mystream_sum_list1_data;
  assign mystream_sum_list1_data = _reduceadd_data_20;
  wire [1-1:0] mystream_sum_valid_list1_data;
  assign mystream_sum_valid_list1_data = _pulse_data_22;
  wire _set_flag_104;
  assign _set_flag_104 = th_matmul == 24;
  reg signed [32-1:0] __variable_wdata_0;
  assign mystream_size_data = __variable_wdata_0;
  wire _set_flag_105;
  assign _set_flag_105 = th_matmul == 25;
  assign ram_a0_0_0_addr = (_mystream_stream_oready && _mystream_a00_source_ram_renable && (_mystream_a00_source_sel == 1))? _mystream_a00_source_ram_raddr : 
                           ((write_burst_packed_fsm_0 == 1) && _maxi_read_narrow_wvalid_46)? write_burst_packed_ram_addr_52 : 'hx;
  assign ram_a0_0_0_enable = (_mystream_stream_oready && _mystream_a00_source_ram_renable && (_mystream_a00_source_sel == 1))? 1'd1 : 
                             ((write_burst_packed_fsm_0 == 1) && _maxi_read_narrow_wvalid_46)? 1'd1 : 0;
  localparam _tmp_106 = 1;
  wire [_tmp_106-1:0] _tmp_107;
  assign _tmp_107 = _mystream_stream_oready && _mystream_a00_source_ram_renable && (_mystream_a00_source_sel == 1);
  reg [_tmp_106-1:0] __tmp_107_1;
  assign _mystream_a00_source_ram_rdata = (_mystream_a00_source_sel == 1)? ram_a0_0_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_1;
  assign mystream_a00_data = __variable_wdata_1;
  reg [32-1:0] _mystream_a00_source_fsm_0;
  localparam _mystream_a00_source_fsm_0_init = 0;
  wire _set_flag_108;
  assign _set_flag_108 = th_matmul == 26;
  assign ram_a0_1_0_addr = (_mystream_stream_oready && _mystream_a01_source_ram_renable && (_mystream_a01_source_sel == 2))? _mystream_a01_source_ram_raddr : 
                           ((write_burst_packed_fsm_0 == 1) && _maxi_read_narrow_wvalid_46)? write_burst_packed_ram_addr_54 : 'hx;
  assign ram_a0_1_0_enable = (_mystream_stream_oready && _mystream_a01_source_ram_renable && (_mystream_a01_source_sel == 2))? 1'd1 : 
                             ((write_burst_packed_fsm_0 == 1) && _maxi_read_narrow_wvalid_46)? 1'd1 : 0;
  localparam _tmp_109 = 1;
  wire [_tmp_109-1:0] _tmp_110;
  assign _tmp_110 = _mystream_stream_oready && _mystream_a01_source_ram_renable && (_mystream_a01_source_sel == 2);
  reg [_tmp_109-1:0] __tmp_110_1;
  assign _mystream_a01_source_ram_rdata = (_mystream_a01_source_sel == 2)? ram_a0_1_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_2;
  assign mystream_a01_data = __variable_wdata_2;
  reg [32-1:0] _mystream_a01_source_fsm_1;
  localparam _mystream_a01_source_fsm_1_init = 0;
  wire _set_flag_111;
  assign _set_flag_111 = th_matmul == 27;
  assign ram_a1_0_0_addr = (_mystream_stream_oready && _mystream_a10_source_ram_renable && (_mystream_a10_source_sel == 3))? _mystream_a10_source_ram_raddr : 
                           ((write_burst_packed_fsm_1 == 1) && _maxi_read_narrow_wvalid_62)? write_burst_packed_ram_addr_68 : 'hx;
  assign ram_a1_0_0_enable = (_mystream_stream_oready && _mystream_a10_source_ram_renable && (_mystream_a10_source_sel == 3))? 1'd1 : 
                             ((write_burst_packed_fsm_1 == 1) && _maxi_read_narrow_wvalid_62)? 1'd1 : 0;
  localparam _tmp_112 = 1;
  wire [_tmp_112-1:0] _tmp_113;
  assign _tmp_113 = _mystream_stream_oready && _mystream_a10_source_ram_renable && (_mystream_a10_source_sel == 3);
  reg [_tmp_112-1:0] __tmp_113_1;
  assign _mystream_a10_source_ram_rdata = (_mystream_a10_source_sel == 3)? ram_a1_0_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_3;
  assign mystream_a10_data = __variable_wdata_3;
  reg [32-1:0] _mystream_a10_source_fsm_2;
  localparam _mystream_a10_source_fsm_2_init = 0;
  wire _set_flag_114;
  assign _set_flag_114 = th_matmul == 28;
  assign ram_a1_1_0_addr = (_mystream_stream_oready && _mystream_a11_source_ram_renable && (_mystream_a11_source_sel == 4))? _mystream_a11_source_ram_raddr : 
                           ((write_burst_packed_fsm_1 == 1) && _maxi_read_narrow_wvalid_62)? write_burst_packed_ram_addr_70 : 'hx;
  assign ram_a1_1_0_enable = (_mystream_stream_oready && _mystream_a11_source_ram_renable && (_mystream_a11_source_sel == 4))? 1'd1 : 
                             ((write_burst_packed_fsm_1 == 1) && _maxi_read_narrow_wvalid_62)? 1'd1 : 0;
  localparam _tmp_115 = 1;
  wire [_tmp_115-1:0] _tmp_116;
  assign _tmp_116 = _mystream_stream_oready && _mystream_a11_source_ram_renable && (_mystream_a11_source_sel == 4);
  reg [_tmp_115-1:0] __tmp_116_1;
  assign _mystream_a11_source_ram_rdata = (_mystream_a11_source_sel == 4)? ram_a1_1_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_4;
  assign mystream_a11_data = __variable_wdata_4;
  reg [32-1:0] _mystream_a11_source_fsm_3;
  localparam _mystream_a11_source_fsm_3_init = 0;
  wire _set_flag_117;
  assign _set_flag_117 = th_matmul == 29;
  assign ram_b0_0_0_addr = (_mystream_stream_oready && _mystream_b00_source_ram_renable && (_mystream_b00_source_sel == 5))? _mystream_b00_source_ram_raddr : 
                           ((write_burst_packed_fsm_2 == 1) && _maxi_read_narrow_wvalid_78)? write_burst_packed_ram_addr_84 : 'hx;
  assign ram_b0_0_0_enable = (_mystream_stream_oready && _mystream_b00_source_ram_renable && (_mystream_b00_source_sel == 5))? 1'd1 : 
                             ((write_burst_packed_fsm_2 == 1) && _maxi_read_narrow_wvalid_78)? 1'd1 : 0;
  localparam _tmp_118 = 1;
  wire [_tmp_118-1:0] _tmp_119;
  assign _tmp_119 = _mystream_stream_oready && _mystream_b00_source_ram_renable && (_mystream_b00_source_sel == 5);
  reg [_tmp_118-1:0] __tmp_119_1;
  assign _mystream_b00_source_ram_rdata = (_mystream_b00_source_sel == 5)? ram_b0_0_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_5;
  assign mystream_b00_data = __variable_wdata_5;
  reg [32-1:0] _mystream_b00_source_fsm_4;
  localparam _mystream_b00_source_fsm_4_init = 0;
  wire _set_flag_120;
  assign _set_flag_120 = th_matmul == 30;
  assign ram_b0_1_0_addr = (_mystream_stream_oready && _mystream_b01_source_ram_renable && (_mystream_b01_source_sel == 6))? _mystream_b01_source_ram_raddr : 
                           ((write_burst_packed_fsm_2 == 1) && _maxi_read_narrow_wvalid_78)? write_burst_packed_ram_addr_86 : 'hx;
  assign ram_b0_1_0_enable = (_mystream_stream_oready && _mystream_b01_source_ram_renable && (_mystream_b01_source_sel == 6))? 1'd1 : 
                             ((write_burst_packed_fsm_2 == 1) && _maxi_read_narrow_wvalid_78)? 1'd1 : 0;
  localparam _tmp_121 = 1;
  wire [_tmp_121-1:0] _tmp_122;
  assign _tmp_122 = _mystream_stream_oready && _mystream_b01_source_ram_renable && (_mystream_b01_source_sel == 6);
  reg [_tmp_121-1:0] __tmp_122_1;
  assign _mystream_b01_source_ram_rdata = (_mystream_b01_source_sel == 6)? ram_b0_1_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_6;
  assign mystream_b01_data = __variable_wdata_6;
  reg [32-1:0] _mystream_b01_source_fsm_5;
  localparam _mystream_b01_source_fsm_5_init = 0;
  wire _set_flag_123;
  assign _set_flag_123 = th_matmul == 31;
  assign ram_b1_0_0_addr = (_mystream_stream_oready && _mystream_b10_source_ram_renable && (_mystream_b10_source_sel == 7))? _mystream_b10_source_ram_raddr : 
                           ((write_burst_packed_fsm_3 == 1) && _maxi_read_narrow_wvalid_94)? write_burst_packed_ram_addr_100 : 'hx;
  assign ram_b1_0_0_enable = (_mystream_stream_oready && _mystream_b10_source_ram_renable && (_mystream_b10_source_sel == 7))? 1'd1 : 
                             ((write_burst_packed_fsm_3 == 1) && _maxi_read_narrow_wvalid_94)? 1'd1 : 0;
  localparam _tmp_124 = 1;
  wire [_tmp_124-1:0] _tmp_125;
  assign _tmp_125 = _mystream_stream_oready && _mystream_b10_source_ram_renable && (_mystream_b10_source_sel == 7);
  reg [_tmp_124-1:0] __tmp_125_1;
  assign _mystream_b10_source_ram_rdata = (_mystream_b10_source_sel == 7)? ram_b1_0_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_7;
  assign mystream_b10_data = __variable_wdata_7;
  reg [32-1:0] _mystream_b10_source_fsm_6;
  localparam _mystream_b10_source_fsm_6_init = 0;
  wire _set_flag_126;
  assign _set_flag_126 = th_matmul == 32;
  assign ram_b1_1_0_addr = (_mystream_stream_oready && _mystream_b11_source_ram_renable && (_mystream_b11_source_sel == 8))? _mystream_b11_source_ram_raddr : 
                           ((write_burst_packed_fsm_3 == 1) && _maxi_read_narrow_wvalid_94)? write_burst_packed_ram_addr_102 : 'hx;
  assign ram_b1_1_0_enable = (_mystream_stream_oready && _mystream_b11_source_ram_renable && (_mystream_b11_source_sel == 8))? 1'd1 : 
                             ((write_burst_packed_fsm_3 == 1) && _maxi_read_narrow_wvalid_94)? 1'd1 : 0;
  localparam _tmp_127 = 1;
  wire [_tmp_127-1:0] _tmp_128;
  assign _tmp_128 = _mystream_stream_oready && _mystream_b11_source_ram_renable && (_mystream_b11_source_sel == 8);
  reg [_tmp_127-1:0] __tmp_128_1;
  assign _mystream_b11_source_ram_rdata = (_mystream_b11_source_sel == 8)? ram_b1_1_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_8;
  assign mystream_b11_data = __variable_wdata_8;
  reg [32-1:0] _mystream_b11_source_fsm_7;
  localparam _mystream_b11_source_fsm_7_init = 0;
  wire _set_flag_129;
  assign _set_flag_129 = th_matmul == 33;
  reg _tmp_130;
  reg _tmp_131;
  reg _tmp_132;
  reg _tmp_133;
  reg _tmp_134;
  reg _tmp_135;
  reg _tmp_136;
  reg signed [32-1:0] _tmp_137;
  reg signed [32-1:0] _tmp_138;
  reg signed [32-1:0] _tmp_139;
  reg signed [32-1:0] _tmp_140;
  reg signed [32-1:0] _tmp_141;
  reg signed [32-1:0] _tmp_142;
  reg signed [32-1:0] _tmp_143;
  assign ram_c_0_0_wdata = (_mystream_stream_oready && _mystream_sum_list0_sink_wenable && (_mystream_sum_list0_sink_sel == 9))? _mystream_sum_list0_sink_wdata : 'hx;
  assign ram_c_0_0_wenable = (_mystream_stream_oready && _mystream_sum_list0_sink_wenable && (_mystream_sum_list0_sink_sel == 9))? 1'd1 : 0;
  reg [32-1:0] _mystream_sum_list0_sink_fsm_8;
  localparam _mystream_sum_list0_sink_fsm_8_init = 0;
  wire _set_flag_144;
  assign _set_flag_144 = th_matmul == 33;
  reg _tmp_145;
  reg _tmp_146;
  reg _tmp_147;
  reg _tmp_148;
  reg _tmp_149;
  reg _tmp_150;
  reg _tmp_151;
  reg signed [32-1:0] _tmp_152;
  reg signed [32-1:0] _tmp_153;
  reg signed [32-1:0] _tmp_154;
  reg signed [32-1:0] _tmp_155;
  reg signed [32-1:0] _tmp_156;
  reg signed [32-1:0] _tmp_157;
  reg signed [32-1:0] _tmp_158;
  assign ram_c_1_0_wdata = (_mystream_stream_oready && _mystream_sum_list1_sink_wenable && (_mystream_sum_list1_sink_sel == 10))? _mystream_sum_list1_sink_wdata : 'hx;
  assign ram_c_1_0_wenable = (_mystream_stream_oready && _mystream_sum_list1_sink_wenable && (_mystream_sum_list1_sink_sel == 10))? 1'd1 : 0;
  reg [32-1:0] _mystream_sum_list1_sink_fsm_9;
  localparam _mystream_sum_list1_sink_fsm_9_init = 0;
  wire _set_flag_159;
  assign _set_flag_159 = th_matmul == 33;
  assign _mystream_run_flag = (_set_flag_159)? 1 : 0;
  reg _tmp_160;
  reg _tmp_161;
  reg _tmp_162;
  reg _tmp_163;
  reg _tmp_164;
  reg _tmp_165;
  reg [1-1:0] __variable_wdata_15;
  assign mystream__reduce_reset_data = __variable_wdata_15;
  reg _tmp_166;
  reg _tmp_167;
  reg _tmp_168;
  reg _tmp_169;
  assign _mystream_source_stop = _mystream_stream_oready && (_mystream_a00_idle && _mystream_a01_idle && _mystream_a10_idle && _mystream_a11_idle && _mystream_b00_idle && _mystream_b01_idle && _mystream_b10_idle && _mystream_b11_idle && (_mystream_fsm == 3));
  localparam _tmp_170 = 1;
  wire [_tmp_170-1:0] _tmp_171;
  assign _tmp_171 = _mystream_a00_idle && _mystream_a01_idle && _mystream_a10_idle && _mystream_a11_idle && _mystream_b00_idle && _mystream_b01_idle && _mystream_b10_idle && _mystream_b11_idle && (_mystream_fsm == 3);
  reg [_tmp_170-1:0] _tmp_172;
  localparam _tmp_173 = 1;
  wire [_tmp_173-1:0] _tmp_174;
  assign _tmp_174 = _mystream_a00_idle && _mystream_a01_idle && _mystream_a10_idle && _mystream_a11_idle && _mystream_b00_idle && _mystream_b01_idle && _mystream_b10_idle && _mystream_b11_idle && (_mystream_fsm == 3);
  reg [_tmp_173-1:0] _tmp_175;
  reg _tmp_176;
  reg _tmp_177;
  reg _tmp_178;
  reg _tmp_179;
  reg _tmp_180;
  reg _tmp_181;
  reg _tmp_182;
  assign _mystream_sink_start = _tmp_182;
  reg _tmp_183;
  reg _tmp_184;
  reg _tmp_185;
  reg _tmp_186;
  reg _tmp_187;
  reg _tmp_188;
  reg _tmp_189;
  assign _mystream_sink_stop = _tmp_189;
  reg _tmp_190;
  reg _tmp_191;
  reg _tmp_192;
  reg _tmp_193;
  reg _tmp_194;
  reg _tmp_195;
  reg _tmp_196;
  assign _mystream_sink_busy = _tmp_196;
  reg _tmp_197;
  assign _mystream_busy = _mystream_source_busy || _mystream_sink_busy || _mystream_busy_reg;
  wire [32-1:0] mask_addr_shifted_198;
  assign mask_addr_shifted_198 = _th_matmul_c_offset_8 + ((_th_matmul_i_9 << 5) + (_th_matmul_j_10 << 1) << 2) >> 2;
  wire [32-1:0] mask_addr_masked_199;
  assign mask_addr_masked_199 = mask_addr_shifted_198 << 2;
  reg [32-1:0] _maxi_write_req_fsm;
  localparam _maxi_write_req_fsm_init = 0;
  reg [33-1:0] _maxi_write_cur_global_size;
  reg _maxi_write_cont;
  wire [8-1:0] pack_write_req_op_sel_200;
  wire [32-1:0] pack_write_req_local_addr_201;
  wire [32-1:0] pack_write_req_local_stride_202;
  wire [33-1:0] pack_write_req_size_203;
  wire [32-1:0] pack_write_req_local_blocksize_204;
  assign pack_write_req_op_sel_200 = _maxi_write_op_sel;
  assign pack_write_req_local_addr_201 = _maxi_write_local_addr;
  assign pack_write_req_local_stride_202 = _maxi_write_local_stride;
  assign pack_write_req_size_203 = _maxi_write_local_size;
  assign pack_write_req_local_blocksize_204 = _maxi_write_local_blocksize;
  wire [137-1:0] pack_write_req_packed_205;
  assign pack_write_req_packed_205 = { pack_write_req_op_sel_200, pack_write_req_local_addr_201, pack_write_req_local_stride_202, pack_write_req_size_203, pack_write_req_local_blocksize_204 };
  localparam _tmp_206 = 1;
  wire [_tmp_206-1:0] _tmp_207;
  assign _tmp_207 = !_maxi_write_req_fifo_almost_full;
  reg [_tmp_206-1:0] __tmp_207_1;
  wire [32-1:0] mask_addr_shifted_208;
  assign mask_addr_shifted_208 = _maxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_209;
  assign mask_addr_masked_209 = mask_addr_shifted_208 << 2;
  wire [32-1:0] mask_addr_shifted_210;
  assign mask_addr_shifted_210 = _maxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_211;
  assign mask_addr_masked_211 = mask_addr_shifted_210 << 2;
  wire [32-1:0] mask_addr_shifted_212;
  assign mask_addr_shifted_212 = _maxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_213;
  assign mask_addr_masked_213 = mask_addr_shifted_212 << 2;
  wire [32-1:0] mask_addr_shifted_214;
  assign mask_addr_shifted_214 = _maxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_215;
  assign mask_addr_masked_215 = mask_addr_shifted_214 << 2;
  wire [32-1:0] mask_addr_shifted_216;
  assign mask_addr_shifted_216 = _maxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_217;
  assign mask_addr_masked_217 = mask_addr_shifted_216 << 2;
  wire [32-1:0] mask_addr_shifted_218;
  assign mask_addr_shifted_218 = _maxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_219;
  assign mask_addr_masked_219 = mask_addr_shifted_218 << 2;
  wire [8-1:0] pack_write_req_op_sel_220;
  wire [32-1:0] pack_write_req_local_addr_221;
  wire [32-1:0] pack_write_req_local_stride_222;
  wire [33-1:0] pack_write_req_size_223;
  wire [32-1:0] pack_write_req_local_blocksize_224;
  assign pack_write_req_op_sel_220 = _maxi_write_op_sel;
  assign pack_write_req_local_addr_221 = _maxi_write_local_addr;
  assign pack_write_req_local_stride_222 = _maxi_write_local_stride;
  assign pack_write_req_size_223 = _maxi_write_cur_global_size;
  assign pack_write_req_local_blocksize_224 = _maxi_write_local_blocksize;
  wire [137-1:0] pack_write_req_packed_225;
  assign pack_write_req_packed_225 = { pack_write_req_op_sel_220, pack_write_req_local_addr_221, pack_write_req_local_stride_222, pack_write_req_size_223, pack_write_req_local_blocksize_224 };
  assign _maxi_write_req_fifo_wdata = ((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (outstanding_wcount_0 < 6))? pack_write_req_packed_225 : 
                                      ((_maxi_write_req_fsm == 0) && _maxi_write_start && !_maxi_write_req_fifo_almost_full)? pack_write_req_packed_205 : 'hx;
  assign _maxi_write_req_fifo_enq = ((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (outstanding_wcount_0 < 6))? (_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (outstanding_wcount_0 < 6) && !_maxi_write_req_fifo_almost_full : 
                                    ((_maxi_write_req_fsm == 0) && _maxi_write_start && !_maxi_write_req_fifo_almost_full)? (_maxi_write_req_fsm == 0) && _maxi_write_start && !_maxi_write_req_fifo_almost_full && !_maxi_write_req_fifo_almost_full : 0;
  localparam _tmp_226 = 1;
  wire [_tmp_226-1:0] _tmp_227;
  assign _tmp_227 = !_maxi_write_req_fifo_almost_full;
  reg [_tmp_226-1:0] __tmp_227_1;
  reg _maxi_cond_1_1;
  reg [32-1:0] _maxi_write_data_fsm;
  localparam _maxi_write_data_fsm_init = 0;
  reg [32-1:0] read_burst_fsm_4;
  localparam read_burst_fsm_4_init = 0;
  reg [21-1:0] read_burst_addr_228;
  reg [21-1:0] read_burst_stride_229;
  reg [33-1:0] read_burst_length_230;
  reg read_burst_rvalid_231;
  reg read_burst_rlast_232;
  wire [1-1:0] read_rtl_bank_233;
  assign read_rtl_bank_233 = read_burst_addr_228;
  reg [1-1:0] _tmp_234;
  assign ram_c_0_0_addr = ((read_burst_fsm_4 == 1) && (!read_burst_rvalid_231 || (maxi_wready || !maxi_wvalid) && (_maxi_write_size_buf > 0)))? read_burst_addr_228 >> 1 : 
                          (_mystream_stream_oready && _mystream_sum_list0_sink_wenable && (_mystream_sum_list0_sink_sel == 9))? _mystream_sum_list0_sink_waddr : 'hx;
  assign ram_c_0_0_enable = ((read_burst_fsm_4 == 1) && (!read_burst_rvalid_231 || (maxi_wready || !maxi_wvalid) && (_maxi_write_size_buf > 0)))? 1'd1 : 
                            (_mystream_stream_oready && _mystream_sum_list0_sink_wenable && (_mystream_sum_list0_sink_sel == 9))? 1'd1 : 0;
  localparam _tmp_235 = 1;
  wire [_tmp_235-1:0] _tmp_236;
  assign _tmp_236 = (read_burst_fsm_4 == 1) && (!read_burst_rvalid_231 || (maxi_wready || !maxi_wvalid) && (_maxi_write_size_buf > 0));
  reg [_tmp_235-1:0] __tmp_236_1;
  assign ram_c_1_0_addr = ((read_burst_fsm_4 == 1) && (!read_burst_rvalid_231 || (maxi_wready || !maxi_wvalid) && (_maxi_write_size_buf > 0)))? read_burst_addr_228 >> 1 : 
                          (_mystream_stream_oready && _mystream_sum_list1_sink_wenable && (_mystream_sum_list1_sink_sel == 10))? _mystream_sum_list1_sink_waddr : 'hx;
  assign ram_c_1_0_enable = ((read_burst_fsm_4 == 1) && (!read_burst_rvalid_231 || (maxi_wready || !maxi_wvalid) && (_maxi_write_size_buf > 0)))? 1'd1 : 
                            (_mystream_stream_oready && _mystream_sum_list1_sink_wenable && (_mystream_sum_list1_sink_sel == 10))? 1'd1 : 0;
  localparam _tmp_237 = 1;
  wire [_tmp_237-1:0] _tmp_238;
  assign _tmp_238 = (read_burst_fsm_4 == 1) && (!read_burst_rvalid_231 || (maxi_wready || !maxi_wvalid) && (_maxi_write_size_buf > 0));
  reg [_tmp_237-1:0] __tmp_238_1;
  wire signed [32-1:0] read_rtl_rdata_239;
  wire read_rtl_rvalid_240;
  assign read_rtl_rdata_239 = (_tmp_234 == 0)? ram_c_0_0_rdata : 
                              (_tmp_234 == 1)? ram_c_1_0_rdata : 0;
  assign read_rtl_rvalid_240 = __tmp_236_1;
  wire signed [32-1:0] read_burst_rdata_241;
  assign read_burst_rdata_241 = read_rtl_rdata_239;
  assign _maxi_write_req_fifo_deq = ((_maxi_write_data_fsm == 2) && (!_maxi_write_req_fifo_empty && (_maxi_write_size_buf == 0)) && !_maxi_write_req_fifo_empty)? 1 : 
                                    ((_maxi_write_data_fsm == 0) && (_maxi_write_data_idle && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 1)) && !_maxi_write_req_fifo_empty)? 1 : 0;
  reg _maxi_cond_2_1;

  always @(posedge CLK) begin
    if(RST) begin
      __tmp_236_1 <= 0;
    end else begin
      __tmp_236_1 <= _tmp_236;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_238_1 <= 0;
    end else begin
      __tmp_238_1 <= _tmp_238;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_107_1 <= 0;
    end else begin
      __tmp_107_1 <= _tmp_107;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_110_1 <= 0;
    end else begin
      __tmp_110_1 <= _tmp_110;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_119_1 <= 0;
    end else begin
      __tmp_119_1 <= _tmp_119;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_122_1 <= 0;
    end else begin
      __tmp_122_1 <= _tmp_122;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_113_1 <= 0;
    end else begin
      __tmp_113_1 <= _tmp_113;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_116_1 <= 0;
    end else begin
      __tmp_116_1 <= _tmp_116;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_125_1 <= 0;
    end else begin
      __tmp_125_1 <= _tmp_125;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_128_1 <= 0;
    end else begin
      __tmp_128_1 <= _tmp_128;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      outstanding_wcount_0 <= 0;
      _maxi_read_start <= 0;
      _maxi_write_start <= 0;
      _maxi_read_op_sel <= 0;
      _maxi_read_global_addr <= 0;
      _maxi_read_global_size <= 0;
      _maxi_read_local_addr <= 0;
      _maxi_read_local_stride <= 0;
      _maxi_read_local_size <= 0;
      _maxi_read_local_blocksize <= 0;
      _maxi_read_req_idle <= 1;
      _maxi_read_cur_global_size <= 0;
      maxi_araddr <= 0;
      maxi_arlen <= 0;
      maxi_arvalid <= 0;
      _maxi_cond_0_1 <= 0;
      _maxi_read_data_idle <= 1;
      _maxi_read_op_sel_buf <= 0;
      _maxi_read_local_addr_buf <= 0;
      _maxi_read_local_stride_buf <= 0;
      _maxi_read_local_size_buf <= 0;
      _maxi_read_local_blocksize_buf <= 0;
      _maxi_write_op_sel <= 0;
      _maxi_write_global_addr <= 0;
      _maxi_write_global_size <= 0;
      _maxi_write_local_addr <= 0;
      _maxi_write_local_stride <= 0;
      _maxi_write_local_size <= 0;
      _maxi_write_local_blocksize <= 0;
      _maxi_write_req_idle <= 1;
      _maxi_write_cur_global_size <= 0;
      maxi_awaddr <= 0;
      maxi_awlen <= 0;
      maxi_awvalid <= 0;
      _maxi_cond_1_1 <= 0;
      _maxi_write_data_idle <= 1;
      _maxi_write_op_sel_buf <= 0;
      _maxi_write_local_addr_buf <= 0;
      _maxi_write_local_stride_buf <= 0;
      _maxi_write_size_buf <= 0;
      _maxi_write_local_blocksize_buf <= 0;
      maxi_wdata <= 0;
      maxi_wvalid <= 0;
      maxi_wlast <= 0;
      maxi_wstrb <= 0;
      _maxi_cond_2_1 <= 0;
    end else begin
      if(_maxi_cond_0_1) begin
        maxi_arvalid <= 0;
      end 
      if(_maxi_cond_1_1) begin
        maxi_awvalid <= 0;
      end 
      if(_maxi_cond_2_1) begin
        maxi_wvalid <= 0;
        maxi_wlast <= 0;
      end 
      if(maxi_awvalid && maxi_awready && !(maxi_bvalid && maxi_bready) && (outstanding_wcount_0 < 7)) begin
        outstanding_wcount_0 <= outstanding_wcount_0 + 1;
      end 
      if(!(maxi_awvalid && maxi_awready) && (maxi_bvalid && maxi_bready) && (outstanding_wcount_0 > 0)) begin
        outstanding_wcount_0 <= outstanding_wcount_0 - 1;
      end 
      _maxi_read_start <= 0;
      _maxi_write_start <= 0;
      if((th_matmul == 12) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 1;
        _maxi_read_global_addr <= mask_addr_masked_24;
        _maxi_read_global_size <= _dma_read_packed_local_packed_size_22 << 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 2;
        _maxi_read_local_size <= _dma_read_packed_local_packed_size_22;
        _maxi_read_local_blocksize <= 1;
      end 
      if((_maxi_read_req_fsm == 0) && _maxi_read_start) begin
        _maxi_read_req_idle <= 0;
      end 
      if(_maxi_read_start && _maxi_read_req_fifo_almost_full) begin
        _maxi_read_start <= 1;
      end 
      if((_maxi_read_req_fsm == 0) && (_maxi_read_start || _maxi_read_cont) && !_maxi_read_req_fifo_almost_full && (_maxi_read_global_size <= 256) && ((mask_addr_masked_34 & 4095) + (_maxi_read_global_size << 2) >= 4096)) begin
        _maxi_read_cur_global_size <= 4096 - (mask_addr_masked_36 & 4095) >> 2;
        _maxi_read_global_size <= _maxi_read_global_size - (4096 - (mask_addr_masked_38 & 4095) >> 2);
      end else if((_maxi_read_req_fsm == 0) && (_maxi_read_start || _maxi_read_cont) && !_maxi_read_req_fifo_almost_full && (_maxi_read_global_size <= 256)) begin
        _maxi_read_cur_global_size <= _maxi_read_global_size;
        _maxi_read_global_size <= 0;
      end else if((_maxi_read_req_fsm == 0) && (_maxi_read_start || _maxi_read_cont) && !_maxi_read_req_fifo_almost_full && ((mask_addr_masked_40 & 4095) + 1024 >= 4096)) begin
        _maxi_read_cur_global_size <= 4096 - (mask_addr_masked_42 & 4095) >> 2;
        _maxi_read_global_size <= _maxi_read_global_size - (4096 - (mask_addr_masked_44 & 4095) >> 2);
      end else if((_maxi_read_req_fsm == 0) && (_maxi_read_start || _maxi_read_cont) && !_maxi_read_req_fifo_almost_full) begin
        _maxi_read_cur_global_size <= 256;
        _maxi_read_global_size <= _maxi_read_global_size - 256;
      end 
      if((_maxi_read_req_fsm == 1) && (maxi_arready || !maxi_arvalid)) begin
        maxi_araddr <= _maxi_read_global_addr;
        maxi_arlen <= _maxi_read_cur_global_size - 1;
        maxi_arvalid <= 1;
      end 
      _maxi_cond_0_1 <= 1;
      if(maxi_arvalid && !maxi_arready) begin
        maxi_arvalid <= maxi_arvalid;
      end 
      if((_maxi_read_req_fsm == 1) && (maxi_arready || !maxi_arvalid)) begin
        _maxi_read_global_addr <= _maxi_read_global_addr + (_maxi_read_cur_global_size << 2);
      end 
      if((_maxi_read_req_fsm == 1) && (maxi_arready || !maxi_arvalid) && (_maxi_read_global_size == 0)) begin
        _maxi_read_req_idle <= 1;
      end 
      if((_maxi_read_data_narrow_fsm == 0) && (_maxi_read_data_idle && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 1))) begin
        _maxi_read_data_idle <= 0;
        _maxi_read_op_sel_buf <= _maxi_read_op_sel_fifo;
        _maxi_read_local_addr_buf <= _maxi_read_local_addr_fifo;
        _maxi_read_local_stride_buf <= _maxi_read_local_stride_fifo;
        _maxi_read_local_size_buf <= _maxi_read_local_size_fifo;
        _maxi_read_local_blocksize_buf <= _maxi_read_local_blocksize_fifo;
      end 
      if((_maxi_read_data_narrow_fsm == 2) && (_maxi_read_op_sel_buf == 1) && maxi_rvalid && (_maxi_read_narrow_count_47 == 1)) begin
        _maxi_read_local_size_buf <= _maxi_read_local_size_buf - 1;
      end 
      if((_maxi_read_data_narrow_fsm == 2) && (_maxi_read_op_sel_buf == 1) && maxi_rvalid && (_maxi_read_local_size_buf <= 1) && (_maxi_read_narrow_count_47 == 1)) begin
        _maxi_read_data_idle <= 1;
      end 
      if((th_matmul == 14) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 2;
        _maxi_read_global_addr <= mask_addr_masked_60;
        _maxi_read_global_size <= _dma_read_packed_local_packed_size_58 << 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 2;
        _maxi_read_local_size <= _dma_read_packed_local_packed_size_58;
        _maxi_read_local_blocksize <= 1;
      end 
      if((_maxi_read_data_narrow_fsm == 0) && (_maxi_read_data_idle && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 2))) begin
        _maxi_read_data_idle <= 0;
        _maxi_read_op_sel_buf <= _maxi_read_op_sel_fifo;
        _maxi_read_local_addr_buf <= _maxi_read_local_addr_fifo;
        _maxi_read_local_stride_buf <= _maxi_read_local_stride_fifo;
        _maxi_read_local_size_buf <= _maxi_read_local_size_fifo;
        _maxi_read_local_blocksize_buf <= _maxi_read_local_blocksize_fifo;
      end 
      if((_maxi_read_data_narrow_fsm == 2) && (_maxi_read_op_sel_buf == 2) && maxi_rvalid && (_maxi_read_narrow_count_63 == 1)) begin
        _maxi_read_local_size_buf <= _maxi_read_local_size_buf - 1;
      end 
      if((_maxi_read_data_narrow_fsm == 2) && (_maxi_read_op_sel_buf == 2) && maxi_rvalid && (_maxi_read_local_size_buf <= 1) && (_maxi_read_narrow_count_63 == 1)) begin
        _maxi_read_data_idle <= 1;
      end 
      if((th_matmul == 18) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 3;
        _maxi_read_global_addr <= mask_addr_masked_76;
        _maxi_read_global_size <= _dma_read_packed_local_packed_size_74 << 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 2;
        _maxi_read_local_size <= _dma_read_packed_local_packed_size_74;
        _maxi_read_local_blocksize <= 1;
      end 
      if((_maxi_read_data_narrow_fsm == 0) && (_maxi_read_data_idle && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 3))) begin
        _maxi_read_data_idle <= 0;
        _maxi_read_op_sel_buf <= _maxi_read_op_sel_fifo;
        _maxi_read_local_addr_buf <= _maxi_read_local_addr_fifo;
        _maxi_read_local_stride_buf <= _maxi_read_local_stride_fifo;
        _maxi_read_local_size_buf <= _maxi_read_local_size_fifo;
        _maxi_read_local_blocksize_buf <= _maxi_read_local_blocksize_fifo;
      end 
      if((_maxi_read_data_narrow_fsm == 2) && (_maxi_read_op_sel_buf == 3) && maxi_rvalid && (_maxi_read_narrow_count_79 == 1)) begin
        _maxi_read_local_size_buf <= _maxi_read_local_size_buf - 1;
      end 
      if((_maxi_read_data_narrow_fsm == 2) && (_maxi_read_op_sel_buf == 3) && maxi_rvalid && (_maxi_read_local_size_buf <= 1) && (_maxi_read_narrow_count_79 == 1)) begin
        _maxi_read_data_idle <= 1;
      end 
      if((th_matmul == 20) && _maxi_read_req_idle) begin
        _maxi_read_start <= 1;
        _maxi_read_op_sel <= 4;
        _maxi_read_global_addr <= mask_addr_masked_92;
        _maxi_read_global_size <= _dma_read_packed_local_packed_size_90 << 1;
        _maxi_read_local_addr <= 0;
        _maxi_read_local_stride <= 2;
        _maxi_read_local_size <= _dma_read_packed_local_packed_size_90;
        _maxi_read_local_blocksize <= 1;
      end 
      if((_maxi_read_data_narrow_fsm == 0) && (_maxi_read_data_idle && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 4))) begin
        _maxi_read_data_idle <= 0;
        _maxi_read_op_sel_buf <= _maxi_read_op_sel_fifo;
        _maxi_read_local_addr_buf <= _maxi_read_local_addr_fifo;
        _maxi_read_local_stride_buf <= _maxi_read_local_stride_fifo;
        _maxi_read_local_size_buf <= _maxi_read_local_size_fifo;
        _maxi_read_local_blocksize_buf <= _maxi_read_local_blocksize_fifo;
      end 
      if((_maxi_read_data_narrow_fsm == 2) && (_maxi_read_op_sel_buf == 4) && maxi_rvalid && (_maxi_read_narrow_count_95 == 1)) begin
        _maxi_read_local_size_buf <= _maxi_read_local_size_buf - 1;
      end 
      if((_maxi_read_data_narrow_fsm == 2) && (_maxi_read_op_sel_buf == 4) && maxi_rvalid && (_maxi_read_local_size_buf <= 1) && (_maxi_read_narrow_count_95 == 1)) begin
        _maxi_read_data_idle <= 1;
      end 
      if((th_matmul == 36) && _maxi_write_req_idle) begin
        _maxi_write_start <= 1;
        _maxi_write_op_sel <= 1;
        _maxi_write_global_addr <= mask_addr_masked_199;
        _maxi_write_global_size <= 2;
        _maxi_write_local_addr <= 0;
        _maxi_write_local_stride <= 1;
        _maxi_write_local_size <= 2;
        _maxi_write_local_blocksize <= 1;
      end 
      if((_maxi_write_req_fsm == 0) && _maxi_write_start) begin
        _maxi_write_req_idle <= 0;
      end 
      if(_maxi_write_start && _maxi_write_req_fifo_almost_full) begin
        _maxi_write_start <= 1;
      end 
      if((_maxi_write_req_fsm == 0) && (_maxi_write_start || _maxi_write_cont) && !_maxi_write_req_fifo_almost_full && (_maxi_write_global_size <= 256) && ((mask_addr_masked_209 & 4095) + (_maxi_write_global_size << 2) >= 4096)) begin
        _maxi_write_cur_global_size <= 4096 - (mask_addr_masked_211 & 4095) >> 2;
        _maxi_write_global_size <= _maxi_write_global_size - (4096 - (mask_addr_masked_213 & 4095) >> 2);
      end else if((_maxi_write_req_fsm == 0) && (_maxi_write_start || _maxi_write_cont) && !_maxi_write_req_fifo_almost_full && (_maxi_write_global_size <= 256)) begin
        _maxi_write_cur_global_size <= _maxi_write_global_size;
        _maxi_write_global_size <= 0;
      end else if((_maxi_write_req_fsm == 0) && (_maxi_write_start || _maxi_write_cont) && !_maxi_write_req_fifo_almost_full && ((mask_addr_masked_215 & 4095) + 1024 >= 4096)) begin
        _maxi_write_cur_global_size <= 4096 - (mask_addr_masked_217 & 4095) >> 2;
        _maxi_write_global_size <= _maxi_write_global_size - (4096 - (mask_addr_masked_219 & 4095) >> 2);
      end else if((_maxi_write_req_fsm == 0) && (_maxi_write_start || _maxi_write_cont) && !_maxi_write_req_fifo_almost_full) begin
        _maxi_write_cur_global_size <= 256;
        _maxi_write_global_size <= _maxi_write_global_size - 256;
      end 
      if((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (outstanding_wcount_0 < 6) && ((outstanding_wcount_0 < 6) && (maxi_awready || !maxi_awvalid))) begin
        maxi_awaddr <= _maxi_write_global_addr;
        maxi_awlen <= _maxi_write_cur_global_size - 1;
        maxi_awvalid <= 1;
      end 
      if((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (outstanding_wcount_0 < 6) && ((outstanding_wcount_0 < 6) && (maxi_awready || !maxi_awvalid)) && (_maxi_write_cur_global_size == 0)) begin
        maxi_awvalid <= 0;
      end 
      _maxi_cond_1_1 <= 1;
      if(maxi_awvalid && !maxi_awready) begin
        maxi_awvalid <= maxi_awvalid;
      end 
      if((_maxi_write_req_fsm == 1) && ((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (outstanding_wcount_0 < 6))) begin
        _maxi_write_global_addr <= _maxi_write_global_addr + (_maxi_write_cur_global_size << 2);
      end 
      if((_maxi_write_req_fsm == 1) && ((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (outstanding_wcount_0 < 6)) && (_maxi_write_global_size == 0)) begin
        _maxi_write_req_idle <= 1;
      end 
      if((_maxi_write_data_fsm == 0) && (_maxi_write_data_idle && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 1))) begin
        _maxi_write_data_idle <= 0;
        _maxi_write_op_sel_buf <= _maxi_write_op_sel_fifo;
        _maxi_write_local_addr_buf <= _maxi_write_local_addr_fifo;
        _maxi_write_local_stride_buf <= _maxi_write_local_stride_fifo;
        _maxi_write_size_buf <= _maxi_write_size_fifo;
        _maxi_write_local_blocksize_buf <= _maxi_write_local_blocksize_fifo;
      end 
      if(_maxi_write_data_fsm == 1) begin
        _maxi_write_size_buf <= 0;
      end 
      if((_maxi_write_data_fsm == 2) && (!_maxi_write_req_fifo_empty && (_maxi_write_size_buf == 0))) begin
        _maxi_write_size_buf <= _maxi_write_size_fifo;
      end 
      if((_maxi_write_op_sel_buf == 1) && read_burst_rvalid_231 && ((maxi_wready || !maxi_wvalid) && (_maxi_write_size_buf > 0)) && (maxi_wready || !maxi_wvalid)) begin
        maxi_wdata <= read_burst_rdata_241;
        maxi_wvalid <= 1;
        maxi_wlast <= read_burst_rlast_232 || (_maxi_write_size_buf == 1);
        maxi_wstrb <= { 4{ 1'd1 } };
      end 
      _maxi_cond_2_1 <= 1;
      if(maxi_wvalid && !maxi_wready) begin
        maxi_wvalid <= maxi_wvalid;
        maxi_wlast <= maxi_wlast;
      end 
      if((_maxi_write_data_fsm == 2) && read_burst_rvalid_231 && ((maxi_wready || !maxi_wvalid) && (_maxi_write_size_buf > 0))) begin
        _maxi_write_size_buf <= _maxi_write_size_buf - 1;
      end 
      if((_maxi_write_data_fsm == 2) && ((_maxi_write_op_sel_buf == 1) && read_burst_rvalid_231 && ((maxi_wready || !maxi_wvalid) && (_maxi_write_size_buf > 0))) && read_burst_rlast_232) begin
        _maxi_write_data_idle <= 1;
      end 
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      count__maxi_read_req_fifo <= 0;
      __tmp_32_1 <= 0;
    end else begin
      if(_maxi_read_req_fifo_enq && !_maxi_read_req_fifo_full && (_maxi_read_req_fifo_deq && !_maxi_read_req_fifo_empty)) begin
        count__maxi_read_req_fifo <= count__maxi_read_req_fifo;
      end else if(_maxi_read_req_fifo_enq && !_maxi_read_req_fifo_full) begin
        count__maxi_read_req_fifo <= count__maxi_read_req_fifo + 1;
      end else if(_maxi_read_req_fifo_deq && !_maxi_read_req_fifo_empty) begin
        count__maxi_read_req_fifo <= count__maxi_read_req_fifo - 1;
      end 
      __tmp_32_1 <= _tmp_32;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      count__maxi_write_req_fifo <= 0;
      __tmp_207_1 <= 0;
      __tmp_227_1 <= 0;
    end else begin
      if(_maxi_write_req_fifo_enq && !_maxi_write_req_fifo_full && (_maxi_write_req_fifo_deq && !_maxi_write_req_fifo_empty)) begin
        count__maxi_write_req_fifo <= count__maxi_write_req_fifo;
      end else if(_maxi_write_req_fifo_enq && !_maxi_write_req_fifo_full) begin
        count__maxi_write_req_fifo <= count__maxi_write_req_fifo + 1;
      end else if(_maxi_write_req_fifo_deq && !_maxi_write_req_fifo_empty) begin
        count__maxi_write_req_fifo <= count__maxi_write_req_fifo - 1;
      end 
      __tmp_207_1 <= _tmp_207;
      __tmp_227_1 <= _tmp_227;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      saxi_bvalid <= 0;
      prev_awvalid_14 <= 0;
      prev_arvalid_15 <= 0;
      writevalid_12 <= 0;
      readvalid_13 <= 0;
      addr_11 <= 0;
      saxi_rdata <= 0;
      saxi_rvalid <= 0;
      _saxi_cond_0_1 <= 0;
      _saxi_register_0 <= 0;
      _saxi_flag_0 <= 0;
      _saxi_register_1 <= 0;
      _saxi_flag_1 <= 0;
      _saxi_register_2 <= 0;
      _saxi_flag_2 <= 0;
      _saxi_register_3 <= 0;
      _saxi_flag_3 <= 0;
      _saxi_register_4 <= 0;
      _saxi_flag_4 <= 0;
      _saxi_register_5 <= 0;
      _saxi_flag_5 <= 0;
      _saxi_register_6 <= 0;
      _saxi_flag_6 <= 0;
      _saxi_register_7 <= 0;
      _saxi_flag_7 <= 0;
    end else begin
      if(_saxi_cond_0_1) begin
        saxi_rvalid <= 0;
      end 
      if(saxi_bvalid && saxi_bready) begin
        saxi_bvalid <= 0;
      end 
      if(saxi_wvalid && saxi_wready) begin
        saxi_bvalid <= 1;
      end 
      prev_awvalid_14 <= saxi_awvalid;
      prev_arvalid_15 <= saxi_arvalid;
      writevalid_12 <= 0;
      readvalid_13 <= 0;
      if(saxi_awready && saxi_awvalid && !saxi_bvalid) begin
        addr_11 <= saxi_awaddr;
        writevalid_12 <= 1;
      end else if(saxi_arready && saxi_arvalid) begin
        addr_11 <= saxi_araddr;
        readvalid_13 <= 1;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid)) begin
        saxi_rdata <= axislite_rdata_17;
        saxi_rvalid <= 1;
      end 
      _saxi_cond_0_1 <= 1;
      if(saxi_rvalid && !saxi_rready) begin
        saxi_rvalid <= saxi_rvalid;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_18 && (axis_maskaddr_16 == 0)) begin
        _saxi_register_0 <= axislite_resetval_19;
        _saxi_flag_0 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_18 && (axis_maskaddr_16 == 1)) begin
        _saxi_register_1 <= axislite_resetval_19;
        _saxi_flag_1 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_18 && (axis_maskaddr_16 == 2)) begin
        _saxi_register_2 <= axislite_resetval_19;
        _saxi_flag_2 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_18 && (axis_maskaddr_16 == 3)) begin
        _saxi_register_3 <= axislite_resetval_19;
        _saxi_flag_3 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_18 && (axis_maskaddr_16 == 4)) begin
        _saxi_register_4 <= axislite_resetval_19;
        _saxi_flag_4 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_18 && (axis_maskaddr_16 == 5)) begin
        _saxi_register_5 <= axislite_resetval_19;
        _saxi_flag_5 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_18 && (axis_maskaddr_16 == 6)) begin
        _saxi_register_6 <= axislite_resetval_19;
        _saxi_flag_6 <= 0;
      end 
      if((_saxi_register_fsm == 1) && (saxi_rready || !saxi_rvalid) && axislite_flag_18 && (axis_maskaddr_16 == 7)) begin
        _saxi_register_7 <= axislite_resetval_19;
        _saxi_flag_7 <= 0;
      end 
      if((_saxi_register_fsm == 2) && saxi_wvalid && (axis_maskaddr_16 == 0)) begin
        _saxi_register_0 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 2) && saxi_wvalid && (axis_maskaddr_16 == 1)) begin
        _saxi_register_1 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 2) && saxi_wvalid && (axis_maskaddr_16 == 2)) begin
        _saxi_register_2 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 2) && saxi_wvalid && (axis_maskaddr_16 == 3)) begin
        _saxi_register_3 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 2) && saxi_wvalid && (axis_maskaddr_16 == 4)) begin
        _saxi_register_4 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 2) && saxi_wvalid && (axis_maskaddr_16 == 5)) begin
        _saxi_register_5 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 2) && saxi_wvalid && (axis_maskaddr_16 == 6)) begin
        _saxi_register_6 <= saxi_wdata;
      end 
      if((_saxi_register_fsm == 2) && saxi_wvalid && (axis_maskaddr_16 == 7)) begin
        _saxi_register_7 <= saxi_wdata;
      end 
      if((_saxi_register_0 == 1) && (th_matmul == 2) && 1) begin
        _saxi_register_0 <= 0;
      end 
      if((_saxi_register_0 == 1) && (th_matmul == 2) && 0) begin
        _saxi_register_1 <= 0;
      end 
      if((_saxi_register_0 == 1) && (th_matmul == 2) && 0) begin
        _saxi_register_2 <= 0;
      end 
      if((_saxi_register_0 == 1) && (th_matmul == 2) && 0) begin
        _saxi_register_3 <= 0;
      end 
      if((_saxi_register_0 == 1) && (th_matmul == 2) && 0) begin
        _saxi_register_4 <= 0;
      end 
      if((_saxi_register_0 == 1) && (th_matmul == 2) && 0) begin
        _saxi_register_5 <= 0;
      end 
      if((_saxi_register_0 == 1) && (th_matmul == 2) && 0) begin
        _saxi_register_6 <= 0;
      end 
      if((_saxi_register_0 == 1) && (th_matmul == 2) && 0) begin
        _saxi_register_7 <= 0;
      end 
      if((th_matmul == 3) && 0) begin
        _saxi_register_0 <= 1;
        _saxi_flag_0 <= 0;
      end 
      if((th_matmul == 3) && 1) begin
        _saxi_register_1 <= 1;
        _saxi_flag_1 <= 0;
      end 
      if((th_matmul == 3) && 0) begin
        _saxi_register_2 <= 1;
        _saxi_flag_2 <= 0;
      end 
      if((th_matmul == 3) && 0) begin
        _saxi_register_3 <= 1;
        _saxi_flag_3 <= 0;
      end 
      if((th_matmul == 3) && 0) begin
        _saxi_register_4 <= 1;
        _saxi_flag_4 <= 0;
      end 
      if((th_matmul == 3) && 0) begin
        _saxi_register_5 <= 1;
        _saxi_flag_5 <= 0;
      end 
      if((th_matmul == 3) && 0) begin
        _saxi_register_6 <= 1;
        _saxi_flag_6 <= 0;
      end 
      if((th_matmul == 3) && 0) begin
        _saxi_register_7 <= 1;
        _saxi_flag_7 <= 0;
      end 
      if((th_matmul == 40) && 0) begin
        _saxi_register_0 <= 0;
        _saxi_flag_0 <= 0;
      end 
      if((th_matmul == 40) && 1) begin
        _saxi_register_1 <= 0;
        _saxi_flag_1 <= 0;
      end 
      if((th_matmul == 40) && 0) begin
        _saxi_register_2 <= 0;
        _saxi_flag_2 <= 0;
      end 
      if((th_matmul == 40) && 0) begin
        _saxi_register_3 <= 0;
        _saxi_flag_3 <= 0;
      end 
      if((th_matmul == 40) && 0) begin
        _saxi_register_4 <= 0;
        _saxi_flag_4 <= 0;
      end 
      if((th_matmul == 40) && 0) begin
        _saxi_register_5 <= 0;
        _saxi_flag_5 <= 0;
      end 
      if((th_matmul == 40) && 0) begin
        _saxi_register_6 <= 0;
        _saxi_flag_6 <= 0;
      end 
      if((th_matmul == 40) && 0) begin
        _saxi_register_7 <= 0;
        _saxi_flag_7 <= 0;
      end 
    end
  end

  localparam _saxi_register_fsm_1 = 1;
  localparam _saxi_register_fsm_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _saxi_register_fsm <= _saxi_register_fsm_init;
      axis_maskaddr_16 <= 0;
    end else begin
      case(_saxi_register_fsm)
        _saxi_register_fsm_init: begin
          if(readvalid_13 || writevalid_12) begin
            axis_maskaddr_16 <= (addr_11 >> _saxi_shift) & _saxi_mask;
          end 
          if(readvalid_13) begin
            _saxi_register_fsm <= _saxi_register_fsm_1;
          end 
          if(writevalid_12) begin
            _saxi_register_fsm <= _saxi_register_fsm_2;
          end 
        end
        _saxi_register_fsm_1: begin
          if(saxi_rready || !saxi_rvalid) begin
            _saxi_register_fsm <= _saxi_register_fsm_init;
          end 
        end
        _saxi_register_fsm_2: begin
          if(saxi_wvalid) begin
            _saxi_register_fsm <= _saxi_register_fsm_init;
          end 
        end
      endcase
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _mystream_a00_source_ram_renable <= 0;
      _mystream_a00_source_fifo_deq <= 0;
      _mystream_a00_idle <= 1;
      _mystream_a01_source_ram_renable <= 0;
      _mystream_a01_source_fifo_deq <= 0;
      _mystream_a01_idle <= 1;
      _mystream_a10_source_ram_renable <= 0;
      _mystream_a10_source_fifo_deq <= 0;
      _mystream_a10_idle <= 1;
      _mystream_a11_source_ram_renable <= 0;
      _mystream_a11_source_fifo_deq <= 0;
      _mystream_a11_idle <= 1;
      _mystream_b00_source_ram_renable <= 0;
      _mystream_b00_source_fifo_deq <= 0;
      _mystream_b00_idle <= 1;
      _mystream_b01_source_ram_renable <= 0;
      _mystream_b01_source_fifo_deq <= 0;
      _mystream_b01_idle <= 1;
      _mystream_b10_source_ram_renable <= 0;
      _mystream_b10_source_fifo_deq <= 0;
      _mystream_b10_idle <= 1;
      _mystream_b11_source_ram_renable <= 0;
      _mystream_b11_source_fifo_deq <= 0;
      _mystream_b11_idle <= 1;
      _mystream_sum_list0_sink_wenable <= 0;
      _mystream_sum_list0_sink_fifo_enq <= 0;
      _mystream_sum_valid_list0_sink_wenable <= 0;
      _mystream_sum_valid_list0_sink_fifo_enq <= 0;
      _mystream_sum_list1_sink_wenable <= 0;
      _mystream_sum_list1_sink_fifo_enq <= 0;
      _mystream_sum_valid_list1_sink_wenable <= 0;
      _mystream_sum_valid_list1_sink_fifo_enq <= 0;
      __mystream_stream_ivalid_1 <= 0;
      __mystream_stream_ivalid_2 <= 0;
      __mystream_stream_ivalid_3 <= 0;
      __mystream_stream_ivalid_4 <= 0;
      __mystream_stream_ivalid_5 <= 0;
      _times_mul_odata_reg_9 <= 0;
      _times_mul_odata_reg_10 <= 0;
      _times_mul_odata_reg_11 <= 0;
      _times_mul_odata_reg_12 <= 0;
      __delay_data_24__variable_0 <= 0;
      __delay_data_28__variable_15 <= 0;
      __delay_data_25__delay_24__variable_0 <= 0;
      __delay_data_29__delay_28__variable_15 <= 0;
      __delay_data_26__delay_25__delay_24__variable_0 <= 0;
      __delay_data_30__delay_29__delay_28__variable_15 <= 0;
      __plusn_data_13 <= 0;
      __plusn_data_14 <= 0;
      __delay_data_27__delay_26__delay_25__delay_24__variable_0 <= 0;
      __delay_data_31__delay_30__delay_29__delay_28__variable_15 <= 0;
      _reduceadd_data_16 <= 1'sd0;
      _reduceadd_count_16 <= 0;
      _reduceadd_prev_count_max_16 <= 0;
      _pulse_data_18 <= 1'sd0;
      _pulse_count_18 <= 0;
      _pulse_prev_count_max_18 <= 0;
      _reduceadd_data_20 <= 1'sd0;
      _reduceadd_count_20 <= 0;
      _reduceadd_prev_count_max_20 <= 0;
      _pulse_data_22 <= 1'sd0;
      _pulse_count_22 <= 0;
      _pulse_prev_count_max_22 <= 0;
      _mystream_size_next_parameter_data <= 0;
      __variable_wdata_0 <= 0;
      _mystream_a00_source_mode <= 5'b0;
      _mystream_a00_source_offset <= 0;
      _mystream_a00_source_size <= 0;
      _mystream_a00_source_stride <= 0;
      _mystream_a00_source_sel <= 0;
      _mystream_a00_source_offset_buf <= 0;
      _mystream_a00_source_size_buf <= 0;
      _mystream_a00_source_stride_buf <= 0;
      __variable_wdata_1 <= 0;
      _mystream_a00_source_ram_raddr <= 0;
      _mystream_a00_source_count <= 0;
      _mystream_a01_source_mode <= 5'b0;
      _mystream_a01_source_offset <= 0;
      _mystream_a01_source_size <= 0;
      _mystream_a01_source_stride <= 0;
      _mystream_a01_source_sel <= 0;
      _mystream_a01_source_offset_buf <= 0;
      _mystream_a01_source_size_buf <= 0;
      _mystream_a01_source_stride_buf <= 0;
      __variable_wdata_2 <= 0;
      _mystream_a01_source_ram_raddr <= 0;
      _mystream_a01_source_count <= 0;
      _mystream_a10_source_mode <= 5'b0;
      _mystream_a10_source_offset <= 0;
      _mystream_a10_source_size <= 0;
      _mystream_a10_source_stride <= 0;
      _mystream_a10_source_sel <= 0;
      _mystream_a10_source_offset_buf <= 0;
      _mystream_a10_source_size_buf <= 0;
      _mystream_a10_source_stride_buf <= 0;
      __variable_wdata_3 <= 0;
      _mystream_a10_source_ram_raddr <= 0;
      _mystream_a10_source_count <= 0;
      _mystream_a11_source_mode <= 5'b0;
      _mystream_a11_source_offset <= 0;
      _mystream_a11_source_size <= 0;
      _mystream_a11_source_stride <= 0;
      _mystream_a11_source_sel <= 0;
      _mystream_a11_source_offset_buf <= 0;
      _mystream_a11_source_size_buf <= 0;
      _mystream_a11_source_stride_buf <= 0;
      __variable_wdata_4 <= 0;
      _mystream_a11_source_ram_raddr <= 0;
      _mystream_a11_source_count <= 0;
      _mystream_b00_source_mode <= 5'b0;
      _mystream_b00_source_offset <= 0;
      _mystream_b00_source_size <= 0;
      _mystream_b00_source_stride <= 0;
      _mystream_b00_source_sel <= 0;
      _mystream_b00_source_offset_buf <= 0;
      _mystream_b00_source_size_buf <= 0;
      _mystream_b00_source_stride_buf <= 0;
      __variable_wdata_5 <= 0;
      _mystream_b00_source_ram_raddr <= 0;
      _mystream_b00_source_count <= 0;
      _mystream_b01_source_mode <= 5'b0;
      _mystream_b01_source_offset <= 0;
      _mystream_b01_source_size <= 0;
      _mystream_b01_source_stride <= 0;
      _mystream_b01_source_sel <= 0;
      _mystream_b01_source_offset_buf <= 0;
      _mystream_b01_source_size_buf <= 0;
      _mystream_b01_source_stride_buf <= 0;
      __variable_wdata_6 <= 0;
      _mystream_b01_source_ram_raddr <= 0;
      _mystream_b01_source_count <= 0;
      _mystream_b10_source_mode <= 5'b0;
      _mystream_b10_source_offset <= 0;
      _mystream_b10_source_size <= 0;
      _mystream_b10_source_stride <= 0;
      _mystream_b10_source_sel <= 0;
      _mystream_b10_source_offset_buf <= 0;
      _mystream_b10_source_size_buf <= 0;
      _mystream_b10_source_stride_buf <= 0;
      __variable_wdata_7 <= 0;
      _mystream_b10_source_ram_raddr <= 0;
      _mystream_b10_source_count <= 0;
      _mystream_b11_source_mode <= 5'b0;
      _mystream_b11_source_offset <= 0;
      _mystream_b11_source_size <= 0;
      _mystream_b11_source_stride <= 0;
      _mystream_b11_source_sel <= 0;
      _mystream_b11_source_offset_buf <= 0;
      _mystream_b11_source_size_buf <= 0;
      _mystream_b11_source_stride_buf <= 0;
      __variable_wdata_8 <= 0;
      _mystream_b11_source_ram_raddr <= 0;
      _mystream_b11_source_count <= 0;
      _tmp_130 <= 0;
      _tmp_131 <= 0;
      _tmp_132 <= 0;
      _tmp_133 <= 0;
      _tmp_134 <= 0;
      _tmp_135 <= 0;
      _tmp_136 <= 0;
      _tmp_137 <= 0;
      _tmp_138 <= 0;
      _tmp_139 <= 0;
      _tmp_140 <= 0;
      _tmp_141 <= 0;
      _tmp_142 <= 0;
      _tmp_143 <= 0;
      _mystream_sum_list0_sink_mode <= 5'b0;
      _mystream_sum_list0_sink_offset <= 0;
      _mystream_sum_list0_sink_size <= 0;
      _mystream_sum_list0_sink_stride <= 0;
      _mystream_sum_list0_sink_sel <= 0;
      _mystream_sum_list0_sink_offset_buf <= 0;
      _mystream_sum_list0_sink_size_buf <= 0;
      _mystream_sum_list0_sink_stride_buf <= 0;
      _mystream_sum_list0_sink_waddr <= 0;
      _mystream_sum_list0_sink_count <= 0;
      _mystream_sum_list0_sink_wdata <= 0;
      _tmp_145 <= 0;
      _tmp_146 <= 0;
      _tmp_147 <= 0;
      _tmp_148 <= 0;
      _tmp_149 <= 0;
      _tmp_150 <= 0;
      _tmp_151 <= 0;
      _tmp_152 <= 0;
      _tmp_153 <= 0;
      _tmp_154 <= 0;
      _tmp_155 <= 0;
      _tmp_156 <= 0;
      _tmp_157 <= 0;
      _tmp_158 <= 0;
      _mystream_sum_list1_sink_mode <= 5'b0;
      _mystream_sum_list1_sink_offset <= 0;
      _mystream_sum_list1_sink_size <= 0;
      _mystream_sum_list1_sink_stride <= 0;
      _mystream_sum_list1_sink_sel <= 0;
      _mystream_sum_list1_sink_offset_buf <= 0;
      _mystream_sum_list1_sink_size_buf <= 0;
      _mystream_sum_list1_sink_stride_buf <= 0;
      _mystream_sum_list1_sink_waddr <= 0;
      _mystream_sum_list1_sink_count <= 0;
      _mystream_sum_list1_sink_wdata <= 0;
      _tmp_160 <= 0;
      _tmp_161 <= 0;
      _tmp_162 <= 0;
      _tmp_163 <= 0;
      _tmp_164 <= 0;
      _tmp_165 <= 0;
      __variable_wdata_15 <= 0;
      _tmp_166 <= 0;
      _tmp_167 <= 0;
      _tmp_168 <= 0;
      _tmp_169 <= 0;
      _tmp_172 <= 0;
      _tmp_175 <= 0;
      _tmp_176 <= 0;
      _tmp_177 <= 0;
      _tmp_178 <= 0;
      _tmp_179 <= 0;
      _tmp_180 <= 0;
      _tmp_181 <= 0;
      _tmp_182 <= 0;
      _tmp_183 <= 0;
      _tmp_184 <= 0;
      _tmp_185 <= 0;
      _tmp_186 <= 0;
      _tmp_187 <= 0;
      _tmp_188 <= 0;
      _tmp_189 <= 0;
      _tmp_190 <= 0;
      _tmp_191 <= 0;
      _tmp_192 <= 0;
      _tmp_193 <= 0;
      _tmp_194 <= 0;
      _tmp_195 <= 0;
      _tmp_196 <= 0;
      _tmp_197 <= 0;
      _mystream_busy_reg <= 0;
    end else begin
      if(_mystream_stream_oready) begin
        _mystream_a00_source_ram_renable <= 0;
        _mystream_a00_source_fifo_deq <= 0;
      end 
      _mystream_a00_idle <= _mystream_a00_idle;
      if(_mystream_stream_oready) begin
        _mystream_a01_source_ram_renable <= 0;
        _mystream_a01_source_fifo_deq <= 0;
      end 
      _mystream_a01_idle <= _mystream_a01_idle;
      if(_mystream_stream_oready) begin
        _mystream_a10_source_ram_renable <= 0;
        _mystream_a10_source_fifo_deq <= 0;
      end 
      _mystream_a10_idle <= _mystream_a10_idle;
      if(_mystream_stream_oready) begin
        _mystream_a11_source_ram_renable <= 0;
        _mystream_a11_source_fifo_deq <= 0;
      end 
      _mystream_a11_idle <= _mystream_a11_idle;
      if(_mystream_stream_oready) begin
        _mystream_b00_source_ram_renable <= 0;
        _mystream_b00_source_fifo_deq <= 0;
      end 
      _mystream_b00_idle <= _mystream_b00_idle;
      if(_mystream_stream_oready) begin
        _mystream_b01_source_ram_renable <= 0;
        _mystream_b01_source_fifo_deq <= 0;
      end 
      _mystream_b01_idle <= _mystream_b01_idle;
      if(_mystream_stream_oready) begin
        _mystream_b10_source_ram_renable <= 0;
        _mystream_b10_source_fifo_deq <= 0;
      end 
      _mystream_b10_idle <= _mystream_b10_idle;
      if(_mystream_stream_oready) begin
        _mystream_b11_source_ram_renable <= 0;
        _mystream_b11_source_fifo_deq <= 0;
      end 
      _mystream_b11_idle <= _mystream_b11_idle;
      if(_mystream_stream_oready) begin
        _mystream_sum_list0_sink_wenable <= 0;
        _mystream_sum_list0_sink_fifo_enq <= 0;
      end 
      if(_mystream_stream_oready) begin
        _mystream_sum_valid_list0_sink_wenable <= 0;
        _mystream_sum_valid_list0_sink_fifo_enq <= 0;
      end 
      if(_mystream_stream_oready) begin
        _mystream_sum_list1_sink_wenable <= 0;
        _mystream_sum_list1_sink_fifo_enq <= 0;
      end 
      if(_mystream_stream_oready) begin
        _mystream_sum_valid_list1_sink_wenable <= 0;
        _mystream_sum_valid_list1_sink_fifo_enq <= 0;
      end 
      if(_mystream_stream_oready) begin
        __mystream_stream_ivalid_1 <= _mystream_stream_ivalid;
      end 
      if(_mystream_stream_oready) begin
        __mystream_stream_ivalid_2 <= __mystream_stream_ivalid_1;
      end 
      if(_mystream_stream_oready) begin
        __mystream_stream_ivalid_3 <= __mystream_stream_ivalid_2;
      end 
      if(_mystream_stream_oready) begin
        __mystream_stream_ivalid_4 <= __mystream_stream_ivalid_3;
      end 
      if(_mystream_stream_oready) begin
        __mystream_stream_ivalid_5 <= __mystream_stream_ivalid_4;
      end 
      if(_mystream_stream_oready) begin
        _times_mul_odata_reg_9 <= _times_mul_odata_9;
      end 
      if(_mystream_stream_oready) begin
        _times_mul_odata_reg_10 <= _times_mul_odata_10;
      end 
      if(_mystream_stream_oready) begin
        _times_mul_odata_reg_11 <= _times_mul_odata_11;
      end 
      if(_mystream_stream_oready) begin
        _times_mul_odata_reg_12 <= _times_mul_odata_12;
      end 
      if(_mystream_stream_oready) begin
        __delay_data_24__variable_0 <= mystream_size_data;
      end 
      if(_mystream_stream_oready) begin
        __delay_data_28__variable_15 <= mystream__reduce_reset_data;
      end 
      if(_mystream_stream_oready) begin
        __delay_data_25__delay_24__variable_0 <= __delay_data_24__variable_0;
      end 
      if(_mystream_stream_oready) begin
        __delay_data_29__delay_28__variable_15 <= __delay_data_28__variable_15;
      end 
      if(_mystream_stream_oready) begin
        __delay_data_26__delay_25__delay_24__variable_0 <= __delay_data_25__delay_24__variable_0;
      end 
      if(_mystream_stream_oready) begin
        __delay_data_30__delay_29__delay_28__variable_15 <= __delay_data_29__delay_28__variable_15;
      end 
      if(_mystream_stream_oready) begin
        __plusn_data_13 <= _times_data_9 + _times_data_10;
      end 
      if(_mystream_stream_oready) begin
        __plusn_data_14 <= _times_data_11 + _times_data_12;
      end 
      if(_mystream_stream_oready) begin
        __delay_data_27__delay_26__delay_25__delay_24__variable_0 <= __delay_data_26__delay_25__delay_24__variable_0;
      end 
      if(_mystream_stream_oready) begin
        __delay_data_31__delay_30__delay_29__delay_28__variable_15 <= __delay_data_30__delay_29__delay_28__variable_15;
      end 
      if(__mystream_stream_ivalid_4 && _mystream_stream_oready && _reduceadd_reset_cond_16) begin
        _reduceadd_data_16 <= 1'sd0;
      end 
      if(__mystream_stream_ivalid_4 && _mystream_stream_oready) begin
        _reduceadd_count_16 <= (_reduceadd_current_count_16 >= __delay_data_27__delay_26__delay_25__delay_24__variable_0 - 1)? 0 : _reduceadd_current_count_16 + 1;
      end 
      if(__mystream_stream_ivalid_4 && _mystream_stream_oready) begin
        _reduceadd_prev_count_max_16 <= _reduceadd_current_count_16 >= __delay_data_27__delay_26__delay_25__delay_24__variable_0 - 1;
      end 
      if(__mystream_stream_ivalid_4 && _mystream_stream_oready) begin
        _reduceadd_data_16 <= _reduceadd_current_data_16 + __plusn_data_13;
      end 
      if(__mystream_stream_ivalid_4 && _mystream_stream_oready && _pulse_reset_cond_18) begin
        _pulse_data_18 <= 1'sd0;
      end 
      if(__mystream_stream_ivalid_4 && _mystream_stream_oready) begin
        _pulse_count_18 <= (_pulse_current_count_18 >= __delay_data_27__delay_26__delay_25__delay_24__variable_0 - 1)? 0 : _pulse_current_count_18 + 1;
      end 
      if(__mystream_stream_ivalid_4 && _mystream_stream_oready) begin
        _pulse_prev_count_max_18 <= _pulse_current_count_18 >= __delay_data_27__delay_26__delay_25__delay_24__variable_0 - 1;
      end 
      if(__mystream_stream_ivalid_4 && _mystream_stream_oready) begin
        _pulse_data_18 <= _pulse_current_count_18 >= __delay_data_27__delay_26__delay_25__delay_24__variable_0 - 1;
      end 
      if(__mystream_stream_ivalid_4 && _mystream_stream_oready && _reduceadd_reset_cond_20) begin
        _reduceadd_data_20 <= 1'sd0;
      end 
      if(__mystream_stream_ivalid_4 && _mystream_stream_oready) begin
        _reduceadd_count_20 <= (_reduceadd_current_count_20 >= __delay_data_27__delay_26__delay_25__delay_24__variable_0 - 1)? 0 : _reduceadd_current_count_20 + 1;
      end 
      if(__mystream_stream_ivalid_4 && _mystream_stream_oready) begin
        _reduceadd_prev_count_max_20 <= _reduceadd_current_count_20 >= __delay_data_27__delay_26__delay_25__delay_24__variable_0 - 1;
      end 
      if(__mystream_stream_ivalid_4 && _mystream_stream_oready) begin
        _reduceadd_data_20 <= _reduceadd_current_data_20 + __plusn_data_14;
      end 
      if(__mystream_stream_ivalid_4 && _mystream_stream_oready && _pulse_reset_cond_22) begin
        _pulse_data_22 <= 1'sd0;
      end 
      if(__mystream_stream_ivalid_4 && _mystream_stream_oready) begin
        _pulse_count_22 <= (_pulse_current_count_22 >= __delay_data_27__delay_26__delay_25__delay_24__variable_0 - 1)? 0 : _pulse_current_count_22 + 1;
      end 
      if(__mystream_stream_ivalid_4 && _mystream_stream_oready) begin
        _pulse_prev_count_max_22 <= _pulse_current_count_22 >= __delay_data_27__delay_26__delay_25__delay_24__variable_0 - 1;
      end 
      if(__mystream_stream_ivalid_4 && _mystream_stream_oready) begin
        _pulse_data_22 <= _pulse_current_count_22 >= __delay_data_27__delay_26__delay_25__delay_24__variable_0 - 1;
      end 
      if(_set_flag_104) begin
        _mystream_size_next_parameter_data <= _th_matmul__size_15;
      end 
      if(_mystream_source_start) begin
        __variable_wdata_0 <= _mystream_size_next_parameter_data;
      end 
      if(_set_flag_105) begin
        _mystream_a00_source_mode <= 5'b1;
        _mystream_a00_source_offset <= _th_matmul_offset_12;
        _mystream_a00_source_size <= _th_matmul__size_15;
        _mystream_a00_source_stride <= 1;
      end 
      if(_set_flag_105) begin
        _mystream_a00_source_sel <= 1;
      end 
      if(_mystream_source_start && _mystream_a00_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_a00_source_offset_buf <= _mystream_a00_source_offset;
        _mystream_a00_source_size_buf <= _mystream_a00_source_size;
        _mystream_a00_source_stride_buf <= _mystream_a00_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_1 <= _mystream_a00_source_ram_rdata;
      end 
      if((_mystream_a00_source_fsm_0 == 1) && _mystream_stream_oready) begin
        _mystream_a00_idle <= 0;
        _mystream_a00_source_ram_raddr <= _mystream_a00_source_offset_buf;
        _mystream_a00_source_ram_renable <= 1;
        _mystream_a00_source_count <= _mystream_a00_source_size_buf;
      end 
      if((_mystream_a00_source_fsm_0 == 2) && _mystream_stream_oready) begin
        _mystream_a00_source_ram_raddr <= _mystream_a00_source_ram_raddr + _mystream_a00_source_stride_buf;
        _mystream_a00_source_ram_renable <= 1;
        _mystream_a00_source_count <= _mystream_a00_source_count - 1;
      end 
      if((_mystream_a00_source_fsm_0 == 2) && (_mystream_a00_source_count == 1) && _mystream_stream_oready) begin
        _mystream_a00_source_ram_renable <= 0;
        _mystream_a00_idle <= 1;
      end 
      if((_mystream_a00_source_fsm_0 == 2) && _mystream_source_stop && _mystream_stream_oready) begin
        _mystream_a00_source_ram_renable <= 0;
        _mystream_a00_idle <= 1;
      end 
      if(_set_flag_108) begin
        _mystream_a01_source_mode <= 5'b1;
        _mystream_a01_source_offset <= _th_matmul_offset_12;
        _mystream_a01_source_size <= _th_matmul__size_15;
        _mystream_a01_source_stride <= 1;
      end 
      if(_set_flag_108) begin
        _mystream_a01_source_sel <= 2;
      end 
      if(_mystream_source_start && _mystream_a01_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_a01_source_offset_buf <= _mystream_a01_source_offset;
        _mystream_a01_source_size_buf <= _mystream_a01_source_size;
        _mystream_a01_source_stride_buf <= _mystream_a01_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_2 <= _mystream_a01_source_ram_rdata;
      end 
      if((_mystream_a01_source_fsm_1 == 1) && _mystream_stream_oready) begin
        _mystream_a01_idle <= 0;
        _mystream_a01_source_ram_raddr <= _mystream_a01_source_offset_buf;
        _mystream_a01_source_ram_renable <= 1;
        _mystream_a01_source_count <= _mystream_a01_source_size_buf;
      end 
      if((_mystream_a01_source_fsm_1 == 2) && _mystream_stream_oready) begin
        _mystream_a01_source_ram_raddr <= _mystream_a01_source_ram_raddr + _mystream_a01_source_stride_buf;
        _mystream_a01_source_ram_renable <= 1;
        _mystream_a01_source_count <= _mystream_a01_source_count - 1;
      end 
      if((_mystream_a01_source_fsm_1 == 2) && (_mystream_a01_source_count == 1) && _mystream_stream_oready) begin
        _mystream_a01_source_ram_renable <= 0;
        _mystream_a01_idle <= 1;
      end 
      if((_mystream_a01_source_fsm_1 == 2) && _mystream_source_stop && _mystream_stream_oready) begin
        _mystream_a01_source_ram_renable <= 0;
        _mystream_a01_idle <= 1;
      end 
      if(_set_flag_111) begin
        _mystream_a10_source_mode <= 5'b1;
        _mystream_a10_source_offset <= _th_matmul_offset_12;
        _mystream_a10_source_size <= _th_matmul__size_15;
        _mystream_a10_source_stride <= 1;
      end 
      if(_set_flag_111) begin
        _mystream_a10_source_sel <= 3;
      end 
      if(_mystream_source_start && _mystream_a10_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_a10_source_offset_buf <= _mystream_a10_source_offset;
        _mystream_a10_source_size_buf <= _mystream_a10_source_size;
        _mystream_a10_source_stride_buf <= _mystream_a10_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_3 <= _mystream_a10_source_ram_rdata;
      end 
      if((_mystream_a10_source_fsm_2 == 1) && _mystream_stream_oready) begin
        _mystream_a10_idle <= 0;
        _mystream_a10_source_ram_raddr <= _mystream_a10_source_offset_buf;
        _mystream_a10_source_ram_renable <= 1;
        _mystream_a10_source_count <= _mystream_a10_source_size_buf;
      end 
      if((_mystream_a10_source_fsm_2 == 2) && _mystream_stream_oready) begin
        _mystream_a10_source_ram_raddr <= _mystream_a10_source_ram_raddr + _mystream_a10_source_stride_buf;
        _mystream_a10_source_ram_renable <= 1;
        _mystream_a10_source_count <= _mystream_a10_source_count - 1;
      end 
      if((_mystream_a10_source_fsm_2 == 2) && (_mystream_a10_source_count == 1) && _mystream_stream_oready) begin
        _mystream_a10_source_ram_renable <= 0;
        _mystream_a10_idle <= 1;
      end 
      if((_mystream_a10_source_fsm_2 == 2) && _mystream_source_stop && _mystream_stream_oready) begin
        _mystream_a10_source_ram_renable <= 0;
        _mystream_a10_idle <= 1;
      end 
      if(_set_flag_114) begin
        _mystream_a11_source_mode <= 5'b1;
        _mystream_a11_source_offset <= _th_matmul_offset_12;
        _mystream_a11_source_size <= _th_matmul__size_15;
        _mystream_a11_source_stride <= 1;
      end 
      if(_set_flag_114) begin
        _mystream_a11_source_sel <= 4;
      end 
      if(_mystream_source_start && _mystream_a11_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_a11_source_offset_buf <= _mystream_a11_source_offset;
        _mystream_a11_source_size_buf <= _mystream_a11_source_size;
        _mystream_a11_source_stride_buf <= _mystream_a11_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_4 <= _mystream_a11_source_ram_rdata;
      end 
      if((_mystream_a11_source_fsm_3 == 1) && _mystream_stream_oready) begin
        _mystream_a11_idle <= 0;
        _mystream_a11_source_ram_raddr <= _mystream_a11_source_offset_buf;
        _mystream_a11_source_ram_renable <= 1;
        _mystream_a11_source_count <= _mystream_a11_source_size_buf;
      end 
      if((_mystream_a11_source_fsm_3 == 2) && _mystream_stream_oready) begin
        _mystream_a11_source_ram_raddr <= _mystream_a11_source_ram_raddr + _mystream_a11_source_stride_buf;
        _mystream_a11_source_ram_renable <= 1;
        _mystream_a11_source_count <= _mystream_a11_source_count - 1;
      end 
      if((_mystream_a11_source_fsm_3 == 2) && (_mystream_a11_source_count == 1) && _mystream_stream_oready) begin
        _mystream_a11_source_ram_renable <= 0;
        _mystream_a11_idle <= 1;
      end 
      if((_mystream_a11_source_fsm_3 == 2) && _mystream_source_stop && _mystream_stream_oready) begin
        _mystream_a11_source_ram_renable <= 0;
        _mystream_a11_idle <= 1;
      end 
      if(_set_flag_117) begin
        _mystream_b00_source_mode <= 5'b1;
        _mystream_b00_source_offset <= _th_matmul_offset_12;
        _mystream_b00_source_size <= _th_matmul__size_15;
        _mystream_b00_source_stride <= 1;
      end 
      if(_set_flag_117) begin
        _mystream_b00_source_sel <= 5;
      end 
      if(_mystream_source_start && _mystream_b00_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_b00_source_offset_buf <= _mystream_b00_source_offset;
        _mystream_b00_source_size_buf <= _mystream_b00_source_size;
        _mystream_b00_source_stride_buf <= _mystream_b00_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_5 <= _mystream_b00_source_ram_rdata;
      end 
      if((_mystream_b00_source_fsm_4 == 1) && _mystream_stream_oready) begin
        _mystream_b00_idle <= 0;
        _mystream_b00_source_ram_raddr <= _mystream_b00_source_offset_buf;
        _mystream_b00_source_ram_renable <= 1;
        _mystream_b00_source_count <= _mystream_b00_source_size_buf;
      end 
      if((_mystream_b00_source_fsm_4 == 2) && _mystream_stream_oready) begin
        _mystream_b00_source_ram_raddr <= _mystream_b00_source_ram_raddr + _mystream_b00_source_stride_buf;
        _mystream_b00_source_ram_renable <= 1;
        _mystream_b00_source_count <= _mystream_b00_source_count - 1;
      end 
      if((_mystream_b00_source_fsm_4 == 2) && (_mystream_b00_source_count == 1) && _mystream_stream_oready) begin
        _mystream_b00_source_ram_renable <= 0;
        _mystream_b00_idle <= 1;
      end 
      if((_mystream_b00_source_fsm_4 == 2) && _mystream_source_stop && _mystream_stream_oready) begin
        _mystream_b00_source_ram_renable <= 0;
        _mystream_b00_idle <= 1;
      end 
      if(_set_flag_120) begin
        _mystream_b01_source_mode <= 5'b1;
        _mystream_b01_source_offset <= _th_matmul_offset_12;
        _mystream_b01_source_size <= _th_matmul__size_15;
        _mystream_b01_source_stride <= 1;
      end 
      if(_set_flag_120) begin
        _mystream_b01_source_sel <= 6;
      end 
      if(_mystream_source_start && _mystream_b01_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_b01_source_offset_buf <= _mystream_b01_source_offset;
        _mystream_b01_source_size_buf <= _mystream_b01_source_size;
        _mystream_b01_source_stride_buf <= _mystream_b01_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_6 <= _mystream_b01_source_ram_rdata;
      end 
      if((_mystream_b01_source_fsm_5 == 1) && _mystream_stream_oready) begin
        _mystream_b01_idle <= 0;
        _mystream_b01_source_ram_raddr <= _mystream_b01_source_offset_buf;
        _mystream_b01_source_ram_renable <= 1;
        _mystream_b01_source_count <= _mystream_b01_source_size_buf;
      end 
      if((_mystream_b01_source_fsm_5 == 2) && _mystream_stream_oready) begin
        _mystream_b01_source_ram_raddr <= _mystream_b01_source_ram_raddr + _mystream_b01_source_stride_buf;
        _mystream_b01_source_ram_renable <= 1;
        _mystream_b01_source_count <= _mystream_b01_source_count - 1;
      end 
      if((_mystream_b01_source_fsm_5 == 2) && (_mystream_b01_source_count == 1) && _mystream_stream_oready) begin
        _mystream_b01_source_ram_renable <= 0;
        _mystream_b01_idle <= 1;
      end 
      if((_mystream_b01_source_fsm_5 == 2) && _mystream_source_stop && _mystream_stream_oready) begin
        _mystream_b01_source_ram_renable <= 0;
        _mystream_b01_idle <= 1;
      end 
      if(_set_flag_123) begin
        _mystream_b10_source_mode <= 5'b1;
        _mystream_b10_source_offset <= _th_matmul_offset_12;
        _mystream_b10_source_size <= _th_matmul__size_15;
        _mystream_b10_source_stride <= 1;
      end 
      if(_set_flag_123) begin
        _mystream_b10_source_sel <= 7;
      end 
      if(_mystream_source_start && _mystream_b10_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_b10_source_offset_buf <= _mystream_b10_source_offset;
        _mystream_b10_source_size_buf <= _mystream_b10_source_size;
        _mystream_b10_source_stride_buf <= _mystream_b10_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_7 <= _mystream_b10_source_ram_rdata;
      end 
      if((_mystream_b10_source_fsm_6 == 1) && _mystream_stream_oready) begin
        _mystream_b10_idle <= 0;
        _mystream_b10_source_ram_raddr <= _mystream_b10_source_offset_buf;
        _mystream_b10_source_ram_renable <= 1;
        _mystream_b10_source_count <= _mystream_b10_source_size_buf;
      end 
      if((_mystream_b10_source_fsm_6 == 2) && _mystream_stream_oready) begin
        _mystream_b10_source_ram_raddr <= _mystream_b10_source_ram_raddr + _mystream_b10_source_stride_buf;
        _mystream_b10_source_ram_renable <= 1;
        _mystream_b10_source_count <= _mystream_b10_source_count - 1;
      end 
      if((_mystream_b10_source_fsm_6 == 2) && (_mystream_b10_source_count == 1) && _mystream_stream_oready) begin
        _mystream_b10_source_ram_renable <= 0;
        _mystream_b10_idle <= 1;
      end 
      if((_mystream_b10_source_fsm_6 == 2) && _mystream_source_stop && _mystream_stream_oready) begin
        _mystream_b10_source_ram_renable <= 0;
        _mystream_b10_idle <= 1;
      end 
      if(_set_flag_126) begin
        _mystream_b11_source_mode <= 5'b1;
        _mystream_b11_source_offset <= _th_matmul_offset_12;
        _mystream_b11_source_size <= _th_matmul__size_15;
        _mystream_b11_source_stride <= 1;
      end 
      if(_set_flag_126) begin
        _mystream_b11_source_sel <= 8;
      end 
      if(_mystream_source_start && _mystream_b11_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_b11_source_offset_buf <= _mystream_b11_source_offset;
        _mystream_b11_source_size_buf <= _mystream_b11_source_size;
        _mystream_b11_source_stride_buf <= _mystream_b11_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_8 <= _mystream_b11_source_ram_rdata;
      end 
      if((_mystream_b11_source_fsm_7 == 1) && _mystream_stream_oready) begin
        _mystream_b11_idle <= 0;
        _mystream_b11_source_ram_raddr <= _mystream_b11_source_offset_buf;
        _mystream_b11_source_ram_renable <= 1;
        _mystream_b11_source_count <= _mystream_b11_source_size_buf;
      end 
      if((_mystream_b11_source_fsm_7 == 2) && _mystream_stream_oready) begin
        _mystream_b11_source_ram_raddr <= _mystream_b11_source_ram_raddr + _mystream_b11_source_stride_buf;
        _mystream_b11_source_ram_renable <= 1;
        _mystream_b11_source_count <= _mystream_b11_source_count - 1;
      end 
      if((_mystream_b11_source_fsm_7 == 2) && (_mystream_b11_source_count == 1) && _mystream_stream_oready) begin
        _mystream_b11_source_ram_renable <= 0;
        _mystream_b11_idle <= 1;
      end 
      if((_mystream_b11_source_fsm_7 == 2) && _mystream_source_stop && _mystream_stream_oready) begin
        _mystream_b11_source_ram_renable <= 0;
        _mystream_b11_idle <= 1;
      end 
      if(_mystream_stream_oready) begin
        _tmp_130 <= _set_flag_129;
      end 
      if(_mystream_stream_oready) begin
        _tmp_131 <= _tmp_130;
      end 
      if(_mystream_stream_oready) begin
        _tmp_132 <= _tmp_131;
      end 
      if(_mystream_stream_oready) begin
        _tmp_133 <= _tmp_132;
      end 
      if(_mystream_stream_oready) begin
        _tmp_134 <= _tmp_133;
      end 
      if(_mystream_stream_oready) begin
        _tmp_135 <= _tmp_134;
      end 
      if(_mystream_stream_oready) begin
        _tmp_136 <= _tmp_135;
      end 
      if(_mystream_stream_oready) begin
        _tmp_137 <= _th_matmul_offset_12;
      end 
      if(_mystream_stream_oready) begin
        _tmp_138 <= _tmp_137;
      end 
      if(_mystream_stream_oready) begin
        _tmp_139 <= _tmp_138;
      end 
      if(_mystream_stream_oready) begin
        _tmp_140 <= _tmp_139;
      end 
      if(_mystream_stream_oready) begin
        _tmp_141 <= _tmp_140;
      end 
      if(_mystream_stream_oready) begin
        _tmp_142 <= _tmp_141;
      end 
      if(_mystream_stream_oready) begin
        _tmp_143 <= _tmp_142;
      end 
      if(_tmp_136) begin
        _mystream_sum_list0_sink_mode <= 5'b1;
        _mystream_sum_list0_sink_offset <= _tmp_143;
        _mystream_sum_list0_sink_size <= 1;
        _mystream_sum_list0_sink_stride <= 1;
      end 
      if(_tmp_136) begin
        _mystream_sum_list0_sink_sel <= 9;
      end 
      if(_mystream_sink_start && _mystream_sum_list0_sink_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_sum_list0_sink_offset_buf <= _mystream_sum_list0_sink_offset;
        _mystream_sum_list0_sink_size_buf <= _mystream_sum_list0_sink_size;
        _mystream_sum_list0_sink_stride_buf <= _mystream_sum_list0_sink_stride;
      end 
      if((_mystream_sum_list0_sink_fsm_8 == 1) && _mystream_stream_oready) begin
        _mystream_sum_list0_sink_waddr <= _mystream_sum_list0_sink_offset_buf - _mystream_sum_list0_sink_stride_buf;
        _mystream_sum_list0_sink_count <= _mystream_sum_list0_sink_size_buf;
      end 
      if((_mystream_sum_list0_sink_fsm_8 == 2) && mystream_sum_valid_list0_data && _mystream_stream_oready) begin
        _mystream_sum_list0_sink_waddr <= _mystream_sum_list0_sink_waddr + _mystream_sum_list0_sink_stride_buf;
        _mystream_sum_list0_sink_wdata <= mystream_sum_list0_data;
        _mystream_sum_list0_sink_wenable <= 1;
        _mystream_sum_list0_sink_count <= _mystream_sum_list0_sink_count - 1;
      end 
      if(_mystream_stream_oready) begin
        _tmp_145 <= _set_flag_144;
      end 
      if(_mystream_stream_oready) begin
        _tmp_146 <= _tmp_145;
      end 
      if(_mystream_stream_oready) begin
        _tmp_147 <= _tmp_146;
      end 
      if(_mystream_stream_oready) begin
        _tmp_148 <= _tmp_147;
      end 
      if(_mystream_stream_oready) begin
        _tmp_149 <= _tmp_148;
      end 
      if(_mystream_stream_oready) begin
        _tmp_150 <= _tmp_149;
      end 
      if(_mystream_stream_oready) begin
        _tmp_151 <= _tmp_150;
      end 
      if(_mystream_stream_oready) begin
        _tmp_152 <= _th_matmul_offset_12;
      end 
      if(_mystream_stream_oready) begin
        _tmp_153 <= _tmp_152;
      end 
      if(_mystream_stream_oready) begin
        _tmp_154 <= _tmp_153;
      end 
      if(_mystream_stream_oready) begin
        _tmp_155 <= _tmp_154;
      end 
      if(_mystream_stream_oready) begin
        _tmp_156 <= _tmp_155;
      end 
      if(_mystream_stream_oready) begin
        _tmp_157 <= _tmp_156;
      end 
      if(_mystream_stream_oready) begin
        _tmp_158 <= _tmp_157;
      end 
      if(_tmp_151) begin
        _mystream_sum_list1_sink_mode <= 5'b1;
        _mystream_sum_list1_sink_offset <= _tmp_158;
        _mystream_sum_list1_sink_size <= 1;
        _mystream_sum_list1_sink_stride <= 1;
      end 
      if(_tmp_151) begin
        _mystream_sum_list1_sink_sel <= 10;
      end 
      if(_mystream_sink_start && _mystream_sum_list1_sink_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_sum_list1_sink_offset_buf <= _mystream_sum_list1_sink_offset;
        _mystream_sum_list1_sink_size_buf <= _mystream_sum_list1_sink_size;
        _mystream_sum_list1_sink_stride_buf <= _mystream_sum_list1_sink_stride;
      end 
      if((_mystream_sum_list1_sink_fsm_9 == 1) && _mystream_stream_oready) begin
        _mystream_sum_list1_sink_waddr <= _mystream_sum_list1_sink_offset_buf - _mystream_sum_list1_sink_stride_buf;
        _mystream_sum_list1_sink_count <= _mystream_sum_list1_sink_size_buf;
      end 
      if((_mystream_sum_list1_sink_fsm_9 == 2) && mystream_sum_valid_list1_data && _mystream_stream_oready) begin
        _mystream_sum_list1_sink_waddr <= _mystream_sum_list1_sink_waddr + _mystream_sum_list1_sink_stride_buf;
        _mystream_sum_list1_sink_wdata <= mystream_sum_list1_data;
        _mystream_sum_list1_sink_wenable <= 1;
        _mystream_sum_list1_sink_count <= _mystream_sum_list1_sink_count - 1;
      end 
      if(_mystream_stream_oready) begin
        _tmp_160 <= _mystream_source_start;
      end 
      if(_mystream_stream_oready) begin
        _tmp_161 <= _tmp_160;
      end 
      if(_mystream_stream_oready) begin
        _tmp_162 <= _tmp_161;
      end 
      if(_mystream_stream_oready) begin
        _tmp_163 <= _mystream_source_start;
      end 
      if(_mystream_stream_oready) begin
        _tmp_164 <= _tmp_163;
      end 
      if(_mystream_stream_oready) begin
        _tmp_165 <= _tmp_164;
      end 
      if(_mystream_stream_oready && _tmp_165) begin
        __variable_wdata_15 <= 1;
      end 
      if(_mystream_stream_oready) begin
        _tmp_166 <= _mystream_source_start;
      end 
      if(_mystream_stream_oready) begin
        _tmp_167 <= _tmp_166;
      end 
      if(_mystream_stream_oready) begin
        _tmp_168 <= _tmp_167;
      end 
      if(_mystream_stream_oready) begin
        _tmp_169 <= _tmp_168;
      end 
      if(_mystream_stream_oready && _tmp_169) begin
        __variable_wdata_15 <= 0;
      end 
      if(_mystream_stream_oready) begin
        _tmp_172 <= _tmp_171;
      end 
      if(_mystream_stream_oready) begin
        _tmp_175 <= _tmp_174;
      end 
      if(_mystream_stream_oready && _tmp_175) begin
        __variable_wdata_15 <= 1;
      end 
      if(_mystream_stream_oready) begin
        _tmp_176 <= _mystream_source_start;
      end 
      if(_mystream_stream_oready) begin
        _tmp_177 <= _tmp_176;
      end 
      if(_mystream_stream_oready) begin
        _tmp_178 <= _tmp_177;
      end 
      if(_mystream_stream_oready) begin
        _tmp_179 <= _tmp_178;
      end 
      if(_mystream_stream_oready) begin
        _tmp_180 <= _tmp_179;
      end 
      if(_mystream_stream_oready) begin
        _tmp_181 <= _tmp_180;
      end 
      if(_mystream_stream_oready) begin
        _tmp_182 <= _tmp_181;
      end 
      if(_mystream_stream_oready) begin
        _tmp_183 <= _mystream_source_stop;
      end 
      if(_mystream_stream_oready) begin
        _tmp_184 <= _tmp_183;
      end 
      if(_mystream_stream_oready) begin
        _tmp_185 <= _tmp_184;
      end 
      if(_mystream_stream_oready) begin
        _tmp_186 <= _tmp_185;
      end 
      if(_mystream_stream_oready) begin
        _tmp_187 <= _tmp_186;
      end 
      if(_mystream_stream_oready) begin
        _tmp_188 <= _tmp_187;
      end 
      if(_mystream_stream_oready) begin
        _tmp_189 <= _tmp_188;
      end 
      if(_mystream_stream_oready) begin
        _tmp_190 <= _mystream_source_busy;
      end 
      if(_mystream_stream_oready) begin
        _tmp_191 <= _tmp_190;
      end 
      if(_mystream_stream_oready) begin
        _tmp_192 <= _tmp_191;
      end 
      if(_mystream_stream_oready) begin
        _tmp_193 <= _tmp_192;
      end 
      if(_mystream_stream_oready) begin
        _tmp_194 <= _tmp_193;
      end 
      if(_mystream_stream_oready) begin
        _tmp_195 <= _tmp_194;
      end 
      if(_mystream_stream_oready) begin
        _tmp_196 <= _tmp_195;
      end 
      if(_mystream_stream_oready) begin
        _tmp_197 <= _mystream_sink_busy;
      end 
      if(!_mystream_sink_busy && _tmp_197) begin
        _mystream_busy_reg <= 0;
      end 
      if(_mystream_source_busy) begin
        _mystream_busy_reg <= 1;
      end 
    end
  end

  localparam _mystream_fsm_1 = 1;
  localparam _mystream_fsm_2 = 2;
  localparam _mystream_fsm_3 = 3;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_fsm <= _mystream_fsm_init;
      _mystream_source_start <= 0;
      _mystream_source_busy <= 0;
      _mystream_stream_ivalid <= 0;
    end else begin
      if(_mystream_stream_oready && _tmp_162) begin
        _mystream_stream_ivalid <= 1;
      end 
      if(_mystream_stream_oready && _tmp_172) begin
        _mystream_stream_ivalid <= 0;
      end 
      case(_mystream_fsm)
        _mystream_fsm_init: begin
          if(_mystream_run_flag) begin
            _mystream_source_start <= 1;
          end 
          if(_mystream_run_flag) begin
            _mystream_fsm <= _mystream_fsm_1;
          end 
        end
        _mystream_fsm_1: begin
          if(_mystream_source_start && _mystream_stream_oready) begin
            _mystream_source_start <= 0;
            _mystream_source_busy <= 1;
          end 
          if(_mystream_source_start && _mystream_stream_oready) begin
            _mystream_fsm <= _mystream_fsm_2;
          end 
        end
        _mystream_fsm_2: begin
          if(_mystream_stream_oready) begin
            _mystream_fsm <= _mystream_fsm_3;
          end 
        end
        _mystream_fsm_3: begin
          if(_mystream_stream_oready && (_mystream_a00_idle && _mystream_a01_idle && _mystream_a10_idle && _mystream_a11_idle && _mystream_b00_idle && _mystream_b01_idle && _mystream_b10_idle && _mystream_b11_idle && (_mystream_fsm == 3))) begin
            _mystream_source_busy <= 0;
          end 
          if(_mystream_stream_oready && (_mystream_a00_idle && _mystream_a01_idle && _mystream_a10_idle && _mystream_a11_idle && _mystream_b00_idle && _mystream_b01_idle && _mystream_b10_idle && _mystream_b11_idle && (_mystream_fsm == 3)) && _mystream_run_flag) begin
            _mystream_source_start <= 1;
          end 
          if(_mystream_stream_oready && (_mystream_a00_idle && _mystream_a01_idle && _mystream_a10_idle && _mystream_a11_idle && _mystream_b00_idle && _mystream_b01_idle && _mystream_b10_idle && _mystream_b11_idle && (_mystream_fsm == 3))) begin
            _mystream_fsm <= _mystream_fsm_init;
          end 
          if(_mystream_stream_oready && (_mystream_a00_idle && _mystream_a01_idle && _mystream_a10_idle && _mystream_a11_idle && _mystream_b00_idle && _mystream_b01_idle && _mystream_b10_idle && _mystream_b11_idle && (_mystream_fsm == 3)) && _mystream_run_flag) begin
            _mystream_fsm <= _mystream_fsm_1;
          end 
        end
      endcase
    end
  end

  localparam th_matmul_1 = 1;
  localparam th_matmul_2 = 2;
  localparam th_matmul_3 = 3;
  localparam th_matmul_4 = 4;
  localparam th_matmul_5 = 5;
  localparam th_matmul_6 = 6;
  localparam th_matmul_7 = 7;
  localparam th_matmul_8 = 8;
  localparam th_matmul_9 = 9;
  localparam th_matmul_10 = 10;
  localparam th_matmul_11 = 11;
  localparam th_matmul_12 = 12;
  localparam th_matmul_13 = 13;
  localparam th_matmul_14 = 14;
  localparam th_matmul_15 = 15;
  localparam th_matmul_16 = 16;
  localparam th_matmul_17 = 17;
  localparam th_matmul_18 = 18;
  localparam th_matmul_19 = 19;
  localparam th_matmul_20 = 20;
  localparam th_matmul_21 = 21;
  localparam th_matmul_22 = 22;
  localparam th_matmul_23 = 23;
  localparam th_matmul_24 = 24;
  localparam th_matmul_25 = 25;
  localparam th_matmul_26 = 26;
  localparam th_matmul_27 = 27;
  localparam th_matmul_28 = 28;
  localparam th_matmul_29 = 29;
  localparam th_matmul_30 = 30;
  localparam th_matmul_31 = 31;
  localparam th_matmul_32 = 32;
  localparam th_matmul_33 = 33;
  localparam th_matmul_34 = 34;
  localparam th_matmul_35 = 35;
  localparam th_matmul_36 = 36;
  localparam th_matmul_37 = 37;
  localparam th_matmul_38 = 38;
  localparam th_matmul_39 = 39;
  localparam th_matmul_40 = 40;
  localparam th_matmul_41 = 41;
  localparam th_matmul_42 = 42;

  always @(posedge CLK) begin
    if(RST) begin
      th_matmul <= th_matmul_init;
      _th_matmul_matrix_size_0 <= 0;
      _th_matmul_a_offset_1 <= 0;
      _th_matmul_b_offset_2 <= 0;
      _th_matmul_c_offset_3 <= 0;
      _th_matmul_offset_4 <= 0;
      _th_matmul_matrix_size_a_5 <= 0;
      _th_matmul_matrix_size_b_6 <= 0;
      _th_matmul_matrix_size_k_7 <= 0;
      _th_matmul_c_offset_8 <= 0;
      _th_matmul_i_9 <= 0;
      _th_matmul_j_10 <= 0;
      _th_matmul_size_11 <= 0;
      _th_matmul_offset_12 <= 0;
      _th_matmul_indexa_13 <= 0;
      _th_matmul_indexb_14 <= 0;
      _th_matmul__size_15 <= 0;
    end else begin
      case(th_matmul)
        th_matmul_init: begin
          th_matmul <= th_matmul_1;
        end
        th_matmul_1: begin
          if(1) begin
            th_matmul <= th_matmul_2;
          end else begin
            th_matmul <= th_matmul_42;
          end
        end
        th_matmul_2: begin
          if(_saxi_register_0 == 1) begin
            th_matmul <= th_matmul_3;
          end 
        end
        th_matmul_3: begin
          th_matmul <= th_matmul_4;
        end
        th_matmul_4: begin
          _th_matmul_matrix_size_0 <= _saxi_register_2;
          th_matmul <= th_matmul_5;
        end
        th_matmul_5: begin
          _th_matmul_a_offset_1 <= _saxi_register_3;
          th_matmul <= th_matmul_6;
        end
        th_matmul_6: begin
          _th_matmul_b_offset_2 <= _saxi_register_4;
          th_matmul <= th_matmul_7;
        end
        th_matmul_7: begin
          _th_matmul_c_offset_3 <= _saxi_register_5;
          th_matmul <= th_matmul_8;
        end
        th_matmul_8: begin
          _th_matmul_offset_4 <= 0;
          th_matmul <= th_matmul_9;
        end
        th_matmul_9: begin
          _th_matmul_matrix_size_a_5 <= _th_matmul_matrix_size_0;
          _th_matmul_matrix_size_b_6 <= _th_matmul_matrix_size_0;
          _th_matmul_matrix_size_k_7 <= _th_matmul_matrix_size_0;
          _th_matmul_c_offset_8 <= _th_matmul_c_offset_3;
          th_matmul <= th_matmul_10;
        end
        th_matmul_10: begin
          _th_matmul_i_9 <= 0;
          th_matmul <= th_matmul_11;
        end
        th_matmul_11: begin
          if(_th_matmul_i_9 < _th_matmul_matrix_size_a_5) begin
            th_matmul <= th_matmul_12;
          end else begin
            th_matmul <= th_matmul_40;
          end
        end
        th_matmul_12: begin
          if(_maxi_read_req_idle) begin
            th_matmul <= th_matmul_13;
          end 
        end
        th_matmul_13: begin
          if(_maxi_read_idle) begin
            th_matmul <= th_matmul_14;
          end 
        end
        th_matmul_14: begin
          if(_maxi_read_req_idle) begin
            th_matmul <= th_matmul_15;
          end 
        end
        th_matmul_15: begin
          if(_maxi_read_idle) begin
            th_matmul <= th_matmul_16;
          end 
        end
        th_matmul_16: begin
          _th_matmul_j_10 <= 0;
          th_matmul <= th_matmul_17;
        end
        th_matmul_17: begin
          if(_th_matmul_j_10 < (_th_matmul_matrix_size_b_6 >>> 1)) begin
            th_matmul <= th_matmul_18;
          end else begin
            th_matmul <= th_matmul_39;
          end
        end
        th_matmul_18: begin
          if(_maxi_read_req_idle) begin
            th_matmul <= th_matmul_19;
          end 
        end
        th_matmul_19: begin
          if(_maxi_read_idle) begin
            th_matmul <= th_matmul_20;
          end 
        end
        th_matmul_20: begin
          if(_maxi_read_req_idle) begin
            th_matmul <= th_matmul_21;
          end 
        end
        th_matmul_21: begin
          if(_maxi_read_idle) begin
            th_matmul <= th_matmul_22;
          end 
        end
        th_matmul_22: begin
          _th_matmul_size_11 <= 64;
          _th_matmul_offset_12 <= 0;
          _th_matmul_indexa_13 <= _th_matmul_i_9;
          _th_matmul_indexb_14 <= _th_matmul_j_10;
          th_matmul <= th_matmul_23;
        end
        th_matmul_23: begin
          _th_matmul__size_15 <= _th_matmul_size_11 >>> 2;
          th_matmul <= th_matmul_24;
        end
        th_matmul_24: begin
          th_matmul <= th_matmul_25;
        end
        th_matmul_25: begin
          th_matmul <= th_matmul_26;
        end
        th_matmul_26: begin
          th_matmul <= th_matmul_27;
        end
        th_matmul_27: begin
          th_matmul <= th_matmul_28;
        end
        th_matmul_28: begin
          th_matmul <= th_matmul_29;
        end
        th_matmul_29: begin
          th_matmul <= th_matmul_30;
        end
        th_matmul_30: begin
          th_matmul <= th_matmul_31;
        end
        th_matmul_31: begin
          th_matmul <= th_matmul_32;
        end
        th_matmul_32: begin
          th_matmul <= th_matmul_33;
        end
        th_matmul_33: begin
          th_matmul <= th_matmul_34;
        end
        th_matmul_34: begin
          if(_mystream_busy) begin
            th_matmul <= th_matmul_35;
          end 
        end
        th_matmul_35: begin
          if(!_mystream_busy) begin
            th_matmul <= th_matmul_36;
          end 
        end
        th_matmul_36: begin
          if(_maxi_write_req_idle) begin
            th_matmul <= th_matmul_37;
          end 
        end
        th_matmul_37: begin
          if(_maxi_write_idle && (outstanding_wcount_0 == 0)) begin
            th_matmul <= th_matmul_38;
          end 
        end
        th_matmul_38: begin
          _th_matmul_j_10 <= _th_matmul_j_10 + 1;
          th_matmul <= th_matmul_17;
        end
        th_matmul_39: begin
          _th_matmul_i_9 <= _th_matmul_i_9 + 1;
          th_matmul <= th_matmul_11;
        end
        th_matmul_40: begin
          th_matmul <= th_matmul_41;
        end
        th_matmul_41: begin
          th_matmul <= th_matmul_1;
        end
      endcase
    end
  end

  localparam _maxi_read_req_fsm_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      _maxi_read_req_fsm <= _maxi_read_req_fsm_init;
      _maxi_read_cont <= 0;
    end else begin
      case(_maxi_read_req_fsm)
        _maxi_read_req_fsm_init: begin
          if((_maxi_read_req_fsm == 0) && (_maxi_read_start || _maxi_read_cont) && !_maxi_read_req_fifo_almost_full) begin
            _maxi_read_req_fsm <= _maxi_read_req_fsm_1;
          end 
        end
        _maxi_read_req_fsm_1: begin
          if(maxi_arready || !maxi_arvalid) begin
            _maxi_read_cont <= 1;
          end 
          if((maxi_arready || !maxi_arvalid) && (_maxi_read_global_size == 0)) begin
            _maxi_read_cont <= 0;
          end 
          if(maxi_arready || !maxi_arvalid) begin
            _maxi_read_req_fsm <= _maxi_read_req_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam _maxi_read_data_narrow_fsm_1 = 1;
  localparam _maxi_read_data_narrow_fsm_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _maxi_read_data_narrow_fsm <= _maxi_read_data_narrow_fsm_init;
      _maxi_read_narrow_count_47 <= 0;
      _maxi_read_narrow_wvalid_46 <= 0;
      _maxi_read_narrow_wdata_45 <= 0;
      _maxi_read_narrow_count_63 <= 0;
      _maxi_read_narrow_wvalid_62 <= 0;
      _maxi_read_narrow_wdata_61 <= 0;
      _maxi_read_narrow_count_79 <= 0;
      _maxi_read_narrow_wvalid_78 <= 0;
      _maxi_read_narrow_wdata_77 <= 0;
      _maxi_read_narrow_count_95 <= 0;
      _maxi_read_narrow_wvalid_94 <= 0;
      _maxi_read_narrow_wdata_93 <= 0;
    end else begin
      case(_maxi_read_data_narrow_fsm)
        _maxi_read_data_narrow_fsm_init: begin
          if(_maxi_read_data_idle && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 1)) begin
            _maxi_read_data_narrow_fsm <= _maxi_read_data_narrow_fsm_1;
          end 
          if(_maxi_read_data_idle && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 2)) begin
            _maxi_read_data_narrow_fsm <= _maxi_read_data_narrow_fsm_1;
          end 
          if(_maxi_read_data_idle && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 3)) begin
            _maxi_read_data_narrow_fsm <= _maxi_read_data_narrow_fsm_1;
          end 
          if(_maxi_read_data_idle && !_maxi_read_req_fifo_empty && (_maxi_read_op_sel_fifo == 4)) begin
            _maxi_read_data_narrow_fsm <= _maxi_read_data_narrow_fsm_1;
          end 
        end
        _maxi_read_data_narrow_fsm_1: begin
          _maxi_read_narrow_count_47 <= 0;
          _maxi_read_narrow_wvalid_46 <= 0;
          _maxi_read_narrow_count_63 <= 0;
          _maxi_read_narrow_wvalid_62 <= 0;
          _maxi_read_narrow_count_79 <= 0;
          _maxi_read_narrow_wvalid_78 <= 0;
          _maxi_read_narrow_count_95 <= 0;
          _maxi_read_narrow_wvalid_94 <= 0;
          _maxi_read_data_narrow_fsm <= _maxi_read_data_narrow_fsm_2;
          _maxi_read_data_narrow_fsm <= _maxi_read_data_narrow_fsm_2;
          _maxi_read_data_narrow_fsm <= _maxi_read_data_narrow_fsm_2;
          _maxi_read_data_narrow_fsm <= _maxi_read_data_narrow_fsm_2;
        end
        _maxi_read_data_narrow_fsm_2: begin
          if(_maxi_read_op_sel_buf == 1) begin
            _maxi_read_narrow_wvalid_46 <= 0;
          end 
          if((_maxi_read_op_sel_buf == 1) && maxi_rvalid && (_maxi_read_narrow_count_47 < 1)) begin
            _maxi_read_narrow_count_47 <= _maxi_read_narrow_count_47 + 1;
            _maxi_read_narrow_wdata_45 <= { maxi_rdata, _maxi_read_narrow_wdata_45[63:32] };
            _maxi_read_narrow_wvalid_46 <= 0;
          end 
          if((_maxi_read_op_sel_buf == 1) && maxi_rvalid && (_maxi_read_narrow_count_47 == 1)) begin
            _maxi_read_narrow_count_47 <= 0;
            _maxi_read_narrow_wdata_45 <= { maxi_rdata, _maxi_read_narrow_wdata_45[63:32] };
            _maxi_read_narrow_wvalid_46 <= 1;
          end 
          if(_maxi_read_op_sel_buf == 2) begin
            _maxi_read_narrow_wvalid_62 <= 0;
          end 
          if((_maxi_read_op_sel_buf == 2) && maxi_rvalid && (_maxi_read_narrow_count_63 < 1)) begin
            _maxi_read_narrow_count_63 <= _maxi_read_narrow_count_63 + 1;
            _maxi_read_narrow_wdata_61 <= { maxi_rdata, _maxi_read_narrow_wdata_61[63:32] };
            _maxi_read_narrow_wvalid_62 <= 0;
          end 
          if((_maxi_read_op_sel_buf == 2) && maxi_rvalid && (_maxi_read_narrow_count_63 == 1)) begin
            _maxi_read_narrow_count_63 <= 0;
            _maxi_read_narrow_wdata_61 <= { maxi_rdata, _maxi_read_narrow_wdata_61[63:32] };
            _maxi_read_narrow_wvalid_62 <= 1;
          end 
          if(_maxi_read_op_sel_buf == 3) begin
            _maxi_read_narrow_wvalid_78 <= 0;
          end 
          if((_maxi_read_op_sel_buf == 3) && maxi_rvalid && (_maxi_read_narrow_count_79 < 1)) begin
            _maxi_read_narrow_count_79 <= _maxi_read_narrow_count_79 + 1;
            _maxi_read_narrow_wdata_77 <= { maxi_rdata, _maxi_read_narrow_wdata_77[63:32] };
            _maxi_read_narrow_wvalid_78 <= 0;
          end 
          if((_maxi_read_op_sel_buf == 3) && maxi_rvalid && (_maxi_read_narrow_count_79 == 1)) begin
            _maxi_read_narrow_count_79 <= 0;
            _maxi_read_narrow_wdata_77 <= { maxi_rdata, _maxi_read_narrow_wdata_77[63:32] };
            _maxi_read_narrow_wvalid_78 <= 1;
          end 
          if(_maxi_read_op_sel_buf == 4) begin
            _maxi_read_narrow_wvalid_94 <= 0;
          end 
          if((_maxi_read_op_sel_buf == 4) && maxi_rvalid && (_maxi_read_narrow_count_95 < 1)) begin
            _maxi_read_narrow_count_95 <= _maxi_read_narrow_count_95 + 1;
            _maxi_read_narrow_wdata_93 <= { maxi_rdata, _maxi_read_narrow_wdata_93[63:32] };
            _maxi_read_narrow_wvalid_94 <= 0;
          end 
          if((_maxi_read_op_sel_buf == 4) && maxi_rvalid && (_maxi_read_narrow_count_95 == 1)) begin
            _maxi_read_narrow_count_95 <= 0;
            _maxi_read_narrow_wdata_93 <= { maxi_rdata, _maxi_read_narrow_wdata_93[63:32] };
            _maxi_read_narrow_wvalid_94 <= 1;
          end 
          if((_maxi_read_op_sel_buf == 1) && maxi_rvalid && (_maxi_read_local_size_buf <= 1) && (_maxi_read_narrow_count_47 == 1)) begin
            _maxi_read_data_narrow_fsm <= _maxi_read_data_narrow_fsm_init;
          end 
          if((_maxi_read_op_sel_buf == 2) && maxi_rvalid && (_maxi_read_local_size_buf <= 1) && (_maxi_read_narrow_count_63 == 1)) begin
            _maxi_read_data_narrow_fsm <= _maxi_read_data_narrow_fsm_init;
          end 
          if((_maxi_read_op_sel_buf == 3) && maxi_rvalid && (_maxi_read_local_size_buf <= 1) && (_maxi_read_narrow_count_79 == 1)) begin
            _maxi_read_data_narrow_fsm <= _maxi_read_data_narrow_fsm_init;
          end 
          if((_maxi_read_op_sel_buf == 4) && maxi_rvalid && (_maxi_read_local_size_buf <= 1) && (_maxi_read_narrow_count_95 == 1)) begin
            _maxi_read_data_narrow_fsm <= _maxi_read_data_narrow_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_packed_fsm_0_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_packed_fsm_0 <= write_burst_packed_fsm_0_init;
      write_burst_packed_addr_48 <= 0;
      write_burst_packed_stride_49 <= 0;
      write_burst_packed_length_50 <= 0;
      write_burst_packed_done_51 <= 0;
    end else begin
      case(write_burst_packed_fsm_0)
        write_burst_packed_fsm_0_init: begin
          write_burst_packed_addr_48 <= _maxi_read_local_addr_buf;
          write_burst_packed_stride_49 <= _maxi_read_local_stride_buf;
          write_burst_packed_length_50 <= _maxi_read_local_size_buf;
          write_burst_packed_done_51 <= 0;
          if((_maxi_read_data_narrow_fsm == 1) && (_maxi_read_op_sel_buf == 1) && (_maxi_read_local_size_buf > 0)) begin
            write_burst_packed_fsm_0 <= write_burst_packed_fsm_0_1;
          end 
        end
        write_burst_packed_fsm_0_1: begin
          if(_maxi_read_narrow_wvalid_46) begin
            write_burst_packed_addr_48 <= write_burst_packed_addr_48 + write_burst_packed_stride_49;
            write_burst_packed_length_50 <= write_burst_packed_length_50 - 1;
            write_burst_packed_done_51 <= 0;
          end 
          if(_maxi_read_narrow_wvalid_46 && (write_burst_packed_length_50 <= 1)) begin
            write_burst_packed_done_51 <= 1;
          end 
          if(_maxi_read_narrow_wvalid_46 && 0) begin
            write_burst_packed_done_51 <= 1;
          end 
          if(_maxi_read_narrow_wvalid_46 && (write_burst_packed_length_50 <= 1)) begin
            write_burst_packed_fsm_0 <= write_burst_packed_fsm_0_init;
          end 
          if(_maxi_read_narrow_wvalid_46 && 0) begin
            write_burst_packed_fsm_0 <= write_burst_packed_fsm_0_init;
          end 
          if(0) begin
            write_burst_packed_fsm_0 <= write_burst_packed_fsm_0_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_packed_fsm_1_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_packed_fsm_1 <= write_burst_packed_fsm_1_init;
      write_burst_packed_addr_64 <= 0;
      write_burst_packed_stride_65 <= 0;
      write_burst_packed_length_66 <= 0;
      write_burst_packed_done_67 <= 0;
    end else begin
      case(write_burst_packed_fsm_1)
        write_burst_packed_fsm_1_init: begin
          write_burst_packed_addr_64 <= _maxi_read_local_addr_buf;
          write_burst_packed_stride_65 <= _maxi_read_local_stride_buf;
          write_burst_packed_length_66 <= _maxi_read_local_size_buf;
          write_burst_packed_done_67 <= 0;
          if((_maxi_read_data_narrow_fsm == 1) && (_maxi_read_op_sel_buf == 2) && (_maxi_read_local_size_buf > 0)) begin
            write_burst_packed_fsm_1 <= write_burst_packed_fsm_1_1;
          end 
        end
        write_burst_packed_fsm_1_1: begin
          if(_maxi_read_narrow_wvalid_62) begin
            write_burst_packed_addr_64 <= write_burst_packed_addr_64 + write_burst_packed_stride_65;
            write_burst_packed_length_66 <= write_burst_packed_length_66 - 1;
            write_burst_packed_done_67 <= 0;
          end 
          if(_maxi_read_narrow_wvalid_62 && (write_burst_packed_length_66 <= 1)) begin
            write_burst_packed_done_67 <= 1;
          end 
          if(_maxi_read_narrow_wvalid_62 && 0) begin
            write_burst_packed_done_67 <= 1;
          end 
          if(_maxi_read_narrow_wvalid_62 && (write_burst_packed_length_66 <= 1)) begin
            write_burst_packed_fsm_1 <= write_burst_packed_fsm_1_init;
          end 
          if(_maxi_read_narrow_wvalid_62 && 0) begin
            write_burst_packed_fsm_1 <= write_burst_packed_fsm_1_init;
          end 
          if(0) begin
            write_burst_packed_fsm_1 <= write_burst_packed_fsm_1_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_packed_fsm_2_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_packed_fsm_2 <= write_burst_packed_fsm_2_init;
      write_burst_packed_addr_80 <= 0;
      write_burst_packed_stride_81 <= 0;
      write_burst_packed_length_82 <= 0;
      write_burst_packed_done_83 <= 0;
    end else begin
      case(write_burst_packed_fsm_2)
        write_burst_packed_fsm_2_init: begin
          write_burst_packed_addr_80 <= _maxi_read_local_addr_buf;
          write_burst_packed_stride_81 <= _maxi_read_local_stride_buf;
          write_burst_packed_length_82 <= _maxi_read_local_size_buf;
          write_burst_packed_done_83 <= 0;
          if((_maxi_read_data_narrow_fsm == 1) && (_maxi_read_op_sel_buf == 3) && (_maxi_read_local_size_buf > 0)) begin
            write_burst_packed_fsm_2 <= write_burst_packed_fsm_2_1;
          end 
        end
        write_burst_packed_fsm_2_1: begin
          if(_maxi_read_narrow_wvalid_78) begin
            write_burst_packed_addr_80 <= write_burst_packed_addr_80 + write_burst_packed_stride_81;
            write_burst_packed_length_82 <= write_burst_packed_length_82 - 1;
            write_burst_packed_done_83 <= 0;
          end 
          if(_maxi_read_narrow_wvalid_78 && (write_burst_packed_length_82 <= 1)) begin
            write_burst_packed_done_83 <= 1;
          end 
          if(_maxi_read_narrow_wvalid_78 && 0) begin
            write_burst_packed_done_83 <= 1;
          end 
          if(_maxi_read_narrow_wvalid_78 && (write_burst_packed_length_82 <= 1)) begin
            write_burst_packed_fsm_2 <= write_burst_packed_fsm_2_init;
          end 
          if(_maxi_read_narrow_wvalid_78 && 0) begin
            write_burst_packed_fsm_2 <= write_burst_packed_fsm_2_init;
          end 
          if(0) begin
            write_burst_packed_fsm_2 <= write_burst_packed_fsm_2_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_packed_fsm_3_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_packed_fsm_3 <= write_burst_packed_fsm_3_init;
      write_burst_packed_addr_96 <= 0;
      write_burst_packed_stride_97 <= 0;
      write_burst_packed_length_98 <= 0;
      write_burst_packed_done_99 <= 0;
    end else begin
      case(write_burst_packed_fsm_3)
        write_burst_packed_fsm_3_init: begin
          write_burst_packed_addr_96 <= _maxi_read_local_addr_buf;
          write_burst_packed_stride_97 <= _maxi_read_local_stride_buf;
          write_burst_packed_length_98 <= _maxi_read_local_size_buf;
          write_burst_packed_done_99 <= 0;
          if((_maxi_read_data_narrow_fsm == 1) && (_maxi_read_op_sel_buf == 4) && (_maxi_read_local_size_buf > 0)) begin
            write_burst_packed_fsm_3 <= write_burst_packed_fsm_3_1;
          end 
        end
        write_burst_packed_fsm_3_1: begin
          if(_maxi_read_narrow_wvalid_94) begin
            write_burst_packed_addr_96 <= write_burst_packed_addr_96 + write_burst_packed_stride_97;
            write_burst_packed_length_98 <= write_burst_packed_length_98 - 1;
            write_burst_packed_done_99 <= 0;
          end 
          if(_maxi_read_narrow_wvalid_94 && (write_burst_packed_length_98 <= 1)) begin
            write_burst_packed_done_99 <= 1;
          end 
          if(_maxi_read_narrow_wvalid_94 && 0) begin
            write_burst_packed_done_99 <= 1;
          end 
          if(_maxi_read_narrow_wvalid_94 && (write_burst_packed_length_98 <= 1)) begin
            write_burst_packed_fsm_3 <= write_burst_packed_fsm_3_init;
          end 
          if(_maxi_read_narrow_wvalid_94 && 0) begin
            write_burst_packed_fsm_3 <= write_burst_packed_fsm_3_init;
          end 
          if(0) begin
            write_burst_packed_fsm_3 <= write_burst_packed_fsm_3_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_a00_source_fsm_0_1 = 1;
  localparam _mystream_a00_source_fsm_0_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_a00_source_fsm_0 <= _mystream_a00_source_fsm_0_init;
    end else begin
      case(_mystream_a00_source_fsm_0)
        _mystream_a00_source_fsm_0_init: begin
          if(_mystream_source_start && _mystream_a00_source_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_a00_source_fsm_0 <= _mystream_a00_source_fsm_0_1;
          end 
        end
        _mystream_a00_source_fsm_0_1: begin
          if(_mystream_stream_oready) begin
            _mystream_a00_source_fsm_0 <= _mystream_a00_source_fsm_0_2;
          end 
        end
        _mystream_a00_source_fsm_0_2: begin
          if((_mystream_a00_source_count == 1) && _mystream_stream_oready) begin
            _mystream_a00_source_fsm_0 <= _mystream_a00_source_fsm_0_init;
          end 
          if(_mystream_source_stop && _mystream_stream_oready) begin
            _mystream_a00_source_fsm_0 <= _mystream_a00_source_fsm_0_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_a01_source_fsm_1_1 = 1;
  localparam _mystream_a01_source_fsm_1_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_a01_source_fsm_1 <= _mystream_a01_source_fsm_1_init;
    end else begin
      case(_mystream_a01_source_fsm_1)
        _mystream_a01_source_fsm_1_init: begin
          if(_mystream_source_start && _mystream_a01_source_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_a01_source_fsm_1 <= _mystream_a01_source_fsm_1_1;
          end 
        end
        _mystream_a01_source_fsm_1_1: begin
          if(_mystream_stream_oready) begin
            _mystream_a01_source_fsm_1 <= _mystream_a01_source_fsm_1_2;
          end 
        end
        _mystream_a01_source_fsm_1_2: begin
          if((_mystream_a01_source_count == 1) && _mystream_stream_oready) begin
            _mystream_a01_source_fsm_1 <= _mystream_a01_source_fsm_1_init;
          end 
          if(_mystream_source_stop && _mystream_stream_oready) begin
            _mystream_a01_source_fsm_1 <= _mystream_a01_source_fsm_1_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_a10_source_fsm_2_1 = 1;
  localparam _mystream_a10_source_fsm_2_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_a10_source_fsm_2 <= _mystream_a10_source_fsm_2_init;
    end else begin
      case(_mystream_a10_source_fsm_2)
        _mystream_a10_source_fsm_2_init: begin
          if(_mystream_source_start && _mystream_a10_source_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_a10_source_fsm_2 <= _mystream_a10_source_fsm_2_1;
          end 
        end
        _mystream_a10_source_fsm_2_1: begin
          if(_mystream_stream_oready) begin
            _mystream_a10_source_fsm_2 <= _mystream_a10_source_fsm_2_2;
          end 
        end
        _mystream_a10_source_fsm_2_2: begin
          if((_mystream_a10_source_count == 1) && _mystream_stream_oready) begin
            _mystream_a10_source_fsm_2 <= _mystream_a10_source_fsm_2_init;
          end 
          if(_mystream_source_stop && _mystream_stream_oready) begin
            _mystream_a10_source_fsm_2 <= _mystream_a10_source_fsm_2_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_a11_source_fsm_3_1 = 1;
  localparam _mystream_a11_source_fsm_3_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_a11_source_fsm_3 <= _mystream_a11_source_fsm_3_init;
    end else begin
      case(_mystream_a11_source_fsm_3)
        _mystream_a11_source_fsm_3_init: begin
          if(_mystream_source_start && _mystream_a11_source_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_a11_source_fsm_3 <= _mystream_a11_source_fsm_3_1;
          end 
        end
        _mystream_a11_source_fsm_3_1: begin
          if(_mystream_stream_oready) begin
            _mystream_a11_source_fsm_3 <= _mystream_a11_source_fsm_3_2;
          end 
        end
        _mystream_a11_source_fsm_3_2: begin
          if((_mystream_a11_source_count == 1) && _mystream_stream_oready) begin
            _mystream_a11_source_fsm_3 <= _mystream_a11_source_fsm_3_init;
          end 
          if(_mystream_source_stop && _mystream_stream_oready) begin
            _mystream_a11_source_fsm_3 <= _mystream_a11_source_fsm_3_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_b00_source_fsm_4_1 = 1;
  localparam _mystream_b00_source_fsm_4_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_b00_source_fsm_4 <= _mystream_b00_source_fsm_4_init;
    end else begin
      case(_mystream_b00_source_fsm_4)
        _mystream_b00_source_fsm_4_init: begin
          if(_mystream_source_start && _mystream_b00_source_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_b00_source_fsm_4 <= _mystream_b00_source_fsm_4_1;
          end 
        end
        _mystream_b00_source_fsm_4_1: begin
          if(_mystream_stream_oready) begin
            _mystream_b00_source_fsm_4 <= _mystream_b00_source_fsm_4_2;
          end 
        end
        _mystream_b00_source_fsm_4_2: begin
          if((_mystream_b00_source_count == 1) && _mystream_stream_oready) begin
            _mystream_b00_source_fsm_4 <= _mystream_b00_source_fsm_4_init;
          end 
          if(_mystream_source_stop && _mystream_stream_oready) begin
            _mystream_b00_source_fsm_4 <= _mystream_b00_source_fsm_4_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_b01_source_fsm_5_1 = 1;
  localparam _mystream_b01_source_fsm_5_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_b01_source_fsm_5 <= _mystream_b01_source_fsm_5_init;
    end else begin
      case(_mystream_b01_source_fsm_5)
        _mystream_b01_source_fsm_5_init: begin
          if(_mystream_source_start && _mystream_b01_source_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_b01_source_fsm_5 <= _mystream_b01_source_fsm_5_1;
          end 
        end
        _mystream_b01_source_fsm_5_1: begin
          if(_mystream_stream_oready) begin
            _mystream_b01_source_fsm_5 <= _mystream_b01_source_fsm_5_2;
          end 
        end
        _mystream_b01_source_fsm_5_2: begin
          if((_mystream_b01_source_count == 1) && _mystream_stream_oready) begin
            _mystream_b01_source_fsm_5 <= _mystream_b01_source_fsm_5_init;
          end 
          if(_mystream_source_stop && _mystream_stream_oready) begin
            _mystream_b01_source_fsm_5 <= _mystream_b01_source_fsm_5_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_b10_source_fsm_6_1 = 1;
  localparam _mystream_b10_source_fsm_6_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_b10_source_fsm_6 <= _mystream_b10_source_fsm_6_init;
    end else begin
      case(_mystream_b10_source_fsm_6)
        _mystream_b10_source_fsm_6_init: begin
          if(_mystream_source_start && _mystream_b10_source_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_b10_source_fsm_6 <= _mystream_b10_source_fsm_6_1;
          end 
        end
        _mystream_b10_source_fsm_6_1: begin
          if(_mystream_stream_oready) begin
            _mystream_b10_source_fsm_6 <= _mystream_b10_source_fsm_6_2;
          end 
        end
        _mystream_b10_source_fsm_6_2: begin
          if((_mystream_b10_source_count == 1) && _mystream_stream_oready) begin
            _mystream_b10_source_fsm_6 <= _mystream_b10_source_fsm_6_init;
          end 
          if(_mystream_source_stop && _mystream_stream_oready) begin
            _mystream_b10_source_fsm_6 <= _mystream_b10_source_fsm_6_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_b11_source_fsm_7_1 = 1;
  localparam _mystream_b11_source_fsm_7_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_b11_source_fsm_7 <= _mystream_b11_source_fsm_7_init;
    end else begin
      case(_mystream_b11_source_fsm_7)
        _mystream_b11_source_fsm_7_init: begin
          if(_mystream_source_start && _mystream_b11_source_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_b11_source_fsm_7 <= _mystream_b11_source_fsm_7_1;
          end 
        end
        _mystream_b11_source_fsm_7_1: begin
          if(_mystream_stream_oready) begin
            _mystream_b11_source_fsm_7 <= _mystream_b11_source_fsm_7_2;
          end 
        end
        _mystream_b11_source_fsm_7_2: begin
          if((_mystream_b11_source_count == 1) && _mystream_stream_oready) begin
            _mystream_b11_source_fsm_7 <= _mystream_b11_source_fsm_7_init;
          end 
          if(_mystream_source_stop && _mystream_stream_oready) begin
            _mystream_b11_source_fsm_7 <= _mystream_b11_source_fsm_7_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_sum_list0_sink_fsm_8_1 = 1;
  localparam _mystream_sum_list0_sink_fsm_8_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_sum_list0_sink_fsm_8 <= _mystream_sum_list0_sink_fsm_8_init;
    end else begin
      case(_mystream_sum_list0_sink_fsm_8)
        _mystream_sum_list0_sink_fsm_8_init: begin
          if(_mystream_sink_start && _mystream_sum_list0_sink_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_sum_list0_sink_fsm_8 <= _mystream_sum_list0_sink_fsm_8_1;
          end 
        end
        _mystream_sum_list0_sink_fsm_8_1: begin
          if(_mystream_stream_oready) begin
            _mystream_sum_list0_sink_fsm_8 <= _mystream_sum_list0_sink_fsm_8_2;
          end 
        end
        _mystream_sum_list0_sink_fsm_8_2: begin
          if(mystream_sum_valid_list0_data && (_mystream_sum_list0_sink_count == 1) && _mystream_stream_oready) begin
            _mystream_sum_list0_sink_fsm_8 <= _mystream_sum_list0_sink_fsm_8_init;
          end 
          if(_mystream_sink_stop && _mystream_stream_oready) begin
            _mystream_sum_list0_sink_fsm_8 <= _mystream_sum_list0_sink_fsm_8_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_sum_list1_sink_fsm_9_1 = 1;
  localparam _mystream_sum_list1_sink_fsm_9_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_sum_list1_sink_fsm_9 <= _mystream_sum_list1_sink_fsm_9_init;
    end else begin
      case(_mystream_sum_list1_sink_fsm_9)
        _mystream_sum_list1_sink_fsm_9_init: begin
          if(_mystream_sink_start && _mystream_sum_list1_sink_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_sum_list1_sink_fsm_9 <= _mystream_sum_list1_sink_fsm_9_1;
          end 
        end
        _mystream_sum_list1_sink_fsm_9_1: begin
          if(_mystream_stream_oready) begin
            _mystream_sum_list1_sink_fsm_9 <= _mystream_sum_list1_sink_fsm_9_2;
          end 
        end
        _mystream_sum_list1_sink_fsm_9_2: begin
          if(mystream_sum_valid_list1_data && (_mystream_sum_list1_sink_count == 1) && _mystream_stream_oready) begin
            _mystream_sum_list1_sink_fsm_9 <= _mystream_sum_list1_sink_fsm_9_init;
          end 
          if(_mystream_sink_stop && _mystream_stream_oready) begin
            _mystream_sum_list1_sink_fsm_9 <= _mystream_sum_list1_sink_fsm_9_init;
          end 
        end
      endcase
    end
  end

  localparam _maxi_write_req_fsm_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      _maxi_write_req_fsm <= _maxi_write_req_fsm_init;
      _maxi_write_cont <= 0;
    end else begin
      case(_maxi_write_req_fsm)
        _maxi_write_req_fsm_init: begin
          if((_maxi_write_req_fsm == 0) && (_maxi_write_start || _maxi_write_cont) && !_maxi_write_req_fifo_almost_full) begin
            _maxi_write_req_fsm <= _maxi_write_req_fsm_1;
          end 
        end
        _maxi_write_req_fsm_1: begin
          if((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (outstanding_wcount_0 < 6)) begin
            _maxi_write_cont <= 1;
          end 
          if((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (outstanding_wcount_0 < 6) && (_maxi_write_global_size == 0)) begin
            _maxi_write_cont <= 0;
          end 
          if((_maxi_write_req_fsm == 1) && !_maxi_write_req_fifo_almost_full && (maxi_awready || !maxi_awvalid) && (outstanding_wcount_0 < 6)) begin
            _maxi_write_req_fsm <= _maxi_write_req_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam _maxi_write_data_fsm_1 = 1;
  localparam _maxi_write_data_fsm_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _maxi_write_data_fsm <= _maxi_write_data_fsm_init;
    end else begin
      case(_maxi_write_data_fsm)
        _maxi_write_data_fsm_init: begin
          if(_maxi_write_data_idle && !_maxi_write_req_fifo_empty && (_maxi_write_op_sel_fifo == 1)) begin
            _maxi_write_data_fsm <= _maxi_write_data_fsm_1;
          end 
        end
        _maxi_write_data_fsm_1: begin
          _maxi_write_data_fsm <= _maxi_write_data_fsm_2;
        end
        _maxi_write_data_fsm_2: begin
          if((_maxi_write_op_sel_buf == 1) && read_burst_rvalid_231 && ((maxi_wready || !maxi_wvalid) && (_maxi_write_size_buf > 0)) && read_burst_rlast_232) begin
            _maxi_write_data_fsm <= _maxi_write_data_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam read_burst_fsm_4_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      read_burst_fsm_4 <= read_burst_fsm_4_init;
      read_burst_addr_228 <= 0;
      read_burst_stride_229 <= 0;
      read_burst_length_230 <= 0;
      read_burst_rvalid_231 <= 0;
      read_burst_rlast_232 <= 0;
    end else begin
      case(read_burst_fsm_4)
        read_burst_fsm_4_init: begin
          read_burst_addr_228 <= _maxi_write_local_addr_buf;
          read_burst_stride_229 <= _maxi_write_local_stride_buf;
          read_burst_length_230 <= _maxi_write_size_buf;
          read_burst_rvalid_231 <= 0;
          read_burst_rlast_232 <= 0;
          if((_maxi_write_data_fsm == 1) && (_maxi_write_op_sel_buf == 1) && (_maxi_write_size_buf > 0)) begin
            read_burst_fsm_4 <= read_burst_fsm_4_1;
          end 
        end
        read_burst_fsm_4_1: begin
          if((maxi_wready || !maxi_wvalid) && (_maxi_write_size_buf > 0) && (read_burst_length_230 > 0)) begin
            read_burst_addr_228 <= read_burst_addr_228 + read_burst_stride_229;
            read_burst_length_230 <= read_burst_length_230 - 1;
            read_burst_rvalid_231 <= 1;
          end 
          if((maxi_wready || !maxi_wvalid) && (_maxi_write_size_buf > 0) && (read_burst_length_230 <= 1)) begin
            read_burst_rlast_232 <= 1;
          end 
          if(read_burst_rlast_232 && read_burst_rvalid_231 && ((maxi_wready || !maxi_wvalid) && (_maxi_write_size_buf > 0))) begin
            read_burst_rvalid_231 <= 0;
            read_burst_rlast_232 <= 0;
          end 
          if(0) begin
            read_burst_rvalid_231 <= 0;
            read_burst_rlast_232 <= 0;
          end 
          if(read_burst_rlast_232 && read_burst_rvalid_231 && ((maxi_wready || !maxi_wvalid) && (_maxi_write_size_buf > 0))) begin
            read_burst_fsm_4 <= read_burst_fsm_4_init;
          end 
          if(0) begin
            read_burst_fsm_4 <= read_burst_fsm_4_init;
          end 
        end
      endcase
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _tmp_234 <= 0;
    end else begin
      if((read_burst_fsm_4 == 1) && (!read_burst_rvalid_231 || (maxi_wready || !maxi_wvalid) && (_maxi_write_size_buf > 0))) begin
        _tmp_234 <= read_rtl_bank_233;
      end 
    end
  end


endmodule



module ram_c_0
(
  input CLK,
  input [20-1:0] ram_c_0_0_addr,
  output [32-1:0] ram_c_0_0_rdata,
  input [32-1:0] ram_c_0_0_wdata,
  input ram_c_0_0_wenable,
  input ram_c_0_0_enable
);

  reg [32-1:0] ram_c_0_0_rdata_out;
  assign ram_c_0_0_rdata = ram_c_0_0_rdata_out;
  reg [32-1:0] mem [0:1048576-1];

  always @(posedge CLK) begin
    if(ram_c_0_0_enable) begin
      if(ram_c_0_0_wenable) begin
        mem[ram_c_0_0_addr] <= ram_c_0_0_wdata;
        ram_c_0_0_rdata_out <= ram_c_0_0_wdata;
      end else begin
        ram_c_0_0_rdata_out <= mem[ram_c_0_0_addr];
      end
    end 
  end


endmodule



module ram_c_1
(
  input CLK,
  input [20-1:0] ram_c_1_0_addr,
  output [32-1:0] ram_c_1_0_rdata,
  input [32-1:0] ram_c_1_0_wdata,
  input ram_c_1_0_wenable,
  input ram_c_1_0_enable
);

  reg [32-1:0] ram_c_1_0_rdata_out;
  assign ram_c_1_0_rdata = ram_c_1_0_rdata_out;
  reg [32-1:0] mem [0:1048576-1];

  always @(posedge CLK) begin
    if(ram_c_1_0_enable) begin
      if(ram_c_1_0_wenable) begin
        mem[ram_c_1_0_addr] <= ram_c_1_0_wdata;
        ram_c_1_0_rdata_out <= ram_c_1_0_wdata;
      end else begin
        ram_c_1_0_rdata_out <= mem[ram_c_1_0_addr];
      end
    end 
  end


endmodule



module ram_a0_0
(
  input CLK,
  input [20-1:0] ram_a0_0_0_addr,
  output [32-1:0] ram_a0_0_0_rdata,
  input [32-1:0] ram_a0_0_0_wdata,
  input ram_a0_0_0_wenable,
  input ram_a0_0_0_enable
);

  reg [32-1:0] ram_a0_0_0_rdata_out;
  assign ram_a0_0_0_rdata = ram_a0_0_0_rdata_out;
  reg [32-1:0] mem [0:1048576-1];

  always @(posedge CLK) begin
    if(ram_a0_0_0_enable) begin
      if(ram_a0_0_0_wenable) begin
        mem[ram_a0_0_0_addr] <= ram_a0_0_0_wdata;
        ram_a0_0_0_rdata_out <= ram_a0_0_0_wdata;
      end else begin
        ram_a0_0_0_rdata_out <= mem[ram_a0_0_0_addr];
      end
    end 
  end


endmodule



module ram_a0_1
(
  input CLK,
  input [20-1:0] ram_a0_1_0_addr,
  output [32-1:0] ram_a0_1_0_rdata,
  input [32-1:0] ram_a0_1_0_wdata,
  input ram_a0_1_0_wenable,
  input ram_a0_1_0_enable
);

  reg [32-1:0] ram_a0_1_0_rdata_out;
  assign ram_a0_1_0_rdata = ram_a0_1_0_rdata_out;
  reg [32-1:0] mem [0:1048576-1];

  always @(posedge CLK) begin
    if(ram_a0_1_0_enable) begin
      if(ram_a0_1_0_wenable) begin
        mem[ram_a0_1_0_addr] <= ram_a0_1_0_wdata;
        ram_a0_1_0_rdata_out <= ram_a0_1_0_wdata;
      end else begin
        ram_a0_1_0_rdata_out <= mem[ram_a0_1_0_addr];
      end
    end 
  end


endmodule



module ram_b0_0
(
  input CLK,
  input [20-1:0] ram_b0_0_0_addr,
  output [32-1:0] ram_b0_0_0_rdata,
  input [32-1:0] ram_b0_0_0_wdata,
  input ram_b0_0_0_wenable,
  input ram_b0_0_0_enable
);

  reg [32-1:0] ram_b0_0_0_rdata_out;
  assign ram_b0_0_0_rdata = ram_b0_0_0_rdata_out;
  reg [32-1:0] mem [0:1048576-1];

  always @(posedge CLK) begin
    if(ram_b0_0_0_enable) begin
      if(ram_b0_0_0_wenable) begin
        mem[ram_b0_0_0_addr] <= ram_b0_0_0_wdata;
        ram_b0_0_0_rdata_out <= ram_b0_0_0_wdata;
      end else begin
        ram_b0_0_0_rdata_out <= mem[ram_b0_0_0_addr];
      end
    end 
  end


endmodule



module ram_b0_1
(
  input CLK,
  input [20-1:0] ram_b0_1_0_addr,
  output [32-1:0] ram_b0_1_0_rdata,
  input [32-1:0] ram_b0_1_0_wdata,
  input ram_b0_1_0_wenable,
  input ram_b0_1_0_enable
);

  reg [32-1:0] ram_b0_1_0_rdata_out;
  assign ram_b0_1_0_rdata = ram_b0_1_0_rdata_out;
  reg [32-1:0] mem [0:1048576-1];

  always @(posedge CLK) begin
    if(ram_b0_1_0_enable) begin
      if(ram_b0_1_0_wenable) begin
        mem[ram_b0_1_0_addr] <= ram_b0_1_0_wdata;
        ram_b0_1_0_rdata_out <= ram_b0_1_0_wdata;
      end else begin
        ram_b0_1_0_rdata_out <= mem[ram_b0_1_0_addr];
      end
    end 
  end


endmodule



module ram_a1_0
(
  input CLK,
  input [20-1:0] ram_a1_0_0_addr,
  output [32-1:0] ram_a1_0_0_rdata,
  input [32-1:0] ram_a1_0_0_wdata,
  input ram_a1_0_0_wenable,
  input ram_a1_0_0_enable
);

  reg [32-1:0] ram_a1_0_0_rdata_out;
  assign ram_a1_0_0_rdata = ram_a1_0_0_rdata_out;
  reg [32-1:0] mem [0:1048576-1];

  always @(posedge CLK) begin
    if(ram_a1_0_0_enable) begin
      if(ram_a1_0_0_wenable) begin
        mem[ram_a1_0_0_addr] <= ram_a1_0_0_wdata;
        ram_a1_0_0_rdata_out <= ram_a1_0_0_wdata;
      end else begin
        ram_a1_0_0_rdata_out <= mem[ram_a1_0_0_addr];
      end
    end 
  end


endmodule



module ram_a1_1
(
  input CLK,
  input [20-1:0] ram_a1_1_0_addr,
  output [32-1:0] ram_a1_1_0_rdata,
  input [32-1:0] ram_a1_1_0_wdata,
  input ram_a1_1_0_wenable,
  input ram_a1_1_0_enable
);

  reg [32-1:0] ram_a1_1_0_rdata_out;
  assign ram_a1_1_0_rdata = ram_a1_1_0_rdata_out;
  reg [32-1:0] mem [0:1048576-1];

  always @(posedge CLK) begin
    if(ram_a1_1_0_enable) begin
      if(ram_a1_1_0_wenable) begin
        mem[ram_a1_1_0_addr] <= ram_a1_1_0_wdata;
        ram_a1_1_0_rdata_out <= ram_a1_1_0_wdata;
      end else begin
        ram_a1_1_0_rdata_out <= mem[ram_a1_1_0_addr];
      end
    end 
  end


endmodule



module ram_b1_0
(
  input CLK,
  input [20-1:0] ram_b1_0_0_addr,
  output [32-1:0] ram_b1_0_0_rdata,
  input [32-1:0] ram_b1_0_0_wdata,
  input ram_b1_0_0_wenable,
  input ram_b1_0_0_enable
);

  reg [32-1:0] ram_b1_0_0_rdata_out;
  assign ram_b1_0_0_rdata = ram_b1_0_0_rdata_out;
  reg [32-1:0] mem [0:1048576-1];

  always @(posedge CLK) begin
    if(ram_b1_0_0_enable) begin
      if(ram_b1_0_0_wenable) begin
        mem[ram_b1_0_0_addr] <= ram_b1_0_0_wdata;
        ram_b1_0_0_rdata_out <= ram_b1_0_0_wdata;
      end else begin
        ram_b1_0_0_rdata_out <= mem[ram_b1_0_0_addr];
      end
    end 
  end


endmodule



module ram_b1_1
(
  input CLK,
  input [20-1:0] ram_b1_1_0_addr,
  output [32-1:0] ram_b1_1_0_rdata,
  input [32-1:0] ram_b1_1_0_wdata,
  input ram_b1_1_0_wenable,
  input ram_b1_1_0_enable
);

  reg [32-1:0] ram_b1_1_0_rdata_out;
  assign ram_b1_1_0_rdata = ram_b1_1_0_rdata_out;
  reg [32-1:0] mem [0:1048576-1];

  always @(posedge CLK) begin
    if(ram_b1_1_0_enable) begin
      if(ram_b1_1_0_wenable) begin
        mem[ram_b1_1_0_addr] <= ram_b1_1_0_wdata;
        ram_b1_1_0_rdata_out <= ram_b1_1_0_wdata;
      end else begin
        ram_b1_1_0_rdata_out <= mem[ram_b1_1_0_addr];
      end
    end 
  end


endmodule



module _maxi_read_req_fifo
(
  input CLK,
  input RST,
  input _maxi_read_req_fifo_enq,
  input [137-1:0] _maxi_read_req_fifo_wdata,
  output _maxi_read_req_fifo_full,
  output _maxi_read_req_fifo_almost_full,
  input _maxi_read_req_fifo_deq,
  output [137-1:0] _maxi_read_req_fifo_rdata,
  output _maxi_read_req_fifo_empty,
  output _maxi_read_req_fifo_almost_empty
);

  reg [137-1:0] mem [0:8-1];
  reg [3-1:0] head;
  reg [3-1:0] tail;
  wire is_empty;
  wire is_almost_empty;
  wire is_full;
  wire is_almost_full;
  assign is_empty = head == tail;
  assign is_almost_empty = head == (tail + 1 & 7);
  assign is_full = (head + 1 & 7) == tail;
  assign is_almost_full = (head + 2 & 7) == tail;
  wire [137-1:0] rdata;
  assign _maxi_read_req_fifo_full = is_full;
  assign _maxi_read_req_fifo_almost_full = is_almost_full || is_full;
  assign _maxi_read_req_fifo_empty = is_empty;
  assign _maxi_read_req_fifo_almost_empty = is_almost_empty || is_empty;
  assign rdata = mem[tail];
  assign _maxi_read_req_fifo_rdata = rdata;

  always @(posedge CLK) begin
    if(RST) begin
      head <= 0;
      tail <= 0;
    end else begin
      if(_maxi_read_req_fifo_enq && !is_full) begin
        mem[head] <= _maxi_read_req_fifo_wdata;
        head <= head + 1;
      end 
      if(_maxi_read_req_fifo_deq && !is_empty) begin
        tail <= tail + 1;
      end 
    end
  end


endmodule



module _maxi_write_req_fifo
(
  input CLK,
  input RST,
  input _maxi_write_req_fifo_enq,
  input [137-1:0] _maxi_write_req_fifo_wdata,
  output _maxi_write_req_fifo_full,
  output _maxi_write_req_fifo_almost_full,
  input _maxi_write_req_fifo_deq,
  output [137-1:0] _maxi_write_req_fifo_rdata,
  output _maxi_write_req_fifo_empty,
  output _maxi_write_req_fifo_almost_empty
);

  reg [137-1:0] mem [0:8-1];
  reg [3-1:0] head;
  reg [3-1:0] tail;
  wire is_empty;
  wire is_almost_empty;
  wire is_full;
  wire is_almost_full;
  assign is_empty = head == tail;
  assign is_almost_empty = head == (tail + 1 & 7);
  assign is_full = (head + 1 & 7) == tail;
  assign is_almost_full = (head + 2 & 7) == tail;
  wire [137-1:0] rdata;
  assign _maxi_write_req_fifo_full = is_full;
  assign _maxi_write_req_fifo_almost_full = is_almost_full || is_full;
  assign _maxi_write_req_fifo_empty = is_empty;
  assign _maxi_write_req_fifo_almost_empty = is_almost_empty || is_empty;
  assign rdata = mem[tail];
  assign _maxi_write_req_fifo_rdata = rdata;

  always @(posedge CLK) begin
    if(RST) begin
      head <= 0;
      tail <= 0;
    end else begin
      if(_maxi_write_req_fifo_enq && !is_full) begin
        mem[head] <= _maxi_write_req_fifo_wdata;
        head <= head + 1;
      end 
      if(_maxi_write_req_fifo_deq && !is_empty) begin
        tail <= tail + 1;
      end 
    end
  end


endmodule



module multiplier_0
(
  input CLK,
  input update,
  input [32-1:0] a,
  input [32-1:0] b,
  output [64-1:0] c
);


  multiplier_core_0
  mult
  (
    .CLK(CLK),
    .update(update),
    .a(a),
    .b(b),
    .c(c)
  );


endmodule



module multiplier_core_0
(
  input CLK,
  input update,
  input [32-1:0] a,
  input [32-1:0] b,
  output [64-1:0] c
);

  reg signed [32-1:0] _a;
  reg signed [32-1:0] _b;
  wire signed [64-1:0] _mul;
  reg signed [64-1:0] _pipe_mul0;
  assign _mul = _a * _b;
  assign c = _pipe_mul0;

  always @(posedge CLK) begin
    if(update) begin
      _a <= a;
      _b <= b;
      _pipe_mul0 <= _mul;
    end 
  end


endmodule



module multiplier_1
(
  input CLK,
  input update,
  input [32-1:0] a,
  input [32-1:0] b,
  output [64-1:0] c
);


  multiplier_core_1
  mult
  (
    .CLK(CLK),
    .update(update),
    .a(a),
    .b(b),
    .c(c)
  );


endmodule



module multiplier_core_1
(
  input CLK,
  input update,
  input [32-1:0] a,
  input [32-1:0] b,
  output [64-1:0] c
);

  reg signed [32-1:0] _a;
  reg signed [32-1:0] _b;
  wire signed [64-1:0] _mul;
  reg signed [64-1:0] _pipe_mul0;
  assign _mul = _a * _b;
  assign c = _pipe_mul0;

  always @(posedge CLK) begin
    if(update) begin
      _a <= a;
      _b <= b;
      _pipe_mul0 <= _mul;
    end 
  end


endmodule



module multiplier_2
(
  input CLK,
  input update,
  input [32-1:0] a,
  input [32-1:0] b,
  output [64-1:0] c
);


  multiplier_core_2
  mult
  (
    .CLK(CLK),
    .update(update),
    .a(a),
    .b(b),
    .c(c)
  );


endmodule



module multiplier_core_2
(
  input CLK,
  input update,
  input [32-1:0] a,
  input [32-1:0] b,
  output [64-1:0] c
);

  reg signed [32-1:0] _a;
  reg signed [32-1:0] _b;
  wire signed [64-1:0] _mul;
  reg signed [64-1:0] _pipe_mul0;
  assign _mul = _a * _b;
  assign c = _pipe_mul0;

  always @(posedge CLK) begin
    if(update) begin
      _a <= a;
      _b <= b;
      _pipe_mul0 <= _mul;
    end 
  end


endmodule



module multiplier_3
(
  input CLK,
  input update,
  input [32-1:0] a,
  input [32-1:0] b,
  output [64-1:0] c
);


  multiplier_core_3
  mult
  (
    .CLK(CLK),
    .update(update),
    .a(a),
    .b(b),
    .c(c)
  );


endmodule



module multiplier_core_3
(
  input CLK,
  input update,
  input [32-1:0] a,
  input [32-1:0] b,
  output [64-1:0] c
);

  reg signed [32-1:0] _a;
  reg signed [32-1:0] _b;
  wire signed [64-1:0] _mul;
  reg signed [64-1:0] _pipe_mul0;
  assign _mul = _a * _b;
  assign c = _pipe_mul0;

  always @(posedge CLK) begin
    if(update) begin
      _a <= a;
      _b <= b;
      _pipe_mul0 <= _mul;
    end 
  end


endmodule

