

module test
(

);

  reg CLK;
  reg RST;
  wire [32-1:0] myaxi_awaddr;
  wire [8-1:0] myaxi_awlen;
  wire [3-1:0] myaxi_awsize;
  wire [2-1:0] myaxi_awburst;
  wire [1-1:0] myaxi_awlock;
  wire [4-1:0] myaxi_awcache;
  wire [3-1:0] myaxi_awprot;
  wire [4-1:0] myaxi_awqos;
  wire [2-1:0] myaxi_awuser;
  wire myaxi_awvalid;
  reg myaxi_awready;
  wire [32-1:0] myaxi_wdata;
  wire [4-1:0] myaxi_wstrb;
  wire myaxi_wlast;
  wire myaxi_wvalid;
  reg myaxi_wready;
  reg [2-1:0] myaxi_bresp;
  reg myaxi_bvalid;
  wire myaxi_bready;
  wire [32-1:0] myaxi_araddr;
  wire [8-1:0] myaxi_arlen;
  wire [3-1:0] myaxi_arsize;
  wire [2-1:0] myaxi_arburst;
  wire [1-1:0] myaxi_arlock;
  wire [4-1:0] myaxi_arcache;
  wire [3-1:0] myaxi_arprot;
  wire [4-1:0] myaxi_arqos;
  wire [2-1:0] myaxi_aruser;
  wire myaxi_arvalid;
  reg myaxi_arready;
  reg [32-1:0] myaxi_rdata;
  reg [2-1:0] myaxi_rresp;
  reg myaxi_rlast;
  reg myaxi_rvalid;
  wire myaxi_rready;
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
    $readmemh("memimg_parall_multicore_different_ram.out", _memory_mem);
  end

  reg [33-1:0] _write_count;
  reg [32-1:0] _write_addr;
  reg [33-1:0] _read_count;
  reg [32-1:0] _read_addr;
  reg [33-1:0] _sleep_interval_count;
  reg [33-1:0] _keep_sleep_count;
  wire [32-1:0] pack_write_req_global_addr_0;
  wire [9-1:0] pack_write_req_size_1;
  assign pack_write_req_global_addr_0 = memory_awaddr;
  assign pack_write_req_size_1 = memory_awlen + 1;
  wire [41-1:0] pack_write_req_packed_2;
  assign pack_write_req_packed_2 = { pack_write_req_global_addr_0, pack_write_req_size_1 };
  assign _memory_wreq_fifo_wdata = ((_memory_waddr_fsm == 11) && memory_awvalid && memory_awready)? pack_write_req_packed_2 : 'hx;
  assign _memory_wreq_fifo_enq = ((_memory_waddr_fsm == 11) && memory_awvalid && memory_awready)? (_memory_waddr_fsm == 11) && memory_awvalid && memory_awready && !_memory_wreq_fifo_almost_full : 0;
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
  reg __memory_rdata_fsm_cond_11_0_1;
  assign memory_awaddr = myaxi_awaddr;
  assign memory_awlen = myaxi_awlen;
  assign memory_awsize = myaxi_awsize;
  assign memory_awburst = myaxi_awburst;
  assign memory_awlock = myaxi_awlock;
  assign memory_awcache = myaxi_awcache;
  assign memory_awprot = myaxi_awprot;
  assign memory_awqos = myaxi_awqos;
  assign memory_awuser = myaxi_awuser;
  assign memory_awvalid = myaxi_awvalid;
  wire _tmp_14;
  assign _tmp_14 = memory_awready;

  always @(*) begin
    myaxi_awready = _tmp_14;
  end

  assign memory_wdata = myaxi_wdata;
  assign memory_wstrb = myaxi_wstrb;
  assign memory_wlast = myaxi_wlast;
  assign memory_wvalid = myaxi_wvalid;
  wire _tmp_15;
  assign _tmp_15 = memory_wready;

  always @(*) begin
    myaxi_wready = _tmp_15;
  end

  wire [2-1:0] _tmp_16;
  assign _tmp_16 = memory_bresp;

  always @(*) begin
    myaxi_bresp = _tmp_16;
  end

  wire _tmp_17;
  assign _tmp_17 = memory_bvalid;

  always @(*) begin
    myaxi_bvalid = _tmp_17;
  end

  assign memory_bready = myaxi_bready;
  assign memory_araddr = myaxi_araddr;
  assign memory_arlen = myaxi_arlen;
  assign memory_arsize = myaxi_arsize;
  assign memory_arburst = myaxi_arburst;
  assign memory_arlock = myaxi_arlock;
  assign memory_arcache = myaxi_arcache;
  assign memory_arprot = myaxi_arprot;
  assign memory_arqos = myaxi_arqos;
  assign memory_aruser = myaxi_aruser;
  assign memory_arvalid = myaxi_arvalid;
  wire _tmp_18;
  assign _tmp_18 = memory_arready;

  always @(*) begin
    myaxi_arready = _tmp_18;
  end

  wire [32-1:0] _tmp_19;
  assign _tmp_19 = memory_rdata;

  always @(*) begin
    myaxi_rdata = _tmp_19;
  end

  wire [2-1:0] _tmp_20;
  assign _tmp_20 = memory_rresp;

  always @(*) begin
    myaxi_rresp = _tmp_20;
  end

  wire _tmp_21;
  assign _tmp_21 = memory_rlast;

  always @(*) begin
    myaxi_rlast = _tmp_21;
  end

  wire _tmp_22;
  assign _tmp_22 = memory_rvalid;

  always @(*) begin
    myaxi_rvalid = _tmp_22;
  end

  assign memory_rready = myaxi_rready;

  blinkled
  uut
  (
    .CLK(CLK),
    .RST(RST),
    .myaxi_awaddr(myaxi_awaddr),
    .myaxi_awlen(myaxi_awlen),
    .myaxi_awsize(myaxi_awsize),
    .myaxi_awburst(myaxi_awburst),
    .myaxi_awlock(myaxi_awlock),
    .myaxi_awcache(myaxi_awcache),
    .myaxi_awprot(myaxi_awprot),
    .myaxi_awqos(myaxi_awqos),
    .myaxi_awuser(myaxi_awuser),
    .myaxi_awvalid(myaxi_awvalid),
    .myaxi_awready(myaxi_awready),
    .myaxi_wdata(myaxi_wdata),
    .myaxi_wstrb(myaxi_wstrb),
    .myaxi_wlast(myaxi_wlast),
    .myaxi_wvalid(myaxi_wvalid),
    .myaxi_wready(myaxi_wready),
    .myaxi_bresp(myaxi_bresp),
    .myaxi_bvalid(myaxi_bvalid),
    .myaxi_bready(myaxi_bready),
    .myaxi_araddr(myaxi_araddr),
    .myaxi_arlen(myaxi_arlen),
    .myaxi_arsize(myaxi_arsize),
    .myaxi_arburst(myaxi_arburst),
    .myaxi_arlock(myaxi_arlock),
    .myaxi_arcache(myaxi_arcache),
    .myaxi_arprot(myaxi_arprot),
    .myaxi_arqos(myaxi_arqos),
    .myaxi_aruser(myaxi_aruser),
    .myaxi_arvalid(myaxi_arvalid),
    .myaxi_arready(myaxi_arready),
    .myaxi_rdata(myaxi_rdata),
    .myaxi_rresp(myaxi_rresp),
    .myaxi_rlast(myaxi_rlast),
    .myaxi_rvalid(myaxi_rvalid),
    .myaxi_rready(myaxi_rready)
  );


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
    _sleep_interval_count = 0;
    _keep_sleep_count = 0;
    __tmp_4_1 = 0;
    __tmp_11_1 = 0;
    _d1__memory_rdata_fsm = _memory_rdata_fsm_init;
    __memory_rdata_fsm_cond_11_0_1 = 0;
    #100;
    RST = 1;
    #100;
    RST = 0;
    #1000000;
    $finish;
  end


  always @(posedge CLK) begin
    if(RST) begin
      _keep_sleep_count <= 0;
      _sleep_interval_count <= 0;
    end else begin
      if(_sleep_interval_count == 15) begin
        _keep_sleep_count <= _keep_sleep_count + 1;
      end 
      if((_sleep_interval_count == 15) && (_keep_sleep_count == 3)) begin
        _keep_sleep_count <= 0;
      end 
      if(_sleep_interval_count < 15) begin
        _sleep_interval_count <= _sleep_interval_count + 1;
      end 
      if((_keep_sleep_count == 3) && (_sleep_interval_count == 15)) begin
        _sleep_interval_count <= 0;
      end 
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
  end

  localparam _memory_waddr_fsm_1 = 1;
  localparam _memory_waddr_fsm_2 = 2;
  localparam _memory_waddr_fsm_3 = 3;
  localparam _memory_waddr_fsm_4 = 4;
  localparam _memory_waddr_fsm_5 = 5;
  localparam _memory_waddr_fsm_6 = 6;
  localparam _memory_waddr_fsm_7 = 7;
  localparam _memory_waddr_fsm_8 = 8;
  localparam _memory_waddr_fsm_9 = 9;
  localparam _memory_waddr_fsm_10 = 10;
  localparam _memory_waddr_fsm_11 = 11;

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
          _memory_waddr_fsm <= _memory_waddr_fsm_2;
        end
        _memory_waddr_fsm_2: begin
          _memory_waddr_fsm <= _memory_waddr_fsm_3;
        end
        _memory_waddr_fsm_3: begin
          _memory_waddr_fsm <= _memory_waddr_fsm_4;
        end
        _memory_waddr_fsm_4: begin
          _memory_waddr_fsm <= _memory_waddr_fsm_5;
        end
        _memory_waddr_fsm_5: begin
          _memory_waddr_fsm <= _memory_waddr_fsm_6;
        end
        _memory_waddr_fsm_6: begin
          _memory_waddr_fsm <= _memory_waddr_fsm_7;
        end
        _memory_waddr_fsm_7: begin
          _memory_waddr_fsm <= _memory_waddr_fsm_8;
        end
        _memory_waddr_fsm_8: begin
          _memory_waddr_fsm <= _memory_waddr_fsm_9;
        end
        _memory_waddr_fsm_9: begin
          _memory_waddr_fsm <= _memory_waddr_fsm_10;
        end
        _memory_waddr_fsm_10: begin
          _memory_waddr_fsm <= _memory_waddr_fsm_11;
        end
        _memory_waddr_fsm_11: begin
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
          if(_sleep_interval_count == 15) begin
            memory_wready <= 0;
          end else begin
            memory_wready <= 1;
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
  localparam _memory_rdata_fsm_2 = 2;
  localparam _memory_rdata_fsm_3 = 3;
  localparam _memory_rdata_fsm_4 = 4;
  localparam _memory_rdata_fsm_5 = 5;
  localparam _memory_rdata_fsm_6 = 6;
  localparam _memory_rdata_fsm_7 = 7;
  localparam _memory_rdata_fsm_8 = 8;
  localparam _memory_rdata_fsm_9 = 9;
  localparam _memory_rdata_fsm_10 = 10;
  localparam _memory_rdata_fsm_11 = 11;

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
      __memory_rdata_fsm_cond_11_0_1 <= 0;
      memory_rdata <= 0;
    end else begin
      _d1__memory_rdata_fsm <= _memory_rdata_fsm;
      case(_d1__memory_rdata_fsm)
        _memory_rdata_fsm_11: begin
          if(__memory_rdata_fsm_cond_11_0_1) begin
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
          _memory_rdata_fsm <= _memory_rdata_fsm_2;
        end
        _memory_rdata_fsm_2: begin
          _memory_rdata_fsm <= _memory_rdata_fsm_3;
        end
        _memory_rdata_fsm_3: begin
          _memory_rdata_fsm <= _memory_rdata_fsm_4;
        end
        _memory_rdata_fsm_4: begin
          _memory_rdata_fsm <= _memory_rdata_fsm_5;
        end
        _memory_rdata_fsm_5: begin
          _memory_rdata_fsm <= _memory_rdata_fsm_6;
        end
        _memory_rdata_fsm_6: begin
          _memory_rdata_fsm <= _memory_rdata_fsm_7;
        end
        _memory_rdata_fsm_7: begin
          _memory_rdata_fsm <= _memory_rdata_fsm_8;
        end
        _memory_rdata_fsm_8: begin
          _memory_rdata_fsm <= _memory_rdata_fsm_9;
        end
        _memory_rdata_fsm_9: begin
          _memory_rdata_fsm <= _memory_rdata_fsm_10;
        end
        _memory_rdata_fsm_10: begin
          _memory_rdata_fsm <= _memory_rdata_fsm_11;
        end
        _memory_rdata_fsm_11: begin
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
          if((_sleep_interval_count < 15) && (_read_count > 0) && memory_rready | !memory_rvalid) begin
            memory_rvalid <= 1;
            _read_addr <= _read_addr + 4;
            _read_count <= _read_count - 1;
          end 
          if((_sleep_interval_count < 15) && (_read_count == 1) && memory_rready | !memory_rvalid) begin
            memory_rlast <= 1;
          end 
          __memory_rdata_fsm_cond_11_0_1 <= 1;
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
  output reg [32-1:0] myaxi_awaddr,
  output reg [8-1:0] myaxi_awlen,
  output [3-1:0] myaxi_awsize,
  output [2-1:0] myaxi_awburst,
  output [1-1:0] myaxi_awlock,
  output [4-1:0] myaxi_awcache,
  output [3-1:0] myaxi_awprot,
  output [4-1:0] myaxi_awqos,
  output [2-1:0] myaxi_awuser,
  output reg myaxi_awvalid,
  input myaxi_awready,
  output reg [32-1:0] myaxi_wdata,
  output reg [4-1:0] myaxi_wstrb,
  output reg myaxi_wlast,
  output reg myaxi_wvalid,
  input myaxi_wready,
  input [2-1:0] myaxi_bresp,
  input myaxi_bvalid,
  output myaxi_bready,
  output reg [32-1:0] myaxi_araddr,
  output reg [8-1:0] myaxi_arlen,
  output [3-1:0] myaxi_arsize,
  output [2-1:0] myaxi_arburst,
  output [1-1:0] myaxi_arlock,
  output [4-1:0] myaxi_arcache,
  output [3-1:0] myaxi_arprot,
  output [4-1:0] myaxi_arqos,
  output [2-1:0] myaxi_aruser,
  output reg myaxi_arvalid,
  input myaxi_arready,
  input [32-1:0] myaxi_rdata,
  input [2-1:0] myaxi_rresp,
  input myaxi_rlast,
  input myaxi_rvalid,
  output myaxi_rready
);

  assign myaxi_awsize = 2;
  assign myaxi_awburst = 1;
  assign myaxi_awlock = 0;
  assign myaxi_awcache = 3;
  assign myaxi_awprot = 0;
  assign myaxi_awqos = 0;
  assign myaxi_awuser = 0;
  assign myaxi_bready = 1;
  assign myaxi_arsize = 2;
  assign myaxi_arburst = 1;
  assign myaxi_arlock = 0;
  assign myaxi_arcache = 3;
  assign myaxi_arprot = 0;
  assign myaxi_arqos = 0;
  assign myaxi_aruser = 0;
  reg [3-1:0] outstanding_wcount_0;
  reg _myaxi_read_start;
  reg [8-1:0] _myaxi_read_op_sel;
  reg [32-1:0] _myaxi_read_global_addr;
  reg [33-1:0] _myaxi_read_global_size;
  reg [32-1:0] _myaxi_read_local_addr;
  reg [32-1:0] _myaxi_read_local_stride;
  reg [33-1:0] _myaxi_read_local_size;
  reg [32-1:0] _myaxi_read_local_blocksize;
  wire _myaxi_read_req_fifo_enq;
  wire [137-1:0] _myaxi_read_req_fifo_wdata;
  wire _myaxi_read_req_fifo_full;
  wire _myaxi_read_req_fifo_almost_full;
  wire _myaxi_read_req_fifo_deq;
  wire [137-1:0] _myaxi_read_req_fifo_rdata;
  wire _myaxi_read_req_fifo_empty;
  wire _myaxi_read_req_fifo_almost_empty;

  _myaxi_read_req_fifo
  inst__myaxi_read_req_fifo
  (
    .CLK(CLK),
    .RST(RST),
    ._myaxi_read_req_fifo_enq(_myaxi_read_req_fifo_enq),
    ._myaxi_read_req_fifo_wdata(_myaxi_read_req_fifo_wdata),
    ._myaxi_read_req_fifo_full(_myaxi_read_req_fifo_full),
    ._myaxi_read_req_fifo_almost_full(_myaxi_read_req_fifo_almost_full),
    ._myaxi_read_req_fifo_deq(_myaxi_read_req_fifo_deq),
    ._myaxi_read_req_fifo_rdata(_myaxi_read_req_fifo_rdata),
    ._myaxi_read_req_fifo_empty(_myaxi_read_req_fifo_empty),
    ._myaxi_read_req_fifo_almost_empty(_myaxi_read_req_fifo_almost_empty)
  );

  reg [4-1:0] count__myaxi_read_req_fifo;
  wire [8-1:0] _myaxi_read_op_sel_fifo;
  wire [32-1:0] _myaxi_read_local_addr_fifo;
  wire [32-1:0] _myaxi_read_local_stride_fifo;
  wire [33-1:0] _myaxi_read_local_size_fifo;
  wire [32-1:0] _myaxi_read_local_blocksize_fifo;
  wire [8-1:0] unpack_read_req_op_sel_1;
  wire [32-1:0] unpack_read_req_local_addr_2;
  wire [32-1:0] unpack_read_req_local_stride_3;
  wire [33-1:0] unpack_read_req_local_size_4;
  wire [32-1:0] unpack_read_req_local_blocksize_5;
  assign unpack_read_req_op_sel_1 = _myaxi_read_req_fifo_rdata[136:129];
  assign unpack_read_req_local_addr_2 = _myaxi_read_req_fifo_rdata[128:97];
  assign unpack_read_req_local_stride_3 = _myaxi_read_req_fifo_rdata[96:65];
  assign unpack_read_req_local_size_4 = _myaxi_read_req_fifo_rdata[64:32];
  assign unpack_read_req_local_blocksize_5 = _myaxi_read_req_fifo_rdata[31:0];
  assign _myaxi_read_op_sel_fifo = unpack_read_req_op_sel_1;
  assign _myaxi_read_local_addr_fifo = unpack_read_req_local_addr_2;
  assign _myaxi_read_local_stride_fifo = unpack_read_req_local_stride_3;
  assign _myaxi_read_local_size_fifo = unpack_read_req_local_size_4;
  assign _myaxi_read_local_blocksize_fifo = unpack_read_req_local_blocksize_5;
  reg [8-1:0] _myaxi_read_op_sel_buf;
  reg [32-1:0] _myaxi_read_local_addr_buf;
  reg [32-1:0] _myaxi_read_local_stride_buf;
  reg [33-1:0] _myaxi_read_local_size_buf;
  reg [32-1:0] _myaxi_read_local_blocksize_buf;
  reg _myaxi_read_req_idle;
  reg _myaxi_read_data_idle;
  wire _myaxi_read_idle;
  assign _myaxi_read_idle = !_myaxi_read_start && _myaxi_read_req_idle && _myaxi_read_req_fifo_empty && _myaxi_read_data_idle;
  reg _myaxi_write_start;
  reg [8-1:0] _myaxi_write_op_sel;
  reg [32-1:0] _myaxi_write_global_addr;
  reg [33-1:0] _myaxi_write_global_size;
  reg [32-1:0] _myaxi_write_local_addr;
  reg [32-1:0] _myaxi_write_local_stride;
  reg [33-1:0] _myaxi_write_local_size;
  reg [32-1:0] _myaxi_write_local_blocksize;
  wire _myaxi_write_req_fifo_enq;
  wire [137-1:0] _myaxi_write_req_fifo_wdata;
  wire _myaxi_write_req_fifo_full;
  wire _myaxi_write_req_fifo_almost_full;
  wire _myaxi_write_req_fifo_deq;
  wire [137-1:0] _myaxi_write_req_fifo_rdata;
  wire _myaxi_write_req_fifo_empty;
  wire _myaxi_write_req_fifo_almost_empty;

  _myaxi_write_req_fifo
  inst__myaxi_write_req_fifo
  (
    .CLK(CLK),
    .RST(RST),
    ._myaxi_write_req_fifo_enq(_myaxi_write_req_fifo_enq),
    ._myaxi_write_req_fifo_wdata(_myaxi_write_req_fifo_wdata),
    ._myaxi_write_req_fifo_full(_myaxi_write_req_fifo_full),
    ._myaxi_write_req_fifo_almost_full(_myaxi_write_req_fifo_almost_full),
    ._myaxi_write_req_fifo_deq(_myaxi_write_req_fifo_deq),
    ._myaxi_write_req_fifo_rdata(_myaxi_write_req_fifo_rdata),
    ._myaxi_write_req_fifo_empty(_myaxi_write_req_fifo_empty),
    ._myaxi_write_req_fifo_almost_empty(_myaxi_write_req_fifo_almost_empty)
  );

  reg [4-1:0] count__myaxi_write_req_fifo;
  wire [8-1:0] _myaxi_write_op_sel_fifo;
  wire [32-1:0] _myaxi_write_local_addr_fifo;
  wire [32-1:0] _myaxi_write_local_stride_fifo;
  wire [33-1:0] _myaxi_write_size_fifo;
  wire [32-1:0] _myaxi_write_local_blocksize_fifo;
  wire [8-1:0] unpack_write_req_op_sel_6;
  wire [32-1:0] unpack_write_req_local_addr_7;
  wire [32-1:0] unpack_write_req_local_stride_8;
  wire [33-1:0] unpack_write_req_size_9;
  wire [32-1:0] unpack_write_req_local_blocksize_10;
  assign unpack_write_req_op_sel_6 = _myaxi_write_req_fifo_rdata[136:129];
  assign unpack_write_req_local_addr_7 = _myaxi_write_req_fifo_rdata[128:97];
  assign unpack_write_req_local_stride_8 = _myaxi_write_req_fifo_rdata[96:65];
  assign unpack_write_req_size_9 = _myaxi_write_req_fifo_rdata[64:32];
  assign unpack_write_req_local_blocksize_10 = _myaxi_write_req_fifo_rdata[31:0];
  assign _myaxi_write_op_sel_fifo = unpack_write_req_op_sel_6;
  assign _myaxi_write_local_addr_fifo = unpack_write_req_local_addr_7;
  assign _myaxi_write_local_stride_fifo = unpack_write_req_local_stride_8;
  assign _myaxi_write_size_fifo = unpack_write_req_size_9;
  assign _myaxi_write_local_blocksize_fifo = unpack_write_req_local_blocksize_10;
  reg [8-1:0] _myaxi_write_op_sel_buf;
  reg [32-1:0] _myaxi_write_local_addr_buf;
  reg [32-1:0] _myaxi_write_local_stride_buf;
  reg [33-1:0] _myaxi_write_size_buf;
  reg [32-1:0] _myaxi_write_local_blocksize_buf;
  reg _myaxi_write_req_idle;
  reg _myaxi_write_data_idle;
  wire _myaxi_write_idle;
  assign _myaxi_write_idle = !_myaxi_write_start && _myaxi_write_req_idle && _myaxi_write_req_fifo_empty && _myaxi_write_data_idle;
  wire [10-1:0] ram_a0_0_0_addr;
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

  wire [10-1:0] ram_a0_1_0_addr;
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

  wire [10-1:0] ram_a1_0_0_addr;
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

  wire [10-1:0] ram_a1_1_0_addr;
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

  wire [10-1:0] ram_b0_0_0_addr;
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

  wire [10-1:0] ram_b0_1_0_addr;
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

  wire [10-1:0] ram_b1_0_0_addr;
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

  wire [10-1:0] ram_b1_1_0_addr;
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

  wire [10-1:0] ram_c_0_addr;
  wire [32-1:0] ram_c_0_rdata;
  wire [32-1:0] ram_c_0_wdata;
  wire ram_c_0_wenable;
  wire ram_c_0_enable;

  ram_c
  inst_ram_c
  (
    .CLK(CLK),
    .ram_c_0_addr(ram_c_0_addr),
    .ram_c_0_rdata(ram_c_0_rdata),
    .ram_c_0_wdata(ram_c_0_wdata),
    .ram_c_0_wenable(ram_c_0_wenable),
    .ram_c_0_enable(ram_c_0_enable)
  );

  wire [10-1:0] ram_x_0_addr;
  wire [32-1:0] ram_x_0_rdata;
  wire [32-1:0] ram_x_0_wdata;
  wire ram_x_0_wenable;
  wire ram_x_0_enable;

  ram_x
  inst_ram_x
  (
    .CLK(CLK),
    .ram_x_0_addr(ram_x_0_addr),
    .ram_x_0_rdata(ram_x_0_rdata),
    .ram_x_0_wdata(ram_x_0_wdata),
    .ram_x_0_wenable(ram_x_0_wenable),
    .ram_x_0_enable(ram_x_0_enable)
  );

  wire [10-1:0] ram_y_0_addr;
  wire [32-1:0] ram_y_0_rdata;
  wire [32-1:0] ram_y_0_wdata;
  wire ram_y_0_wenable;
  wire ram_y_0_enable;

  ram_y
  inst_ram_y
  (
    .CLK(CLK),
    .ram_y_0_addr(ram_y_0_addr),
    .ram_y_0_rdata(ram_y_0_rdata),
    .ram_y_0_wdata(ram_y_0_wdata),
    .ram_y_0_wenable(ram_y_0_wenable),
    .ram_y_0_enable(ram_y_0_enable)
  );

  wire [10-1:0] ram_z_0_addr;
  wire [32-1:0] ram_z_0_rdata;
  wire [32-1:0] ram_z_0_wdata;
  wire ram_z_0_wenable;
  wire ram_z_0_enable;

  ram_z
  inst_ram_z
  (
    .CLK(CLK),
    .ram_z_0_addr(ram_z_0_addr),
    .ram_z_0_rdata(ram_z_0_rdata),
    .ram_z_0_wdata(ram_z_0_wdata),
    .ram_z_0_wenable(ram_z_0_wenable),
    .ram_z_0_enable(ram_z_0_enable)
  );

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
  reg [33-1:0] _mystream_sum_sink_count;
  reg [5-1:0] _mystream_sum_sink_mode;
  reg [16-1:0] _mystream_sum_sink_generator_id;
  reg [32-1:0] _mystream_sum_sink_offset;
  reg [33-1:0] _mystream_sum_sink_size;
  reg [32-1:0] _mystream_sum_sink_stride;
  reg [32-1:0] _mystream_sum_sink_offset_buf;
  reg [33-1:0] _mystream_sum_sink_size_buf;
  reg [32-1:0] _mystream_sum_sink_stride_buf;
  reg [8-1:0] _mystream_sum_sink_sel;
  reg [32-1:0] _mystream_sum_sink_waddr;
  reg _mystream_sum_sink_wenable;
  reg [32-1:0] _mystream_sum_sink_wdata;
  reg _mystream_sum_sink_fifo_enq;
  reg [32-1:0] _mystream_sum_sink_fifo_wdata;
  reg [32-1:0] _mystream_sum_sink_immediate;
  reg [33-1:0] _mystream_sum_valid2_sink_count;
  reg [5-1:0] _mystream_sum_valid2_sink_mode;
  reg [16-1:0] _mystream_sum_valid2_sink_generator_id;
  reg [32-1:0] _mystream_sum_valid2_sink_offset;
  reg [33-1:0] _mystream_sum_valid2_sink_size;
  reg [32-1:0] _mystream_sum_valid2_sink_stride;
  reg [32-1:0] _mystream_sum_valid2_sink_offset_buf;
  reg [33-1:0] _mystream_sum_valid2_sink_size_buf;
  reg [32-1:0] _mystream_sum_valid2_sink_stride_buf;
  reg [8-1:0] _mystream_sum_valid2_sink_sel;
  reg [32-1:0] _mystream_sum_valid2_sink_waddr;
  reg _mystream_sum_valid2_sink_wenable;
  reg [1-1:0] _mystream_sum_valid2_sink_wdata;
  reg _mystream_sum_valid2_sink_fifo_enq;
  reg [1-1:0] _mystream_sum_valid2_sink_fifo_wdata;
  reg [1-1:0] _mystream_sum_valid2_sink_immediate;
  reg [32-1:0] counter;
  reg [32-1:0] th_comp;
  localparam th_comp_init = 0;
  reg signed [32-1:0] _th_comp_size_0;
  reg signed [32-1:0] _th_comp_offset_1;
  wire [32-1:0] _dma_read_packed_high_local_size_11;
  assign _dma_read_packed_high_local_size_11 = (_th_comp_size_0 >>> 1) >> 1;
  wire [1-1:0] _dma_read_packed_low_local_size_12;
  assign _dma_read_packed_low_local_size_12 = (_th_comp_size_0 >>> 1) & { 1{ 1'd1 } };
  wire [32-1:0] _dma_read_packed_local_packed_size_13;
  assign _dma_read_packed_local_packed_size_13 = (_dma_read_packed_low_local_size_12 > 0)? _dma_read_packed_high_local_size_11 + 1 : _dma_read_packed_high_local_size_11;
  wire [32-1:0] mask_addr_shifted_14;
  assign mask_addr_shifted_14 = 0;
  wire [32-1:0] mask_addr_masked_15;
  assign mask_addr_masked_15 = mask_addr_shifted_14 << 2;
  reg [32-1:0] _myaxi_read_req_fsm;
  localparam _myaxi_read_req_fsm_init = 0;
  reg [33-1:0] _myaxi_read_cur_global_size;
  reg _myaxi_read_cont;
  wire [8-1:0] pack_read_req_op_sel_16;
  wire [32-1:0] pack_read_req_local_addr_17;
  wire [32-1:0] pack_read_req_local_stride_18;
  wire [33-1:0] pack_read_req_local_size_19;
  wire [32-1:0] pack_read_req_local_blocksize_20;
  assign pack_read_req_op_sel_16 = _myaxi_read_op_sel;
  assign pack_read_req_local_addr_17 = _myaxi_read_local_addr;
  assign pack_read_req_local_stride_18 = _myaxi_read_local_stride;
  assign pack_read_req_local_size_19 = _myaxi_read_local_size;
  assign pack_read_req_local_blocksize_20 = _myaxi_read_local_blocksize;
  wire [137-1:0] pack_read_req_packed_21;
  assign pack_read_req_packed_21 = { pack_read_req_op_sel_16, pack_read_req_local_addr_17, pack_read_req_local_stride_18, pack_read_req_local_size_19, pack_read_req_local_blocksize_20 };
  assign _myaxi_read_req_fifo_wdata = ((_myaxi_read_req_fsm == 0) && _myaxi_read_start && !_myaxi_read_req_fifo_almost_full)? pack_read_req_packed_21 : 'hx;
  assign _myaxi_read_req_fifo_enq = ((_myaxi_read_req_fsm == 0) && _myaxi_read_start && !_myaxi_read_req_fifo_almost_full)? (_myaxi_read_req_fsm == 0) && _myaxi_read_start && !_myaxi_read_req_fifo_almost_full && !_myaxi_read_req_fifo_almost_full : 0;
  localparam _tmp_22 = 1;
  wire [_tmp_22-1:0] _tmp_23;
  assign _tmp_23 = !_myaxi_read_req_fifo_almost_full;
  reg [_tmp_22-1:0] __tmp_23_1;
  wire [32-1:0] mask_addr_shifted_24;
  assign mask_addr_shifted_24 = _myaxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_25;
  assign mask_addr_masked_25 = mask_addr_shifted_24 << 2;
  wire [32-1:0] mask_addr_shifted_26;
  assign mask_addr_shifted_26 = _myaxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_27;
  assign mask_addr_masked_27 = mask_addr_shifted_26 << 2;
  wire [32-1:0] mask_addr_shifted_28;
  assign mask_addr_shifted_28 = _myaxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_29;
  assign mask_addr_masked_29 = mask_addr_shifted_28 << 2;
  wire [32-1:0] mask_addr_shifted_30;
  assign mask_addr_shifted_30 = _myaxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_31;
  assign mask_addr_masked_31 = mask_addr_shifted_30 << 2;
  wire [32-1:0] mask_addr_shifted_32;
  assign mask_addr_shifted_32 = _myaxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_33;
  assign mask_addr_masked_33 = mask_addr_shifted_32 << 2;
  wire [32-1:0] mask_addr_shifted_34;
  assign mask_addr_shifted_34 = _myaxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_35;
  assign mask_addr_masked_35 = mask_addr_shifted_34 << 2;
  reg _myaxi_cond_0_1;
  reg [32-1:0] _myaxi_read_data_narrow_fsm;
  localparam _myaxi_read_data_narrow_fsm_init = 0;
  reg [64-1:0] _myaxi_read_narrow_wdata_36;
  reg _myaxi_read_narrow_wvalid_37;
  reg [1-1:0] _myaxi_read_narrow_count_38;
  reg [32-1:0] write_burst_packed_fsm_0;
  localparam write_burst_packed_fsm_0_init = 0;
  reg [11-1:0] write_burst_packed_addr_39;
  reg [11-1:0] write_burst_packed_stride_40;
  reg [33-1:0] write_burst_packed_length_41;
  reg write_burst_packed_done_42;
  wire [10-1:0] write_burst_packed_ram_addr_43;
  assign write_burst_packed_ram_addr_43 = write_burst_packed_addr_39 >> 1;
  wire [32-1:0] write_burst_packed_ram_wdata_44;
  assign write_burst_packed_ram_wdata_44 = _myaxi_read_narrow_wdata_36 >> 0;
  assign ram_a0_0_0_wdata = ((write_burst_packed_fsm_0 == 1) && _myaxi_read_narrow_wvalid_37)? write_burst_packed_ram_wdata_44 : 'hx;
  assign ram_a0_0_0_wenable = ((write_burst_packed_fsm_0 == 1) && _myaxi_read_narrow_wvalid_37)? 1'd1 : 0;
  wire [10-1:0] write_burst_packed_ram_addr_45;
  assign write_burst_packed_ram_addr_45 = write_burst_packed_addr_39 >> 1;
  wire [32-1:0] write_burst_packed_ram_wdata_46;
  assign write_burst_packed_ram_wdata_46 = _myaxi_read_narrow_wdata_36 >> 32;
  assign ram_a0_1_0_wdata = ((write_burst_packed_fsm_0 == 1) && _myaxi_read_narrow_wvalid_37)? write_burst_packed_ram_wdata_46 : 'hx;
  assign ram_a0_1_0_wenable = ((write_burst_packed_fsm_0 == 1) && _myaxi_read_narrow_wvalid_37)? 1'd1 : 0;
  wire [32-1:0] _dma_read_packed_high_local_size_47;
  assign _dma_read_packed_high_local_size_47 = (_th_comp_size_0 >>> 1) >> 1;
  wire [1-1:0] _dma_read_packed_low_local_size_48;
  assign _dma_read_packed_low_local_size_48 = (_th_comp_size_0 >>> 1) & { 1{ 1'd1 } };
  wire [32-1:0] _dma_read_packed_local_packed_size_49;
  assign _dma_read_packed_local_packed_size_49 = (_dma_read_packed_low_local_size_48 > 0)? _dma_read_packed_high_local_size_47 + 1 : _dma_read_packed_high_local_size_47;
  wire [32-1:0] mask_addr_shifted_50;
  assign mask_addr_shifted_50 = ((_th_comp_size_0 >>> 1) << 2) >> 2;
  wire [32-1:0] mask_addr_masked_51;
  assign mask_addr_masked_51 = mask_addr_shifted_50 << 2;
  reg [64-1:0] _myaxi_read_narrow_wdata_52;
  reg _myaxi_read_narrow_wvalid_53;
  reg [1-1:0] _myaxi_read_narrow_count_54;
  reg [32-1:0] write_burst_packed_fsm_1;
  localparam write_burst_packed_fsm_1_init = 0;
  reg [11-1:0] write_burst_packed_addr_55;
  reg [11-1:0] write_burst_packed_stride_56;
  reg [33-1:0] write_burst_packed_length_57;
  reg write_burst_packed_done_58;
  wire [10-1:0] write_burst_packed_ram_addr_59;
  assign write_burst_packed_ram_addr_59 = write_burst_packed_addr_55 >> 1;
  wire [32-1:0] write_burst_packed_ram_wdata_60;
  assign write_burst_packed_ram_wdata_60 = _myaxi_read_narrow_wdata_52 >> 0;
  assign ram_a1_0_0_wdata = ((write_burst_packed_fsm_1 == 1) && _myaxi_read_narrow_wvalid_53)? write_burst_packed_ram_wdata_60 : 'hx;
  assign ram_a1_0_0_wenable = ((write_burst_packed_fsm_1 == 1) && _myaxi_read_narrow_wvalid_53)? 1'd1 : 0;
  wire [10-1:0] write_burst_packed_ram_addr_61;
  assign write_burst_packed_ram_addr_61 = write_burst_packed_addr_55 >> 1;
  wire [32-1:0] write_burst_packed_ram_wdata_62;
  assign write_burst_packed_ram_wdata_62 = _myaxi_read_narrow_wdata_52 >> 32;
  assign ram_a1_1_0_wdata = ((write_burst_packed_fsm_1 == 1) && _myaxi_read_narrow_wvalid_53)? write_burst_packed_ram_wdata_62 : 'hx;
  assign ram_a1_1_0_wenable = ((write_burst_packed_fsm_1 == 1) && _myaxi_read_narrow_wvalid_53)? 1'd1 : 0;
  wire [32-1:0] _dma_read_packed_high_local_size_63;
  assign _dma_read_packed_high_local_size_63 = (_th_comp_size_0 >>> 1) >> 1;
  wire [1-1:0] _dma_read_packed_low_local_size_64;
  assign _dma_read_packed_low_local_size_64 = (_th_comp_size_0 >>> 1) & { 1{ 1'd1 } };
  wire [32-1:0] _dma_read_packed_local_packed_size_65;
  assign _dma_read_packed_local_packed_size_65 = (_dma_read_packed_low_local_size_64 > 0)? _dma_read_packed_high_local_size_63 + 1 : _dma_read_packed_high_local_size_63;
  wire [32-1:0] mask_addr_shifted_66;
  assign mask_addr_shifted_66 = 128;
  wire [32-1:0] mask_addr_masked_67;
  assign mask_addr_masked_67 = mask_addr_shifted_66 << 2;
  reg [64-1:0] _myaxi_read_narrow_wdata_68;
  reg _myaxi_read_narrow_wvalid_69;
  reg [1-1:0] _myaxi_read_narrow_count_70;
  reg [32-1:0] write_burst_packed_fsm_2;
  localparam write_burst_packed_fsm_2_init = 0;
  reg [11-1:0] write_burst_packed_addr_71;
  reg [11-1:0] write_burst_packed_stride_72;
  reg [33-1:0] write_burst_packed_length_73;
  reg write_burst_packed_done_74;
  wire [10-1:0] write_burst_packed_ram_addr_75;
  assign write_burst_packed_ram_addr_75 = write_burst_packed_addr_71 >> 1;
  wire [32-1:0] write_burst_packed_ram_wdata_76;
  assign write_burst_packed_ram_wdata_76 = _myaxi_read_narrow_wdata_68 >> 0;
  assign ram_b0_0_0_wdata = ((write_burst_packed_fsm_2 == 1) && _myaxi_read_narrow_wvalid_69)? write_burst_packed_ram_wdata_76 : 'hx;
  assign ram_b0_0_0_wenable = ((write_burst_packed_fsm_2 == 1) && _myaxi_read_narrow_wvalid_69)? 1'd1 : 0;
  wire [10-1:0] write_burst_packed_ram_addr_77;
  assign write_burst_packed_ram_addr_77 = write_burst_packed_addr_71 >> 1;
  wire [32-1:0] write_burst_packed_ram_wdata_78;
  assign write_burst_packed_ram_wdata_78 = _myaxi_read_narrow_wdata_68 >> 32;
  assign ram_b0_1_0_wdata = ((write_burst_packed_fsm_2 == 1) && _myaxi_read_narrow_wvalid_69)? write_burst_packed_ram_wdata_78 : 'hx;
  assign ram_b0_1_0_wenable = ((write_burst_packed_fsm_2 == 1) && _myaxi_read_narrow_wvalid_69)? 1'd1 : 0;
  wire [32-1:0] _dma_read_packed_high_local_size_79;
  assign _dma_read_packed_high_local_size_79 = (_th_comp_size_0 >>> 1) >> 1;
  wire [1-1:0] _dma_read_packed_low_local_size_80;
  assign _dma_read_packed_low_local_size_80 = (_th_comp_size_0 >>> 1) & { 1{ 1'd1 } };
  wire [32-1:0] _dma_read_packed_local_packed_size_81;
  assign _dma_read_packed_local_packed_size_81 = (_dma_read_packed_low_local_size_80 > 0)? _dma_read_packed_high_local_size_79 + 1 : _dma_read_packed_high_local_size_79;
  wire [32-1:0] mask_addr_shifted_82;
  assign mask_addr_shifted_82 = 512 + ((_th_comp_size_0 >>> 1) << 2) >> 2;
  wire [32-1:0] mask_addr_masked_83;
  assign mask_addr_masked_83 = mask_addr_shifted_82 << 2;
  reg [64-1:0] _myaxi_read_narrow_wdata_84;
  reg _myaxi_read_narrow_wvalid_85;
  reg [1-1:0] _myaxi_read_narrow_count_86;
  reg [32-1:0] write_burst_packed_fsm_3;
  localparam write_burst_packed_fsm_3_init = 0;
  reg [11-1:0] write_burst_packed_addr_87;
  reg [11-1:0] write_burst_packed_stride_88;
  reg [33-1:0] write_burst_packed_length_89;
  reg write_burst_packed_done_90;
  wire [10-1:0] write_burst_packed_ram_addr_91;
  assign write_burst_packed_ram_addr_91 = write_burst_packed_addr_87 >> 1;
  wire [32-1:0] write_burst_packed_ram_wdata_92;
  assign write_burst_packed_ram_wdata_92 = _myaxi_read_narrow_wdata_84 >> 0;
  assign ram_b1_0_0_wdata = ((write_burst_packed_fsm_3 == 1) && _myaxi_read_narrow_wvalid_85)? write_burst_packed_ram_wdata_92 : 'hx;
  assign ram_b1_0_0_wenable = ((write_burst_packed_fsm_3 == 1) && _myaxi_read_narrow_wvalid_85)? 1'd1 : 0;
  wire [10-1:0] write_burst_packed_ram_addr_93;
  assign write_burst_packed_ram_addr_93 = write_burst_packed_addr_87 >> 1;
  wire [32-1:0] write_burst_packed_ram_wdata_94;
  assign write_burst_packed_ram_wdata_94 = _myaxi_read_narrow_wdata_84 >> 32;
  assign ram_b1_1_0_wdata = ((write_burst_packed_fsm_3 == 1) && _myaxi_read_narrow_wvalid_85)? write_burst_packed_ram_wdata_94 : 'hx;
  assign ram_b1_1_0_wenable = ((write_burst_packed_fsm_3 == 1) && _myaxi_read_narrow_wvalid_85)? 1'd1 : 0;
  reg signed [32-1:0] _th_comp_size_2;
  reg signed [32-1:0] _th_comp_offset_3;
  reg signed [32-1:0] _th_comp_start_time_4;
  reg signed [32-1:0] _th_comp__size_5;
  wire signed [32-1:0] mystream_size_data;
  wire signed [32-1:0] mystream_a00_data;
  wire signed [32-1:0] mystream_a01_data;
  wire signed [32-1:0] mystream_b00_data;
  wire signed [32-1:0] mystream_b01_data;
  wire [1-1:0] mystream__reduce_reset_data;
  wire signed [32-1:0] mystream_a10_data;
  wire signed [32-1:0] mystream_a11_data;
  wire signed [32-1:0] mystream_b10_data;
  wire signed [32-1:0] mystream_b11_data;
  reg __mystream_stream_ivalid_1;
  reg __mystream_stream_ivalid_2;
  reg __mystream_stream_ivalid_3;
  reg __mystream_stream_ivalid_4;
  reg signed [32-1:0] _plus_data_5;
  reg signed [32-1:0] _plus_data_6;
  reg signed [32-1:0] _plus_data_17;
  reg signed [32-1:0] _plus_data_18;
  reg signed [32-1:0] __delay_data_25__variable_0;
  reg [1-1:0] __delay_data_27__variable_8;
  reg signed [32-1:0] __plusn_data_7;
  reg signed [32-1:0] __plusn_data_19;
  reg signed [32-1:0] __delay_data_26__delay_25__variable_0;
  reg [1-1:0] __delay_data_28__delay_27__variable_8;
  reg signed [32-1:0] _reduceadd_data_9;
  reg [33-1:0] _reduceadd_count_9;
  reg _reduceadd_prev_count_max_9;
  wire _reduceadd_reset_cond_9;
  assign _reduceadd_reset_cond_9 = __delay_data_28__delay_27__variable_8 || _reduceadd_prev_count_max_9;
  wire [33-1:0] _reduceadd_current_count_9;
  assign _reduceadd_current_count_9 = (_reduceadd_reset_cond_9)? 0 : _reduceadd_count_9;
  wire signed [32-1:0] _reduceadd_current_data_9;
  assign _reduceadd_current_data_9 = (_reduceadd_reset_cond_9)? 1'sd0 : _reduceadd_data_9;
  reg signed [32-1:0] _reduceadd_data_20;
  reg [33-1:0] _reduceadd_count_20;
  reg _reduceadd_prev_count_max_20;
  wire _reduceadd_reset_cond_20;
  assign _reduceadd_reset_cond_20 = __delay_data_28__delay_27__variable_8 || _reduceadd_prev_count_max_20;
  wire [33-1:0] _reduceadd_current_count_20;
  assign _reduceadd_current_count_20 = (_reduceadd_reset_cond_20)? 0 : _reduceadd_count_20;
  wire signed [32-1:0] _reduceadd_current_data_20;
  assign _reduceadd_current_data_20 = (_reduceadd_reset_cond_20)? 1'sd0 : _reduceadd_data_20;
  reg [1-1:0] _pulse_data_22;
  reg [33-1:0] _pulse_count_22;
  reg _pulse_prev_count_max_22;
  wire _pulse_reset_cond_22;
  assign _pulse_reset_cond_22 = __delay_data_28__delay_27__variable_8 || _pulse_prev_count_max_22;
  wire [33-1:0] _pulse_current_count_22;
  assign _pulse_current_count_22 = (_pulse_reset_cond_22)? 0 : _pulse_count_22;
  wire [1-1:0] _pulse_current_data_22;
  assign _pulse_current_data_22 = (_pulse_reset_cond_22)? 1'sd0 : _pulse_data_22;
  reg signed [32-1:0] _plus_data_24;
  reg [1-1:0] __delay_data_29_pulse_22;
  wire signed [32-1:0] mystream_sum_data;
  assign mystream_sum_data = _plus_data_24;
  wire [1-1:0] mystream_sum_valid2_data;
  assign mystream_sum_valid2_data = __delay_data_29_pulse_22;
  wire _set_flag_95;
  assign _set_flag_95 = th_comp == 13;
  reg signed [32-1:0] __variable_wdata_0;
  assign mystream_size_data = __variable_wdata_0;
  wire _set_flag_96;
  assign _set_flag_96 = th_comp == 14;
  assign ram_a0_0_0_addr = (_mystream_stream_oready && _mystream_a00_source_ram_renable && (_mystream_a00_source_sel == 1))? _mystream_a00_source_ram_raddr : 
                           ((write_burst_packed_fsm_0 == 1) && _myaxi_read_narrow_wvalid_37)? write_burst_packed_ram_addr_43 : 'hx;
  assign ram_a0_0_0_enable = (_mystream_stream_oready && _mystream_a00_source_ram_renable && (_mystream_a00_source_sel == 1))? 1'd1 : 
                             ((write_burst_packed_fsm_0 == 1) && _myaxi_read_narrow_wvalid_37)? 1'd1 : 0;
  localparam _tmp_97 = 1;
  wire [_tmp_97-1:0] _tmp_98;
  assign _tmp_98 = _mystream_stream_oready && _mystream_a00_source_ram_renable && (_mystream_a00_source_sel == 1);
  reg [_tmp_97-1:0] __tmp_98_1;
  assign _mystream_a00_source_ram_rdata = (_mystream_a00_source_sel == 1)? ram_a0_0_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_1;
  assign mystream_a00_data = __variable_wdata_1;
  reg [32-1:0] _mystream_a00_source_fsm_0;
  localparam _mystream_a00_source_fsm_0_init = 0;
  wire _set_flag_99;
  assign _set_flag_99 = th_comp == 15;
  assign ram_a0_1_0_addr = (_mystream_stream_oready && _mystream_a01_source_ram_renable && (_mystream_a01_source_sel == 2))? _mystream_a01_source_ram_raddr : 
                           ((write_burst_packed_fsm_0 == 1) && _myaxi_read_narrow_wvalid_37)? write_burst_packed_ram_addr_45 : 'hx;
  assign ram_a0_1_0_enable = (_mystream_stream_oready && _mystream_a01_source_ram_renable && (_mystream_a01_source_sel == 2))? 1'd1 : 
                             ((write_burst_packed_fsm_0 == 1) && _myaxi_read_narrow_wvalid_37)? 1'd1 : 0;
  localparam _tmp_100 = 1;
  wire [_tmp_100-1:0] _tmp_101;
  assign _tmp_101 = _mystream_stream_oready && _mystream_a01_source_ram_renable && (_mystream_a01_source_sel == 2);
  reg [_tmp_100-1:0] __tmp_101_1;
  assign _mystream_a01_source_ram_rdata = (_mystream_a01_source_sel == 2)? ram_a0_1_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_2;
  assign mystream_a01_data = __variable_wdata_2;
  reg [32-1:0] _mystream_a01_source_fsm_1;
  localparam _mystream_a01_source_fsm_1_init = 0;
  wire _set_flag_102;
  assign _set_flag_102 = th_comp == 16;
  assign ram_a1_0_0_addr = (_mystream_stream_oready && _mystream_a10_source_ram_renable && (_mystream_a10_source_sel == 3))? _mystream_a10_source_ram_raddr : 
                           ((write_burst_packed_fsm_1 == 1) && _myaxi_read_narrow_wvalid_53)? write_burst_packed_ram_addr_59 : 'hx;
  assign ram_a1_0_0_enable = (_mystream_stream_oready && _mystream_a10_source_ram_renable && (_mystream_a10_source_sel == 3))? 1'd1 : 
                             ((write_burst_packed_fsm_1 == 1) && _myaxi_read_narrow_wvalid_53)? 1'd1 : 0;
  localparam _tmp_103 = 1;
  wire [_tmp_103-1:0] _tmp_104;
  assign _tmp_104 = _mystream_stream_oready && _mystream_a10_source_ram_renable && (_mystream_a10_source_sel == 3);
  reg [_tmp_103-1:0] __tmp_104_1;
  assign _mystream_a10_source_ram_rdata = (_mystream_a10_source_sel == 3)? ram_a1_0_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_13;
  assign mystream_a10_data = __variable_wdata_13;
  reg [32-1:0] _mystream_a10_source_fsm_2;
  localparam _mystream_a10_source_fsm_2_init = 0;
  wire _set_flag_105;
  assign _set_flag_105 = th_comp == 17;
  assign ram_a1_1_0_addr = (_mystream_stream_oready && _mystream_a11_source_ram_renable && (_mystream_a11_source_sel == 4))? _mystream_a11_source_ram_raddr : 
                           ((write_burst_packed_fsm_1 == 1) && _myaxi_read_narrow_wvalid_53)? write_burst_packed_ram_addr_61 : 'hx;
  assign ram_a1_1_0_enable = (_mystream_stream_oready && _mystream_a11_source_ram_renable && (_mystream_a11_source_sel == 4))? 1'd1 : 
                             ((write_burst_packed_fsm_1 == 1) && _myaxi_read_narrow_wvalid_53)? 1'd1 : 0;
  localparam _tmp_106 = 1;
  wire [_tmp_106-1:0] _tmp_107;
  assign _tmp_107 = _mystream_stream_oready && _mystream_a11_source_ram_renable && (_mystream_a11_source_sel == 4);
  reg [_tmp_106-1:0] __tmp_107_1;
  assign _mystream_a11_source_ram_rdata = (_mystream_a11_source_sel == 4)? ram_a1_1_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_14;
  assign mystream_a11_data = __variable_wdata_14;
  reg [32-1:0] _mystream_a11_source_fsm_3;
  localparam _mystream_a11_source_fsm_3_init = 0;
  wire _set_flag_108;
  assign _set_flag_108 = th_comp == 19;
  assign ram_b0_0_0_addr = (_mystream_stream_oready && _mystream_b00_source_ram_renable && (_mystream_b00_source_sel == 5))? _mystream_b00_source_ram_raddr : 
                           ((write_burst_packed_fsm_2 == 1) && _myaxi_read_narrow_wvalid_69)? write_burst_packed_ram_addr_75 : 'hx;
  assign ram_b0_0_0_enable = (_mystream_stream_oready && _mystream_b00_source_ram_renable && (_mystream_b00_source_sel == 5))? 1'd1 : 
                             ((write_burst_packed_fsm_2 == 1) && _myaxi_read_narrow_wvalid_69)? 1'd1 : 0;
  localparam _tmp_109 = 1;
  wire [_tmp_109-1:0] _tmp_110;
  assign _tmp_110 = _mystream_stream_oready && _mystream_b00_source_ram_renable && (_mystream_b00_source_sel == 5);
  reg [_tmp_109-1:0] __tmp_110_1;
  assign _mystream_b00_source_ram_rdata = (_mystream_b00_source_sel == 5)? ram_b0_0_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_3;
  assign mystream_b00_data = __variable_wdata_3;
  reg [32-1:0] _mystream_b00_source_fsm_4;
  localparam _mystream_b00_source_fsm_4_init = 0;
  wire _set_flag_111;
  assign _set_flag_111 = th_comp == 20;
  assign ram_b0_1_0_addr = (_mystream_stream_oready && _mystream_b01_source_ram_renable && (_mystream_b01_source_sel == 6))? _mystream_b01_source_ram_raddr : 
                           ((write_burst_packed_fsm_2 == 1) && _myaxi_read_narrow_wvalid_69)? write_burst_packed_ram_addr_77 : 'hx;
  assign ram_b0_1_0_enable = (_mystream_stream_oready && _mystream_b01_source_ram_renable && (_mystream_b01_source_sel == 6))? 1'd1 : 
                             ((write_burst_packed_fsm_2 == 1) && _myaxi_read_narrow_wvalid_69)? 1'd1 : 0;
  localparam _tmp_112 = 1;
  wire [_tmp_112-1:0] _tmp_113;
  assign _tmp_113 = _mystream_stream_oready && _mystream_b01_source_ram_renable && (_mystream_b01_source_sel == 6);
  reg [_tmp_112-1:0] __tmp_113_1;
  assign _mystream_b01_source_ram_rdata = (_mystream_b01_source_sel == 6)? ram_b0_1_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_4;
  assign mystream_b01_data = __variable_wdata_4;
  reg [32-1:0] _mystream_b01_source_fsm_5;
  localparam _mystream_b01_source_fsm_5_init = 0;
  wire _set_flag_114;
  assign _set_flag_114 = th_comp == 21;
  assign ram_b1_0_0_addr = (_mystream_stream_oready && _mystream_b10_source_ram_renable && (_mystream_b10_source_sel == 7))? _mystream_b10_source_ram_raddr : 
                           ((write_burst_packed_fsm_3 == 1) && _myaxi_read_narrow_wvalid_85)? write_burst_packed_ram_addr_91 : 'hx;
  assign ram_b1_0_0_enable = (_mystream_stream_oready && _mystream_b10_source_ram_renable && (_mystream_b10_source_sel == 7))? 1'd1 : 
                             ((write_burst_packed_fsm_3 == 1) && _myaxi_read_narrow_wvalid_85)? 1'd1 : 0;
  localparam _tmp_115 = 1;
  wire [_tmp_115-1:0] _tmp_116;
  assign _tmp_116 = _mystream_stream_oready && _mystream_b10_source_ram_renable && (_mystream_b10_source_sel == 7);
  reg [_tmp_115-1:0] __tmp_116_1;
  assign _mystream_b10_source_ram_rdata = (_mystream_b10_source_sel == 7)? ram_b1_0_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_15;
  assign mystream_b10_data = __variable_wdata_15;
  reg [32-1:0] _mystream_b10_source_fsm_6;
  localparam _mystream_b10_source_fsm_6_init = 0;
  wire _set_flag_117;
  assign _set_flag_117 = th_comp == 22;
  assign ram_b1_1_0_addr = (_mystream_stream_oready && _mystream_b11_source_ram_renable && (_mystream_b11_source_sel == 8))? _mystream_b11_source_ram_raddr : 
                           ((write_burst_packed_fsm_3 == 1) && _myaxi_read_narrow_wvalid_85)? write_burst_packed_ram_addr_93 : 'hx;
  assign ram_b1_1_0_enable = (_mystream_stream_oready && _mystream_b11_source_ram_renable && (_mystream_b11_source_sel == 8))? 1'd1 : 
                             ((write_burst_packed_fsm_3 == 1) && _myaxi_read_narrow_wvalid_85)? 1'd1 : 0;
  localparam _tmp_118 = 1;
  wire [_tmp_118-1:0] _tmp_119;
  assign _tmp_119 = _mystream_stream_oready && _mystream_b11_source_ram_renable && (_mystream_b11_source_sel == 8);
  reg [_tmp_118-1:0] __tmp_119_1;
  assign _mystream_b11_source_ram_rdata = (_mystream_b11_source_sel == 8)? ram_b1_1_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_16;
  assign mystream_b11_data = __variable_wdata_16;
  reg [32-1:0] _mystream_b11_source_fsm_7;
  localparam _mystream_b11_source_fsm_7_init = 0;
  wire _set_flag_120;
  assign _set_flag_120 = th_comp == 23;
  reg _tmp_121;
  reg _tmp_122;
  reg _tmp_123;
  reg _tmp_124;
  reg _tmp_125;
  reg _tmp_126;
  reg signed [32-1:0] _tmp_127;
  reg signed [32-1:0] _tmp_128;
  reg signed [32-1:0] _tmp_129;
  reg signed [32-1:0] _tmp_130;
  reg signed [32-1:0] _tmp_131;
  reg signed [32-1:0] _tmp_132;
  reg [32-1:0] _mystream_sum_sink_fsm_8;
  localparam _mystream_sum_sink_fsm_8_init = 0;
  wire _set_flag_133;
  assign _set_flag_133 = th_comp == 24;
  assign _mystream_run_flag = (_set_flag_133)? 1 : 0;
  reg _tmp_134;
  reg _tmp_135;
  reg _tmp_136;
  reg _tmp_137;
  reg _tmp_138;
  reg _tmp_139;
  reg [1-1:0] __variable_wdata_8;
  assign mystream__reduce_reset_data = __variable_wdata_8;
  reg _tmp_140;
  reg _tmp_141;
  reg _tmp_142;
  reg _tmp_143;
  assign _mystream_source_stop = _mystream_stream_oready && (_mystream_a00_idle && _mystream_a01_idle && _mystream_a10_idle && _mystream_a11_idle && _mystream_b00_idle && _mystream_b01_idle && _mystream_b10_idle && _mystream_b11_idle && (_mystream_fsm == 3));
  localparam _tmp_144 = 1;
  wire [_tmp_144-1:0] _tmp_145;
  assign _tmp_145 = _mystream_a00_idle && _mystream_a01_idle && _mystream_a10_idle && _mystream_a11_idle && _mystream_b00_idle && _mystream_b01_idle && _mystream_b10_idle && _mystream_b11_idle && (_mystream_fsm == 3);
  reg [_tmp_144-1:0] _tmp_146;
  localparam _tmp_147 = 1;
  wire [_tmp_147-1:0] _tmp_148;
  assign _tmp_148 = _mystream_a00_idle && _mystream_a01_idle && _mystream_a10_idle && _mystream_a11_idle && _mystream_b00_idle && _mystream_b01_idle && _mystream_b10_idle && _mystream_b11_idle && (_mystream_fsm == 3);
  reg [_tmp_147-1:0] _tmp_149;
  reg _tmp_150;
  reg _tmp_151;
  reg _tmp_152;
  reg _tmp_153;
  reg _tmp_154;
  reg _tmp_155;
  assign _mystream_sink_start = _tmp_155;
  reg _tmp_156;
  reg _tmp_157;
  reg _tmp_158;
  reg _tmp_159;
  reg _tmp_160;
  reg _tmp_161;
  assign _mystream_sink_stop = _tmp_161;
  reg _tmp_162;
  reg _tmp_163;
  reg _tmp_164;
  reg _tmp_165;
  reg _tmp_166;
  reg _tmp_167;
  assign _mystream_sink_busy = _tmp_167;
  reg _tmp_168;
  assign _mystream_busy = _mystream_source_busy || _mystream_sink_busy || _mystream_busy_reg;
  reg signed [32-1:0] _th_comp_end_time_6;
  reg signed [32-1:0] _th_comp_exec_time_7;
  wire [32-1:0] mask_addr_shifted_169;
  assign mask_addr_shifted_169 = 256;
  wire [32-1:0] mask_addr_masked_170;
  assign mask_addr_masked_170 = mask_addr_shifted_169 << 2;
  reg [32-1:0] _myaxi_write_req_fsm;
  localparam _myaxi_write_req_fsm_init = 0;
  reg [33-1:0] _myaxi_write_cur_global_size;
  reg _myaxi_write_cont;
  wire [8-1:0] pack_write_req_op_sel_171;
  wire [32-1:0] pack_write_req_local_addr_172;
  wire [32-1:0] pack_write_req_local_stride_173;
  wire [33-1:0] pack_write_req_size_174;
  wire [32-1:0] pack_write_req_local_blocksize_175;
  assign pack_write_req_op_sel_171 = _myaxi_write_op_sel;
  assign pack_write_req_local_addr_172 = _myaxi_write_local_addr;
  assign pack_write_req_local_stride_173 = _myaxi_write_local_stride;
  assign pack_write_req_size_174 = _myaxi_write_local_size;
  assign pack_write_req_local_blocksize_175 = _myaxi_write_local_blocksize;
  wire [137-1:0] pack_write_req_packed_176;
  assign pack_write_req_packed_176 = { pack_write_req_op_sel_171, pack_write_req_local_addr_172, pack_write_req_local_stride_173, pack_write_req_size_174, pack_write_req_local_blocksize_175 };
  localparam _tmp_177 = 1;
  wire [_tmp_177-1:0] _tmp_178;
  assign _tmp_178 = !_myaxi_write_req_fifo_almost_full;
  reg [_tmp_177-1:0] __tmp_178_1;
  wire [32-1:0] mask_addr_shifted_179;
  assign mask_addr_shifted_179 = _myaxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_180;
  assign mask_addr_masked_180 = mask_addr_shifted_179 << 2;
  wire [32-1:0] mask_addr_shifted_181;
  assign mask_addr_shifted_181 = _myaxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_182;
  assign mask_addr_masked_182 = mask_addr_shifted_181 << 2;
  wire [32-1:0] mask_addr_shifted_183;
  assign mask_addr_shifted_183 = _myaxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_184;
  assign mask_addr_masked_184 = mask_addr_shifted_183 << 2;
  wire [32-1:0] mask_addr_shifted_185;
  assign mask_addr_shifted_185 = _myaxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_186;
  assign mask_addr_masked_186 = mask_addr_shifted_185 << 2;
  wire [32-1:0] mask_addr_shifted_187;
  assign mask_addr_shifted_187 = _myaxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_188;
  assign mask_addr_masked_188 = mask_addr_shifted_187 << 2;
  wire [32-1:0] mask_addr_shifted_189;
  assign mask_addr_shifted_189 = _myaxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_190;
  assign mask_addr_masked_190 = mask_addr_shifted_189 << 2;
  wire [8-1:0] pack_write_req_op_sel_191;
  wire [32-1:0] pack_write_req_local_addr_192;
  wire [32-1:0] pack_write_req_local_stride_193;
  wire [33-1:0] pack_write_req_size_194;
  wire [32-1:0] pack_write_req_local_blocksize_195;
  assign pack_write_req_op_sel_191 = _myaxi_write_op_sel;
  assign pack_write_req_local_addr_192 = _myaxi_write_local_addr;
  assign pack_write_req_local_stride_193 = _myaxi_write_local_stride;
  assign pack_write_req_size_194 = _myaxi_write_cur_global_size;
  assign pack_write_req_local_blocksize_195 = _myaxi_write_local_blocksize;
  wire [137-1:0] pack_write_req_packed_196;
  assign pack_write_req_packed_196 = { pack_write_req_op_sel_191, pack_write_req_local_addr_192, pack_write_req_local_stride_193, pack_write_req_size_194, pack_write_req_local_blocksize_195 };
  assign _myaxi_write_req_fifo_wdata = ((_myaxi_write_req_fsm == 1) && !_myaxi_write_req_fifo_almost_full && (myaxi_awready || !myaxi_awvalid) && (outstanding_wcount_0 < 6))? pack_write_req_packed_196 : 
                                       ((_myaxi_write_req_fsm == 0) && _myaxi_write_start && !_myaxi_write_req_fifo_almost_full)? pack_write_req_packed_176 : 'hx;
  assign _myaxi_write_req_fifo_enq = ((_myaxi_write_req_fsm == 1) && !_myaxi_write_req_fifo_almost_full && (myaxi_awready || !myaxi_awvalid) && (outstanding_wcount_0 < 6))? (_myaxi_write_req_fsm == 1) && !_myaxi_write_req_fifo_almost_full && (myaxi_awready || !myaxi_awvalid) && (outstanding_wcount_0 < 6) && !_myaxi_write_req_fifo_almost_full : 
                                     ((_myaxi_write_req_fsm == 0) && _myaxi_write_start && !_myaxi_write_req_fifo_almost_full)? (_myaxi_write_req_fsm == 0) && _myaxi_write_start && !_myaxi_write_req_fifo_almost_full && !_myaxi_write_req_fifo_almost_full : 0;
  localparam _tmp_197 = 1;
  wire [_tmp_197-1:0] _tmp_198;
  assign _tmp_198 = !_myaxi_write_req_fifo_almost_full;
  reg [_tmp_197-1:0] __tmp_198_1;
  reg _myaxi_cond_1_1;
  reg [32-1:0] _myaxi_write_data_fsm;
  localparam _myaxi_write_data_fsm_init = 0;
  reg [32-1:0] read_burst_fsm_4;
  localparam read_burst_fsm_4_init = 0;
  reg [10-1:0] read_burst_addr_199;
  reg [10-1:0] read_burst_stride_200;
  reg [33-1:0] read_burst_length_201;
  reg read_burst_rvalid_202;
  reg read_burst_rlast_203;
  localparam _tmp_204 = 1;
  wire [_tmp_204-1:0] _tmp_205;
  assign _tmp_205 = (read_burst_fsm_4 == 1) && (!read_burst_rvalid_202 || (myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0));
  reg [_tmp_204-1:0] __tmp_205_1;
  wire [32-1:0] read_burst_rdata_206;
  assign read_burst_rdata_206 = ram_c_0_rdata;
  reg _myaxi_cond_2_1;
  wire [32-1:0] mask_addr_shifted_207;
  assign mask_addr_shifted_207 = 0;
  wire [32-1:0] mask_addr_masked_208;
  assign mask_addr_masked_208 = mask_addr_shifted_207 << 2;
  reg [32-1:0] _myaxi_read_data_fsm;
  localparam _myaxi_read_data_fsm_init = 0;
  reg [32-1:0] write_burst_fsm_5;
  localparam write_burst_fsm_5_init = 0;
  reg [10-1:0] write_burst_addr_209;
  reg [10-1:0] write_burst_stride_210;
  reg [33-1:0] write_burst_length_211;
  reg write_burst_done_212;
  assign ram_x_0_wdata = ((write_burst_fsm_5 == 1) && myaxi_rvalid)? myaxi_rdata : 'hx;
  assign ram_x_0_wenable = ((write_burst_fsm_5 == 1) && myaxi_rvalid)? 1'd1 : 0;
  wire [32-1:0] mask_addr_shifted_213;
  assign mask_addr_shifted_213 = 128;
  wire [32-1:0] mask_addr_masked_214;
  assign mask_addr_masked_214 = mask_addr_shifted_213 << 2;
  reg [32-1:0] write_burst_fsm_6;
  localparam write_burst_fsm_6_init = 0;
  reg [10-1:0] write_burst_addr_215;
  reg [10-1:0] write_burst_stride_216;
  reg [33-1:0] write_burst_length_217;
  reg write_burst_done_218;
  assign ram_y_0_wdata = ((write_burst_fsm_6 == 1) && myaxi_rvalid)? myaxi_rdata : 'hx;
  assign ram_y_0_wenable = ((write_burst_fsm_6 == 1) && myaxi_rvalid)? 1'd1 : 0;
  reg signed [32-1:0] _th_comp_size_8;
  reg signed [32-1:0] _th_comp_offset_9;
  reg signed [32-1:0] _th_comp_sum_10;
  reg signed [32-1:0] _th_comp_i_11;
  assign ram_x_0_addr = (th_comp == 41)? _th_comp_i_11 + _th_comp_offset_9 : 
                        ((write_burst_fsm_5 == 1) && myaxi_rvalid)? write_burst_addr_209 : 'hx;
  assign ram_x_0_enable = (th_comp == 41)? 1'd1 : 
                          ((write_burst_fsm_5 == 1) && myaxi_rvalid)? 1'd1 : 0;
  localparam _tmp_219 = 1;
  wire [_tmp_219-1:0] _tmp_220;
  assign _tmp_220 = th_comp == 41;
  reg [_tmp_219-1:0] __tmp_220_1;
  reg signed [32-1:0] read_rdata_221;
  reg signed [32-1:0] _th_comp_a_12;
  assign ram_y_0_addr = (th_comp == 43)? _th_comp_i_11 + _th_comp_offset_9 : 
                        ((write_burst_fsm_6 == 1) && myaxi_rvalid)? write_burst_addr_215 : 'hx;
  assign ram_y_0_enable = (th_comp == 43)? 1'd1 : 
                          ((write_burst_fsm_6 == 1) && myaxi_rvalid)? 1'd1 : 0;
  localparam _tmp_222 = 1;
  wire [_tmp_222-1:0] _tmp_223;
  assign _tmp_223 = th_comp == 43;
  reg [_tmp_222-1:0] __tmp_223_1;
  reg signed [32-1:0] read_rdata_224;
  reg signed [32-1:0] _th_comp_b_13;
  reg signed [32-1:0] _th_comp_c_14;
  assign ram_z_0_wdata = (th_comp == 48)? _th_comp_sum_10 : 'hx;
  assign ram_z_0_wenable = (th_comp == 48)? 1'd1 : 0;
  wire [32-1:0] mask_addr_shifted_225;
  assign mask_addr_shifted_225 = 2048 >> 2;
  wire [32-1:0] mask_addr_masked_226;
  assign mask_addr_masked_226 = mask_addr_shifted_225 << 2;
  reg [32-1:0] read_burst_fsm_7;
  localparam read_burst_fsm_7_init = 0;
  reg [10-1:0] read_burst_addr_227;
  reg [10-1:0] read_burst_stride_228;
  reg [33-1:0] read_burst_length_229;
  reg read_burst_rvalid_230;
  reg read_burst_rlast_231;
  assign ram_z_0_addr = ((read_burst_fsm_7 == 1) && (!read_burst_rvalid_230 || (myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0)))? read_burst_addr_227 : 
                        (th_comp == 48)? _th_comp_offset_9 : 'hx;
  assign ram_z_0_enable = ((read_burst_fsm_7 == 1) && (!read_burst_rvalid_230 || (myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0)))? 1'd1 : 
                          (th_comp == 48)? 1'd1 : 0;
  localparam _tmp_232 = 1;
  wire [_tmp_232-1:0] _tmp_233;
  assign _tmp_233 = (read_burst_fsm_7 == 1) && (!read_burst_rvalid_230 || (myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0));
  reg [_tmp_232-1:0] __tmp_233_1;
  wire [32-1:0] read_burst_rdata_234;
  assign read_burst_rdata_234 = ram_z_0_rdata;
  assign _myaxi_write_req_fifo_deq = ((_myaxi_write_data_fsm == 2) && (!_myaxi_write_req_fifo_empty && (_myaxi_write_size_buf == 0)) && !_myaxi_write_req_fifo_empty)? 1 : 
                                     ((_myaxi_write_data_fsm == 0) && (_myaxi_write_data_idle && !_myaxi_write_req_fifo_empty && (_myaxi_write_op_sel_fifo == 2)) && !_myaxi_write_req_fifo_empty)? 1 : 
                                     ((_myaxi_write_data_fsm == 2) && (!_myaxi_write_req_fifo_empty && (_myaxi_write_size_buf == 0)) && !_myaxi_write_req_fifo_empty)? 1 : 
                                     ((_myaxi_write_data_fsm == 0) && (_myaxi_write_data_idle && !_myaxi_write_req_fifo_empty && (_myaxi_write_op_sel_fifo == 1)) && !_myaxi_write_req_fifo_empty)? 1 : 0;
  reg _myaxi_cond_3_1;
  wire [32-1:0] mask_addr_shifted_235;
  assign mask_addr_shifted_235 = 2048 >> 2;
  wire [32-1:0] mask_addr_masked_236;
  assign mask_addr_masked_236 = mask_addr_shifted_235 << 2;
  assign _myaxi_read_req_fifo_deq = ((_myaxi_read_data_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 7)) && !_myaxi_read_req_fifo_empty)? 1 : 
                                    ((_myaxi_read_data_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 6)) && !_myaxi_read_req_fifo_empty)? 1 : 
                                    ((_myaxi_read_data_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 5)) && !_myaxi_read_req_fifo_empty)? 1 : 
                                    ((_myaxi_read_data_narrow_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 4)) && !_myaxi_read_req_fifo_empty)? 1 : 
                                    ((_myaxi_read_data_narrow_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 3)) && !_myaxi_read_req_fifo_empty)? 1 : 
                                    ((_myaxi_read_data_narrow_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 2)) && !_myaxi_read_req_fifo_empty)? 1 : 
                                    ((_myaxi_read_data_narrow_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 1)) && !_myaxi_read_req_fifo_empty)? 1 : 0;
  reg [32-1:0] write_burst_fsm_8;
  localparam write_burst_fsm_8_init = 0;
  reg [10-1:0] write_burst_addr_237;
  reg [10-1:0] write_burst_stride_238;
  reg [33-1:0] write_burst_length_239;
  reg write_burst_done_240;
  assign ram_c_0_wdata = ((write_burst_fsm_8 == 1) && myaxi_rvalid)? myaxi_rdata : 
                         (_mystream_stream_oready && _mystream_sum_sink_wenable && (_mystream_sum_sink_sel == 9))? _mystream_sum_sink_wdata : 'hx;
  assign ram_c_0_wenable = ((write_burst_fsm_8 == 1) && myaxi_rvalid)? 1'd1 : 
                           (_mystream_stream_oready && _mystream_sum_sink_wenable && (_mystream_sum_sink_sel == 9))? 1'd1 : 0;
  assign myaxi_rready = (_myaxi_read_data_narrow_fsm == 2) || (_myaxi_read_data_narrow_fsm == 2) || (_myaxi_read_data_narrow_fsm == 2) || (_myaxi_read_data_narrow_fsm == 2) || (_myaxi_read_data_fsm == 2) || (_myaxi_read_data_fsm == 2) || (_myaxi_read_data_fsm == 2);
  reg signed [32-1:0] _th_comp_size_15;
  reg signed [32-1:0] _th_comp_offset_stream_16;
  reg signed [32-1:0] _th_comp_offset_seq_17;
  reg signed [32-1:0] _th_comp_all_ok_18;
  reg signed [32-1:0] _th_comp_i_19;
  localparam _tmp_241 = 1;
  wire [_tmp_241-1:0] _tmp_242;
  assign _tmp_242 = th_comp == 57;
  reg [_tmp_241-1:0] __tmp_242_1;
  reg signed [32-1:0] read_rdata_243;
  reg signed [32-1:0] _th_comp_st_20;
  assign ram_c_0_addr = (th_comp == 59)? _th_comp_i_19 + _th_comp_offset_seq_17 : 
                        (th_comp == 57)? _th_comp_i_19 + _th_comp_offset_stream_16 : 
                        ((write_burst_fsm_8 == 1) && myaxi_rvalid)? write_burst_addr_237 : 
                        ((read_burst_fsm_4 == 1) && (!read_burst_rvalid_202 || (myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0)))? read_burst_addr_199 : 
                        (_mystream_stream_oready && _mystream_sum_sink_wenable && (_mystream_sum_sink_sel == 9))? _mystream_sum_sink_waddr : 'hx;
  assign ram_c_0_enable = (th_comp == 59)? 1'd1 : 
                          (th_comp == 57)? 1'd1 : 
                          ((write_burst_fsm_8 == 1) && myaxi_rvalid)? 1'd1 : 
                          ((read_burst_fsm_4 == 1) && (!read_burst_rvalid_202 || (myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0)))? 1'd1 : 
                          (_mystream_stream_oready && _mystream_sum_sink_wenable && (_mystream_sum_sink_sel == 9))? 1'd1 : 0;
  localparam _tmp_244 = 1;
  wire [_tmp_244-1:0] _tmp_245;
  assign _tmp_245 = th_comp == 59;
  reg [_tmp_244-1:0] __tmp_245_1;
  reg signed [32-1:0] read_rdata_246;
  reg signed [32-1:0] _th_comp_sq_21;

  always @(posedge CLK) begin
    if(RST) begin
      outstanding_wcount_0 <= 0;
      _myaxi_read_start <= 0;
      _myaxi_write_start <= 0;
      _myaxi_read_op_sel <= 0;
      _myaxi_read_global_addr <= 0;
      _myaxi_read_global_size <= 0;
      _myaxi_read_local_addr <= 0;
      _myaxi_read_local_stride <= 0;
      _myaxi_read_local_size <= 0;
      _myaxi_read_local_blocksize <= 0;
      _myaxi_read_req_idle <= 1;
      _myaxi_read_cur_global_size <= 0;
      myaxi_araddr <= 0;
      myaxi_arlen <= 0;
      myaxi_arvalid <= 0;
      _myaxi_cond_0_1 <= 0;
      _myaxi_read_data_idle <= 1;
      _myaxi_read_op_sel_buf <= 0;
      _myaxi_read_local_addr_buf <= 0;
      _myaxi_read_local_stride_buf <= 0;
      _myaxi_read_local_size_buf <= 0;
      _myaxi_read_local_blocksize_buf <= 0;
      _myaxi_write_op_sel <= 0;
      _myaxi_write_global_addr <= 0;
      _myaxi_write_global_size <= 0;
      _myaxi_write_local_addr <= 0;
      _myaxi_write_local_stride <= 0;
      _myaxi_write_local_size <= 0;
      _myaxi_write_local_blocksize <= 0;
      _myaxi_write_req_idle <= 1;
      _myaxi_write_cur_global_size <= 0;
      myaxi_awaddr <= 0;
      myaxi_awlen <= 0;
      myaxi_awvalid <= 0;
      _myaxi_cond_1_1 <= 0;
      _myaxi_write_data_idle <= 1;
      _myaxi_write_op_sel_buf <= 0;
      _myaxi_write_local_addr_buf <= 0;
      _myaxi_write_local_stride_buf <= 0;
      _myaxi_write_size_buf <= 0;
      _myaxi_write_local_blocksize_buf <= 0;
      myaxi_wdata <= 0;
      myaxi_wvalid <= 0;
      myaxi_wlast <= 0;
      myaxi_wstrb <= 0;
      _myaxi_cond_2_1 <= 0;
      _myaxi_cond_3_1 <= 0;
    end else begin
      if(_myaxi_cond_0_1) begin
        myaxi_arvalid <= 0;
      end 
      if(_myaxi_cond_1_1) begin
        myaxi_awvalid <= 0;
      end 
      if(_myaxi_cond_2_1) begin
        myaxi_wvalid <= 0;
        myaxi_wlast <= 0;
      end 
      if(_myaxi_cond_3_1) begin
        myaxi_wvalid <= 0;
        myaxi_wlast <= 0;
      end 
      if(myaxi_awvalid && myaxi_awready && !(myaxi_bvalid && myaxi_bready) && (outstanding_wcount_0 < 7)) begin
        outstanding_wcount_0 <= outstanding_wcount_0 + 1;
      end 
      if(!(myaxi_awvalid && myaxi_awready) && (myaxi_bvalid && myaxi_bready) && (outstanding_wcount_0 > 0)) begin
        outstanding_wcount_0 <= outstanding_wcount_0 - 1;
      end 
      _myaxi_read_start <= 0;
      _myaxi_write_start <= 0;
      if((th_comp == 2) && _myaxi_read_req_idle) begin
        _myaxi_read_start <= 1;
        _myaxi_read_op_sel <= 1;
        _myaxi_read_global_addr <= mask_addr_masked_15;
        _myaxi_read_global_size <= _dma_read_packed_local_packed_size_13 << 1;
        _myaxi_read_local_addr <= _th_comp_offset_1;
        _myaxi_read_local_stride <= 2;
        _myaxi_read_local_size <= _dma_read_packed_local_packed_size_13;
        _myaxi_read_local_blocksize <= 1;
      end 
      if((_myaxi_read_req_fsm == 0) && _myaxi_read_start) begin
        _myaxi_read_req_idle <= 0;
      end 
      if(_myaxi_read_start && _myaxi_read_req_fifo_almost_full) begin
        _myaxi_read_start <= 1;
      end 
      if((_myaxi_read_req_fsm == 0) && (_myaxi_read_start || _myaxi_read_cont) && !_myaxi_read_req_fifo_almost_full && (_myaxi_read_global_size <= 256) && ((mask_addr_masked_25 & 4095) + (_myaxi_read_global_size << 2) >= 4096)) begin
        _myaxi_read_cur_global_size <= 4096 - (mask_addr_masked_27 & 4095) >> 2;
        _myaxi_read_global_size <= _myaxi_read_global_size - (4096 - (mask_addr_masked_29 & 4095) >> 2);
      end else if((_myaxi_read_req_fsm == 0) && (_myaxi_read_start || _myaxi_read_cont) && !_myaxi_read_req_fifo_almost_full && (_myaxi_read_global_size <= 256)) begin
        _myaxi_read_cur_global_size <= _myaxi_read_global_size;
        _myaxi_read_global_size <= 0;
      end else if((_myaxi_read_req_fsm == 0) && (_myaxi_read_start || _myaxi_read_cont) && !_myaxi_read_req_fifo_almost_full && ((mask_addr_masked_31 & 4095) + 1024 >= 4096)) begin
        _myaxi_read_cur_global_size <= 4096 - (mask_addr_masked_33 & 4095) >> 2;
        _myaxi_read_global_size <= _myaxi_read_global_size - (4096 - (mask_addr_masked_35 & 4095) >> 2);
      end else if((_myaxi_read_req_fsm == 0) && (_myaxi_read_start || _myaxi_read_cont) && !_myaxi_read_req_fifo_almost_full) begin
        _myaxi_read_cur_global_size <= 256;
        _myaxi_read_global_size <= _myaxi_read_global_size - 256;
      end 
      if((_myaxi_read_req_fsm == 1) && (myaxi_arready || !myaxi_arvalid)) begin
        myaxi_araddr <= _myaxi_read_global_addr;
        myaxi_arlen <= _myaxi_read_cur_global_size - 1;
        myaxi_arvalid <= 1;
      end 
      _myaxi_cond_0_1 <= 1;
      if(myaxi_arvalid && !myaxi_arready) begin
        myaxi_arvalid <= myaxi_arvalid;
      end 
      if((_myaxi_read_req_fsm == 1) && (myaxi_arready || !myaxi_arvalid)) begin
        _myaxi_read_global_addr <= _myaxi_read_global_addr + (_myaxi_read_cur_global_size << 2);
      end 
      if((_myaxi_read_req_fsm == 1) && (myaxi_arready || !myaxi_arvalid) && (_myaxi_read_global_size == 0)) begin
        _myaxi_read_req_idle <= 1;
      end 
      if((_myaxi_read_data_narrow_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 1))) begin
        _myaxi_read_data_idle <= 0;
        _myaxi_read_op_sel_buf <= _myaxi_read_op_sel_fifo;
        _myaxi_read_local_addr_buf <= _myaxi_read_local_addr_fifo;
        _myaxi_read_local_stride_buf <= _myaxi_read_local_stride_fifo;
        _myaxi_read_local_size_buf <= _myaxi_read_local_size_fifo;
        _myaxi_read_local_blocksize_buf <= _myaxi_read_local_blocksize_fifo;
      end 
      if((_myaxi_read_data_narrow_fsm == 2) && (_myaxi_read_op_sel_buf == 1) && myaxi_rvalid && (_myaxi_read_narrow_count_38 == 1)) begin
        _myaxi_read_local_size_buf <= _myaxi_read_local_size_buf - 1;
      end 
      if((_myaxi_read_data_narrow_fsm == 2) && (_myaxi_read_op_sel_buf == 1) && myaxi_rvalid && (_myaxi_read_local_size_buf <= 1) && (_myaxi_read_narrow_count_38 == 1)) begin
        _myaxi_read_data_idle <= 1;
      end 
      if((th_comp == 4) && _myaxi_read_req_idle) begin
        _myaxi_read_start <= 1;
        _myaxi_read_op_sel <= 2;
        _myaxi_read_global_addr <= mask_addr_masked_51;
        _myaxi_read_global_size <= _dma_read_packed_local_packed_size_49 << 1;
        _myaxi_read_local_addr <= _th_comp_offset_1;
        _myaxi_read_local_stride <= 2;
        _myaxi_read_local_size <= _dma_read_packed_local_packed_size_49;
        _myaxi_read_local_blocksize <= 1;
      end 
      if((_myaxi_read_data_narrow_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 2))) begin
        _myaxi_read_data_idle <= 0;
        _myaxi_read_op_sel_buf <= _myaxi_read_op_sel_fifo;
        _myaxi_read_local_addr_buf <= _myaxi_read_local_addr_fifo;
        _myaxi_read_local_stride_buf <= _myaxi_read_local_stride_fifo;
        _myaxi_read_local_size_buf <= _myaxi_read_local_size_fifo;
        _myaxi_read_local_blocksize_buf <= _myaxi_read_local_blocksize_fifo;
      end 
      if((_myaxi_read_data_narrow_fsm == 2) && (_myaxi_read_op_sel_buf == 2) && myaxi_rvalid && (_myaxi_read_narrow_count_54 == 1)) begin
        _myaxi_read_local_size_buf <= _myaxi_read_local_size_buf - 1;
      end 
      if((_myaxi_read_data_narrow_fsm == 2) && (_myaxi_read_op_sel_buf == 2) && myaxi_rvalid && (_myaxi_read_local_size_buf <= 1) && (_myaxi_read_narrow_count_54 == 1)) begin
        _myaxi_read_data_idle <= 1;
      end 
      if((th_comp == 6) && _myaxi_read_req_idle) begin
        _myaxi_read_start <= 1;
        _myaxi_read_op_sel <= 3;
        _myaxi_read_global_addr <= mask_addr_masked_67;
        _myaxi_read_global_size <= _dma_read_packed_local_packed_size_65 << 1;
        _myaxi_read_local_addr <= _th_comp_offset_1;
        _myaxi_read_local_stride <= 2;
        _myaxi_read_local_size <= _dma_read_packed_local_packed_size_65;
        _myaxi_read_local_blocksize <= 1;
      end 
      if((_myaxi_read_data_narrow_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 3))) begin
        _myaxi_read_data_idle <= 0;
        _myaxi_read_op_sel_buf <= _myaxi_read_op_sel_fifo;
        _myaxi_read_local_addr_buf <= _myaxi_read_local_addr_fifo;
        _myaxi_read_local_stride_buf <= _myaxi_read_local_stride_fifo;
        _myaxi_read_local_size_buf <= _myaxi_read_local_size_fifo;
        _myaxi_read_local_blocksize_buf <= _myaxi_read_local_blocksize_fifo;
      end 
      if((_myaxi_read_data_narrow_fsm == 2) && (_myaxi_read_op_sel_buf == 3) && myaxi_rvalid && (_myaxi_read_narrow_count_70 == 1)) begin
        _myaxi_read_local_size_buf <= _myaxi_read_local_size_buf - 1;
      end 
      if((_myaxi_read_data_narrow_fsm == 2) && (_myaxi_read_op_sel_buf == 3) && myaxi_rvalid && (_myaxi_read_local_size_buf <= 1) && (_myaxi_read_narrow_count_70 == 1)) begin
        _myaxi_read_data_idle <= 1;
      end 
      if((th_comp == 8) && _myaxi_read_req_idle) begin
        _myaxi_read_start <= 1;
        _myaxi_read_op_sel <= 4;
        _myaxi_read_global_addr <= mask_addr_masked_83;
        _myaxi_read_global_size <= _dma_read_packed_local_packed_size_81 << 1;
        _myaxi_read_local_addr <= _th_comp_offset_1;
        _myaxi_read_local_stride <= 2;
        _myaxi_read_local_size <= _dma_read_packed_local_packed_size_81;
        _myaxi_read_local_blocksize <= 1;
      end 
      if((_myaxi_read_data_narrow_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 4))) begin
        _myaxi_read_data_idle <= 0;
        _myaxi_read_op_sel_buf <= _myaxi_read_op_sel_fifo;
        _myaxi_read_local_addr_buf <= _myaxi_read_local_addr_fifo;
        _myaxi_read_local_stride_buf <= _myaxi_read_local_stride_fifo;
        _myaxi_read_local_size_buf <= _myaxi_read_local_size_fifo;
        _myaxi_read_local_blocksize_buf <= _myaxi_read_local_blocksize_fifo;
      end 
      if((_myaxi_read_data_narrow_fsm == 2) && (_myaxi_read_op_sel_buf == 4) && myaxi_rvalid && (_myaxi_read_narrow_count_86 == 1)) begin
        _myaxi_read_local_size_buf <= _myaxi_read_local_size_buf - 1;
      end 
      if((_myaxi_read_data_narrow_fsm == 2) && (_myaxi_read_op_sel_buf == 4) && myaxi_rvalid && (_myaxi_read_local_size_buf <= 1) && (_myaxi_read_narrow_count_86 == 1)) begin
        _myaxi_read_data_idle <= 1;
      end 
      if((th_comp == 30) && _myaxi_write_req_idle) begin
        _myaxi_write_start <= 1;
        _myaxi_write_op_sel <= 1;
        _myaxi_write_global_addr <= mask_addr_masked_170;
        _myaxi_write_global_size <= 1;
        _myaxi_write_local_addr <= _th_comp_offset_1;
        _myaxi_write_local_stride <= 1;
        _myaxi_write_local_size <= 1;
        _myaxi_write_local_blocksize <= 1;
      end 
      if((_myaxi_write_req_fsm == 0) && _myaxi_write_start) begin
        _myaxi_write_req_idle <= 0;
      end 
      if(_myaxi_write_start && _myaxi_write_req_fifo_almost_full) begin
        _myaxi_write_start <= 1;
      end 
      if((_myaxi_write_req_fsm == 0) && (_myaxi_write_start || _myaxi_write_cont) && !_myaxi_write_req_fifo_almost_full && (_myaxi_write_global_size <= 256) && ((mask_addr_masked_180 & 4095) + (_myaxi_write_global_size << 2) >= 4096)) begin
        _myaxi_write_cur_global_size <= 4096 - (mask_addr_masked_182 & 4095) >> 2;
        _myaxi_write_global_size <= _myaxi_write_global_size - (4096 - (mask_addr_masked_184 & 4095) >> 2);
      end else if((_myaxi_write_req_fsm == 0) && (_myaxi_write_start || _myaxi_write_cont) && !_myaxi_write_req_fifo_almost_full && (_myaxi_write_global_size <= 256)) begin
        _myaxi_write_cur_global_size <= _myaxi_write_global_size;
        _myaxi_write_global_size <= 0;
      end else if((_myaxi_write_req_fsm == 0) && (_myaxi_write_start || _myaxi_write_cont) && !_myaxi_write_req_fifo_almost_full && ((mask_addr_masked_186 & 4095) + 1024 >= 4096)) begin
        _myaxi_write_cur_global_size <= 4096 - (mask_addr_masked_188 & 4095) >> 2;
        _myaxi_write_global_size <= _myaxi_write_global_size - (4096 - (mask_addr_masked_190 & 4095) >> 2);
      end else if((_myaxi_write_req_fsm == 0) && (_myaxi_write_start || _myaxi_write_cont) && !_myaxi_write_req_fifo_almost_full) begin
        _myaxi_write_cur_global_size <= 256;
        _myaxi_write_global_size <= _myaxi_write_global_size - 256;
      end 
      if((_myaxi_write_req_fsm == 1) && !_myaxi_write_req_fifo_almost_full && (outstanding_wcount_0 < 6) && ((outstanding_wcount_0 < 6) && (myaxi_awready || !myaxi_awvalid))) begin
        myaxi_awaddr <= _myaxi_write_global_addr;
        myaxi_awlen <= _myaxi_write_cur_global_size - 1;
        myaxi_awvalid <= 1;
      end 
      if((_myaxi_write_req_fsm == 1) && !_myaxi_write_req_fifo_almost_full && (outstanding_wcount_0 < 6) && ((outstanding_wcount_0 < 6) && (myaxi_awready || !myaxi_awvalid)) && (_myaxi_write_cur_global_size == 0)) begin
        myaxi_awvalid <= 0;
      end 
      _myaxi_cond_1_1 <= 1;
      if(myaxi_awvalid && !myaxi_awready) begin
        myaxi_awvalid <= myaxi_awvalid;
      end 
      if((_myaxi_write_req_fsm == 1) && ((_myaxi_write_req_fsm == 1) && !_myaxi_write_req_fifo_almost_full && (myaxi_awready || !myaxi_awvalid) && (outstanding_wcount_0 < 6))) begin
        _myaxi_write_global_addr <= _myaxi_write_global_addr + (_myaxi_write_cur_global_size << 2);
      end 
      if((_myaxi_write_req_fsm == 1) && ((_myaxi_write_req_fsm == 1) && !_myaxi_write_req_fifo_almost_full && (myaxi_awready || !myaxi_awvalid) && (outstanding_wcount_0 < 6)) && (_myaxi_write_global_size == 0)) begin
        _myaxi_write_req_idle <= 1;
      end 
      if((_myaxi_write_data_fsm == 0) && (_myaxi_write_data_idle && !_myaxi_write_req_fifo_empty && (_myaxi_write_op_sel_fifo == 1))) begin
        _myaxi_write_data_idle <= 0;
        _myaxi_write_op_sel_buf <= _myaxi_write_op_sel_fifo;
        _myaxi_write_local_addr_buf <= _myaxi_write_local_addr_fifo;
        _myaxi_write_local_stride_buf <= _myaxi_write_local_stride_fifo;
        _myaxi_write_size_buf <= _myaxi_write_size_fifo;
        _myaxi_write_local_blocksize_buf <= _myaxi_write_local_blocksize_fifo;
      end 
      if(_myaxi_write_data_fsm == 1) begin
        _myaxi_write_size_buf <= 0;
      end 
      if((_myaxi_write_data_fsm == 2) && (!_myaxi_write_req_fifo_empty && (_myaxi_write_size_buf == 0))) begin
        _myaxi_write_size_buf <= _myaxi_write_size_fifo;
      end 
      if((_myaxi_write_op_sel_buf == 1) && read_burst_rvalid_202 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0)) && (myaxi_wready || !myaxi_wvalid)) begin
        myaxi_wdata <= read_burst_rdata_206;
        myaxi_wvalid <= 1;
        myaxi_wlast <= read_burst_rlast_203 || (_myaxi_write_size_buf == 1);
        myaxi_wstrb <= { 4{ 1'd1 } };
      end 
      _myaxi_cond_2_1 <= 1;
      if(myaxi_wvalid && !myaxi_wready) begin
        myaxi_wvalid <= myaxi_wvalid;
        myaxi_wlast <= myaxi_wlast;
      end 
      if((_myaxi_write_data_fsm == 2) && read_burst_rvalid_202 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0))) begin
        _myaxi_write_size_buf <= _myaxi_write_size_buf - 1;
      end 
      if((_myaxi_write_data_fsm == 2) && ((_myaxi_write_op_sel_buf == 1) && read_burst_rvalid_202 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0))) && read_burst_rlast_203) begin
        _myaxi_write_data_idle <= 1;
      end 
      if((th_comp == 33) && _myaxi_read_req_idle) begin
        _myaxi_read_start <= 1;
        _myaxi_read_op_sel <= 5;
        _myaxi_read_global_addr <= mask_addr_masked_208;
        _myaxi_read_global_size <= _th_comp_size_0;
        _myaxi_read_local_addr <= _th_comp_offset_1;
        _myaxi_read_local_stride <= 1;
        _myaxi_read_local_size <= _th_comp_size_0;
        _myaxi_read_local_blocksize <= 1;
      end 
      if((_myaxi_read_data_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 5))) begin
        _myaxi_read_data_idle <= 0;
        _myaxi_read_op_sel_buf <= _myaxi_read_op_sel_fifo;
        _myaxi_read_local_addr_buf <= _myaxi_read_local_addr_fifo;
        _myaxi_read_local_stride_buf <= _myaxi_read_local_stride_fifo;
        _myaxi_read_local_size_buf <= _myaxi_read_local_size_fifo;
        _myaxi_read_local_blocksize_buf <= _myaxi_read_local_blocksize_fifo;
      end 
      if((_myaxi_read_data_fsm == 2) && myaxi_rvalid) begin
        _myaxi_read_local_size_buf <= _myaxi_read_local_size_buf - 1;
      end 
      if((_myaxi_read_data_fsm == 2) && myaxi_rvalid && (_myaxi_read_local_size_buf <= 1)) begin
        _myaxi_read_data_idle <= 1;
      end 
      if((th_comp == 35) && _myaxi_read_req_idle) begin
        _myaxi_read_start <= 1;
        _myaxi_read_op_sel <= 6;
        _myaxi_read_global_addr <= mask_addr_masked_214;
        _myaxi_read_global_size <= _th_comp_size_0;
        _myaxi_read_local_addr <= _th_comp_offset_1;
        _myaxi_read_local_stride <= 1;
        _myaxi_read_local_size <= _th_comp_size_0;
        _myaxi_read_local_blocksize <= 1;
      end 
      if((_myaxi_read_data_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 6))) begin
        _myaxi_read_data_idle <= 0;
        _myaxi_read_op_sel_buf <= _myaxi_read_op_sel_fifo;
        _myaxi_read_local_addr_buf <= _myaxi_read_local_addr_fifo;
        _myaxi_read_local_stride_buf <= _myaxi_read_local_stride_fifo;
        _myaxi_read_local_size_buf <= _myaxi_read_local_size_fifo;
        _myaxi_read_local_blocksize_buf <= _myaxi_read_local_blocksize_fifo;
      end 
      if((_myaxi_read_data_fsm == 2) && myaxi_rvalid) begin
        _myaxi_read_local_size_buf <= _myaxi_read_local_size_buf - 1;
      end 
      if((_myaxi_read_data_fsm == 2) && myaxi_rvalid && (_myaxi_read_local_size_buf <= 1)) begin
        _myaxi_read_data_idle <= 1;
      end 
      if((th_comp == 49) && _myaxi_write_req_idle) begin
        _myaxi_write_start <= 1;
        _myaxi_write_op_sel <= 2;
        _myaxi_write_global_addr <= mask_addr_masked_226;
        _myaxi_write_global_size <= 1;
        _myaxi_write_local_addr <= _th_comp_offset_1;
        _myaxi_write_local_stride <= 1;
        _myaxi_write_local_size <= 1;
        _myaxi_write_local_blocksize <= 1;
      end 
      if((_myaxi_write_data_fsm == 0) && (_myaxi_write_data_idle && !_myaxi_write_req_fifo_empty && (_myaxi_write_op_sel_fifo == 2))) begin
        _myaxi_write_data_idle <= 0;
        _myaxi_write_op_sel_buf <= _myaxi_write_op_sel_fifo;
        _myaxi_write_local_addr_buf <= _myaxi_write_local_addr_fifo;
        _myaxi_write_local_stride_buf <= _myaxi_write_local_stride_fifo;
        _myaxi_write_size_buf <= _myaxi_write_size_fifo;
        _myaxi_write_local_blocksize_buf <= _myaxi_write_local_blocksize_fifo;
      end 
      if(_myaxi_write_data_fsm == 1) begin
        _myaxi_write_size_buf <= 0;
      end 
      if((_myaxi_write_data_fsm == 2) && (!_myaxi_write_req_fifo_empty && (_myaxi_write_size_buf == 0))) begin
        _myaxi_write_size_buf <= _myaxi_write_size_fifo;
      end 
      if((_myaxi_write_op_sel_buf == 2) && read_burst_rvalid_230 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0)) && (myaxi_wready || !myaxi_wvalid)) begin
        myaxi_wdata <= read_burst_rdata_234;
        myaxi_wvalid <= 1;
        myaxi_wlast <= read_burst_rlast_231 || (_myaxi_write_size_buf == 1);
        myaxi_wstrb <= { 4{ 1'd1 } };
      end 
      _myaxi_cond_3_1 <= 1;
      if(myaxi_wvalid && !myaxi_wready) begin
        myaxi_wvalid <= myaxi_wvalid;
        myaxi_wlast <= myaxi_wlast;
      end 
      if((_myaxi_write_data_fsm == 2) && read_burst_rvalid_230 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0))) begin
        _myaxi_write_size_buf <= _myaxi_write_size_buf - 1;
      end 
      if((_myaxi_write_data_fsm == 2) && ((_myaxi_write_op_sel_buf == 2) && read_burst_rvalid_230 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0))) && read_burst_rlast_231) begin
        _myaxi_write_data_idle <= 1;
      end 
      if((th_comp == 51) && _myaxi_read_req_idle) begin
        _myaxi_read_start <= 1;
        _myaxi_read_op_sel <= 7;
        _myaxi_read_global_addr <= mask_addr_masked_236;
        _myaxi_read_global_size <= 1;
        _myaxi_read_local_addr <= _th_comp_offset_1;
        _myaxi_read_local_stride <= 1;
        _myaxi_read_local_size <= 1;
        _myaxi_read_local_blocksize <= 1;
      end 
      if((_myaxi_read_data_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 7))) begin
        _myaxi_read_data_idle <= 0;
        _myaxi_read_op_sel_buf <= _myaxi_read_op_sel_fifo;
        _myaxi_read_local_addr_buf <= _myaxi_read_local_addr_fifo;
        _myaxi_read_local_stride_buf <= _myaxi_read_local_stride_fifo;
        _myaxi_read_local_size_buf <= _myaxi_read_local_size_fifo;
        _myaxi_read_local_blocksize_buf <= _myaxi_read_local_blocksize_fifo;
      end 
      if((_myaxi_read_data_fsm == 2) && myaxi_rvalid) begin
        _myaxi_read_local_size_buf <= _myaxi_read_local_size_buf - 1;
      end 
      if((_myaxi_read_data_fsm == 2) && myaxi_rvalid && (_myaxi_read_local_size_buf <= 1)) begin
        _myaxi_read_data_idle <= 1;
      end 
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      count__myaxi_read_req_fifo <= 0;
      __tmp_23_1 <= 0;
    end else begin
      if(_myaxi_read_req_fifo_enq && !_myaxi_read_req_fifo_full && (_myaxi_read_req_fifo_deq && !_myaxi_read_req_fifo_empty)) begin
        count__myaxi_read_req_fifo <= count__myaxi_read_req_fifo;
      end else if(_myaxi_read_req_fifo_enq && !_myaxi_read_req_fifo_full) begin
        count__myaxi_read_req_fifo <= count__myaxi_read_req_fifo + 1;
      end else if(_myaxi_read_req_fifo_deq && !_myaxi_read_req_fifo_empty) begin
        count__myaxi_read_req_fifo <= count__myaxi_read_req_fifo - 1;
      end 
      __tmp_23_1 <= _tmp_23;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      count__myaxi_write_req_fifo <= 0;
      __tmp_178_1 <= 0;
      __tmp_198_1 <= 0;
    end else begin
      if(_myaxi_write_req_fifo_enq && !_myaxi_write_req_fifo_full && (_myaxi_write_req_fifo_deq && !_myaxi_write_req_fifo_empty)) begin
        count__myaxi_write_req_fifo <= count__myaxi_write_req_fifo;
      end else if(_myaxi_write_req_fifo_enq && !_myaxi_write_req_fifo_full) begin
        count__myaxi_write_req_fifo <= count__myaxi_write_req_fifo + 1;
      end else if(_myaxi_write_req_fifo_deq && !_myaxi_write_req_fifo_empty) begin
        count__myaxi_write_req_fifo <= count__myaxi_write_req_fifo - 1;
      end 
      __tmp_178_1 <= _tmp_178;
      __tmp_198_1 <= _tmp_198;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_98_1 <= 0;
    end else begin
      __tmp_98_1 <= _tmp_98;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_101_1 <= 0;
    end else begin
      __tmp_101_1 <= _tmp_101;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_104_1 <= 0;
    end else begin
      __tmp_104_1 <= _tmp_104;
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
      __tmp_119_1 <= 0;
    end else begin
      __tmp_119_1 <= _tmp_119;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_205_1 <= 0;
      __tmp_242_1 <= 0;
      __tmp_245_1 <= 0;
    end else begin
      __tmp_205_1 <= _tmp_205;
      __tmp_242_1 <= _tmp_242;
      __tmp_245_1 <= _tmp_245;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_220_1 <= 0;
    end else begin
      __tmp_220_1 <= _tmp_220;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_223_1 <= 0;
    end else begin
      __tmp_223_1 <= _tmp_223;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_233_1 <= 0;
    end else begin
      __tmp_233_1 <= _tmp_233;
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
      _mystream_b00_source_ram_renable <= 0;
      _mystream_b00_source_fifo_deq <= 0;
      _mystream_b00_idle <= 1;
      _mystream_b01_source_ram_renable <= 0;
      _mystream_b01_source_fifo_deq <= 0;
      _mystream_b01_idle <= 1;
      _mystream_a10_source_ram_renable <= 0;
      _mystream_a10_source_fifo_deq <= 0;
      _mystream_a10_idle <= 1;
      _mystream_a11_source_ram_renable <= 0;
      _mystream_a11_source_fifo_deq <= 0;
      _mystream_a11_idle <= 1;
      _mystream_b10_source_ram_renable <= 0;
      _mystream_b10_source_fifo_deq <= 0;
      _mystream_b10_idle <= 1;
      _mystream_b11_source_ram_renable <= 0;
      _mystream_b11_source_fifo_deq <= 0;
      _mystream_b11_idle <= 1;
      _mystream_sum_sink_wenable <= 0;
      _mystream_sum_sink_fifo_enq <= 0;
      _mystream_sum_valid2_sink_wenable <= 0;
      _mystream_sum_valid2_sink_fifo_enq <= 0;
      __mystream_stream_ivalid_1 <= 0;
      __mystream_stream_ivalid_2 <= 0;
      __mystream_stream_ivalid_3 <= 0;
      __mystream_stream_ivalid_4 <= 0;
      _plus_data_5 <= 0;
      _plus_data_6 <= 0;
      _plus_data_17 <= 0;
      _plus_data_18 <= 0;
      __delay_data_25__variable_0 <= 0;
      __delay_data_27__variable_8 <= 0;
      __plusn_data_7 <= 0;
      __plusn_data_19 <= 0;
      __delay_data_26__delay_25__variable_0 <= 0;
      __delay_data_28__delay_27__variable_8 <= 0;
      _reduceadd_data_9 <= 1'sd0;
      _reduceadd_count_9 <= 0;
      _reduceadd_prev_count_max_9 <= 0;
      _reduceadd_data_20 <= 1'sd0;
      _reduceadd_count_20 <= 0;
      _reduceadd_prev_count_max_20 <= 0;
      _pulse_data_22 <= 1'sd0;
      _pulse_count_22 <= 0;
      _pulse_prev_count_max_22 <= 0;
      _plus_data_24 <= 0;
      __delay_data_29_pulse_22 <= 0;
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
      __variable_wdata_13 <= 0;
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
      __variable_wdata_14 <= 0;
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
      __variable_wdata_3 <= 0;
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
      __variable_wdata_4 <= 0;
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
      __variable_wdata_15 <= 0;
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
      __variable_wdata_16 <= 0;
      _mystream_b11_source_ram_raddr <= 0;
      _mystream_b11_source_count <= 0;
      _tmp_121 <= 0;
      _tmp_122 <= 0;
      _tmp_123 <= 0;
      _tmp_124 <= 0;
      _tmp_125 <= 0;
      _tmp_126 <= 0;
      _tmp_127 <= 0;
      _tmp_128 <= 0;
      _tmp_129 <= 0;
      _tmp_130 <= 0;
      _tmp_131 <= 0;
      _tmp_132 <= 0;
      _mystream_sum_sink_mode <= 5'b0;
      _mystream_sum_sink_offset <= 0;
      _mystream_sum_sink_size <= 0;
      _mystream_sum_sink_stride <= 0;
      _mystream_sum_sink_sel <= 0;
      _mystream_sum_sink_offset_buf <= 0;
      _mystream_sum_sink_size_buf <= 0;
      _mystream_sum_sink_stride_buf <= 0;
      _mystream_sum_sink_waddr <= 0;
      _mystream_sum_sink_count <= 0;
      _mystream_sum_sink_wdata <= 0;
      _tmp_134 <= 0;
      _tmp_135 <= 0;
      _tmp_136 <= 0;
      _tmp_137 <= 0;
      _tmp_138 <= 0;
      _tmp_139 <= 0;
      __variable_wdata_8 <= 0;
      _tmp_140 <= 0;
      _tmp_141 <= 0;
      _tmp_142 <= 0;
      _tmp_143 <= 0;
      _tmp_146 <= 0;
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
      _tmp_159 <= 0;
      _tmp_160 <= 0;
      _tmp_161 <= 0;
      _tmp_162 <= 0;
      _tmp_163 <= 0;
      _tmp_164 <= 0;
      _tmp_165 <= 0;
      _tmp_166 <= 0;
      _tmp_167 <= 0;
      _tmp_168 <= 0;
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
        _mystream_sum_sink_wenable <= 0;
        _mystream_sum_sink_fifo_enq <= 0;
      end 
      if(_mystream_stream_oready) begin
        _mystream_sum_valid2_sink_wenable <= 0;
        _mystream_sum_valid2_sink_fifo_enq <= 0;
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
        _plus_data_5 <= mystream_a00_data + mystream_b00_data;
      end 
      if(_mystream_stream_oready) begin
        _plus_data_6 <= mystream_a01_data + mystream_b01_data;
      end 
      if(_mystream_stream_oready) begin
        _plus_data_17 <= mystream_a10_data + mystream_b10_data;
      end 
      if(_mystream_stream_oready) begin
        _plus_data_18 <= mystream_a11_data + mystream_b11_data;
      end 
      if(_mystream_stream_oready) begin
        __delay_data_25__variable_0 <= mystream_size_data;
      end 
      if(_mystream_stream_oready) begin
        __delay_data_27__variable_8 <= mystream__reduce_reset_data;
      end 
      if(_mystream_stream_oready) begin
        __plusn_data_7 <= _plus_data_5 + _plus_data_6;
      end 
      if(_mystream_stream_oready) begin
        __plusn_data_19 <= _plus_data_17 + _plus_data_18;
      end 
      if(_mystream_stream_oready) begin
        __delay_data_26__delay_25__variable_0 <= __delay_data_25__variable_0;
      end 
      if(_mystream_stream_oready) begin
        __delay_data_28__delay_27__variable_8 <= __delay_data_27__variable_8;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready && _reduceadd_reset_cond_9) begin
        _reduceadd_data_9 <= 1'sd0;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready) begin
        _reduceadd_count_9 <= (_reduceadd_current_count_9 >= __delay_data_26__delay_25__variable_0 - 1)? 0 : _reduceadd_current_count_9 + 1;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready) begin
        _reduceadd_prev_count_max_9 <= _reduceadd_current_count_9 >= __delay_data_26__delay_25__variable_0 - 1;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready) begin
        _reduceadd_data_9 <= _reduceadd_current_data_9 + __plusn_data_7;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready && _reduceadd_reset_cond_20) begin
        _reduceadd_data_20 <= 1'sd0;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready) begin
        _reduceadd_count_20 <= (_reduceadd_current_count_20 >= __delay_data_26__delay_25__variable_0 - 1)? 0 : _reduceadd_current_count_20 + 1;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready) begin
        _reduceadd_prev_count_max_20 <= _reduceadd_current_count_20 >= __delay_data_26__delay_25__variable_0 - 1;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready) begin
        _reduceadd_data_20 <= _reduceadd_current_data_20 + __plusn_data_19;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready && _pulse_reset_cond_22) begin
        _pulse_data_22 <= 1'sd0;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready) begin
        _pulse_count_22 <= (_pulse_current_count_22 >= __delay_data_26__delay_25__variable_0 - 1)? 0 : _pulse_current_count_22 + 1;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready) begin
        _pulse_prev_count_max_22 <= _pulse_current_count_22 >= __delay_data_26__delay_25__variable_0 - 1;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready) begin
        _pulse_data_22 <= _pulse_current_count_22 >= __delay_data_26__delay_25__variable_0 - 1;
      end 
      if(_mystream_stream_oready) begin
        _plus_data_24 <= _reduceadd_data_9 + _reduceadd_data_20;
      end 
      if(_mystream_stream_oready) begin
        __delay_data_29_pulse_22 <= _pulse_data_22;
      end 
      if(_set_flag_95) begin
        _mystream_size_next_parameter_data <= _th_comp__size_5;
      end 
      if(_mystream_source_start) begin
        __variable_wdata_0 <= _mystream_size_next_parameter_data;
      end 
      if(_set_flag_96) begin
        _mystream_a00_source_mode <= 5'b1;
        _mystream_a00_source_offset <= _th_comp_offset_3;
        _mystream_a00_source_size <= _th_comp__size_5;
        _mystream_a00_source_stride <= 1;
      end 
      if(_set_flag_96) begin
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
      if(_set_flag_99) begin
        _mystream_a01_source_mode <= 5'b1;
        _mystream_a01_source_offset <= _th_comp_offset_3;
        _mystream_a01_source_size <= _th_comp__size_5;
        _mystream_a01_source_stride <= 1;
      end 
      if(_set_flag_99) begin
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
      if(_set_flag_102) begin
        _mystream_a10_source_mode <= 5'b1;
        _mystream_a10_source_offset <= _th_comp_offset_3;
        _mystream_a10_source_size <= _th_comp__size_5;
        _mystream_a10_source_stride <= 1;
      end 
      if(_set_flag_102) begin
        _mystream_a10_source_sel <= 3;
      end 
      if(_mystream_source_start && _mystream_a10_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_a10_source_offset_buf <= _mystream_a10_source_offset;
        _mystream_a10_source_size_buf <= _mystream_a10_source_size;
        _mystream_a10_source_stride_buf <= _mystream_a10_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_13 <= _mystream_a10_source_ram_rdata;
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
      if(_set_flag_105) begin
        _mystream_a11_source_mode <= 5'b1;
        _mystream_a11_source_offset <= _th_comp_offset_3;
        _mystream_a11_source_size <= _th_comp__size_5;
        _mystream_a11_source_stride <= 1;
      end 
      if(_set_flag_105) begin
        _mystream_a11_source_sel <= 4;
      end 
      if(_mystream_source_start && _mystream_a11_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_a11_source_offset_buf <= _mystream_a11_source_offset;
        _mystream_a11_source_size_buf <= _mystream_a11_source_size;
        _mystream_a11_source_stride_buf <= _mystream_a11_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_14 <= _mystream_a11_source_ram_rdata;
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
      if(_set_flag_108) begin
        _mystream_b00_source_mode <= 5'b1;
        _mystream_b00_source_offset <= _th_comp_offset_3;
        _mystream_b00_source_size <= _th_comp__size_5;
        _mystream_b00_source_stride <= 1;
      end 
      if(_set_flag_108) begin
        _mystream_b00_source_sel <= 5;
      end 
      if(_mystream_source_start && _mystream_b00_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_b00_source_offset_buf <= _mystream_b00_source_offset;
        _mystream_b00_source_size_buf <= _mystream_b00_source_size;
        _mystream_b00_source_stride_buf <= _mystream_b00_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_3 <= _mystream_b00_source_ram_rdata;
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
      if(_set_flag_111) begin
        _mystream_b01_source_mode <= 5'b1;
        _mystream_b01_source_offset <= _th_comp_offset_3;
        _mystream_b01_source_size <= _th_comp__size_5;
        _mystream_b01_source_stride <= 1;
      end 
      if(_set_flag_111) begin
        _mystream_b01_source_sel <= 6;
      end 
      if(_mystream_source_start && _mystream_b01_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_b01_source_offset_buf <= _mystream_b01_source_offset;
        _mystream_b01_source_size_buf <= _mystream_b01_source_size;
        _mystream_b01_source_stride_buf <= _mystream_b01_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_4 <= _mystream_b01_source_ram_rdata;
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
      if(_set_flag_114) begin
        _mystream_b10_source_mode <= 5'b1;
        _mystream_b10_source_offset <= _th_comp_offset_3;
        _mystream_b10_source_size <= _th_comp__size_5;
        _mystream_b10_source_stride <= 1;
      end 
      if(_set_flag_114) begin
        _mystream_b10_source_sel <= 7;
      end 
      if(_mystream_source_start && _mystream_b10_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_b10_source_offset_buf <= _mystream_b10_source_offset;
        _mystream_b10_source_size_buf <= _mystream_b10_source_size;
        _mystream_b10_source_stride_buf <= _mystream_b10_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_15 <= _mystream_b10_source_ram_rdata;
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
      if(_set_flag_117) begin
        _mystream_b11_source_mode <= 5'b1;
        _mystream_b11_source_offset <= _th_comp_offset_3;
        _mystream_b11_source_size <= _th_comp__size_5;
        _mystream_b11_source_stride <= 1;
      end 
      if(_set_flag_117) begin
        _mystream_b11_source_sel <= 8;
      end 
      if(_mystream_source_start && _mystream_b11_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_b11_source_offset_buf <= _mystream_b11_source_offset;
        _mystream_b11_source_size_buf <= _mystream_b11_source_size;
        _mystream_b11_source_stride_buf <= _mystream_b11_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_16 <= _mystream_b11_source_ram_rdata;
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
        _tmp_121 <= _set_flag_120;
      end 
      if(_mystream_stream_oready) begin
        _tmp_122 <= _tmp_121;
      end 
      if(_mystream_stream_oready) begin
        _tmp_123 <= _tmp_122;
      end 
      if(_mystream_stream_oready) begin
        _tmp_124 <= _tmp_123;
      end 
      if(_mystream_stream_oready) begin
        _tmp_125 <= _tmp_124;
      end 
      if(_mystream_stream_oready) begin
        _tmp_126 <= _tmp_125;
      end 
      if(_mystream_stream_oready) begin
        _tmp_127 <= _th_comp_offset_3;
      end 
      if(_mystream_stream_oready) begin
        _tmp_128 <= _tmp_127;
      end 
      if(_mystream_stream_oready) begin
        _tmp_129 <= _tmp_128;
      end 
      if(_mystream_stream_oready) begin
        _tmp_130 <= _tmp_129;
      end 
      if(_mystream_stream_oready) begin
        _tmp_131 <= _tmp_130;
      end 
      if(_mystream_stream_oready) begin
        _tmp_132 <= _tmp_131;
      end 
      if(_tmp_126) begin
        _mystream_sum_sink_mode <= 5'b1;
        _mystream_sum_sink_offset <= _tmp_132;
        _mystream_sum_sink_size <= 1;
        _mystream_sum_sink_stride <= 1;
      end 
      if(_tmp_126) begin
        _mystream_sum_sink_sel <= 9;
      end 
      if(_mystream_sink_start && _mystream_sum_sink_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_sum_sink_offset_buf <= _mystream_sum_sink_offset;
        _mystream_sum_sink_size_buf <= _mystream_sum_sink_size;
        _mystream_sum_sink_stride_buf <= _mystream_sum_sink_stride;
      end 
      if((_mystream_sum_sink_fsm_8 == 1) && _mystream_stream_oready) begin
        _mystream_sum_sink_waddr <= _mystream_sum_sink_offset_buf - _mystream_sum_sink_stride_buf;
        _mystream_sum_sink_count <= _mystream_sum_sink_size_buf;
      end 
      if((_mystream_sum_sink_fsm_8 == 2) && mystream_sum_valid2_data && _mystream_stream_oready) begin
        _mystream_sum_sink_waddr <= _mystream_sum_sink_waddr + _mystream_sum_sink_stride_buf;
        _mystream_sum_sink_wdata <= mystream_sum_data;
        _mystream_sum_sink_wenable <= 1;
        _mystream_sum_sink_count <= _mystream_sum_sink_count - 1;
      end 
      if(_mystream_stream_oready) begin
        _tmp_134 <= _mystream_source_start;
      end 
      if(_mystream_stream_oready) begin
        _tmp_135 <= _tmp_134;
      end 
      if(_mystream_stream_oready) begin
        _tmp_136 <= _tmp_135;
      end 
      if(_mystream_stream_oready) begin
        _tmp_137 <= _mystream_source_start;
      end 
      if(_mystream_stream_oready) begin
        _tmp_138 <= _tmp_137;
      end 
      if(_mystream_stream_oready) begin
        _tmp_139 <= _tmp_138;
      end 
      if(_mystream_stream_oready && _tmp_139) begin
        __variable_wdata_8 <= 1;
      end 
      if(_mystream_stream_oready) begin
        _tmp_140 <= _mystream_source_start;
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
      if(_mystream_stream_oready && _tmp_143) begin
        __variable_wdata_8 <= 0;
      end 
      if(_mystream_stream_oready) begin
        _tmp_146 <= _tmp_145;
      end 
      if(_mystream_stream_oready) begin
        _tmp_149 <= _tmp_148;
      end 
      if(_mystream_stream_oready && _tmp_149) begin
        __variable_wdata_8 <= 1;
      end 
      if(_mystream_stream_oready) begin
        _tmp_150 <= _mystream_source_start;
      end 
      if(_mystream_stream_oready) begin
        _tmp_151 <= _tmp_150;
      end 
      if(_mystream_stream_oready) begin
        _tmp_152 <= _tmp_151;
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
        _tmp_156 <= _mystream_source_stop;
      end 
      if(_mystream_stream_oready) begin
        _tmp_157 <= _tmp_156;
      end 
      if(_mystream_stream_oready) begin
        _tmp_158 <= _tmp_157;
      end 
      if(_mystream_stream_oready) begin
        _tmp_159 <= _tmp_158;
      end 
      if(_mystream_stream_oready) begin
        _tmp_160 <= _tmp_159;
      end 
      if(_mystream_stream_oready) begin
        _tmp_161 <= _tmp_160;
      end 
      if(_mystream_stream_oready) begin
        _tmp_162 <= _mystream_source_busy;
      end 
      if(_mystream_stream_oready) begin
        _tmp_163 <= _tmp_162;
      end 
      if(_mystream_stream_oready) begin
        _tmp_164 <= _tmp_163;
      end 
      if(_mystream_stream_oready) begin
        _tmp_165 <= _tmp_164;
      end 
      if(_mystream_stream_oready) begin
        _tmp_166 <= _tmp_165;
      end 
      if(_mystream_stream_oready) begin
        _tmp_167 <= _tmp_166;
      end 
      if(_mystream_stream_oready) begin
        _tmp_168 <= _mystream_sink_busy;
      end 
      if(!_mystream_sink_busy && _tmp_168) begin
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
      if(_mystream_stream_oready && _tmp_136) begin
        _mystream_stream_ivalid <= 1;
      end 
      if(_mystream_stream_oready && _tmp_146) begin
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


  always @(posedge CLK) begin
    if(RST) begin
      counter <= 0;
    end else begin
      counter <= counter + 1;
    end
  end

  localparam th_comp_1 = 1;
  localparam th_comp_2 = 2;
  localparam th_comp_3 = 3;
  localparam th_comp_4 = 4;
  localparam th_comp_5 = 5;
  localparam th_comp_6 = 6;
  localparam th_comp_7 = 7;
  localparam th_comp_8 = 8;
  localparam th_comp_9 = 9;
  localparam th_comp_10 = 10;
  localparam th_comp_11 = 11;
  localparam th_comp_12 = 12;
  localparam th_comp_13 = 13;
  localparam th_comp_14 = 14;
  localparam th_comp_15 = 15;
  localparam th_comp_16 = 16;
  localparam th_comp_17 = 17;
  localparam th_comp_18 = 18;
  localparam th_comp_19 = 19;
  localparam th_comp_20 = 20;
  localparam th_comp_21 = 21;
  localparam th_comp_22 = 22;
  localparam th_comp_23 = 23;
  localparam th_comp_24 = 24;
  localparam th_comp_25 = 25;
  localparam th_comp_26 = 26;
  localparam th_comp_27 = 27;
  localparam th_comp_28 = 28;
  localparam th_comp_29 = 29;
  localparam th_comp_30 = 30;
  localparam th_comp_31 = 31;
  localparam th_comp_32 = 32;
  localparam th_comp_33 = 33;
  localparam th_comp_34 = 34;
  localparam th_comp_35 = 35;
  localparam th_comp_36 = 36;
  localparam th_comp_37 = 37;
  localparam th_comp_38 = 38;
  localparam th_comp_39 = 39;
  localparam th_comp_40 = 40;
  localparam th_comp_41 = 41;
  localparam th_comp_42 = 42;
  localparam th_comp_43 = 43;
  localparam th_comp_44 = 44;
  localparam th_comp_45 = 45;
  localparam th_comp_46 = 46;
  localparam th_comp_47 = 47;
  localparam th_comp_48 = 48;
  localparam th_comp_49 = 49;
  localparam th_comp_50 = 50;
  localparam th_comp_51 = 51;
  localparam th_comp_52 = 52;
  localparam th_comp_53 = 53;
  localparam th_comp_54 = 54;
  localparam th_comp_55 = 55;
  localparam th_comp_56 = 56;
  localparam th_comp_57 = 57;
  localparam th_comp_58 = 58;
  localparam th_comp_59 = 59;
  localparam th_comp_60 = 60;
  localparam th_comp_61 = 61;
  localparam th_comp_62 = 62;
  localparam th_comp_63 = 63;
  localparam th_comp_64 = 64;
  localparam th_comp_65 = 65;
  localparam th_comp_66 = 66;
  localparam th_comp_67 = 67;
  localparam th_comp_68 = 68;
  localparam th_comp_69 = 69;
  localparam th_comp_70 = 70;
  localparam th_comp_71 = 71;

  always @(posedge CLK) begin
    if(RST) begin
      th_comp <= th_comp_init;
      _th_comp_size_0 <= 0;
      _th_comp_offset_1 <= 0;
      _th_comp_size_2 <= 0;
      _th_comp_offset_3 <= 0;
      _th_comp_start_time_4 <= 0;
      _th_comp__size_5 <= 0;
      _th_comp_end_time_6 <= 0;
      _th_comp_exec_time_7 <= 0;
      _th_comp_size_8 <= 0;
      _th_comp_offset_9 <= 0;
      _th_comp_sum_10 <= 0;
      _th_comp_i_11 <= 0;
      read_rdata_221 <= 0;
      _th_comp_a_12 <= 0;
      read_rdata_224 <= 0;
      _th_comp_b_13 <= 0;
      _th_comp_c_14 <= 0;
      _th_comp_size_15 <= 0;
      _th_comp_offset_stream_16 <= 0;
      _th_comp_offset_seq_17 <= 0;
      _th_comp_all_ok_18 <= 0;
      _th_comp_i_19 <= 0;
      read_rdata_243 <= 0;
      _th_comp_st_20 <= 0;
      read_rdata_246 <= 0;
      _th_comp_sq_21 <= 0;
    end else begin
      case(th_comp)
        th_comp_init: begin
          _th_comp_size_0 <= 128;
          th_comp <= th_comp_1;
        end
        th_comp_1: begin
          _th_comp_offset_1 <= 0;
          th_comp <= th_comp_2;
        end
        th_comp_2: begin
          if(_myaxi_read_req_idle) begin
            th_comp <= th_comp_3;
          end 
        end
        th_comp_3: begin
          if(_myaxi_read_idle) begin
            th_comp <= th_comp_4;
          end 
        end
        th_comp_4: begin
          if(_myaxi_read_req_idle) begin
            th_comp <= th_comp_5;
          end 
        end
        th_comp_5: begin
          if(_myaxi_read_idle) begin
            th_comp <= th_comp_6;
          end 
        end
        th_comp_6: begin
          if(_myaxi_read_req_idle) begin
            th_comp <= th_comp_7;
          end 
        end
        th_comp_7: begin
          if(_myaxi_read_idle) begin
            th_comp <= th_comp_8;
          end 
        end
        th_comp_8: begin
          if(_myaxi_read_req_idle) begin
            th_comp <= th_comp_9;
          end 
        end
        th_comp_9: begin
          if(_myaxi_read_idle) begin
            th_comp <= th_comp_10;
          end 
        end
        th_comp_10: begin
          _th_comp_size_2 <= _th_comp_size_0;
          _th_comp_offset_3 <= _th_comp_offset_1;
          th_comp <= th_comp_11;
        end
        th_comp_11: begin
          _th_comp_start_time_4 <= counter;
          th_comp <= th_comp_12;
        end
        th_comp_12: begin
          _th_comp__size_5 <= _th_comp_size_2 >>> 2;
          th_comp <= th_comp_13;
        end
        th_comp_13: begin
          th_comp <= th_comp_14;
        end
        th_comp_14: begin
          th_comp <= th_comp_15;
        end
        th_comp_15: begin
          th_comp <= th_comp_16;
        end
        th_comp_16: begin
          th_comp <= th_comp_17;
        end
        th_comp_17: begin
          th_comp <= th_comp_18;
        end
        th_comp_18: begin
          $display("ssss: %d", (_th_comp_size_2 >>> 1));
          th_comp <= th_comp_19;
        end
        th_comp_19: begin
          th_comp <= th_comp_20;
        end
        th_comp_20: begin
          th_comp <= th_comp_21;
        end
        th_comp_21: begin
          th_comp <= th_comp_22;
        end
        th_comp_22: begin
          th_comp <= th_comp_23;
        end
        th_comp_23: begin
          if(_mystream_stream_oready) begin
            th_comp <= th_comp_24;
          end 
        end
        th_comp_24: begin
          th_comp <= th_comp_25;
        end
        th_comp_25: begin
          if(_mystream_busy) begin
            th_comp <= th_comp_26;
          end 
        end
        th_comp_26: begin
          if(!_mystream_busy) begin
            th_comp <= th_comp_27;
          end 
        end
        th_comp_27: begin
          _th_comp_end_time_6 <= counter;
          th_comp <= th_comp_28;
        end
        th_comp_28: begin
          _th_comp_exec_time_7 <= _th_comp_end_time_6 - _th_comp_start_time_4;
          th_comp <= th_comp_29;
        end
        th_comp_29: begin
          $display("# para = %d, exec_time = %d", 2, _th_comp_exec_time_7);
          th_comp <= th_comp_30;
        end
        th_comp_30: begin
          if(_myaxi_write_req_idle) begin
            th_comp <= th_comp_31;
          end 
        end
        th_comp_31: begin
          if(_myaxi_write_idle && (outstanding_wcount_0 == 0)) begin
            th_comp <= th_comp_32;
          end 
        end
        th_comp_32: begin
          _th_comp_offset_1 <= 512;
          th_comp <= th_comp_33;
        end
        th_comp_33: begin
          if(_myaxi_read_req_idle) begin
            th_comp <= th_comp_34;
          end 
        end
        th_comp_34: begin
          if(_myaxi_read_idle) begin
            th_comp <= th_comp_35;
          end 
        end
        th_comp_35: begin
          if(_myaxi_read_req_idle) begin
            th_comp <= th_comp_36;
          end 
        end
        th_comp_36: begin
          if(_myaxi_read_idle) begin
            th_comp <= th_comp_37;
          end 
        end
        th_comp_37: begin
          _th_comp_size_8 <= _th_comp_size_0;
          _th_comp_offset_9 <= _th_comp_offset_1;
          th_comp <= th_comp_38;
        end
        th_comp_38: begin
          _th_comp_sum_10 <= 0;
          th_comp <= th_comp_39;
        end
        th_comp_39: begin
          _th_comp_i_11 <= 0;
          th_comp <= th_comp_40;
        end
        th_comp_40: begin
          if(_th_comp_i_11 < _th_comp_size_8) begin
            th_comp <= th_comp_41;
          end else begin
            th_comp <= th_comp_48;
          end
        end
        th_comp_41: begin
          if(__tmp_220_1) begin
            read_rdata_221 <= ram_x_0_rdata;
          end 
          if(__tmp_220_1) begin
            th_comp <= th_comp_42;
          end 
        end
        th_comp_42: begin
          _th_comp_a_12 <= read_rdata_221;
          th_comp <= th_comp_43;
        end
        th_comp_43: begin
          if(__tmp_223_1) begin
            read_rdata_224 <= ram_y_0_rdata;
          end 
          if(__tmp_223_1) begin
            th_comp <= th_comp_44;
          end 
        end
        th_comp_44: begin
          _th_comp_b_13 <= read_rdata_224;
          th_comp <= th_comp_45;
        end
        th_comp_45: begin
          _th_comp_c_14 <= _th_comp_a_12 + _th_comp_b_13;
          th_comp <= th_comp_46;
        end
        th_comp_46: begin
          _th_comp_sum_10 <= _th_comp_sum_10 + _th_comp_c_14;
          th_comp <= th_comp_47;
        end
        th_comp_47: begin
          _th_comp_i_11 <= _th_comp_i_11 + 1;
          th_comp <= th_comp_40;
        end
        th_comp_48: begin
          th_comp <= th_comp_49;
        end
        th_comp_49: begin
          if(_myaxi_write_req_idle) begin
            th_comp <= th_comp_50;
          end 
        end
        th_comp_50: begin
          if(_myaxi_write_idle && (outstanding_wcount_0 == 0)) begin
            th_comp <= th_comp_51;
          end 
        end
        th_comp_51: begin
          if(_myaxi_read_req_idle) begin
            th_comp <= th_comp_52;
          end 
        end
        th_comp_52: begin
          if(_myaxi_read_idle) begin
            th_comp <= th_comp_53;
          end 
        end
        th_comp_53: begin
          _th_comp_size_15 <= 1;
          _th_comp_offset_stream_16 <= 0;
          _th_comp_offset_seq_17 <= _th_comp_offset_1;
          th_comp <= th_comp_54;
        end
        th_comp_54: begin
          _th_comp_all_ok_18 <= 1;
          th_comp <= th_comp_55;
        end
        th_comp_55: begin
          _th_comp_i_19 <= 0;
          th_comp <= th_comp_56;
        end
        th_comp_56: begin
          if(_th_comp_i_19 < _th_comp_size_15) begin
            th_comp <= th_comp_57;
          end else begin
            th_comp <= th_comp_66;
          end
        end
        th_comp_57: begin
          if(__tmp_242_1) begin
            read_rdata_243 <= ram_c_0_rdata;
          end 
          if(__tmp_242_1) begin
            th_comp <= th_comp_58;
          end 
        end
        th_comp_58: begin
          _th_comp_st_20 <= read_rdata_243;
          th_comp <= th_comp_59;
        end
        th_comp_59: begin
          if(__tmp_245_1) begin
            read_rdata_246 <= ram_c_0_rdata;
          end 
          if(__tmp_245_1) begin
            th_comp <= th_comp_60;
          end 
        end
        th_comp_60: begin
          _th_comp_sq_21 <= read_rdata_246;
          th_comp <= th_comp_61;
        end
        th_comp_61: begin
          $display("%d", _th_comp_st_20);
          th_comp <= th_comp_62;
        end
        th_comp_62: begin
          $display("%d", _th_comp_sq_21);
          th_comp <= th_comp_63;
        end
        th_comp_63: begin
          if(_th_comp_st_20 !== _th_comp_sq_21) begin
            th_comp <= th_comp_64;
          end else begin
            th_comp <= th_comp_65;
          end
        end
        th_comp_64: begin
          _th_comp_all_ok_18 <= 0;
          th_comp <= th_comp_65;
        end
        th_comp_65: begin
          _th_comp_i_19 <= _th_comp_i_19 + 1;
          th_comp <= th_comp_56;
        end
        th_comp_66: begin
          if(_th_comp_all_ok_18) begin
            th_comp <= th_comp_67;
          end else begin
            th_comp <= th_comp_69;
          end
        end
        th_comp_67: begin
          $display("# verify: PASSED");
          th_comp <= th_comp_68;
        end
        th_comp_68: begin
          th_comp <= th_comp_70;
        end
        th_comp_69: begin
          $display("# verify: FAILED");
          th_comp <= th_comp_70;
        end
        th_comp_70: begin
          $finish;
          th_comp <= th_comp_71;
        end
      endcase
    end
  end

  localparam _myaxi_read_req_fsm_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      _myaxi_read_req_fsm <= _myaxi_read_req_fsm_init;
      _myaxi_read_cont <= 0;
    end else begin
      case(_myaxi_read_req_fsm)
        _myaxi_read_req_fsm_init: begin
          if((_myaxi_read_req_fsm == 0) && (_myaxi_read_start || _myaxi_read_cont) && !_myaxi_read_req_fifo_almost_full) begin
            _myaxi_read_req_fsm <= _myaxi_read_req_fsm_1;
          end 
        end
        _myaxi_read_req_fsm_1: begin
          if(myaxi_arready || !myaxi_arvalid) begin
            _myaxi_read_cont <= 1;
          end 
          if((myaxi_arready || !myaxi_arvalid) && (_myaxi_read_global_size == 0)) begin
            _myaxi_read_cont <= 0;
          end 
          if(myaxi_arready || !myaxi_arvalid) begin
            _myaxi_read_req_fsm <= _myaxi_read_req_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam _myaxi_read_data_narrow_fsm_1 = 1;
  localparam _myaxi_read_data_narrow_fsm_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _myaxi_read_data_narrow_fsm <= _myaxi_read_data_narrow_fsm_init;
      _myaxi_read_narrow_count_38 <= 0;
      _myaxi_read_narrow_wvalid_37 <= 0;
      _myaxi_read_narrow_wdata_36 <= 0;
      _myaxi_read_narrow_count_54 <= 0;
      _myaxi_read_narrow_wvalid_53 <= 0;
      _myaxi_read_narrow_wdata_52 <= 0;
      _myaxi_read_narrow_count_70 <= 0;
      _myaxi_read_narrow_wvalid_69 <= 0;
      _myaxi_read_narrow_wdata_68 <= 0;
      _myaxi_read_narrow_count_86 <= 0;
      _myaxi_read_narrow_wvalid_85 <= 0;
      _myaxi_read_narrow_wdata_84 <= 0;
    end else begin
      case(_myaxi_read_data_narrow_fsm)
        _myaxi_read_data_narrow_fsm_init: begin
          if(_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 1)) begin
            _myaxi_read_data_narrow_fsm <= _myaxi_read_data_narrow_fsm_1;
          end 
          if(_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 2)) begin
            _myaxi_read_data_narrow_fsm <= _myaxi_read_data_narrow_fsm_1;
          end 
          if(_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 3)) begin
            _myaxi_read_data_narrow_fsm <= _myaxi_read_data_narrow_fsm_1;
          end 
          if(_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 4)) begin
            _myaxi_read_data_narrow_fsm <= _myaxi_read_data_narrow_fsm_1;
          end 
        end
        _myaxi_read_data_narrow_fsm_1: begin
          _myaxi_read_narrow_count_38 <= 0;
          _myaxi_read_narrow_wvalid_37 <= 0;
          _myaxi_read_narrow_count_54 <= 0;
          _myaxi_read_narrow_wvalid_53 <= 0;
          _myaxi_read_narrow_count_70 <= 0;
          _myaxi_read_narrow_wvalid_69 <= 0;
          _myaxi_read_narrow_count_86 <= 0;
          _myaxi_read_narrow_wvalid_85 <= 0;
          _myaxi_read_data_narrow_fsm <= _myaxi_read_data_narrow_fsm_2;
          _myaxi_read_data_narrow_fsm <= _myaxi_read_data_narrow_fsm_2;
          _myaxi_read_data_narrow_fsm <= _myaxi_read_data_narrow_fsm_2;
          _myaxi_read_data_narrow_fsm <= _myaxi_read_data_narrow_fsm_2;
        end
        _myaxi_read_data_narrow_fsm_2: begin
          if(_myaxi_read_op_sel_buf == 1) begin
            _myaxi_read_narrow_wvalid_37 <= 0;
          end 
          if((_myaxi_read_op_sel_buf == 1) && myaxi_rvalid && (_myaxi_read_narrow_count_38 < 1)) begin
            _myaxi_read_narrow_count_38 <= _myaxi_read_narrow_count_38 + 1;
            _myaxi_read_narrow_wdata_36 <= { myaxi_rdata, _myaxi_read_narrow_wdata_36[63:32] };
            _myaxi_read_narrow_wvalid_37 <= 0;
          end 
          if((_myaxi_read_op_sel_buf == 1) && myaxi_rvalid && (_myaxi_read_narrow_count_38 == 1)) begin
            _myaxi_read_narrow_count_38 <= 0;
            _myaxi_read_narrow_wdata_36 <= { myaxi_rdata, _myaxi_read_narrow_wdata_36[63:32] };
            _myaxi_read_narrow_wvalid_37 <= 1;
          end 
          if(_myaxi_read_op_sel_buf == 2) begin
            _myaxi_read_narrow_wvalid_53 <= 0;
          end 
          if((_myaxi_read_op_sel_buf == 2) && myaxi_rvalid && (_myaxi_read_narrow_count_54 < 1)) begin
            _myaxi_read_narrow_count_54 <= _myaxi_read_narrow_count_54 + 1;
            _myaxi_read_narrow_wdata_52 <= { myaxi_rdata, _myaxi_read_narrow_wdata_52[63:32] };
            _myaxi_read_narrow_wvalid_53 <= 0;
          end 
          if((_myaxi_read_op_sel_buf == 2) && myaxi_rvalid && (_myaxi_read_narrow_count_54 == 1)) begin
            _myaxi_read_narrow_count_54 <= 0;
            _myaxi_read_narrow_wdata_52 <= { myaxi_rdata, _myaxi_read_narrow_wdata_52[63:32] };
            _myaxi_read_narrow_wvalid_53 <= 1;
          end 
          if(_myaxi_read_op_sel_buf == 3) begin
            _myaxi_read_narrow_wvalid_69 <= 0;
          end 
          if((_myaxi_read_op_sel_buf == 3) && myaxi_rvalid && (_myaxi_read_narrow_count_70 < 1)) begin
            _myaxi_read_narrow_count_70 <= _myaxi_read_narrow_count_70 + 1;
            _myaxi_read_narrow_wdata_68 <= { myaxi_rdata, _myaxi_read_narrow_wdata_68[63:32] };
            _myaxi_read_narrow_wvalid_69 <= 0;
          end 
          if((_myaxi_read_op_sel_buf == 3) && myaxi_rvalid && (_myaxi_read_narrow_count_70 == 1)) begin
            _myaxi_read_narrow_count_70 <= 0;
            _myaxi_read_narrow_wdata_68 <= { myaxi_rdata, _myaxi_read_narrow_wdata_68[63:32] };
            _myaxi_read_narrow_wvalid_69 <= 1;
          end 
          if(_myaxi_read_op_sel_buf == 4) begin
            _myaxi_read_narrow_wvalid_85 <= 0;
          end 
          if((_myaxi_read_op_sel_buf == 4) && myaxi_rvalid && (_myaxi_read_narrow_count_86 < 1)) begin
            _myaxi_read_narrow_count_86 <= _myaxi_read_narrow_count_86 + 1;
            _myaxi_read_narrow_wdata_84 <= { myaxi_rdata, _myaxi_read_narrow_wdata_84[63:32] };
            _myaxi_read_narrow_wvalid_85 <= 0;
          end 
          if((_myaxi_read_op_sel_buf == 4) && myaxi_rvalid && (_myaxi_read_narrow_count_86 == 1)) begin
            _myaxi_read_narrow_count_86 <= 0;
            _myaxi_read_narrow_wdata_84 <= { myaxi_rdata, _myaxi_read_narrow_wdata_84[63:32] };
            _myaxi_read_narrow_wvalid_85 <= 1;
          end 
          if((_myaxi_read_op_sel_buf == 1) && myaxi_rvalid && (_myaxi_read_local_size_buf <= 1) && (_myaxi_read_narrow_count_38 == 1)) begin
            _myaxi_read_data_narrow_fsm <= _myaxi_read_data_narrow_fsm_init;
          end 
          if((_myaxi_read_op_sel_buf == 2) && myaxi_rvalid && (_myaxi_read_local_size_buf <= 1) && (_myaxi_read_narrow_count_54 == 1)) begin
            _myaxi_read_data_narrow_fsm <= _myaxi_read_data_narrow_fsm_init;
          end 
          if((_myaxi_read_op_sel_buf == 3) && myaxi_rvalid && (_myaxi_read_local_size_buf <= 1) && (_myaxi_read_narrow_count_70 == 1)) begin
            _myaxi_read_data_narrow_fsm <= _myaxi_read_data_narrow_fsm_init;
          end 
          if((_myaxi_read_op_sel_buf == 4) && myaxi_rvalid && (_myaxi_read_local_size_buf <= 1) && (_myaxi_read_narrow_count_86 == 1)) begin
            _myaxi_read_data_narrow_fsm <= _myaxi_read_data_narrow_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_packed_fsm_0_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_packed_fsm_0 <= write_burst_packed_fsm_0_init;
      write_burst_packed_addr_39 <= 0;
      write_burst_packed_stride_40 <= 0;
      write_burst_packed_length_41 <= 0;
      write_burst_packed_done_42 <= 0;
    end else begin
      case(write_burst_packed_fsm_0)
        write_burst_packed_fsm_0_init: begin
          write_burst_packed_addr_39 <= _myaxi_read_local_addr_buf;
          write_burst_packed_stride_40 <= _myaxi_read_local_stride_buf;
          write_burst_packed_length_41 <= _myaxi_read_local_size_buf;
          write_burst_packed_done_42 <= 0;
          if((_myaxi_read_data_narrow_fsm == 1) && (_myaxi_read_op_sel_buf == 1) && (_myaxi_read_local_size_buf > 0)) begin
            write_burst_packed_fsm_0 <= write_burst_packed_fsm_0_1;
          end 
        end
        write_burst_packed_fsm_0_1: begin
          if(_myaxi_read_narrow_wvalid_37) begin
            write_burst_packed_addr_39 <= write_burst_packed_addr_39 + write_burst_packed_stride_40;
            write_burst_packed_length_41 <= write_burst_packed_length_41 - 1;
            write_burst_packed_done_42 <= 0;
          end 
          if(_myaxi_read_narrow_wvalid_37 && (write_burst_packed_length_41 <= 1)) begin
            write_burst_packed_done_42 <= 1;
          end 
          if(_myaxi_read_narrow_wvalid_37 && 0) begin
            write_burst_packed_done_42 <= 1;
          end 
          if(_myaxi_read_narrow_wvalid_37 && (write_burst_packed_length_41 <= 1)) begin
            write_burst_packed_fsm_0 <= write_burst_packed_fsm_0_init;
          end 
          if(_myaxi_read_narrow_wvalid_37 && 0) begin
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
      write_burst_packed_addr_55 <= 0;
      write_burst_packed_stride_56 <= 0;
      write_burst_packed_length_57 <= 0;
      write_burst_packed_done_58 <= 0;
    end else begin
      case(write_burst_packed_fsm_1)
        write_burst_packed_fsm_1_init: begin
          write_burst_packed_addr_55 <= _myaxi_read_local_addr_buf;
          write_burst_packed_stride_56 <= _myaxi_read_local_stride_buf;
          write_burst_packed_length_57 <= _myaxi_read_local_size_buf;
          write_burst_packed_done_58 <= 0;
          if((_myaxi_read_data_narrow_fsm == 1) && (_myaxi_read_op_sel_buf == 2) && (_myaxi_read_local_size_buf > 0)) begin
            write_burst_packed_fsm_1 <= write_burst_packed_fsm_1_1;
          end 
        end
        write_burst_packed_fsm_1_1: begin
          if(_myaxi_read_narrow_wvalid_53) begin
            write_burst_packed_addr_55 <= write_burst_packed_addr_55 + write_burst_packed_stride_56;
            write_burst_packed_length_57 <= write_burst_packed_length_57 - 1;
            write_burst_packed_done_58 <= 0;
          end 
          if(_myaxi_read_narrow_wvalid_53 && (write_burst_packed_length_57 <= 1)) begin
            write_burst_packed_done_58 <= 1;
          end 
          if(_myaxi_read_narrow_wvalid_53 && 0) begin
            write_burst_packed_done_58 <= 1;
          end 
          if(_myaxi_read_narrow_wvalid_53 && (write_burst_packed_length_57 <= 1)) begin
            write_burst_packed_fsm_1 <= write_burst_packed_fsm_1_init;
          end 
          if(_myaxi_read_narrow_wvalid_53 && 0) begin
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
      write_burst_packed_addr_71 <= 0;
      write_burst_packed_stride_72 <= 0;
      write_burst_packed_length_73 <= 0;
      write_burst_packed_done_74 <= 0;
    end else begin
      case(write_burst_packed_fsm_2)
        write_burst_packed_fsm_2_init: begin
          write_burst_packed_addr_71 <= _myaxi_read_local_addr_buf;
          write_burst_packed_stride_72 <= _myaxi_read_local_stride_buf;
          write_burst_packed_length_73 <= _myaxi_read_local_size_buf;
          write_burst_packed_done_74 <= 0;
          if((_myaxi_read_data_narrow_fsm == 1) && (_myaxi_read_op_sel_buf == 3) && (_myaxi_read_local_size_buf > 0)) begin
            write_burst_packed_fsm_2 <= write_burst_packed_fsm_2_1;
          end 
        end
        write_burst_packed_fsm_2_1: begin
          if(_myaxi_read_narrow_wvalid_69) begin
            write_burst_packed_addr_71 <= write_burst_packed_addr_71 + write_burst_packed_stride_72;
            write_burst_packed_length_73 <= write_burst_packed_length_73 - 1;
            write_burst_packed_done_74 <= 0;
          end 
          if(_myaxi_read_narrow_wvalid_69 && (write_burst_packed_length_73 <= 1)) begin
            write_burst_packed_done_74 <= 1;
          end 
          if(_myaxi_read_narrow_wvalid_69 && 0) begin
            write_burst_packed_done_74 <= 1;
          end 
          if(_myaxi_read_narrow_wvalid_69 && (write_burst_packed_length_73 <= 1)) begin
            write_burst_packed_fsm_2 <= write_burst_packed_fsm_2_init;
          end 
          if(_myaxi_read_narrow_wvalid_69 && 0) begin
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
      write_burst_packed_addr_87 <= 0;
      write_burst_packed_stride_88 <= 0;
      write_burst_packed_length_89 <= 0;
      write_burst_packed_done_90 <= 0;
    end else begin
      case(write_burst_packed_fsm_3)
        write_burst_packed_fsm_3_init: begin
          write_burst_packed_addr_87 <= _myaxi_read_local_addr_buf;
          write_burst_packed_stride_88 <= _myaxi_read_local_stride_buf;
          write_burst_packed_length_89 <= _myaxi_read_local_size_buf;
          write_burst_packed_done_90 <= 0;
          if((_myaxi_read_data_narrow_fsm == 1) && (_myaxi_read_op_sel_buf == 4) && (_myaxi_read_local_size_buf > 0)) begin
            write_burst_packed_fsm_3 <= write_burst_packed_fsm_3_1;
          end 
        end
        write_burst_packed_fsm_3_1: begin
          if(_myaxi_read_narrow_wvalid_85) begin
            write_burst_packed_addr_87 <= write_burst_packed_addr_87 + write_burst_packed_stride_88;
            write_burst_packed_length_89 <= write_burst_packed_length_89 - 1;
            write_burst_packed_done_90 <= 0;
          end 
          if(_myaxi_read_narrow_wvalid_85 && (write_burst_packed_length_89 <= 1)) begin
            write_burst_packed_done_90 <= 1;
          end 
          if(_myaxi_read_narrow_wvalid_85 && 0) begin
            write_burst_packed_done_90 <= 1;
          end 
          if(_myaxi_read_narrow_wvalid_85 && (write_burst_packed_length_89 <= 1)) begin
            write_burst_packed_fsm_3 <= write_burst_packed_fsm_3_init;
          end 
          if(_myaxi_read_narrow_wvalid_85 && 0) begin
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

  localparam _mystream_sum_sink_fsm_8_1 = 1;
  localparam _mystream_sum_sink_fsm_8_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_sum_sink_fsm_8 <= _mystream_sum_sink_fsm_8_init;
    end else begin
      case(_mystream_sum_sink_fsm_8)
        _mystream_sum_sink_fsm_8_init: begin
          if(_mystream_sink_start && _mystream_sum_sink_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_sum_sink_fsm_8 <= _mystream_sum_sink_fsm_8_1;
          end 
        end
        _mystream_sum_sink_fsm_8_1: begin
          if(_mystream_stream_oready) begin
            _mystream_sum_sink_fsm_8 <= _mystream_sum_sink_fsm_8_2;
          end 
        end
        _mystream_sum_sink_fsm_8_2: begin
          if(mystream_sum_valid2_data && (_mystream_sum_sink_count == 1) && _mystream_stream_oready) begin
            _mystream_sum_sink_fsm_8 <= _mystream_sum_sink_fsm_8_init;
          end 
          if(_mystream_sink_stop && _mystream_stream_oready) begin
            _mystream_sum_sink_fsm_8 <= _mystream_sum_sink_fsm_8_init;
          end 
        end
      endcase
    end
  end

  localparam _myaxi_write_req_fsm_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      _myaxi_write_req_fsm <= _myaxi_write_req_fsm_init;
      _myaxi_write_cont <= 0;
    end else begin
      case(_myaxi_write_req_fsm)
        _myaxi_write_req_fsm_init: begin
          if((_myaxi_write_req_fsm == 0) && (_myaxi_write_start || _myaxi_write_cont) && !_myaxi_write_req_fifo_almost_full) begin
            _myaxi_write_req_fsm <= _myaxi_write_req_fsm_1;
          end 
        end
        _myaxi_write_req_fsm_1: begin
          if((_myaxi_write_req_fsm == 1) && !_myaxi_write_req_fifo_almost_full && (myaxi_awready || !myaxi_awvalid) && (outstanding_wcount_0 < 6)) begin
            _myaxi_write_cont <= 1;
          end 
          if((_myaxi_write_req_fsm == 1) && !_myaxi_write_req_fifo_almost_full && (myaxi_awready || !myaxi_awvalid) && (outstanding_wcount_0 < 6) && (_myaxi_write_global_size == 0)) begin
            _myaxi_write_cont <= 0;
          end 
          if((_myaxi_write_req_fsm == 1) && !_myaxi_write_req_fifo_almost_full && (myaxi_awready || !myaxi_awvalid) && (outstanding_wcount_0 < 6)) begin
            _myaxi_write_req_fsm <= _myaxi_write_req_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam _myaxi_write_data_fsm_1 = 1;
  localparam _myaxi_write_data_fsm_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _myaxi_write_data_fsm <= _myaxi_write_data_fsm_init;
    end else begin
      case(_myaxi_write_data_fsm)
        _myaxi_write_data_fsm_init: begin
          if(_myaxi_write_data_idle && !_myaxi_write_req_fifo_empty && (_myaxi_write_op_sel_fifo == 1)) begin
            _myaxi_write_data_fsm <= _myaxi_write_data_fsm_1;
          end 
          if(_myaxi_write_data_idle && !_myaxi_write_req_fifo_empty && (_myaxi_write_op_sel_fifo == 2)) begin
            _myaxi_write_data_fsm <= _myaxi_write_data_fsm_1;
          end 
        end
        _myaxi_write_data_fsm_1: begin
          _myaxi_write_data_fsm <= _myaxi_write_data_fsm_2;
          _myaxi_write_data_fsm <= _myaxi_write_data_fsm_2;
        end
        _myaxi_write_data_fsm_2: begin
          if((_myaxi_write_op_sel_buf == 1) && read_burst_rvalid_202 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0)) && read_burst_rlast_203) begin
            _myaxi_write_data_fsm <= _myaxi_write_data_fsm_init;
          end 
          if((_myaxi_write_op_sel_buf == 2) && read_burst_rvalid_230 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0)) && read_burst_rlast_231) begin
            _myaxi_write_data_fsm <= _myaxi_write_data_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam read_burst_fsm_4_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      read_burst_fsm_4 <= read_burst_fsm_4_init;
      read_burst_addr_199 <= 0;
      read_burst_stride_200 <= 0;
      read_burst_length_201 <= 0;
      read_burst_rvalid_202 <= 0;
      read_burst_rlast_203 <= 0;
    end else begin
      case(read_burst_fsm_4)
        read_burst_fsm_4_init: begin
          read_burst_addr_199 <= _myaxi_write_local_addr_buf;
          read_burst_stride_200 <= _myaxi_write_local_stride_buf;
          read_burst_length_201 <= _myaxi_write_size_buf;
          read_burst_rvalid_202 <= 0;
          read_burst_rlast_203 <= 0;
          if((_myaxi_write_data_fsm == 1) && (_myaxi_write_op_sel_buf == 1) && (_myaxi_write_size_buf > 0)) begin
            read_burst_fsm_4 <= read_burst_fsm_4_1;
          end 
        end
        read_burst_fsm_4_1: begin
          if((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0) && (read_burst_length_201 > 0)) begin
            read_burst_addr_199 <= read_burst_addr_199 + read_burst_stride_200;
            read_burst_length_201 <= read_burst_length_201 - 1;
            read_burst_rvalid_202 <= 1;
          end 
          if((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0) && (read_burst_length_201 <= 1)) begin
            read_burst_rlast_203 <= 1;
          end 
          if(read_burst_rlast_203 && read_burst_rvalid_202 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0))) begin
            read_burst_rvalid_202 <= 0;
            read_burst_rlast_203 <= 0;
          end 
          if(0) begin
            read_burst_rvalid_202 <= 0;
            read_burst_rlast_203 <= 0;
          end 
          if(read_burst_rlast_203 && read_burst_rvalid_202 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0))) begin
            read_burst_fsm_4 <= read_burst_fsm_4_init;
          end 
          if(0) begin
            read_burst_fsm_4 <= read_burst_fsm_4_init;
          end 
        end
      endcase
    end
  end

  localparam _myaxi_read_data_fsm_1 = 1;
  localparam _myaxi_read_data_fsm_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _myaxi_read_data_fsm <= _myaxi_read_data_fsm_init;
    end else begin
      case(_myaxi_read_data_fsm)
        _myaxi_read_data_fsm_init: begin
          if(_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 5)) begin
            _myaxi_read_data_fsm <= _myaxi_read_data_fsm_1;
          end 
          if(_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 6)) begin
            _myaxi_read_data_fsm <= _myaxi_read_data_fsm_1;
          end 
          if(_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 7)) begin
            _myaxi_read_data_fsm <= _myaxi_read_data_fsm_1;
          end 
        end
        _myaxi_read_data_fsm_1: begin
          _myaxi_read_data_fsm <= _myaxi_read_data_fsm_2;
          _myaxi_read_data_fsm <= _myaxi_read_data_fsm_2;
          _myaxi_read_data_fsm <= _myaxi_read_data_fsm_2;
        end
        _myaxi_read_data_fsm_2: begin
          if(myaxi_rvalid && (_myaxi_read_local_size_buf <= 1)) begin
            _myaxi_read_data_fsm <= _myaxi_read_data_fsm_init;
          end 
          if(myaxi_rvalid && (_myaxi_read_local_size_buf <= 1)) begin
            _myaxi_read_data_fsm <= _myaxi_read_data_fsm_init;
          end 
          if(myaxi_rvalid && (_myaxi_read_local_size_buf <= 1)) begin
            _myaxi_read_data_fsm <= _myaxi_read_data_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_fsm_5_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_fsm_5 <= write_burst_fsm_5_init;
      write_burst_addr_209 <= 0;
      write_burst_stride_210 <= 0;
      write_burst_length_211 <= 0;
      write_burst_done_212 <= 0;
    end else begin
      case(write_burst_fsm_5)
        write_burst_fsm_5_init: begin
          write_burst_addr_209 <= _myaxi_read_local_addr_buf;
          write_burst_stride_210 <= _myaxi_read_local_stride_buf;
          write_burst_length_211 <= _myaxi_read_local_size_buf;
          write_burst_done_212 <= 0;
          if((_myaxi_read_data_fsm == 1) && (_myaxi_read_op_sel_buf == 5) && (_myaxi_read_local_size_buf > 0)) begin
            write_burst_fsm_5 <= write_burst_fsm_5_1;
          end 
        end
        write_burst_fsm_5_1: begin
          if(myaxi_rvalid) begin
            write_burst_addr_209 <= write_burst_addr_209 + write_burst_stride_210;
            write_burst_length_211 <= write_burst_length_211 - 1;
            write_burst_done_212 <= 0;
          end 
          if(myaxi_rvalid && (write_burst_length_211 <= 1)) begin
            write_burst_done_212 <= 1;
          end 
          if(myaxi_rvalid && 0) begin
            write_burst_done_212 <= 1;
          end 
          if(myaxi_rvalid && (write_burst_length_211 <= 1)) begin
            write_burst_fsm_5 <= write_burst_fsm_5_init;
          end 
          if(myaxi_rvalid && 0) begin
            write_burst_fsm_5 <= write_burst_fsm_5_init;
          end 
          if(0) begin
            write_burst_fsm_5 <= write_burst_fsm_5_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_fsm_6_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_fsm_6 <= write_burst_fsm_6_init;
      write_burst_addr_215 <= 0;
      write_burst_stride_216 <= 0;
      write_burst_length_217 <= 0;
      write_burst_done_218 <= 0;
    end else begin
      case(write_burst_fsm_6)
        write_burst_fsm_6_init: begin
          write_burst_addr_215 <= _myaxi_read_local_addr_buf;
          write_burst_stride_216 <= _myaxi_read_local_stride_buf;
          write_burst_length_217 <= _myaxi_read_local_size_buf;
          write_burst_done_218 <= 0;
          if((_myaxi_read_data_fsm == 1) && (_myaxi_read_op_sel_buf == 6) && (_myaxi_read_local_size_buf > 0)) begin
            write_burst_fsm_6 <= write_burst_fsm_6_1;
          end 
        end
        write_burst_fsm_6_1: begin
          if(myaxi_rvalid) begin
            write_burst_addr_215 <= write_burst_addr_215 + write_burst_stride_216;
            write_burst_length_217 <= write_burst_length_217 - 1;
            write_burst_done_218 <= 0;
          end 
          if(myaxi_rvalid && (write_burst_length_217 <= 1)) begin
            write_burst_done_218 <= 1;
          end 
          if(myaxi_rvalid && 0) begin
            write_burst_done_218 <= 1;
          end 
          if(myaxi_rvalid && (write_burst_length_217 <= 1)) begin
            write_burst_fsm_6 <= write_burst_fsm_6_init;
          end 
          if(myaxi_rvalid && 0) begin
            write_burst_fsm_6 <= write_burst_fsm_6_init;
          end 
          if(0) begin
            write_burst_fsm_6 <= write_burst_fsm_6_init;
          end 
        end
      endcase
    end
  end

  localparam read_burst_fsm_7_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      read_burst_fsm_7 <= read_burst_fsm_7_init;
      read_burst_addr_227 <= 0;
      read_burst_stride_228 <= 0;
      read_burst_length_229 <= 0;
      read_burst_rvalid_230 <= 0;
      read_burst_rlast_231 <= 0;
    end else begin
      case(read_burst_fsm_7)
        read_burst_fsm_7_init: begin
          read_burst_addr_227 <= _myaxi_write_local_addr_buf;
          read_burst_stride_228 <= _myaxi_write_local_stride_buf;
          read_burst_length_229 <= _myaxi_write_size_buf;
          read_burst_rvalid_230 <= 0;
          read_burst_rlast_231 <= 0;
          if((_myaxi_write_data_fsm == 1) && (_myaxi_write_op_sel_buf == 2) && (_myaxi_write_size_buf > 0)) begin
            read_burst_fsm_7 <= read_burst_fsm_7_1;
          end 
        end
        read_burst_fsm_7_1: begin
          if((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0) && (read_burst_length_229 > 0)) begin
            read_burst_addr_227 <= read_burst_addr_227 + read_burst_stride_228;
            read_burst_length_229 <= read_burst_length_229 - 1;
            read_burst_rvalid_230 <= 1;
          end 
          if((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0) && (read_burst_length_229 <= 1)) begin
            read_burst_rlast_231 <= 1;
          end 
          if(read_burst_rlast_231 && read_burst_rvalid_230 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0))) begin
            read_burst_rvalid_230 <= 0;
            read_burst_rlast_231 <= 0;
          end 
          if(0) begin
            read_burst_rvalid_230 <= 0;
            read_burst_rlast_231 <= 0;
          end 
          if(read_burst_rlast_231 && read_burst_rvalid_230 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0))) begin
            read_burst_fsm_7 <= read_burst_fsm_7_init;
          end 
          if(0) begin
            read_burst_fsm_7 <= read_burst_fsm_7_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_fsm_8_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_fsm_8 <= write_burst_fsm_8_init;
      write_burst_addr_237 <= 0;
      write_burst_stride_238 <= 0;
      write_burst_length_239 <= 0;
      write_burst_done_240 <= 0;
    end else begin
      case(write_burst_fsm_8)
        write_burst_fsm_8_init: begin
          write_burst_addr_237 <= _myaxi_read_local_addr_buf;
          write_burst_stride_238 <= _myaxi_read_local_stride_buf;
          write_burst_length_239 <= _myaxi_read_local_size_buf;
          write_burst_done_240 <= 0;
          if((_myaxi_read_data_fsm == 1) && (_myaxi_read_op_sel_buf == 7) && (_myaxi_read_local_size_buf > 0)) begin
            write_burst_fsm_8 <= write_burst_fsm_8_1;
          end 
        end
        write_burst_fsm_8_1: begin
          if(myaxi_rvalid) begin
            write_burst_addr_237 <= write_burst_addr_237 + write_burst_stride_238;
            write_burst_length_239 <= write_burst_length_239 - 1;
            write_burst_done_240 <= 0;
          end 
          if(myaxi_rvalid && (write_burst_length_239 <= 1)) begin
            write_burst_done_240 <= 1;
          end 
          if(myaxi_rvalid && 0) begin
            write_burst_done_240 <= 1;
          end 
          if(myaxi_rvalid && (write_burst_length_239 <= 1)) begin
            write_burst_fsm_8 <= write_burst_fsm_8_init;
          end 
          if(myaxi_rvalid && 0) begin
            write_burst_fsm_8 <= write_burst_fsm_8_init;
          end 
          if(0) begin
            write_burst_fsm_8 <= write_burst_fsm_8_init;
          end 
        end
      endcase
    end
  end


endmodule



module _myaxi_read_req_fifo
(
  input CLK,
  input RST,
  input _myaxi_read_req_fifo_enq,
  input [137-1:0] _myaxi_read_req_fifo_wdata,
  output _myaxi_read_req_fifo_full,
  output _myaxi_read_req_fifo_almost_full,
  input _myaxi_read_req_fifo_deq,
  output [137-1:0] _myaxi_read_req_fifo_rdata,
  output _myaxi_read_req_fifo_empty,
  output _myaxi_read_req_fifo_almost_empty
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
  assign _myaxi_read_req_fifo_full = is_full;
  assign _myaxi_read_req_fifo_almost_full = is_almost_full || is_full;
  assign _myaxi_read_req_fifo_empty = is_empty;
  assign _myaxi_read_req_fifo_almost_empty = is_almost_empty || is_empty;
  assign rdata = mem[tail];
  assign _myaxi_read_req_fifo_rdata = rdata;

  always @(posedge CLK) begin
    if(RST) begin
      head <= 0;
      tail <= 0;
    end else begin
      if(_myaxi_read_req_fifo_enq && !is_full) begin
        mem[head] <= _myaxi_read_req_fifo_wdata;
        head <= head + 1;
      end 
      if(_myaxi_read_req_fifo_deq && !is_empty) begin
        tail <= tail + 1;
      end 
    end
  end


endmodule



module _myaxi_write_req_fifo
(
  input CLK,
  input RST,
  input _myaxi_write_req_fifo_enq,
  input [137-1:0] _myaxi_write_req_fifo_wdata,
  output _myaxi_write_req_fifo_full,
  output _myaxi_write_req_fifo_almost_full,
  input _myaxi_write_req_fifo_deq,
  output [137-1:0] _myaxi_write_req_fifo_rdata,
  output _myaxi_write_req_fifo_empty,
  output _myaxi_write_req_fifo_almost_empty
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
  assign _myaxi_write_req_fifo_full = is_full;
  assign _myaxi_write_req_fifo_almost_full = is_almost_full || is_full;
  assign _myaxi_write_req_fifo_empty = is_empty;
  assign _myaxi_write_req_fifo_almost_empty = is_almost_empty || is_empty;
  assign rdata = mem[tail];
  assign _myaxi_write_req_fifo_rdata = rdata;

  always @(posedge CLK) begin
    if(RST) begin
      head <= 0;
      tail <= 0;
    end else begin
      if(_myaxi_write_req_fifo_enq && !is_full) begin
        mem[head] <= _myaxi_write_req_fifo_wdata;
        head <= head + 1;
      end 
      if(_myaxi_write_req_fifo_deq && !is_empty) begin
        tail <= tail + 1;
      end 
    end
  end


endmodule



module ram_a0_0
(
  input CLK,
  input [10-1:0] ram_a0_0_0_addr,
  output [32-1:0] ram_a0_0_0_rdata,
  input [32-1:0] ram_a0_0_0_wdata,
  input ram_a0_0_0_wenable,
  input ram_a0_0_0_enable
);

  reg [32-1:0] ram_a0_0_0_rdata_out;
  assign ram_a0_0_0_rdata = ram_a0_0_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

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
  input [10-1:0] ram_a0_1_0_addr,
  output [32-1:0] ram_a0_1_0_rdata,
  input [32-1:0] ram_a0_1_0_wdata,
  input ram_a0_1_0_wenable,
  input ram_a0_1_0_enable
);

  reg [32-1:0] ram_a0_1_0_rdata_out;
  assign ram_a0_1_0_rdata = ram_a0_1_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

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



module ram_a1_0
(
  input CLK,
  input [10-1:0] ram_a1_0_0_addr,
  output [32-1:0] ram_a1_0_0_rdata,
  input [32-1:0] ram_a1_0_0_wdata,
  input ram_a1_0_0_wenable,
  input ram_a1_0_0_enable
);

  reg [32-1:0] ram_a1_0_0_rdata_out;
  assign ram_a1_0_0_rdata = ram_a1_0_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

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
  input [10-1:0] ram_a1_1_0_addr,
  output [32-1:0] ram_a1_1_0_rdata,
  input [32-1:0] ram_a1_1_0_wdata,
  input ram_a1_1_0_wenable,
  input ram_a1_1_0_enable
);

  reg [32-1:0] ram_a1_1_0_rdata_out;
  assign ram_a1_1_0_rdata = ram_a1_1_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

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



module ram_b0_0
(
  input CLK,
  input [10-1:0] ram_b0_0_0_addr,
  output [32-1:0] ram_b0_0_0_rdata,
  input [32-1:0] ram_b0_0_0_wdata,
  input ram_b0_0_0_wenable,
  input ram_b0_0_0_enable
);

  reg [32-1:0] ram_b0_0_0_rdata_out;
  assign ram_b0_0_0_rdata = ram_b0_0_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

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
  input [10-1:0] ram_b0_1_0_addr,
  output [32-1:0] ram_b0_1_0_rdata,
  input [32-1:0] ram_b0_1_0_wdata,
  input ram_b0_1_0_wenable,
  input ram_b0_1_0_enable
);

  reg [32-1:0] ram_b0_1_0_rdata_out;
  assign ram_b0_1_0_rdata = ram_b0_1_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

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



module ram_b1_0
(
  input CLK,
  input [10-1:0] ram_b1_0_0_addr,
  output [32-1:0] ram_b1_0_0_rdata,
  input [32-1:0] ram_b1_0_0_wdata,
  input ram_b1_0_0_wenable,
  input ram_b1_0_0_enable
);

  reg [32-1:0] ram_b1_0_0_rdata_out;
  assign ram_b1_0_0_rdata = ram_b1_0_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

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
  input [10-1:0] ram_b1_1_0_addr,
  output [32-1:0] ram_b1_1_0_rdata,
  input [32-1:0] ram_b1_1_0_wdata,
  input ram_b1_1_0_wenable,
  input ram_b1_1_0_enable
);

  reg [32-1:0] ram_b1_1_0_rdata_out;
  assign ram_b1_1_0_rdata = ram_b1_1_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

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



module ram_c
(
  input CLK,
  input [10-1:0] ram_c_0_addr,
  output [32-1:0] ram_c_0_rdata,
  input [32-1:0] ram_c_0_wdata,
  input ram_c_0_wenable,
  input ram_c_0_enable
);

  reg [32-1:0] ram_c_0_rdata_out;
  assign ram_c_0_rdata = ram_c_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

  always @(posedge CLK) begin
    if(ram_c_0_enable) begin
      if(ram_c_0_wenable) begin
        mem[ram_c_0_addr] <= ram_c_0_wdata;
        ram_c_0_rdata_out <= ram_c_0_wdata;
      end else begin
        ram_c_0_rdata_out <= mem[ram_c_0_addr];
      end
    end 
  end


endmodule



module ram_x
(
  input CLK,
  input [10-1:0] ram_x_0_addr,
  output [32-1:0] ram_x_0_rdata,
  input [32-1:0] ram_x_0_wdata,
  input ram_x_0_wenable,
  input ram_x_0_enable
);

  reg [32-1:0] ram_x_0_rdata_out;
  assign ram_x_0_rdata = ram_x_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

  always @(posedge CLK) begin
    if(ram_x_0_enable) begin
      if(ram_x_0_wenable) begin
        mem[ram_x_0_addr] <= ram_x_0_wdata;
        ram_x_0_rdata_out <= ram_x_0_wdata;
      end else begin
        ram_x_0_rdata_out <= mem[ram_x_0_addr];
      end
    end 
  end


endmodule



module ram_y
(
  input CLK,
  input [10-1:0] ram_y_0_addr,
  output [32-1:0] ram_y_0_rdata,
  input [32-1:0] ram_y_0_wdata,
  input ram_y_0_wenable,
  input ram_y_0_enable
);

  reg [32-1:0] ram_y_0_rdata_out;
  assign ram_y_0_rdata = ram_y_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

  always @(posedge CLK) begin
    if(ram_y_0_enable) begin
      if(ram_y_0_wenable) begin
        mem[ram_y_0_addr] <= ram_y_0_wdata;
        ram_y_0_rdata_out <= ram_y_0_wdata;
      end else begin
        ram_y_0_rdata_out <= mem[ram_y_0_addr];
      end
    end 
  end


endmodule



module ram_z
(
  input CLK,
  input [10-1:0] ram_z_0_addr,
  output [32-1:0] ram_z_0_rdata,
  input [32-1:0] ram_z_0_wdata,
  input ram_z_0_wenable,
  input ram_z_0_enable
);

  reg [32-1:0] ram_z_0_rdata_out;
  assign ram_z_0_rdata = ram_z_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

  always @(posedge CLK) begin
    if(ram_z_0_enable) begin
      if(ram_z_0_wenable) begin
        mem[ram_z_0_addr] <= ram_z_0_wdata;
        ram_z_0_rdata_out <= ram_z_0_wdata;
      end else begin
        ram_z_0_rdata_out <= mem[ram_z_0_addr];
      end
    end 
  end


endmodule

