

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
  wire [10-1:0] ram_a_0_0_addr;
  wire [32-1:0] ram_a_0_0_rdata;
  wire [32-1:0] ram_a_0_0_wdata;
  wire ram_a_0_0_wenable;
  wire ram_a_0_0_enable;

  ram_a_0
  inst_ram_a_0
  (
    .CLK(CLK),
    .ram_a_0_0_addr(ram_a_0_0_addr),
    .ram_a_0_0_rdata(ram_a_0_0_rdata),
    .ram_a_0_0_wdata(ram_a_0_0_wdata),
    .ram_a_0_0_wenable(ram_a_0_0_wenable),
    .ram_a_0_0_enable(ram_a_0_0_enable)
  );

  wire [10-1:0] ram_a_1_0_addr;
  wire [32-1:0] ram_a_1_0_rdata;
  wire [32-1:0] ram_a_1_0_wdata;
  wire ram_a_1_0_wenable;
  wire ram_a_1_0_enable;

  ram_a_1
  inst_ram_a_1
  (
    .CLK(CLK),
    .ram_a_1_0_addr(ram_a_1_0_addr),
    .ram_a_1_0_rdata(ram_a_1_0_rdata),
    .ram_a_1_0_wdata(ram_a_1_0_wdata),
    .ram_a_1_0_wenable(ram_a_1_0_wenable),
    .ram_a_1_0_enable(ram_a_1_0_enable)
  );

  wire [10-1:0] ram_a_2_0_addr;
  wire [32-1:0] ram_a_2_0_rdata;
  wire [32-1:0] ram_a_2_0_wdata;
  wire ram_a_2_0_wenable;
  wire ram_a_2_0_enable;

  ram_a_2
  inst_ram_a_2
  (
    .CLK(CLK),
    .ram_a_2_0_addr(ram_a_2_0_addr),
    .ram_a_2_0_rdata(ram_a_2_0_rdata),
    .ram_a_2_0_wdata(ram_a_2_0_wdata),
    .ram_a_2_0_wenable(ram_a_2_0_wenable),
    .ram_a_2_0_enable(ram_a_2_0_enable)
  );

  wire [10-1:0] ram_a_3_0_addr;
  wire [32-1:0] ram_a_3_0_rdata;
  wire [32-1:0] ram_a_3_0_wdata;
  wire ram_a_3_0_wenable;
  wire ram_a_3_0_enable;

  ram_a_3
  inst_ram_a_3
  (
    .CLK(CLK),
    .ram_a_3_0_addr(ram_a_3_0_addr),
    .ram_a_3_0_rdata(ram_a_3_0_rdata),
    .ram_a_3_0_wdata(ram_a_3_0_wdata),
    .ram_a_3_0_wenable(ram_a_3_0_wenable),
    .ram_a_3_0_enable(ram_a_3_0_enable)
  );

  wire [10-1:0] ram_b_0_0_addr;
  wire [32-1:0] ram_b_0_0_rdata;
  wire [32-1:0] ram_b_0_0_wdata;
  wire ram_b_0_0_wenable;
  wire ram_b_0_0_enable;

  ram_b_0
  inst_ram_b_0
  (
    .CLK(CLK),
    .ram_b_0_0_addr(ram_b_0_0_addr),
    .ram_b_0_0_rdata(ram_b_0_0_rdata),
    .ram_b_0_0_wdata(ram_b_0_0_wdata),
    .ram_b_0_0_wenable(ram_b_0_0_wenable),
    .ram_b_0_0_enable(ram_b_0_0_enable)
  );

  wire [10-1:0] ram_b_1_0_addr;
  wire [32-1:0] ram_b_1_0_rdata;
  wire [32-1:0] ram_b_1_0_wdata;
  wire ram_b_1_0_wenable;
  wire ram_b_1_0_enable;

  ram_b_1
  inst_ram_b_1
  (
    .CLK(CLK),
    .ram_b_1_0_addr(ram_b_1_0_addr),
    .ram_b_1_0_rdata(ram_b_1_0_rdata),
    .ram_b_1_0_wdata(ram_b_1_0_wdata),
    .ram_b_1_0_wenable(ram_b_1_0_wenable),
    .ram_b_1_0_enable(ram_b_1_0_enable)
  );

  wire [10-1:0] ram_b_2_0_addr;
  wire [32-1:0] ram_b_2_0_rdata;
  wire [32-1:0] ram_b_2_0_wdata;
  wire ram_b_2_0_wenable;
  wire ram_b_2_0_enable;

  ram_b_2
  inst_ram_b_2
  (
    .CLK(CLK),
    .ram_b_2_0_addr(ram_b_2_0_addr),
    .ram_b_2_0_rdata(ram_b_2_0_rdata),
    .ram_b_2_0_wdata(ram_b_2_0_wdata),
    .ram_b_2_0_wenable(ram_b_2_0_wenable),
    .ram_b_2_0_enable(ram_b_2_0_enable)
  );

  wire [10-1:0] ram_b_3_0_addr;
  wire [32-1:0] ram_b_3_0_rdata;
  wire [32-1:0] ram_b_3_0_wdata;
  wire ram_b_3_0_wenable;
  wire ram_b_3_0_enable;

  ram_b_3
  inst_ram_b_3
  (
    .CLK(CLK),
    .ram_b_3_0_addr(ram_b_3_0_addr),
    .ram_b_3_0_rdata(ram_b_3_0_rdata),
    .ram_b_3_0_wdata(ram_b_3_0_wdata),
    .ram_b_3_0_wenable(ram_b_3_0_wenable),
    .ram_b_3_0_enable(ram_b_3_0_enable)
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
  reg _mystream_a0_idle;
  reg [33-1:0] _mystream_a0_source_count;
  reg [5-1:0] _mystream_a0_source_mode;
  reg [16-1:0] _mystream_a0_source_generator_id;
  reg [32-1:0] _mystream_a0_source_offset;
  reg [33-1:0] _mystream_a0_source_size;
  reg [32-1:0] _mystream_a0_source_stride;
  reg [32-1:0] _mystream_a0_source_offset_buf;
  reg [33-1:0] _mystream_a0_source_size_buf;
  reg [32-1:0] _mystream_a0_source_stride_buf;
  reg [8-1:0] _mystream_a0_source_sel;
  reg [32-1:0] _mystream_a0_source_ram_raddr;
  reg _mystream_a0_source_ram_renable;
  wire [32-1:0] _mystream_a0_source_ram_rdata;
  reg _mystream_a0_source_fifo_deq;
  wire [32-1:0] _mystream_a0_source_fifo_rdata;
  reg [32-1:0] _mystream_a0_source_empty_data;
  reg _mystream_a1_idle;
  reg [33-1:0] _mystream_a1_source_count;
  reg [5-1:0] _mystream_a1_source_mode;
  reg [16-1:0] _mystream_a1_source_generator_id;
  reg [32-1:0] _mystream_a1_source_offset;
  reg [33-1:0] _mystream_a1_source_size;
  reg [32-1:0] _mystream_a1_source_stride;
  reg [32-1:0] _mystream_a1_source_offset_buf;
  reg [33-1:0] _mystream_a1_source_size_buf;
  reg [32-1:0] _mystream_a1_source_stride_buf;
  reg [8-1:0] _mystream_a1_source_sel;
  reg [32-1:0] _mystream_a1_source_ram_raddr;
  reg _mystream_a1_source_ram_renable;
  wire [32-1:0] _mystream_a1_source_ram_rdata;
  reg _mystream_a1_source_fifo_deq;
  wire [32-1:0] _mystream_a1_source_fifo_rdata;
  reg [32-1:0] _mystream_a1_source_empty_data;
  reg _mystream_a2_idle;
  reg [33-1:0] _mystream_a2_source_count;
  reg [5-1:0] _mystream_a2_source_mode;
  reg [16-1:0] _mystream_a2_source_generator_id;
  reg [32-1:0] _mystream_a2_source_offset;
  reg [33-1:0] _mystream_a2_source_size;
  reg [32-1:0] _mystream_a2_source_stride;
  reg [32-1:0] _mystream_a2_source_offset_buf;
  reg [33-1:0] _mystream_a2_source_size_buf;
  reg [32-1:0] _mystream_a2_source_stride_buf;
  reg [8-1:0] _mystream_a2_source_sel;
  reg [32-1:0] _mystream_a2_source_ram_raddr;
  reg _mystream_a2_source_ram_renable;
  wire [32-1:0] _mystream_a2_source_ram_rdata;
  reg _mystream_a2_source_fifo_deq;
  wire [32-1:0] _mystream_a2_source_fifo_rdata;
  reg [32-1:0] _mystream_a2_source_empty_data;
  reg _mystream_a3_idle;
  reg [33-1:0] _mystream_a3_source_count;
  reg [5-1:0] _mystream_a3_source_mode;
  reg [16-1:0] _mystream_a3_source_generator_id;
  reg [32-1:0] _mystream_a3_source_offset;
  reg [33-1:0] _mystream_a3_source_size;
  reg [32-1:0] _mystream_a3_source_stride;
  reg [32-1:0] _mystream_a3_source_offset_buf;
  reg [33-1:0] _mystream_a3_source_size_buf;
  reg [32-1:0] _mystream_a3_source_stride_buf;
  reg [8-1:0] _mystream_a3_source_sel;
  reg [32-1:0] _mystream_a3_source_ram_raddr;
  reg _mystream_a3_source_ram_renable;
  wire [32-1:0] _mystream_a3_source_ram_rdata;
  reg _mystream_a3_source_fifo_deq;
  wire [32-1:0] _mystream_a3_source_fifo_rdata;
  reg [32-1:0] _mystream_a3_source_empty_data;
  reg _mystream_b0_idle;
  reg [33-1:0] _mystream_b0_source_count;
  reg [5-1:0] _mystream_b0_source_mode;
  reg [16-1:0] _mystream_b0_source_generator_id;
  reg [32-1:0] _mystream_b0_source_offset;
  reg [33-1:0] _mystream_b0_source_size;
  reg [32-1:0] _mystream_b0_source_stride;
  reg [32-1:0] _mystream_b0_source_offset_buf;
  reg [33-1:0] _mystream_b0_source_size_buf;
  reg [32-1:0] _mystream_b0_source_stride_buf;
  reg [8-1:0] _mystream_b0_source_sel;
  reg [32-1:0] _mystream_b0_source_ram_raddr;
  reg _mystream_b0_source_ram_renable;
  wire [32-1:0] _mystream_b0_source_ram_rdata;
  reg _mystream_b0_source_fifo_deq;
  wire [32-1:0] _mystream_b0_source_fifo_rdata;
  reg [32-1:0] _mystream_b0_source_empty_data;
  reg _mystream_b1_idle;
  reg [33-1:0] _mystream_b1_source_count;
  reg [5-1:0] _mystream_b1_source_mode;
  reg [16-1:0] _mystream_b1_source_generator_id;
  reg [32-1:0] _mystream_b1_source_offset;
  reg [33-1:0] _mystream_b1_source_size;
  reg [32-1:0] _mystream_b1_source_stride;
  reg [32-1:0] _mystream_b1_source_offset_buf;
  reg [33-1:0] _mystream_b1_source_size_buf;
  reg [32-1:0] _mystream_b1_source_stride_buf;
  reg [8-1:0] _mystream_b1_source_sel;
  reg [32-1:0] _mystream_b1_source_ram_raddr;
  reg _mystream_b1_source_ram_renable;
  wire [32-1:0] _mystream_b1_source_ram_rdata;
  reg _mystream_b1_source_fifo_deq;
  wire [32-1:0] _mystream_b1_source_fifo_rdata;
  reg [32-1:0] _mystream_b1_source_empty_data;
  reg _mystream_b2_idle;
  reg [33-1:0] _mystream_b2_source_count;
  reg [5-1:0] _mystream_b2_source_mode;
  reg [16-1:0] _mystream_b2_source_generator_id;
  reg [32-1:0] _mystream_b2_source_offset;
  reg [33-1:0] _mystream_b2_source_size;
  reg [32-1:0] _mystream_b2_source_stride;
  reg [32-1:0] _mystream_b2_source_offset_buf;
  reg [33-1:0] _mystream_b2_source_size_buf;
  reg [32-1:0] _mystream_b2_source_stride_buf;
  reg [8-1:0] _mystream_b2_source_sel;
  reg [32-1:0] _mystream_b2_source_ram_raddr;
  reg _mystream_b2_source_ram_renable;
  wire [32-1:0] _mystream_b2_source_ram_rdata;
  reg _mystream_b2_source_fifo_deq;
  wire [32-1:0] _mystream_b2_source_fifo_rdata;
  reg [32-1:0] _mystream_b2_source_empty_data;
  reg _mystream_b3_idle;
  reg [33-1:0] _mystream_b3_source_count;
  reg [5-1:0] _mystream_b3_source_mode;
  reg [16-1:0] _mystream_b3_source_generator_id;
  reg [32-1:0] _mystream_b3_source_offset;
  reg [33-1:0] _mystream_b3_source_size;
  reg [32-1:0] _mystream_b3_source_stride;
  reg [32-1:0] _mystream_b3_source_offset_buf;
  reg [33-1:0] _mystream_b3_source_size_buf;
  reg [32-1:0] _mystream_b3_source_stride_buf;
  reg [8-1:0] _mystream_b3_source_sel;
  reg [32-1:0] _mystream_b3_source_ram_raddr;
  reg _mystream_b3_source_ram_renable;
  wire [32-1:0] _mystream_b3_source_ram_rdata;
  reg _mystream_b3_source_fifo_deq;
  wire [32-1:0] _mystream_b3_source_fifo_rdata;
  reg [32-1:0] _mystream_b3_source_empty_data;
  reg _mystream_bias0_idle;
  reg [33-1:0] _mystream_bias0_source_count;
  reg [5-1:0] _mystream_bias0_source_mode;
  reg [16-1:0] _mystream_bias0_source_generator_id;
  reg [32-1:0] _mystream_bias0_source_offset;
  reg [33-1:0] _mystream_bias0_source_size;
  reg [32-1:0] _mystream_bias0_source_stride;
  reg [32-1:0] _mystream_bias0_source_offset_buf;
  reg [33-1:0] _mystream_bias0_source_size_buf;
  reg [32-1:0] _mystream_bias0_source_stride_buf;
  reg [8-1:0] _mystream_bias0_source_sel;
  reg [32-1:0] _mystream_bias0_source_ram_raddr;
  reg _mystream_bias0_source_ram_renable;
  wire [32-1:0] _mystream_bias0_source_ram_rdata;
  reg _mystream_bias0_source_fifo_deq;
  wire [32-1:0] _mystream_bias0_source_fifo_rdata;
  reg [32-1:0] _mystream_bias0_source_empty_data;
  reg _mystream_bias1_idle;
  reg [33-1:0] _mystream_bias1_source_count;
  reg [5-1:0] _mystream_bias1_source_mode;
  reg [16-1:0] _mystream_bias1_source_generator_id;
  reg [32-1:0] _mystream_bias1_source_offset;
  reg [33-1:0] _mystream_bias1_source_size;
  reg [32-1:0] _mystream_bias1_source_stride;
  reg [32-1:0] _mystream_bias1_source_offset_buf;
  reg [33-1:0] _mystream_bias1_source_size_buf;
  reg [32-1:0] _mystream_bias1_source_stride_buf;
  reg [8-1:0] _mystream_bias1_source_sel;
  reg [32-1:0] _mystream_bias1_source_ram_raddr;
  reg _mystream_bias1_source_ram_renable;
  wire [32-1:0] _mystream_bias1_source_ram_rdata;
  reg _mystream_bias1_source_fifo_deq;
  wire [32-1:0] _mystream_bias1_source_fifo_rdata;
  reg [32-1:0] _mystream_bias1_source_empty_data;
  reg _mystream_bias2_idle;
  reg [33-1:0] _mystream_bias2_source_count;
  reg [5-1:0] _mystream_bias2_source_mode;
  reg [16-1:0] _mystream_bias2_source_generator_id;
  reg [32-1:0] _mystream_bias2_source_offset;
  reg [33-1:0] _mystream_bias2_source_size;
  reg [32-1:0] _mystream_bias2_source_stride;
  reg [32-1:0] _mystream_bias2_source_offset_buf;
  reg [33-1:0] _mystream_bias2_source_size_buf;
  reg [32-1:0] _mystream_bias2_source_stride_buf;
  reg [8-1:0] _mystream_bias2_source_sel;
  reg [32-1:0] _mystream_bias2_source_ram_raddr;
  reg _mystream_bias2_source_ram_renable;
  wire [32-1:0] _mystream_bias2_source_ram_rdata;
  reg _mystream_bias2_source_fifo_deq;
  wire [32-1:0] _mystream_bias2_source_fifo_rdata;
  reg [32-1:0] _mystream_bias2_source_empty_data;
  reg _mystream_bias3_idle;
  reg [33-1:0] _mystream_bias3_source_count;
  reg [5-1:0] _mystream_bias3_source_mode;
  reg [16-1:0] _mystream_bias3_source_generator_id;
  reg [32-1:0] _mystream_bias3_source_offset;
  reg [33-1:0] _mystream_bias3_source_size;
  reg [32-1:0] _mystream_bias3_source_stride;
  reg [32-1:0] _mystream_bias3_source_offset_buf;
  reg [33-1:0] _mystream_bias3_source_size_buf;
  reg [32-1:0] _mystream_bias3_source_stride_buf;
  reg [8-1:0] _mystream_bias3_source_sel;
  reg [32-1:0] _mystream_bias3_source_ram_raddr;
  reg _mystream_bias3_source_ram_renable;
  wire [32-1:0] _mystream_bias3_source_ram_rdata;
  reg _mystream_bias3_source_fifo_deq;
  wire [32-1:0] _mystream_bias3_source_fifo_rdata;
  reg [32-1:0] _mystream_bias3_source_empty_data;
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
  reg [33-1:0] _mystream_sum_valid_sink_count;
  reg [5-1:0] _mystream_sum_valid_sink_mode;
  reg [16-1:0] _mystream_sum_valid_sink_generator_id;
  reg [32-1:0] _mystream_sum_valid_sink_offset;
  reg [33-1:0] _mystream_sum_valid_sink_size;
  reg [32-1:0] _mystream_sum_valid_sink_stride;
  reg [32-1:0] _mystream_sum_valid_sink_offset_buf;
  reg [33-1:0] _mystream_sum_valid_sink_size_buf;
  reg [32-1:0] _mystream_sum_valid_sink_stride_buf;
  reg [8-1:0] _mystream_sum_valid_sink_sel;
  reg [32-1:0] _mystream_sum_valid_sink_waddr;
  reg _mystream_sum_valid_sink_wenable;
  reg [1-1:0] _mystream_sum_valid_sink_wdata;
  reg _mystream_sum_valid_sink_fifo_enq;
  reg [1-1:0] _mystream_sum_valid_sink_fifo_wdata;
  reg [1-1:0] _mystream_sum_valid_sink_immediate;
  reg [32-1:0] counter;
  reg [32-1:0] th_comp;
  localparam th_comp_init = 0;
  reg signed [32-1:0] _th_comp_size_0;
  reg signed [32-1:0] _th_comp_offset_1;
  wire [32-1:0] mask_addr_shifted_11;
  assign mask_addr_shifted_11 = 0;
  wire [32-1:0] mask_addr_masked_12;
  assign mask_addr_masked_12 = mask_addr_shifted_11 << 2;
  reg [32-1:0] _myaxi_read_req_fsm;
  localparam _myaxi_read_req_fsm_init = 0;
  reg [33-1:0] _myaxi_read_cur_global_size;
  reg _myaxi_read_cont;
  wire [8-1:0] pack_read_req_op_sel_13;
  wire [32-1:0] pack_read_req_local_addr_14;
  wire [32-1:0] pack_read_req_local_stride_15;
  wire [33-1:0] pack_read_req_local_size_16;
  wire [32-1:0] pack_read_req_local_blocksize_17;
  assign pack_read_req_op_sel_13 = _myaxi_read_op_sel;
  assign pack_read_req_local_addr_14 = _myaxi_read_local_addr;
  assign pack_read_req_local_stride_15 = _myaxi_read_local_stride;
  assign pack_read_req_local_size_16 = _myaxi_read_local_size;
  assign pack_read_req_local_blocksize_17 = _myaxi_read_local_blocksize;
  wire [137-1:0] pack_read_req_packed_18;
  assign pack_read_req_packed_18 = { pack_read_req_op_sel_13, pack_read_req_local_addr_14, pack_read_req_local_stride_15, pack_read_req_local_size_16, pack_read_req_local_blocksize_17 };
  assign _myaxi_read_req_fifo_wdata = ((_myaxi_read_req_fsm == 0) && _myaxi_read_start && !_myaxi_read_req_fifo_almost_full)? pack_read_req_packed_18 : 'hx;
  assign _myaxi_read_req_fifo_enq = ((_myaxi_read_req_fsm == 0) && _myaxi_read_start && !_myaxi_read_req_fifo_almost_full)? (_myaxi_read_req_fsm == 0) && _myaxi_read_start && !_myaxi_read_req_fifo_almost_full && !_myaxi_read_req_fifo_almost_full : 0;
  localparam _tmp_19 = 1;
  wire [_tmp_19-1:0] _tmp_20;
  assign _tmp_20 = !_myaxi_read_req_fifo_almost_full;
  reg [_tmp_19-1:0] __tmp_20_1;
  wire [32-1:0] mask_addr_shifted_21;
  assign mask_addr_shifted_21 = _myaxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_22;
  assign mask_addr_masked_22 = mask_addr_shifted_21 << 2;
  wire [32-1:0] mask_addr_shifted_23;
  assign mask_addr_shifted_23 = _myaxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_24;
  assign mask_addr_masked_24 = mask_addr_shifted_23 << 2;
  wire [32-1:0] mask_addr_shifted_25;
  assign mask_addr_shifted_25 = _myaxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_26;
  assign mask_addr_masked_26 = mask_addr_shifted_25 << 2;
  wire [32-1:0] mask_addr_shifted_27;
  assign mask_addr_shifted_27 = _myaxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_28;
  assign mask_addr_masked_28 = mask_addr_shifted_27 << 2;
  wire [32-1:0] mask_addr_shifted_29;
  assign mask_addr_shifted_29 = _myaxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_30;
  assign mask_addr_masked_30 = mask_addr_shifted_29 << 2;
  wire [32-1:0] mask_addr_shifted_31;
  assign mask_addr_shifted_31 = _myaxi_read_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_32;
  assign mask_addr_masked_32 = mask_addr_shifted_31 << 2;
  reg _myaxi_cond_0_1;
  reg [32-1:0] _myaxi_read_data_fsm;
  localparam _myaxi_read_data_fsm_init = 0;
  reg [32-1:0] write_burst_fsm_0;
  localparam write_burst_fsm_0_init = 0;
  reg [12-1:0] write_burst_addr_33;
  reg [12-1:0] write_burst_stride_34;
  reg [33-1:0] write_burst_length_35;
  reg write_burst_done_36;
  wire [2-1:0] write_rtl_bank_37;
  assign write_rtl_bank_37 = write_burst_addr_33;
  assign ram_a_0_0_wdata = ((write_burst_fsm_0 == 1) && myaxi_rvalid && (write_rtl_bank_37 == 0))? myaxi_rdata : 'hx;
  assign ram_a_0_0_wenable = ((write_burst_fsm_0 == 1) && myaxi_rvalid && (write_rtl_bank_37 == 0))? 1'd1 : 0;
  assign ram_a_1_0_wdata = ((write_burst_fsm_0 == 1) && myaxi_rvalid && (write_rtl_bank_37 == 1))? myaxi_rdata : 'hx;
  assign ram_a_1_0_wenable = ((write_burst_fsm_0 == 1) && myaxi_rvalid && (write_rtl_bank_37 == 1))? 1'd1 : 0;
  assign ram_a_2_0_wdata = ((write_burst_fsm_0 == 1) && myaxi_rvalid && (write_rtl_bank_37 == 2))? myaxi_rdata : 'hx;
  assign ram_a_2_0_wenable = ((write_burst_fsm_0 == 1) && myaxi_rvalid && (write_rtl_bank_37 == 2))? 1'd1 : 0;
  assign ram_a_3_0_wdata = ((write_burst_fsm_0 == 1) && myaxi_rvalid && (write_rtl_bank_37 == 3))? myaxi_rdata : 'hx;
  assign ram_a_3_0_wenable = ((write_burst_fsm_0 == 1) && myaxi_rvalid && (write_rtl_bank_37 == 3))? 1'd1 : 0;
  wire [32-1:0] mask_addr_shifted_38;
  assign mask_addr_shifted_38 = 128;
  wire [32-1:0] mask_addr_masked_39;
  assign mask_addr_masked_39 = mask_addr_shifted_38 << 2;
  reg [32-1:0] write_burst_fsm_1;
  localparam write_burst_fsm_1_init = 0;
  reg [12-1:0] write_burst_addr_40;
  reg [12-1:0] write_burst_stride_41;
  reg [33-1:0] write_burst_length_42;
  reg write_burst_done_43;
  wire [2-1:0] write_rtl_bank_44;
  assign write_rtl_bank_44 = write_burst_addr_40;
  assign ram_b_0_0_wdata = ((write_burst_fsm_1 == 1) && myaxi_rvalid && (write_rtl_bank_44 == 0))? myaxi_rdata : 'hx;
  assign ram_b_0_0_wenable = ((write_burst_fsm_1 == 1) && myaxi_rvalid && (write_rtl_bank_44 == 0))? 1'd1 : 0;
  assign ram_b_1_0_wdata = ((write_burst_fsm_1 == 1) && myaxi_rvalid && (write_rtl_bank_44 == 1))? myaxi_rdata : 'hx;
  assign ram_b_1_0_wenable = ((write_burst_fsm_1 == 1) && myaxi_rvalid && (write_rtl_bank_44 == 1))? 1'd1 : 0;
  assign ram_b_2_0_wdata = ((write_burst_fsm_1 == 1) && myaxi_rvalid && (write_rtl_bank_44 == 2))? myaxi_rdata : 'hx;
  assign ram_b_2_0_wenable = ((write_burst_fsm_1 == 1) && myaxi_rvalid && (write_rtl_bank_44 == 2))? 1'd1 : 0;
  assign ram_b_3_0_wdata = ((write_burst_fsm_1 == 1) && myaxi_rvalid && (write_rtl_bank_44 == 3))? myaxi_rdata : 'hx;
  assign ram_b_3_0_wenable = ((write_burst_fsm_1 == 1) && myaxi_rvalid && (write_rtl_bank_44 == 3))? 1'd1 : 0;
  reg signed [32-1:0] _th_comp_size_2;
  reg signed [32-1:0] _th_comp_offset_3;
  reg signed [32-1:0] _th_comp_start_time_4;
  wire signed [32-1:0] mystream_size_data;
  wire signed [32-1:0] mystream_a0_data;
  wire signed [32-1:0] mystream_a1_data;
  wire signed [32-1:0] mystream_a2_data;
  wire signed [32-1:0] mystream_a3_data;
  wire signed [32-1:0] mystream_b0_data;
  wire signed [32-1:0] mystream_b1_data;
  wire signed [32-1:0] mystream_b2_data;
  wire signed [32-1:0] mystream_b3_data;
  wire signed [32-1:0] mystream_bias0_data;
  wire signed [32-1:0] mystream_bias1_data;
  wire signed [32-1:0] mystream_bias2_data;
  wire signed [32-1:0] mystream_bias3_data;
  wire [1-1:0] mystream__reduce_reset_data;
  reg __mystream_stream_ivalid_1;
  reg __mystream_stream_ivalid_2;
  reg __mystream_stream_ivalid_3;
  reg signed [32-1:0] _plus_data_13;
  reg signed [32-1:0] _plus_data_14;
  reg signed [32-1:0] _plus_data_15;
  reg signed [32-1:0] _plus_data_16;
  reg signed [32-1:0] __delay_data_23__variable_0;
  reg [1-1:0] __delay_data_25__variable_18;
  reg signed [32-1:0] __plusn_data_17;
  reg signed [32-1:0] __delay_data_24__delay_23__variable_0;
  reg [1-1:0] __delay_data_26__delay_25__variable_18;
  reg signed [32-1:0] _reduceadd_data_19;
  reg [33-1:0] _reduceadd_count_19;
  reg _reduceadd_prev_count_max_19;
  wire _reduceadd_reset_cond_19;
  assign _reduceadd_reset_cond_19 = __delay_data_26__delay_25__variable_18 || _reduceadd_prev_count_max_19;
  wire [33-1:0] _reduceadd_current_count_19;
  assign _reduceadd_current_count_19 = (_reduceadd_reset_cond_19)? 0 : _reduceadd_count_19;
  wire signed [32-1:0] _reduceadd_current_data_19;
  assign _reduceadd_current_data_19 = (_reduceadd_reset_cond_19)? 1'sd0 : _reduceadd_data_19;
  reg [1-1:0] _pulse_data_21;
  reg [33-1:0] _pulse_count_21;
  reg _pulse_prev_count_max_21;
  wire _pulse_reset_cond_21;
  assign _pulse_reset_cond_21 = __delay_data_26__delay_25__variable_18 || _pulse_prev_count_max_21;
  wire [33-1:0] _pulse_current_count_21;
  assign _pulse_current_count_21 = (_pulse_reset_cond_21)? 0 : _pulse_count_21;
  wire [1-1:0] _pulse_current_data_21;
  assign _pulse_current_data_21 = (_pulse_reset_cond_21)? 1'sd0 : _pulse_data_21;
  wire signed [32-1:0] mystream_sum_data;
  assign mystream_sum_data = _reduceadd_data_19;
  wire [1-1:0] mystream_sum_valid_data;
  assign mystream_sum_valid_data = _pulse_data_21;
  wire _set_flag_45;
  assign _set_flag_45 = th_comp == 8;
  reg signed [32-1:0] __variable_wdata_0;
  assign mystream_size_data = __variable_wdata_0;
  wire _set_flag_46;
  assign _set_flag_46 = th_comp == 9;
  assign ram_a_0_0_addr = (_mystream_stream_oready && _mystream_a0_source_ram_renable && (_mystream_a0_source_sel == 1))? _mystream_a0_source_ram_raddr : 
                          ((write_burst_fsm_0 == 1) && myaxi_rvalid && (write_rtl_bank_37 == 0))? write_burst_addr_33 >> 2 : 'hx;
  assign ram_a_0_0_enable = (_mystream_stream_oready && _mystream_a0_source_ram_renable && (_mystream_a0_source_sel == 1))? 1'd1 : 
                            ((write_burst_fsm_0 == 1) && myaxi_rvalid && (write_rtl_bank_37 == 0))? 1'd1 : 0;
  localparam _tmp_47 = 1;
  wire [_tmp_47-1:0] _tmp_48;
  assign _tmp_48 = _mystream_stream_oready && _mystream_a0_source_ram_renable && (_mystream_a0_source_sel == 1);
  reg [_tmp_47-1:0] __tmp_48_1;
  assign _mystream_a0_source_ram_rdata = (_mystream_a0_source_sel == 1)? ram_a_0_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_1;
  assign mystream_a0_data = __variable_wdata_1;
  reg [32-1:0] _mystream_a0_source_fsm_0;
  localparam _mystream_a0_source_fsm_0_init = 0;
  wire _set_flag_49;
  assign _set_flag_49 = th_comp == 10;
  assign ram_a_1_0_addr = (_mystream_stream_oready && _mystream_a1_source_ram_renable && (_mystream_a1_source_sel == 2))? _mystream_a1_source_ram_raddr : 
                          ((write_burst_fsm_0 == 1) && myaxi_rvalid && (write_rtl_bank_37 == 1))? write_burst_addr_33 >> 2 : 'hx;
  assign ram_a_1_0_enable = (_mystream_stream_oready && _mystream_a1_source_ram_renable && (_mystream_a1_source_sel == 2))? 1'd1 : 
                            ((write_burst_fsm_0 == 1) && myaxi_rvalid && (write_rtl_bank_37 == 1))? 1'd1 : 0;
  localparam _tmp_50 = 1;
  wire [_tmp_50-1:0] _tmp_51;
  assign _tmp_51 = _mystream_stream_oready && _mystream_a1_source_ram_renable && (_mystream_a1_source_sel == 2);
  reg [_tmp_50-1:0] __tmp_51_1;
  assign _mystream_a1_source_ram_rdata = (_mystream_a1_source_sel == 2)? ram_a_1_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_2;
  assign mystream_a1_data = __variable_wdata_2;
  reg [32-1:0] _mystream_a1_source_fsm_1;
  localparam _mystream_a1_source_fsm_1_init = 0;
  wire _set_flag_52;
  assign _set_flag_52 = th_comp == 11;
  assign ram_a_2_0_addr = (_mystream_stream_oready && _mystream_a2_source_ram_renable && (_mystream_a2_source_sel == 3))? _mystream_a2_source_ram_raddr : 
                          ((write_burst_fsm_0 == 1) && myaxi_rvalid && (write_rtl_bank_37 == 2))? write_burst_addr_33 >> 2 : 'hx;
  assign ram_a_2_0_enable = (_mystream_stream_oready && _mystream_a2_source_ram_renable && (_mystream_a2_source_sel == 3))? 1'd1 : 
                            ((write_burst_fsm_0 == 1) && myaxi_rvalid && (write_rtl_bank_37 == 2))? 1'd1 : 0;
  localparam _tmp_53 = 1;
  wire [_tmp_53-1:0] _tmp_54;
  assign _tmp_54 = _mystream_stream_oready && _mystream_a2_source_ram_renable && (_mystream_a2_source_sel == 3);
  reg [_tmp_53-1:0] __tmp_54_1;
  assign _mystream_a2_source_ram_rdata = (_mystream_a2_source_sel == 3)? ram_a_2_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_3;
  assign mystream_a2_data = __variable_wdata_3;
  reg [32-1:0] _mystream_a2_source_fsm_2;
  localparam _mystream_a2_source_fsm_2_init = 0;
  wire _set_flag_55;
  assign _set_flag_55 = th_comp == 12;
  assign ram_a_3_0_addr = (_mystream_stream_oready && _mystream_a3_source_ram_renable && (_mystream_a3_source_sel == 4))? _mystream_a3_source_ram_raddr : 
                          ((write_burst_fsm_0 == 1) && myaxi_rvalid && (write_rtl_bank_37 == 3))? write_burst_addr_33 >> 2 : 'hx;
  assign ram_a_3_0_enable = (_mystream_stream_oready && _mystream_a3_source_ram_renable && (_mystream_a3_source_sel == 4))? 1'd1 : 
                            ((write_burst_fsm_0 == 1) && myaxi_rvalid && (write_rtl_bank_37 == 3))? 1'd1 : 0;
  localparam _tmp_56 = 1;
  wire [_tmp_56-1:0] _tmp_57;
  assign _tmp_57 = _mystream_stream_oready && _mystream_a3_source_ram_renable && (_mystream_a3_source_sel == 4);
  reg [_tmp_56-1:0] __tmp_57_1;
  assign _mystream_a3_source_ram_rdata = (_mystream_a3_source_sel == 4)? ram_a_3_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_4;
  assign mystream_a3_data = __variable_wdata_4;
  reg [32-1:0] _mystream_a3_source_fsm_3;
  localparam _mystream_a3_source_fsm_3_init = 0;
  wire _set_flag_58;
  assign _set_flag_58 = th_comp == 14;
  assign ram_b_0_0_addr = (_mystream_stream_oready && _mystream_b0_source_ram_renable && (_mystream_b0_source_sel == 5))? _mystream_b0_source_ram_raddr : 
                          ((write_burst_fsm_1 == 1) && myaxi_rvalid && (write_rtl_bank_44 == 0))? write_burst_addr_40 >> 2 : 'hx;
  assign ram_b_0_0_enable = (_mystream_stream_oready && _mystream_b0_source_ram_renable && (_mystream_b0_source_sel == 5))? 1'd1 : 
                            ((write_burst_fsm_1 == 1) && myaxi_rvalid && (write_rtl_bank_44 == 0))? 1'd1 : 0;
  localparam _tmp_59 = 1;
  wire [_tmp_59-1:0] _tmp_60;
  assign _tmp_60 = _mystream_stream_oready && _mystream_b0_source_ram_renable && (_mystream_b0_source_sel == 5);
  reg [_tmp_59-1:0] __tmp_60_1;
  assign _mystream_b0_source_ram_rdata = (_mystream_b0_source_sel == 5)? ram_b_0_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_5;
  assign mystream_b0_data = __variable_wdata_5;
  reg [32-1:0] _mystream_b0_source_fsm_4;
  localparam _mystream_b0_source_fsm_4_init = 0;
  wire _set_flag_61;
  assign _set_flag_61 = th_comp == 15;
  assign ram_b_1_0_addr = (_mystream_stream_oready && _mystream_b1_source_ram_renable && (_mystream_b1_source_sel == 6))? _mystream_b1_source_ram_raddr : 
                          ((write_burst_fsm_1 == 1) && myaxi_rvalid && (write_rtl_bank_44 == 1))? write_burst_addr_40 >> 2 : 'hx;
  assign ram_b_1_0_enable = (_mystream_stream_oready && _mystream_b1_source_ram_renable && (_mystream_b1_source_sel == 6))? 1'd1 : 
                            ((write_burst_fsm_1 == 1) && myaxi_rvalid && (write_rtl_bank_44 == 1))? 1'd1 : 0;
  localparam _tmp_62 = 1;
  wire [_tmp_62-1:0] _tmp_63;
  assign _tmp_63 = _mystream_stream_oready && _mystream_b1_source_ram_renable && (_mystream_b1_source_sel == 6);
  reg [_tmp_62-1:0] __tmp_63_1;
  assign _mystream_b1_source_ram_rdata = (_mystream_b1_source_sel == 6)? ram_b_1_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_6;
  assign mystream_b1_data = __variable_wdata_6;
  reg [32-1:0] _mystream_b1_source_fsm_5;
  localparam _mystream_b1_source_fsm_5_init = 0;
  wire _set_flag_64;
  assign _set_flag_64 = th_comp == 16;
  assign ram_b_2_0_addr = (_mystream_stream_oready && _mystream_b2_source_ram_renable && (_mystream_b2_source_sel == 7))? _mystream_b2_source_ram_raddr : 
                          ((write_burst_fsm_1 == 1) && myaxi_rvalid && (write_rtl_bank_44 == 2))? write_burst_addr_40 >> 2 : 'hx;
  assign ram_b_2_0_enable = (_mystream_stream_oready && _mystream_b2_source_ram_renable && (_mystream_b2_source_sel == 7))? 1'd1 : 
                            ((write_burst_fsm_1 == 1) && myaxi_rvalid && (write_rtl_bank_44 == 2))? 1'd1 : 0;
  localparam _tmp_65 = 1;
  wire [_tmp_65-1:0] _tmp_66;
  assign _tmp_66 = _mystream_stream_oready && _mystream_b2_source_ram_renable && (_mystream_b2_source_sel == 7);
  reg [_tmp_65-1:0] __tmp_66_1;
  assign _mystream_b2_source_ram_rdata = (_mystream_b2_source_sel == 7)? ram_b_2_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_7;
  assign mystream_b2_data = __variable_wdata_7;
  reg [32-1:0] _mystream_b2_source_fsm_6;
  localparam _mystream_b2_source_fsm_6_init = 0;
  wire _set_flag_67;
  assign _set_flag_67 = th_comp == 17;
  assign ram_b_3_0_addr = (_mystream_stream_oready && _mystream_b3_source_ram_renable && (_mystream_b3_source_sel == 8))? _mystream_b3_source_ram_raddr : 
                          ((write_burst_fsm_1 == 1) && myaxi_rvalid && (write_rtl_bank_44 == 3))? write_burst_addr_40 >> 2 : 'hx;
  assign ram_b_3_0_enable = (_mystream_stream_oready && _mystream_b3_source_ram_renable && (_mystream_b3_source_sel == 8))? 1'd1 : 
                            ((write_burst_fsm_1 == 1) && myaxi_rvalid && (write_rtl_bank_44 == 3))? 1'd1 : 0;
  localparam _tmp_68 = 1;
  wire [_tmp_68-1:0] _tmp_69;
  assign _tmp_69 = _mystream_stream_oready && _mystream_b3_source_ram_renable && (_mystream_b3_source_sel == 8);
  reg [_tmp_68-1:0] __tmp_69_1;
  assign _mystream_b3_source_ram_rdata = (_mystream_b3_source_sel == 8)? ram_b_3_0_rdata : 'hx;
  reg signed [32-1:0] __variable_wdata_8;
  assign mystream_b3_data = __variable_wdata_8;
  reg [32-1:0] _mystream_b3_source_fsm_7;
  localparam _mystream_b3_source_fsm_7_init = 0;
  wire _set_flag_70;
  assign _set_flag_70 = th_comp == 18;
  reg _tmp_71;
  reg _tmp_72;
  reg _tmp_73;
  reg _tmp_74;
  reg _tmp_75;
  reg signed [32-1:0] _tmp_76;
  reg signed [32-1:0] _tmp_77;
  reg signed [32-1:0] _tmp_78;
  reg signed [32-1:0] _tmp_79;
  reg signed [32-1:0] _tmp_80;
  reg [32-1:0] _mystream_sum_sink_fsm_8;
  localparam _mystream_sum_sink_fsm_8_init = 0;
  wire _set_flag_81;
  assign _set_flag_81 = th_comp == 19;
  assign _mystream_run_flag = (_set_flag_81)? 1 : 0;
  reg _tmp_82;
  reg _tmp_83;
  reg _tmp_84;
  reg _tmp_85;
  reg _tmp_86;
  reg _tmp_87;
  reg [1-1:0] __variable_wdata_18;
  assign mystream__reduce_reset_data = __variable_wdata_18;
  reg _tmp_88;
  reg _tmp_89;
  reg _tmp_90;
  reg _tmp_91;
  assign _mystream_source_stop = _mystream_stream_oready && (_mystream_a0_idle && _mystream_a1_idle && _mystream_a2_idle && _mystream_a3_idle && _mystream_b0_idle && _mystream_b1_idle && _mystream_b2_idle && _mystream_b3_idle && _mystream_bias0_idle && _mystream_bias1_idle && _mystream_bias2_idle && _mystream_bias3_idle && (_mystream_fsm == 3));
  localparam _tmp_92 = 1;
  wire [_tmp_92-1:0] _tmp_93;
  assign _tmp_93 = _mystream_a0_idle && _mystream_a1_idle && _mystream_a2_idle && _mystream_a3_idle && _mystream_b0_idle && _mystream_b1_idle && _mystream_b2_idle && _mystream_b3_idle && _mystream_bias0_idle && _mystream_bias1_idle && _mystream_bias2_idle && _mystream_bias3_idle && (_mystream_fsm == 3);
  reg [_tmp_92-1:0] _tmp_94;
  localparam _tmp_95 = 1;
  wire [_tmp_95-1:0] _tmp_96;
  assign _tmp_96 = _mystream_a0_idle && _mystream_a1_idle && _mystream_a2_idle && _mystream_a3_idle && _mystream_b0_idle && _mystream_b1_idle && _mystream_b2_idle && _mystream_b3_idle && _mystream_bias0_idle && _mystream_bias1_idle && _mystream_bias2_idle && _mystream_bias3_idle && (_mystream_fsm == 3);
  reg [_tmp_95-1:0] _tmp_97;
  reg _tmp_98;
  reg _tmp_99;
  reg _tmp_100;
  reg _tmp_101;
  reg _tmp_102;
  assign _mystream_sink_start = _tmp_102;
  reg _tmp_103;
  reg _tmp_104;
  reg _tmp_105;
  reg _tmp_106;
  reg _tmp_107;
  assign _mystream_sink_stop = _tmp_107;
  reg _tmp_108;
  reg _tmp_109;
  reg _tmp_110;
  reg _tmp_111;
  reg _tmp_112;
  assign _mystream_sink_busy = _tmp_112;
  reg _tmp_113;
  assign _mystream_busy = _mystream_source_busy || _mystream_sink_busy || _mystream_busy_reg;
  reg signed [32-1:0] _th_comp_end_time_5;
  reg signed [32-1:0] _th_comp_exec_time_6;
  wire [32-1:0] mask_addr_shifted_114;
  assign mask_addr_shifted_114 = 256;
  wire [32-1:0] mask_addr_masked_115;
  assign mask_addr_masked_115 = mask_addr_shifted_114 << 2;
  reg [32-1:0] _myaxi_write_req_fsm;
  localparam _myaxi_write_req_fsm_init = 0;
  reg [33-1:0] _myaxi_write_cur_global_size;
  reg _myaxi_write_cont;
  wire [8-1:0] pack_write_req_op_sel_116;
  wire [32-1:0] pack_write_req_local_addr_117;
  wire [32-1:0] pack_write_req_local_stride_118;
  wire [33-1:0] pack_write_req_size_119;
  wire [32-1:0] pack_write_req_local_blocksize_120;
  assign pack_write_req_op_sel_116 = _myaxi_write_op_sel;
  assign pack_write_req_local_addr_117 = _myaxi_write_local_addr;
  assign pack_write_req_local_stride_118 = _myaxi_write_local_stride;
  assign pack_write_req_size_119 = _myaxi_write_local_size;
  assign pack_write_req_local_blocksize_120 = _myaxi_write_local_blocksize;
  wire [137-1:0] pack_write_req_packed_121;
  assign pack_write_req_packed_121 = { pack_write_req_op_sel_116, pack_write_req_local_addr_117, pack_write_req_local_stride_118, pack_write_req_size_119, pack_write_req_local_blocksize_120 };
  localparam _tmp_122 = 1;
  wire [_tmp_122-1:0] _tmp_123;
  assign _tmp_123 = !_myaxi_write_req_fifo_almost_full;
  reg [_tmp_122-1:0] __tmp_123_1;
  wire [32-1:0] mask_addr_shifted_124;
  assign mask_addr_shifted_124 = _myaxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_125;
  assign mask_addr_masked_125 = mask_addr_shifted_124 << 2;
  wire [32-1:0] mask_addr_shifted_126;
  assign mask_addr_shifted_126 = _myaxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_127;
  assign mask_addr_masked_127 = mask_addr_shifted_126 << 2;
  wire [32-1:0] mask_addr_shifted_128;
  assign mask_addr_shifted_128 = _myaxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_129;
  assign mask_addr_masked_129 = mask_addr_shifted_128 << 2;
  wire [32-1:0] mask_addr_shifted_130;
  assign mask_addr_shifted_130 = _myaxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_131;
  assign mask_addr_masked_131 = mask_addr_shifted_130 << 2;
  wire [32-1:0] mask_addr_shifted_132;
  assign mask_addr_shifted_132 = _myaxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_133;
  assign mask_addr_masked_133 = mask_addr_shifted_132 << 2;
  wire [32-1:0] mask_addr_shifted_134;
  assign mask_addr_shifted_134 = _myaxi_write_global_addr >> 2;
  wire [32-1:0] mask_addr_masked_135;
  assign mask_addr_masked_135 = mask_addr_shifted_134 << 2;
  wire [8-1:0] pack_write_req_op_sel_136;
  wire [32-1:0] pack_write_req_local_addr_137;
  wire [32-1:0] pack_write_req_local_stride_138;
  wire [33-1:0] pack_write_req_size_139;
  wire [32-1:0] pack_write_req_local_blocksize_140;
  assign pack_write_req_op_sel_136 = _myaxi_write_op_sel;
  assign pack_write_req_local_addr_137 = _myaxi_write_local_addr;
  assign pack_write_req_local_stride_138 = _myaxi_write_local_stride;
  assign pack_write_req_size_139 = _myaxi_write_cur_global_size;
  assign pack_write_req_local_blocksize_140 = _myaxi_write_local_blocksize;
  wire [137-1:0] pack_write_req_packed_141;
  assign pack_write_req_packed_141 = { pack_write_req_op_sel_136, pack_write_req_local_addr_137, pack_write_req_local_stride_138, pack_write_req_size_139, pack_write_req_local_blocksize_140 };
  assign _myaxi_write_req_fifo_wdata = ((_myaxi_write_req_fsm == 1) && !_myaxi_write_req_fifo_almost_full && (myaxi_awready || !myaxi_awvalid) && (outstanding_wcount_0 < 6))? pack_write_req_packed_141 : 
                                       ((_myaxi_write_req_fsm == 0) && _myaxi_write_start && !_myaxi_write_req_fifo_almost_full)? pack_write_req_packed_121 : 'hx;
  assign _myaxi_write_req_fifo_enq = ((_myaxi_write_req_fsm == 1) && !_myaxi_write_req_fifo_almost_full && (myaxi_awready || !myaxi_awvalid) && (outstanding_wcount_0 < 6))? (_myaxi_write_req_fsm == 1) && !_myaxi_write_req_fifo_almost_full && (myaxi_awready || !myaxi_awvalid) && (outstanding_wcount_0 < 6) && !_myaxi_write_req_fifo_almost_full : 
                                     ((_myaxi_write_req_fsm == 0) && _myaxi_write_start && !_myaxi_write_req_fifo_almost_full)? (_myaxi_write_req_fsm == 0) && _myaxi_write_start && !_myaxi_write_req_fifo_almost_full && !_myaxi_write_req_fifo_almost_full : 0;
  localparam _tmp_142 = 1;
  wire [_tmp_142-1:0] _tmp_143;
  assign _tmp_143 = !_myaxi_write_req_fifo_almost_full;
  reg [_tmp_142-1:0] __tmp_143_1;
  reg _myaxi_cond_1_1;
  reg [32-1:0] _myaxi_write_data_fsm;
  localparam _myaxi_write_data_fsm_init = 0;
  reg [32-1:0] read_burst_fsm_2;
  localparam read_burst_fsm_2_init = 0;
  reg [10-1:0] read_burst_addr_144;
  reg [10-1:0] read_burst_stride_145;
  reg [33-1:0] read_burst_length_146;
  reg read_burst_rvalid_147;
  reg read_burst_rlast_148;
  localparam _tmp_149 = 1;
  wire [_tmp_149-1:0] _tmp_150;
  assign _tmp_150 = (read_burst_fsm_2 == 1) && (!read_burst_rvalid_147 || (myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0));
  reg [_tmp_149-1:0] __tmp_150_1;
  wire [32-1:0] read_burst_rdata_151;
  assign read_burst_rdata_151 = ram_c_0_rdata;
  reg _myaxi_cond_2_1;
  wire [32-1:0] mask_addr_shifted_152;
  assign mask_addr_shifted_152 = 0;
  wire [32-1:0] mask_addr_masked_153;
  assign mask_addr_masked_153 = mask_addr_shifted_152 << 2;
  reg [32-1:0] write_burst_fsm_3;
  localparam write_burst_fsm_3_init = 0;
  reg [10-1:0] write_burst_addr_154;
  reg [10-1:0] write_burst_stride_155;
  reg [33-1:0] write_burst_length_156;
  reg write_burst_done_157;
  assign ram_x_0_wdata = ((write_burst_fsm_3 == 1) && myaxi_rvalid)? myaxi_rdata : 'hx;
  assign ram_x_0_wenable = ((write_burst_fsm_3 == 1) && myaxi_rvalid)? 1'd1 : 0;
  wire [32-1:0] mask_addr_shifted_158;
  assign mask_addr_shifted_158 = 0;
  wire [32-1:0] mask_addr_masked_159;
  assign mask_addr_masked_159 = mask_addr_shifted_158 << 2;
  reg [32-1:0] write_burst_fsm_4;
  localparam write_burst_fsm_4_init = 0;
  reg [10-1:0] write_burst_addr_160;
  reg [10-1:0] write_burst_stride_161;
  reg [33-1:0] write_burst_length_162;
  reg write_burst_done_163;
  assign ram_y_0_wdata = ((write_burst_fsm_4 == 1) && myaxi_rvalid)? myaxi_rdata : 'hx;
  assign ram_y_0_wenable = ((write_burst_fsm_4 == 1) && myaxi_rvalid)? 1'd1 : 0;
  reg signed [32-1:0] _th_comp_size_7;
  reg signed [32-1:0] _th_comp_offset_8;
  reg signed [32-1:0] _th_comp_sum_9;
  reg signed [32-1:0] _th_comp_i_10;
  assign ram_x_0_addr = (th_comp == 36)? _th_comp_i_10 + _th_comp_offset_8 : 
                        ((write_burst_fsm_3 == 1) && myaxi_rvalid)? write_burst_addr_154 : 'hx;
  assign ram_x_0_enable = (th_comp == 36)? 1'd1 : 
                          ((write_burst_fsm_3 == 1) && myaxi_rvalid)? 1'd1 : 0;
  localparam _tmp_164 = 1;
  wire [_tmp_164-1:0] _tmp_165;
  assign _tmp_165 = th_comp == 36;
  reg [_tmp_164-1:0] __tmp_165_1;
  reg signed [32-1:0] read_rdata_166;
  reg signed [32-1:0] _th_comp_a_11;
  assign ram_y_0_addr = (th_comp == 38)? _th_comp_i_10 + _th_comp_offset_8 : 
                        ((write_burst_fsm_4 == 1) && myaxi_rvalid)? write_burst_addr_160 : 'hx;
  assign ram_y_0_enable = (th_comp == 38)? 1'd1 : 
                          ((write_burst_fsm_4 == 1) && myaxi_rvalid)? 1'd1 : 0;
  localparam _tmp_167 = 1;
  wire [_tmp_167-1:0] _tmp_168;
  assign _tmp_168 = th_comp == 38;
  reg [_tmp_167-1:0] __tmp_168_1;
  reg signed [32-1:0] read_rdata_169;
  reg signed [32-1:0] _th_comp_b_12;
  reg signed [32-1:0] _th_comp_c_13;
  assign ram_z_0_wdata = (th_comp == 43)? _th_comp_sum_9 : 'hx;
  assign ram_z_0_wenable = (th_comp == 43)? 1'd1 : 0;
  wire [32-1:0] mask_addr_shifted_170;
  assign mask_addr_shifted_170 = 2048 >> 2;
  wire [32-1:0] mask_addr_masked_171;
  assign mask_addr_masked_171 = mask_addr_shifted_170 << 2;
  reg [32-1:0] read_burst_fsm_5;
  localparam read_burst_fsm_5_init = 0;
  reg [10-1:0] read_burst_addr_172;
  reg [10-1:0] read_burst_stride_173;
  reg [33-1:0] read_burst_length_174;
  reg read_burst_rvalid_175;
  reg read_burst_rlast_176;
  assign ram_z_0_addr = ((read_burst_fsm_5 == 1) && (!read_burst_rvalid_175 || (myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0)))? read_burst_addr_172 : 
                        (th_comp == 43)? _th_comp_offset_8 : 'hx;
  assign ram_z_0_enable = ((read_burst_fsm_5 == 1) && (!read_burst_rvalid_175 || (myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0)))? 1'd1 : 
                          (th_comp == 43)? 1'd1 : 0;
  localparam _tmp_177 = 1;
  wire [_tmp_177-1:0] _tmp_178;
  assign _tmp_178 = (read_burst_fsm_5 == 1) && (!read_burst_rvalid_175 || (myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0));
  reg [_tmp_177-1:0] __tmp_178_1;
  wire [32-1:0] read_burst_rdata_179;
  assign read_burst_rdata_179 = ram_z_0_rdata;
  assign _myaxi_write_req_fifo_deq = ((_myaxi_write_data_fsm == 2) && (!_myaxi_write_req_fifo_empty && (_myaxi_write_size_buf == 0)) && !_myaxi_write_req_fifo_empty)? 1 : 
                                     ((_myaxi_write_data_fsm == 0) && (_myaxi_write_data_idle && !_myaxi_write_req_fifo_empty && (_myaxi_write_op_sel_fifo == 2)) && !_myaxi_write_req_fifo_empty)? 1 : 
                                     ((_myaxi_write_data_fsm == 2) && (!_myaxi_write_req_fifo_empty && (_myaxi_write_size_buf == 0)) && !_myaxi_write_req_fifo_empty)? 1 : 
                                     ((_myaxi_write_data_fsm == 0) && (_myaxi_write_data_idle && !_myaxi_write_req_fifo_empty && (_myaxi_write_op_sel_fifo == 1)) && !_myaxi_write_req_fifo_empty)? 1 : 0;
  reg _myaxi_cond_3_1;
  wire [32-1:0] mask_addr_shifted_180;
  assign mask_addr_shifted_180 = 2048 >> 2;
  wire [32-1:0] mask_addr_masked_181;
  assign mask_addr_masked_181 = mask_addr_shifted_180 << 2;
  assign _myaxi_read_req_fifo_deq = ((_myaxi_read_data_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 5)) && !_myaxi_read_req_fifo_empty)? 1 : 
                                    ((_myaxi_read_data_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 4)) && !_myaxi_read_req_fifo_empty)? 1 : 
                                    ((_myaxi_read_data_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 3)) && !_myaxi_read_req_fifo_empty)? 1 : 
                                    ((_myaxi_read_data_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 2)) && !_myaxi_read_req_fifo_empty)? 1 : 
                                    ((_myaxi_read_data_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 1)) && !_myaxi_read_req_fifo_empty)? 1 : 0;
  reg [32-1:0] write_burst_fsm_6;
  localparam write_burst_fsm_6_init = 0;
  reg [10-1:0] write_burst_addr_182;
  reg [10-1:0] write_burst_stride_183;
  reg [33-1:0] write_burst_length_184;
  reg write_burst_done_185;
  assign ram_c_0_wdata = ((write_burst_fsm_6 == 1) && myaxi_rvalid)? myaxi_rdata : 
                         (_mystream_stream_oready && _mystream_sum_sink_wenable && (_mystream_sum_sink_sel == 9))? _mystream_sum_sink_wdata : 'hx;
  assign ram_c_0_wenable = ((write_burst_fsm_6 == 1) && myaxi_rvalid)? 1'd1 : 
                           (_mystream_stream_oready && _mystream_sum_sink_wenable && (_mystream_sum_sink_sel == 9))? 1'd1 : 0;
  assign myaxi_rready = (_myaxi_read_data_fsm == 2) || (_myaxi_read_data_fsm == 2) || (_myaxi_read_data_fsm == 2) || (_myaxi_read_data_fsm == 2) || (_myaxi_read_data_fsm == 2);
  reg signed [32-1:0] _th_comp_size_14;
  reg signed [32-1:0] _th_comp_offset_stream_15;
  reg signed [32-1:0] _th_comp_offset_seq_16;
  reg signed [32-1:0] _th_comp_all_ok_17;
  reg signed [32-1:0] _th_comp_i_18;
  localparam _tmp_186 = 1;
  wire [_tmp_186-1:0] _tmp_187;
  assign _tmp_187 = th_comp == 52;
  reg [_tmp_186-1:0] __tmp_187_1;
  reg signed [32-1:0] read_rdata_188;
  reg signed [32-1:0] _th_comp_st_19;
  assign ram_c_0_addr = (th_comp == 54)? _th_comp_i_18 + _th_comp_offset_seq_16 : 
                        (th_comp == 52)? _th_comp_i_18 + _th_comp_offset_stream_15 : 
                        ((write_burst_fsm_6 == 1) && myaxi_rvalid)? write_burst_addr_182 : 
                        ((read_burst_fsm_2 == 1) && (!read_burst_rvalid_147 || (myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0)))? read_burst_addr_144 : 
                        (_mystream_stream_oready && _mystream_sum_sink_wenable && (_mystream_sum_sink_sel == 9))? _mystream_sum_sink_waddr : 'hx;
  assign ram_c_0_enable = (th_comp == 54)? 1'd1 : 
                          (th_comp == 52)? 1'd1 : 
                          ((write_burst_fsm_6 == 1) && myaxi_rvalid)? 1'd1 : 
                          ((read_burst_fsm_2 == 1) && (!read_burst_rvalid_147 || (myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0)))? 1'd1 : 
                          (_mystream_stream_oready && _mystream_sum_sink_wenable && (_mystream_sum_sink_sel == 9))? 1'd1 : 0;
  localparam _tmp_189 = 1;
  wire [_tmp_189-1:0] _tmp_190;
  assign _tmp_190 = th_comp == 54;
  reg [_tmp_189-1:0] __tmp_190_1;
  reg signed [32-1:0] read_rdata_191;
  reg signed [32-1:0] _th_comp_sq_20;

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
        _myaxi_read_global_addr <= mask_addr_masked_12;
        _myaxi_read_global_size <= _th_comp_size_0;
        _myaxi_read_local_addr <= _th_comp_offset_1;
        _myaxi_read_local_stride <= 1;
        _myaxi_read_local_size <= _th_comp_size_0;
        _myaxi_read_local_blocksize <= 1;
      end 
      if((_myaxi_read_req_fsm == 0) && _myaxi_read_start) begin
        _myaxi_read_req_idle <= 0;
      end 
      if(_myaxi_read_start && _myaxi_read_req_fifo_almost_full) begin
        _myaxi_read_start <= 1;
      end 
      if((_myaxi_read_req_fsm == 0) && (_myaxi_read_start || _myaxi_read_cont) && !_myaxi_read_req_fifo_almost_full && (_myaxi_read_global_size <= 256) && ((mask_addr_masked_22 & 4095) + (_myaxi_read_global_size << 2) >= 4096)) begin
        _myaxi_read_cur_global_size <= 4096 - (mask_addr_masked_24 & 4095) >> 2;
        _myaxi_read_global_size <= _myaxi_read_global_size - (4096 - (mask_addr_masked_26 & 4095) >> 2);
      end else if((_myaxi_read_req_fsm == 0) && (_myaxi_read_start || _myaxi_read_cont) && !_myaxi_read_req_fifo_almost_full && (_myaxi_read_global_size <= 256)) begin
        _myaxi_read_cur_global_size <= _myaxi_read_global_size;
        _myaxi_read_global_size <= 0;
      end else if((_myaxi_read_req_fsm == 0) && (_myaxi_read_start || _myaxi_read_cont) && !_myaxi_read_req_fifo_almost_full && ((mask_addr_masked_28 & 4095) + 1024 >= 4096)) begin
        _myaxi_read_cur_global_size <= 4096 - (mask_addr_masked_30 & 4095) >> 2;
        _myaxi_read_global_size <= _myaxi_read_global_size - (4096 - (mask_addr_masked_32 & 4095) >> 2);
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
      if((_myaxi_read_data_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 1))) begin
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
      if((th_comp == 4) && _myaxi_read_req_idle) begin
        _myaxi_read_start <= 1;
        _myaxi_read_op_sel <= 2;
        _myaxi_read_global_addr <= mask_addr_masked_39;
        _myaxi_read_global_size <= _th_comp_size_0;
        _myaxi_read_local_addr <= _th_comp_offset_1;
        _myaxi_read_local_stride <= 1;
        _myaxi_read_local_size <= _th_comp_size_0;
        _myaxi_read_local_blocksize <= 1;
      end 
      if((_myaxi_read_data_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 2))) begin
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
      if((th_comp == 25) && _myaxi_write_req_idle) begin
        _myaxi_write_start <= 1;
        _myaxi_write_op_sel <= 1;
        _myaxi_write_global_addr <= mask_addr_masked_115;
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
      if((_myaxi_write_req_fsm == 0) && (_myaxi_write_start || _myaxi_write_cont) && !_myaxi_write_req_fifo_almost_full && (_myaxi_write_global_size <= 256) && ((mask_addr_masked_125 & 4095) + (_myaxi_write_global_size << 2) >= 4096)) begin
        _myaxi_write_cur_global_size <= 4096 - (mask_addr_masked_127 & 4095) >> 2;
        _myaxi_write_global_size <= _myaxi_write_global_size - (4096 - (mask_addr_masked_129 & 4095) >> 2);
      end else if((_myaxi_write_req_fsm == 0) && (_myaxi_write_start || _myaxi_write_cont) && !_myaxi_write_req_fifo_almost_full && (_myaxi_write_global_size <= 256)) begin
        _myaxi_write_cur_global_size <= _myaxi_write_global_size;
        _myaxi_write_global_size <= 0;
      end else if((_myaxi_write_req_fsm == 0) && (_myaxi_write_start || _myaxi_write_cont) && !_myaxi_write_req_fifo_almost_full && ((mask_addr_masked_131 & 4095) + 1024 >= 4096)) begin
        _myaxi_write_cur_global_size <= 4096 - (mask_addr_masked_133 & 4095) >> 2;
        _myaxi_write_global_size <= _myaxi_write_global_size - (4096 - (mask_addr_masked_135 & 4095) >> 2);
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
      if((_myaxi_write_op_sel_buf == 1) && read_burst_rvalid_147 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0)) && (myaxi_wready || !myaxi_wvalid)) begin
        myaxi_wdata <= read_burst_rdata_151;
        myaxi_wvalid <= 1;
        myaxi_wlast <= read_burst_rlast_148 || (_myaxi_write_size_buf == 1);
        myaxi_wstrb <= { 4{ 1'd1 } };
      end 
      _myaxi_cond_2_1 <= 1;
      if(myaxi_wvalid && !myaxi_wready) begin
        myaxi_wvalid <= myaxi_wvalid;
        myaxi_wlast <= myaxi_wlast;
      end 
      if((_myaxi_write_data_fsm == 2) && read_burst_rvalid_147 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0))) begin
        _myaxi_write_size_buf <= _myaxi_write_size_buf - 1;
      end 
      if((_myaxi_write_data_fsm == 2) && ((_myaxi_write_op_sel_buf == 1) && read_burst_rvalid_147 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0))) && read_burst_rlast_148) begin
        _myaxi_write_data_idle <= 1;
      end 
      if((th_comp == 28) && _myaxi_read_req_idle) begin
        _myaxi_read_start <= 1;
        _myaxi_read_op_sel <= 3;
        _myaxi_read_global_addr <= mask_addr_masked_153;
        _myaxi_read_global_size <= _th_comp_size_0;
        _myaxi_read_local_addr <= _th_comp_offset_1;
        _myaxi_read_local_stride <= 1;
        _myaxi_read_local_size <= _th_comp_size_0;
        _myaxi_read_local_blocksize <= 1;
      end 
      if((_myaxi_read_data_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 3))) begin
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
      if((th_comp == 30) && _myaxi_read_req_idle) begin
        _myaxi_read_start <= 1;
        _myaxi_read_op_sel <= 4;
        _myaxi_read_global_addr <= mask_addr_masked_159;
        _myaxi_read_global_size <= _th_comp_size_0;
        _myaxi_read_local_addr <= _th_comp_offset_1;
        _myaxi_read_local_stride <= 1;
        _myaxi_read_local_size <= _th_comp_size_0;
        _myaxi_read_local_blocksize <= 1;
      end 
      if((_myaxi_read_data_fsm == 0) && (_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 4))) begin
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
      if((th_comp == 44) && _myaxi_write_req_idle) begin
        _myaxi_write_start <= 1;
        _myaxi_write_op_sel <= 2;
        _myaxi_write_global_addr <= mask_addr_masked_171;
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
      if((_myaxi_write_op_sel_buf == 2) && read_burst_rvalid_175 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0)) && (myaxi_wready || !myaxi_wvalid)) begin
        myaxi_wdata <= read_burst_rdata_179;
        myaxi_wvalid <= 1;
        myaxi_wlast <= read_burst_rlast_176 || (_myaxi_write_size_buf == 1);
        myaxi_wstrb <= { 4{ 1'd1 } };
      end 
      _myaxi_cond_3_1 <= 1;
      if(myaxi_wvalid && !myaxi_wready) begin
        myaxi_wvalid <= myaxi_wvalid;
        myaxi_wlast <= myaxi_wlast;
      end 
      if((_myaxi_write_data_fsm == 2) && read_burst_rvalid_175 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0))) begin
        _myaxi_write_size_buf <= _myaxi_write_size_buf - 1;
      end 
      if((_myaxi_write_data_fsm == 2) && ((_myaxi_write_op_sel_buf == 2) && read_burst_rvalid_175 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0))) && read_burst_rlast_176) begin
        _myaxi_write_data_idle <= 1;
      end 
      if((th_comp == 46) && _myaxi_read_req_idle) begin
        _myaxi_read_start <= 1;
        _myaxi_read_op_sel <= 5;
        _myaxi_read_global_addr <= mask_addr_masked_181;
        _myaxi_read_global_size <= 1;
        _myaxi_read_local_addr <= _th_comp_offset_1;
        _myaxi_read_local_stride <= 1;
        _myaxi_read_local_size <= 1;
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
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      count__myaxi_read_req_fifo <= 0;
      __tmp_20_1 <= 0;
    end else begin
      if(_myaxi_read_req_fifo_enq && !_myaxi_read_req_fifo_full && (_myaxi_read_req_fifo_deq && !_myaxi_read_req_fifo_empty)) begin
        count__myaxi_read_req_fifo <= count__myaxi_read_req_fifo;
      end else if(_myaxi_read_req_fifo_enq && !_myaxi_read_req_fifo_full) begin
        count__myaxi_read_req_fifo <= count__myaxi_read_req_fifo + 1;
      end else if(_myaxi_read_req_fifo_deq && !_myaxi_read_req_fifo_empty) begin
        count__myaxi_read_req_fifo <= count__myaxi_read_req_fifo - 1;
      end 
      __tmp_20_1 <= _tmp_20;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      count__myaxi_write_req_fifo <= 0;
      __tmp_123_1 <= 0;
      __tmp_143_1 <= 0;
    end else begin
      if(_myaxi_write_req_fifo_enq && !_myaxi_write_req_fifo_full && (_myaxi_write_req_fifo_deq && !_myaxi_write_req_fifo_empty)) begin
        count__myaxi_write_req_fifo <= count__myaxi_write_req_fifo;
      end else if(_myaxi_write_req_fifo_enq && !_myaxi_write_req_fifo_full) begin
        count__myaxi_write_req_fifo <= count__myaxi_write_req_fifo + 1;
      end else if(_myaxi_write_req_fifo_deq && !_myaxi_write_req_fifo_empty) begin
        count__myaxi_write_req_fifo <= count__myaxi_write_req_fifo - 1;
      end 
      __tmp_123_1 <= _tmp_123;
      __tmp_143_1 <= _tmp_143;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_48_1 <= 0;
    end else begin
      __tmp_48_1 <= _tmp_48;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_51_1 <= 0;
    end else begin
      __tmp_51_1 <= _tmp_51;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_54_1 <= 0;
    end else begin
      __tmp_54_1 <= _tmp_54;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_57_1 <= 0;
    end else begin
      __tmp_57_1 <= _tmp_57;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_60_1 <= 0;
    end else begin
      __tmp_60_1 <= _tmp_60;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_63_1 <= 0;
    end else begin
      __tmp_63_1 <= _tmp_63;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_66_1 <= 0;
    end else begin
      __tmp_66_1 <= _tmp_66;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_69_1 <= 0;
    end else begin
      __tmp_69_1 <= _tmp_69;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_150_1 <= 0;
      __tmp_187_1 <= 0;
      __tmp_190_1 <= 0;
    end else begin
      __tmp_150_1 <= _tmp_150;
      __tmp_187_1 <= _tmp_187;
      __tmp_190_1 <= _tmp_190;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_165_1 <= 0;
    end else begin
      __tmp_165_1 <= _tmp_165;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_168_1 <= 0;
    end else begin
      __tmp_168_1 <= _tmp_168;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      __tmp_178_1 <= 0;
    end else begin
      __tmp_178_1 <= _tmp_178;
    end
  end


  always @(posedge CLK) begin
    if(RST) begin
      _mystream_a0_source_ram_renable <= 0;
      _mystream_a0_source_fifo_deq <= 0;
      _mystream_a0_idle <= 1;
      _mystream_a1_source_ram_renable <= 0;
      _mystream_a1_source_fifo_deq <= 0;
      _mystream_a1_idle <= 1;
      _mystream_a2_source_ram_renable <= 0;
      _mystream_a2_source_fifo_deq <= 0;
      _mystream_a2_idle <= 1;
      _mystream_a3_source_ram_renable <= 0;
      _mystream_a3_source_fifo_deq <= 0;
      _mystream_a3_idle <= 1;
      _mystream_b0_source_ram_renable <= 0;
      _mystream_b0_source_fifo_deq <= 0;
      _mystream_b0_idle <= 1;
      _mystream_b1_source_ram_renable <= 0;
      _mystream_b1_source_fifo_deq <= 0;
      _mystream_b1_idle <= 1;
      _mystream_b2_source_ram_renable <= 0;
      _mystream_b2_source_fifo_deq <= 0;
      _mystream_b2_idle <= 1;
      _mystream_b3_source_ram_renable <= 0;
      _mystream_b3_source_fifo_deq <= 0;
      _mystream_b3_idle <= 1;
      _mystream_bias0_source_ram_renable <= 0;
      _mystream_bias0_source_fifo_deq <= 0;
      _mystream_bias0_idle <= 1;
      _mystream_bias1_source_ram_renable <= 0;
      _mystream_bias1_source_fifo_deq <= 0;
      _mystream_bias1_idle <= 1;
      _mystream_bias2_source_ram_renable <= 0;
      _mystream_bias2_source_fifo_deq <= 0;
      _mystream_bias2_idle <= 1;
      _mystream_bias3_source_ram_renable <= 0;
      _mystream_bias3_source_fifo_deq <= 0;
      _mystream_bias3_idle <= 1;
      _mystream_sum_sink_wenable <= 0;
      _mystream_sum_sink_fifo_enq <= 0;
      _mystream_sum_valid_sink_wenable <= 0;
      _mystream_sum_valid_sink_fifo_enq <= 0;
      __mystream_stream_ivalid_1 <= 0;
      __mystream_stream_ivalid_2 <= 0;
      __mystream_stream_ivalid_3 <= 0;
      _plus_data_13 <= 0;
      _plus_data_14 <= 0;
      _plus_data_15 <= 0;
      _plus_data_16 <= 0;
      __delay_data_23__variable_0 <= 0;
      __delay_data_25__variable_18 <= 0;
      __plusn_data_17 <= 0;
      __delay_data_24__delay_23__variable_0 <= 0;
      __delay_data_26__delay_25__variable_18 <= 0;
      _reduceadd_data_19 <= 1'sd0;
      _reduceadd_count_19 <= 0;
      _reduceadd_prev_count_max_19 <= 0;
      _pulse_data_21 <= 1'sd0;
      _pulse_count_21 <= 0;
      _pulse_prev_count_max_21 <= 0;
      _mystream_size_next_parameter_data <= 0;
      __variable_wdata_0 <= 0;
      _mystream_a0_source_mode <= 5'b0;
      _mystream_a0_source_offset <= 0;
      _mystream_a0_source_size <= 0;
      _mystream_a0_source_stride <= 0;
      _mystream_a0_source_sel <= 0;
      _mystream_a0_source_offset_buf <= 0;
      _mystream_a0_source_size_buf <= 0;
      _mystream_a0_source_stride_buf <= 0;
      __variable_wdata_1 <= 0;
      _mystream_a0_source_ram_raddr <= 0;
      _mystream_a0_source_count <= 0;
      _mystream_a1_source_mode <= 5'b0;
      _mystream_a1_source_offset <= 0;
      _mystream_a1_source_size <= 0;
      _mystream_a1_source_stride <= 0;
      _mystream_a1_source_sel <= 0;
      _mystream_a1_source_offset_buf <= 0;
      _mystream_a1_source_size_buf <= 0;
      _mystream_a1_source_stride_buf <= 0;
      __variable_wdata_2 <= 0;
      _mystream_a1_source_ram_raddr <= 0;
      _mystream_a1_source_count <= 0;
      _mystream_a2_source_mode <= 5'b0;
      _mystream_a2_source_offset <= 0;
      _mystream_a2_source_size <= 0;
      _mystream_a2_source_stride <= 0;
      _mystream_a2_source_sel <= 0;
      _mystream_a2_source_offset_buf <= 0;
      _mystream_a2_source_size_buf <= 0;
      _mystream_a2_source_stride_buf <= 0;
      __variable_wdata_3 <= 0;
      _mystream_a2_source_ram_raddr <= 0;
      _mystream_a2_source_count <= 0;
      _mystream_a3_source_mode <= 5'b0;
      _mystream_a3_source_offset <= 0;
      _mystream_a3_source_size <= 0;
      _mystream_a3_source_stride <= 0;
      _mystream_a3_source_sel <= 0;
      _mystream_a3_source_offset_buf <= 0;
      _mystream_a3_source_size_buf <= 0;
      _mystream_a3_source_stride_buf <= 0;
      __variable_wdata_4 <= 0;
      _mystream_a3_source_ram_raddr <= 0;
      _mystream_a3_source_count <= 0;
      _mystream_b0_source_mode <= 5'b0;
      _mystream_b0_source_offset <= 0;
      _mystream_b0_source_size <= 0;
      _mystream_b0_source_stride <= 0;
      _mystream_b0_source_sel <= 0;
      _mystream_b0_source_offset_buf <= 0;
      _mystream_b0_source_size_buf <= 0;
      _mystream_b0_source_stride_buf <= 0;
      __variable_wdata_5 <= 0;
      _mystream_b0_source_ram_raddr <= 0;
      _mystream_b0_source_count <= 0;
      _mystream_b1_source_mode <= 5'b0;
      _mystream_b1_source_offset <= 0;
      _mystream_b1_source_size <= 0;
      _mystream_b1_source_stride <= 0;
      _mystream_b1_source_sel <= 0;
      _mystream_b1_source_offset_buf <= 0;
      _mystream_b1_source_size_buf <= 0;
      _mystream_b1_source_stride_buf <= 0;
      __variable_wdata_6 <= 0;
      _mystream_b1_source_ram_raddr <= 0;
      _mystream_b1_source_count <= 0;
      _mystream_b2_source_mode <= 5'b0;
      _mystream_b2_source_offset <= 0;
      _mystream_b2_source_size <= 0;
      _mystream_b2_source_stride <= 0;
      _mystream_b2_source_sel <= 0;
      _mystream_b2_source_offset_buf <= 0;
      _mystream_b2_source_size_buf <= 0;
      _mystream_b2_source_stride_buf <= 0;
      __variable_wdata_7 <= 0;
      _mystream_b2_source_ram_raddr <= 0;
      _mystream_b2_source_count <= 0;
      _mystream_b3_source_mode <= 5'b0;
      _mystream_b3_source_offset <= 0;
      _mystream_b3_source_size <= 0;
      _mystream_b3_source_stride <= 0;
      _mystream_b3_source_sel <= 0;
      _mystream_b3_source_offset_buf <= 0;
      _mystream_b3_source_size_buf <= 0;
      _mystream_b3_source_stride_buf <= 0;
      __variable_wdata_8 <= 0;
      _mystream_b3_source_ram_raddr <= 0;
      _mystream_b3_source_count <= 0;
      _tmp_71 <= 0;
      _tmp_72 <= 0;
      _tmp_73 <= 0;
      _tmp_74 <= 0;
      _tmp_75 <= 0;
      _tmp_76 <= 0;
      _tmp_77 <= 0;
      _tmp_78 <= 0;
      _tmp_79 <= 0;
      _tmp_80 <= 0;
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
      _tmp_82 <= 0;
      _tmp_83 <= 0;
      _tmp_84 <= 0;
      _tmp_85 <= 0;
      _tmp_86 <= 0;
      _tmp_87 <= 0;
      __variable_wdata_18 <= 0;
      _tmp_88 <= 0;
      _tmp_89 <= 0;
      _tmp_90 <= 0;
      _tmp_91 <= 0;
      _tmp_94 <= 0;
      _tmp_97 <= 0;
      _tmp_98 <= 0;
      _tmp_99 <= 0;
      _tmp_100 <= 0;
      _tmp_101 <= 0;
      _tmp_102 <= 0;
      _tmp_103 <= 0;
      _tmp_104 <= 0;
      _tmp_105 <= 0;
      _tmp_106 <= 0;
      _tmp_107 <= 0;
      _tmp_108 <= 0;
      _tmp_109 <= 0;
      _tmp_110 <= 0;
      _tmp_111 <= 0;
      _tmp_112 <= 0;
      _tmp_113 <= 0;
      _mystream_busy_reg <= 0;
    end else begin
      if(_mystream_stream_oready) begin
        _mystream_a0_source_ram_renable <= 0;
        _mystream_a0_source_fifo_deq <= 0;
      end 
      _mystream_a0_idle <= _mystream_a0_idle;
      if(_mystream_stream_oready) begin
        _mystream_a1_source_ram_renable <= 0;
        _mystream_a1_source_fifo_deq <= 0;
      end 
      _mystream_a1_idle <= _mystream_a1_idle;
      if(_mystream_stream_oready) begin
        _mystream_a2_source_ram_renable <= 0;
        _mystream_a2_source_fifo_deq <= 0;
      end 
      _mystream_a2_idle <= _mystream_a2_idle;
      if(_mystream_stream_oready) begin
        _mystream_a3_source_ram_renable <= 0;
        _mystream_a3_source_fifo_deq <= 0;
      end 
      _mystream_a3_idle <= _mystream_a3_idle;
      if(_mystream_stream_oready) begin
        _mystream_b0_source_ram_renable <= 0;
        _mystream_b0_source_fifo_deq <= 0;
      end 
      _mystream_b0_idle <= _mystream_b0_idle;
      if(_mystream_stream_oready) begin
        _mystream_b1_source_ram_renable <= 0;
        _mystream_b1_source_fifo_deq <= 0;
      end 
      _mystream_b1_idle <= _mystream_b1_idle;
      if(_mystream_stream_oready) begin
        _mystream_b2_source_ram_renable <= 0;
        _mystream_b2_source_fifo_deq <= 0;
      end 
      _mystream_b2_idle <= _mystream_b2_idle;
      if(_mystream_stream_oready) begin
        _mystream_b3_source_ram_renable <= 0;
        _mystream_b3_source_fifo_deq <= 0;
      end 
      _mystream_b3_idle <= _mystream_b3_idle;
      if(_mystream_stream_oready) begin
        _mystream_bias0_source_ram_renable <= 0;
        _mystream_bias0_source_fifo_deq <= 0;
      end 
      _mystream_bias0_idle <= _mystream_bias0_idle;
      if(_mystream_stream_oready) begin
        _mystream_bias1_source_ram_renable <= 0;
        _mystream_bias1_source_fifo_deq <= 0;
      end 
      _mystream_bias1_idle <= _mystream_bias1_idle;
      if(_mystream_stream_oready) begin
        _mystream_bias2_source_ram_renable <= 0;
        _mystream_bias2_source_fifo_deq <= 0;
      end 
      _mystream_bias2_idle <= _mystream_bias2_idle;
      if(_mystream_stream_oready) begin
        _mystream_bias3_source_ram_renable <= 0;
        _mystream_bias3_source_fifo_deq <= 0;
      end 
      _mystream_bias3_idle <= _mystream_bias3_idle;
      if(_mystream_stream_oready) begin
        _mystream_sum_sink_wenable <= 0;
        _mystream_sum_sink_fifo_enq <= 0;
      end 
      if(_mystream_stream_oready) begin
        _mystream_sum_valid_sink_wenable <= 0;
        _mystream_sum_valid_sink_fifo_enq <= 0;
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
        _plus_data_13 <= mystream_a0_data + mystream_b0_data;
      end 
      if(_mystream_stream_oready) begin
        _plus_data_14 <= mystream_a1_data + mystream_b1_data;
      end 
      if(_mystream_stream_oready) begin
        _plus_data_15 <= mystream_a2_data + mystream_b2_data;
      end 
      if(_mystream_stream_oready) begin
        _plus_data_16 <= mystream_a3_data + mystream_b3_data;
      end 
      if(_mystream_stream_oready) begin
        __delay_data_23__variable_0 <= mystream_size_data;
      end 
      if(_mystream_stream_oready) begin
        __delay_data_25__variable_18 <= mystream__reduce_reset_data;
      end 
      if(_mystream_stream_oready) begin
        __plusn_data_17 <= _plus_data_13 + _plus_data_14 + _plus_data_15 + _plus_data_16;
      end 
      if(_mystream_stream_oready) begin
        __delay_data_24__delay_23__variable_0 <= __delay_data_23__variable_0;
      end 
      if(_mystream_stream_oready) begin
        __delay_data_26__delay_25__variable_18 <= __delay_data_25__variable_18;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready && _reduceadd_reset_cond_19) begin
        _reduceadd_data_19 <= 1'sd0;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready) begin
        _reduceadd_count_19 <= (_reduceadd_current_count_19 >= __delay_data_24__delay_23__variable_0 - 1)? 0 : _reduceadd_current_count_19 + 1;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready) begin
        _reduceadd_prev_count_max_19 <= _reduceadd_current_count_19 >= __delay_data_24__delay_23__variable_0 - 1;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready) begin
        _reduceadd_data_19 <= _reduceadd_current_data_19 + __plusn_data_17;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready && _pulse_reset_cond_21) begin
        _pulse_data_21 <= 1'sd0;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready) begin
        _pulse_count_21 <= (_pulse_current_count_21 >= __delay_data_24__delay_23__variable_0 - 1)? 0 : _pulse_current_count_21 + 1;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready) begin
        _pulse_prev_count_max_21 <= _pulse_current_count_21 >= __delay_data_24__delay_23__variable_0 - 1;
      end 
      if(__mystream_stream_ivalid_2 && _mystream_stream_oready) begin
        _pulse_data_21 <= _pulse_current_count_21 >= __delay_data_24__delay_23__variable_0 - 1;
      end 
      if(_set_flag_45) begin
        _mystream_size_next_parameter_data <= _th_comp_size_2 >>> 2;
      end 
      if(_mystream_source_start) begin
        __variable_wdata_0 <= _mystream_size_next_parameter_data;
      end 
      if(_set_flag_46) begin
        _mystream_a0_source_mode <= 5'b1;
        _mystream_a0_source_offset <= _th_comp_offset_3;
        _mystream_a0_source_size <= _th_comp_size_2 >>> 2;
        _mystream_a0_source_stride <= 1;
      end 
      if(_set_flag_46) begin
        _mystream_a0_source_sel <= 1;
      end 
      if(_mystream_source_start && _mystream_a0_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_a0_source_offset_buf <= _mystream_a0_source_offset;
        _mystream_a0_source_size_buf <= _mystream_a0_source_size;
        _mystream_a0_source_stride_buf <= _mystream_a0_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_1 <= _mystream_a0_source_ram_rdata;
      end 
      if((_mystream_a0_source_fsm_0 == 1) && _mystream_stream_oready) begin
        _mystream_a0_idle <= 0;
        _mystream_a0_source_ram_raddr <= _mystream_a0_source_offset_buf;
        _mystream_a0_source_ram_renable <= 1;
        _mystream_a0_source_count <= _mystream_a0_source_size_buf;
      end 
      if((_mystream_a0_source_fsm_0 == 2) && _mystream_stream_oready) begin
        _mystream_a0_source_ram_raddr <= _mystream_a0_source_ram_raddr + _mystream_a0_source_stride_buf;
        _mystream_a0_source_ram_renable <= 1;
        _mystream_a0_source_count <= _mystream_a0_source_count - 1;
      end 
      if((_mystream_a0_source_fsm_0 == 2) && (_mystream_a0_source_count == 1) && _mystream_stream_oready) begin
        _mystream_a0_source_ram_renable <= 0;
        _mystream_a0_idle <= 1;
      end 
      if((_mystream_a0_source_fsm_0 == 2) && _mystream_source_stop && _mystream_stream_oready) begin
        _mystream_a0_source_ram_renable <= 0;
        _mystream_a0_idle <= 1;
      end 
      if(_set_flag_49) begin
        _mystream_a1_source_mode <= 5'b1;
        _mystream_a1_source_offset <= _th_comp_offset_3;
        _mystream_a1_source_size <= _th_comp_size_2 >>> 2;
        _mystream_a1_source_stride <= 1;
      end 
      if(_set_flag_49) begin
        _mystream_a1_source_sel <= 2;
      end 
      if(_mystream_source_start && _mystream_a1_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_a1_source_offset_buf <= _mystream_a1_source_offset;
        _mystream_a1_source_size_buf <= _mystream_a1_source_size;
        _mystream_a1_source_stride_buf <= _mystream_a1_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_2 <= _mystream_a1_source_ram_rdata;
      end 
      if((_mystream_a1_source_fsm_1 == 1) && _mystream_stream_oready) begin
        _mystream_a1_idle <= 0;
        _mystream_a1_source_ram_raddr <= _mystream_a1_source_offset_buf;
        _mystream_a1_source_ram_renable <= 1;
        _mystream_a1_source_count <= _mystream_a1_source_size_buf;
      end 
      if((_mystream_a1_source_fsm_1 == 2) && _mystream_stream_oready) begin
        _mystream_a1_source_ram_raddr <= _mystream_a1_source_ram_raddr + _mystream_a1_source_stride_buf;
        _mystream_a1_source_ram_renable <= 1;
        _mystream_a1_source_count <= _mystream_a1_source_count - 1;
      end 
      if((_mystream_a1_source_fsm_1 == 2) && (_mystream_a1_source_count == 1) && _mystream_stream_oready) begin
        _mystream_a1_source_ram_renable <= 0;
        _mystream_a1_idle <= 1;
      end 
      if((_mystream_a1_source_fsm_1 == 2) && _mystream_source_stop && _mystream_stream_oready) begin
        _mystream_a1_source_ram_renable <= 0;
        _mystream_a1_idle <= 1;
      end 
      if(_set_flag_52) begin
        _mystream_a2_source_mode <= 5'b1;
        _mystream_a2_source_offset <= _th_comp_offset_3;
        _mystream_a2_source_size <= _th_comp_size_2 >>> 2;
        _mystream_a2_source_stride <= 1;
      end 
      if(_set_flag_52) begin
        _mystream_a2_source_sel <= 3;
      end 
      if(_mystream_source_start && _mystream_a2_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_a2_source_offset_buf <= _mystream_a2_source_offset;
        _mystream_a2_source_size_buf <= _mystream_a2_source_size;
        _mystream_a2_source_stride_buf <= _mystream_a2_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_3 <= _mystream_a2_source_ram_rdata;
      end 
      if((_mystream_a2_source_fsm_2 == 1) && _mystream_stream_oready) begin
        _mystream_a2_idle <= 0;
        _mystream_a2_source_ram_raddr <= _mystream_a2_source_offset_buf;
        _mystream_a2_source_ram_renable <= 1;
        _mystream_a2_source_count <= _mystream_a2_source_size_buf;
      end 
      if((_mystream_a2_source_fsm_2 == 2) && _mystream_stream_oready) begin
        _mystream_a2_source_ram_raddr <= _mystream_a2_source_ram_raddr + _mystream_a2_source_stride_buf;
        _mystream_a2_source_ram_renable <= 1;
        _mystream_a2_source_count <= _mystream_a2_source_count - 1;
      end 
      if((_mystream_a2_source_fsm_2 == 2) && (_mystream_a2_source_count == 1) && _mystream_stream_oready) begin
        _mystream_a2_source_ram_renable <= 0;
        _mystream_a2_idle <= 1;
      end 
      if((_mystream_a2_source_fsm_2 == 2) && _mystream_source_stop && _mystream_stream_oready) begin
        _mystream_a2_source_ram_renable <= 0;
        _mystream_a2_idle <= 1;
      end 
      if(_set_flag_55) begin
        _mystream_a3_source_mode <= 5'b1;
        _mystream_a3_source_offset <= _th_comp_offset_3;
        _mystream_a3_source_size <= _th_comp_size_2 >>> 2;
        _mystream_a3_source_stride <= 1;
      end 
      if(_set_flag_55) begin
        _mystream_a3_source_sel <= 4;
      end 
      if(_mystream_source_start && _mystream_a3_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_a3_source_offset_buf <= _mystream_a3_source_offset;
        _mystream_a3_source_size_buf <= _mystream_a3_source_size;
        _mystream_a3_source_stride_buf <= _mystream_a3_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_4 <= _mystream_a3_source_ram_rdata;
      end 
      if((_mystream_a3_source_fsm_3 == 1) && _mystream_stream_oready) begin
        _mystream_a3_idle <= 0;
        _mystream_a3_source_ram_raddr <= _mystream_a3_source_offset_buf;
        _mystream_a3_source_ram_renable <= 1;
        _mystream_a3_source_count <= _mystream_a3_source_size_buf;
      end 
      if((_mystream_a3_source_fsm_3 == 2) && _mystream_stream_oready) begin
        _mystream_a3_source_ram_raddr <= _mystream_a3_source_ram_raddr + _mystream_a3_source_stride_buf;
        _mystream_a3_source_ram_renable <= 1;
        _mystream_a3_source_count <= _mystream_a3_source_count - 1;
      end 
      if((_mystream_a3_source_fsm_3 == 2) && (_mystream_a3_source_count == 1) && _mystream_stream_oready) begin
        _mystream_a3_source_ram_renable <= 0;
        _mystream_a3_idle <= 1;
      end 
      if((_mystream_a3_source_fsm_3 == 2) && _mystream_source_stop && _mystream_stream_oready) begin
        _mystream_a3_source_ram_renable <= 0;
        _mystream_a3_idle <= 1;
      end 
      if(_set_flag_58) begin
        _mystream_b0_source_mode <= 5'b1;
        _mystream_b0_source_offset <= _th_comp_offset_3;
        _mystream_b0_source_size <= _th_comp_size_2 >>> 2;
        _mystream_b0_source_stride <= 1;
      end 
      if(_set_flag_58) begin
        _mystream_b0_source_sel <= 5;
      end 
      if(_mystream_source_start && _mystream_b0_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_b0_source_offset_buf <= _mystream_b0_source_offset;
        _mystream_b0_source_size_buf <= _mystream_b0_source_size;
        _mystream_b0_source_stride_buf <= _mystream_b0_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_5 <= _mystream_b0_source_ram_rdata;
      end 
      if((_mystream_b0_source_fsm_4 == 1) && _mystream_stream_oready) begin
        _mystream_b0_idle <= 0;
        _mystream_b0_source_ram_raddr <= _mystream_b0_source_offset_buf;
        _mystream_b0_source_ram_renable <= 1;
        _mystream_b0_source_count <= _mystream_b0_source_size_buf;
      end 
      if((_mystream_b0_source_fsm_4 == 2) && _mystream_stream_oready) begin
        _mystream_b0_source_ram_raddr <= _mystream_b0_source_ram_raddr + _mystream_b0_source_stride_buf;
        _mystream_b0_source_ram_renable <= 1;
        _mystream_b0_source_count <= _mystream_b0_source_count - 1;
      end 
      if((_mystream_b0_source_fsm_4 == 2) && (_mystream_b0_source_count == 1) && _mystream_stream_oready) begin
        _mystream_b0_source_ram_renable <= 0;
        _mystream_b0_idle <= 1;
      end 
      if((_mystream_b0_source_fsm_4 == 2) && _mystream_source_stop && _mystream_stream_oready) begin
        _mystream_b0_source_ram_renable <= 0;
        _mystream_b0_idle <= 1;
      end 
      if(_set_flag_61) begin
        _mystream_b1_source_mode <= 5'b1;
        _mystream_b1_source_offset <= _th_comp_offset_3;
        _mystream_b1_source_size <= _th_comp_size_2 >>> 2;
        _mystream_b1_source_stride <= 1;
      end 
      if(_set_flag_61) begin
        _mystream_b1_source_sel <= 6;
      end 
      if(_mystream_source_start && _mystream_b1_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_b1_source_offset_buf <= _mystream_b1_source_offset;
        _mystream_b1_source_size_buf <= _mystream_b1_source_size;
        _mystream_b1_source_stride_buf <= _mystream_b1_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_6 <= _mystream_b1_source_ram_rdata;
      end 
      if((_mystream_b1_source_fsm_5 == 1) && _mystream_stream_oready) begin
        _mystream_b1_idle <= 0;
        _mystream_b1_source_ram_raddr <= _mystream_b1_source_offset_buf;
        _mystream_b1_source_ram_renable <= 1;
        _mystream_b1_source_count <= _mystream_b1_source_size_buf;
      end 
      if((_mystream_b1_source_fsm_5 == 2) && _mystream_stream_oready) begin
        _mystream_b1_source_ram_raddr <= _mystream_b1_source_ram_raddr + _mystream_b1_source_stride_buf;
        _mystream_b1_source_ram_renable <= 1;
        _mystream_b1_source_count <= _mystream_b1_source_count - 1;
      end 
      if((_mystream_b1_source_fsm_5 == 2) && (_mystream_b1_source_count == 1) && _mystream_stream_oready) begin
        _mystream_b1_source_ram_renable <= 0;
        _mystream_b1_idle <= 1;
      end 
      if((_mystream_b1_source_fsm_5 == 2) && _mystream_source_stop && _mystream_stream_oready) begin
        _mystream_b1_source_ram_renable <= 0;
        _mystream_b1_idle <= 1;
      end 
      if(_set_flag_64) begin
        _mystream_b2_source_mode <= 5'b1;
        _mystream_b2_source_offset <= _th_comp_offset_3;
        _mystream_b2_source_size <= _th_comp_size_2 >>> 2;
        _mystream_b2_source_stride <= 1;
      end 
      if(_set_flag_64) begin
        _mystream_b2_source_sel <= 7;
      end 
      if(_mystream_source_start && _mystream_b2_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_b2_source_offset_buf <= _mystream_b2_source_offset;
        _mystream_b2_source_size_buf <= _mystream_b2_source_size;
        _mystream_b2_source_stride_buf <= _mystream_b2_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_7 <= _mystream_b2_source_ram_rdata;
      end 
      if((_mystream_b2_source_fsm_6 == 1) && _mystream_stream_oready) begin
        _mystream_b2_idle <= 0;
        _mystream_b2_source_ram_raddr <= _mystream_b2_source_offset_buf;
        _mystream_b2_source_ram_renable <= 1;
        _mystream_b2_source_count <= _mystream_b2_source_size_buf;
      end 
      if((_mystream_b2_source_fsm_6 == 2) && _mystream_stream_oready) begin
        _mystream_b2_source_ram_raddr <= _mystream_b2_source_ram_raddr + _mystream_b2_source_stride_buf;
        _mystream_b2_source_ram_renable <= 1;
        _mystream_b2_source_count <= _mystream_b2_source_count - 1;
      end 
      if((_mystream_b2_source_fsm_6 == 2) && (_mystream_b2_source_count == 1) && _mystream_stream_oready) begin
        _mystream_b2_source_ram_renable <= 0;
        _mystream_b2_idle <= 1;
      end 
      if((_mystream_b2_source_fsm_6 == 2) && _mystream_source_stop && _mystream_stream_oready) begin
        _mystream_b2_source_ram_renable <= 0;
        _mystream_b2_idle <= 1;
      end 
      if(_set_flag_67) begin
        _mystream_b3_source_mode <= 5'b1;
        _mystream_b3_source_offset <= _th_comp_offset_3;
        _mystream_b3_source_size <= _th_comp_size_2 >>> 2;
        _mystream_b3_source_stride <= 1;
      end 
      if(_set_flag_67) begin
        _mystream_b3_source_sel <= 8;
      end 
      if(_mystream_source_start && _mystream_b3_source_mode & 5'b1 && _mystream_stream_oready) begin
        _mystream_b3_source_offset_buf <= _mystream_b3_source_offset;
        _mystream_b3_source_size_buf <= _mystream_b3_source_size;
        _mystream_b3_source_stride_buf <= _mystream_b3_source_stride;
      end 
      if(_mystream_stream_oready && _mystream_source_busy && _mystream_is_root) begin
        __variable_wdata_8 <= _mystream_b3_source_ram_rdata;
      end 
      if((_mystream_b3_source_fsm_7 == 1) && _mystream_stream_oready) begin
        _mystream_b3_idle <= 0;
        _mystream_b3_source_ram_raddr <= _mystream_b3_source_offset_buf;
        _mystream_b3_source_ram_renable <= 1;
        _mystream_b3_source_count <= _mystream_b3_source_size_buf;
      end 
      if((_mystream_b3_source_fsm_7 == 2) && _mystream_stream_oready) begin
        _mystream_b3_source_ram_raddr <= _mystream_b3_source_ram_raddr + _mystream_b3_source_stride_buf;
        _mystream_b3_source_ram_renable <= 1;
        _mystream_b3_source_count <= _mystream_b3_source_count - 1;
      end 
      if((_mystream_b3_source_fsm_7 == 2) && (_mystream_b3_source_count == 1) && _mystream_stream_oready) begin
        _mystream_b3_source_ram_renable <= 0;
        _mystream_b3_idle <= 1;
      end 
      if((_mystream_b3_source_fsm_7 == 2) && _mystream_source_stop && _mystream_stream_oready) begin
        _mystream_b3_source_ram_renable <= 0;
        _mystream_b3_idle <= 1;
      end 
      if(_mystream_stream_oready) begin
        _tmp_71 <= _set_flag_70;
      end 
      if(_mystream_stream_oready) begin
        _tmp_72 <= _tmp_71;
      end 
      if(_mystream_stream_oready) begin
        _tmp_73 <= _tmp_72;
      end 
      if(_mystream_stream_oready) begin
        _tmp_74 <= _tmp_73;
      end 
      if(_mystream_stream_oready) begin
        _tmp_75 <= _tmp_74;
      end 
      if(_mystream_stream_oready) begin
        _tmp_76 <= _th_comp_offset_3;
      end 
      if(_mystream_stream_oready) begin
        _tmp_77 <= _tmp_76;
      end 
      if(_mystream_stream_oready) begin
        _tmp_78 <= _tmp_77;
      end 
      if(_mystream_stream_oready) begin
        _tmp_79 <= _tmp_78;
      end 
      if(_mystream_stream_oready) begin
        _tmp_80 <= _tmp_79;
      end 
      if(_tmp_75) begin
        _mystream_sum_sink_mode <= 5'b1;
        _mystream_sum_sink_offset <= _tmp_80;
        _mystream_sum_sink_size <= 1;
        _mystream_sum_sink_stride <= 1;
      end 
      if(_tmp_75) begin
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
      if((_mystream_sum_sink_fsm_8 == 2) && mystream_sum_valid_data && _mystream_stream_oready) begin
        _mystream_sum_sink_waddr <= _mystream_sum_sink_waddr + _mystream_sum_sink_stride_buf;
        _mystream_sum_sink_wdata <= mystream_sum_data;
        _mystream_sum_sink_wenable <= 1;
        _mystream_sum_sink_count <= _mystream_sum_sink_count - 1;
      end 
      if(_mystream_stream_oready) begin
        _tmp_82 <= _mystream_source_start;
      end 
      if(_mystream_stream_oready) begin
        _tmp_83 <= _tmp_82;
      end 
      if(_mystream_stream_oready) begin
        _tmp_84 <= _tmp_83;
      end 
      if(_mystream_stream_oready) begin
        _tmp_85 <= _mystream_source_start;
      end 
      if(_mystream_stream_oready) begin
        _tmp_86 <= _tmp_85;
      end 
      if(_mystream_stream_oready) begin
        _tmp_87 <= _tmp_86;
      end 
      if(_mystream_stream_oready && _tmp_87) begin
        __variable_wdata_18 <= 1;
      end 
      if(_mystream_stream_oready) begin
        _tmp_88 <= _mystream_source_start;
      end 
      if(_mystream_stream_oready) begin
        _tmp_89 <= _tmp_88;
      end 
      if(_mystream_stream_oready) begin
        _tmp_90 <= _tmp_89;
      end 
      if(_mystream_stream_oready) begin
        _tmp_91 <= _tmp_90;
      end 
      if(_mystream_stream_oready && _tmp_91) begin
        __variable_wdata_18 <= 0;
      end 
      if(_mystream_stream_oready) begin
        _tmp_94 <= _tmp_93;
      end 
      if(_mystream_stream_oready) begin
        _tmp_97 <= _tmp_96;
      end 
      if(_mystream_stream_oready && _tmp_97) begin
        __variable_wdata_18 <= 1;
      end 
      if(_mystream_stream_oready) begin
        _tmp_98 <= _mystream_source_start;
      end 
      if(_mystream_stream_oready) begin
        _tmp_99 <= _tmp_98;
      end 
      if(_mystream_stream_oready) begin
        _tmp_100 <= _tmp_99;
      end 
      if(_mystream_stream_oready) begin
        _tmp_101 <= _tmp_100;
      end 
      if(_mystream_stream_oready) begin
        _tmp_102 <= _tmp_101;
      end 
      if(_mystream_stream_oready) begin
        _tmp_103 <= _mystream_source_stop;
      end 
      if(_mystream_stream_oready) begin
        _tmp_104 <= _tmp_103;
      end 
      if(_mystream_stream_oready) begin
        _tmp_105 <= _tmp_104;
      end 
      if(_mystream_stream_oready) begin
        _tmp_106 <= _tmp_105;
      end 
      if(_mystream_stream_oready) begin
        _tmp_107 <= _tmp_106;
      end 
      if(_mystream_stream_oready) begin
        _tmp_108 <= _mystream_source_busy;
      end 
      if(_mystream_stream_oready) begin
        _tmp_109 <= _tmp_108;
      end 
      if(_mystream_stream_oready) begin
        _tmp_110 <= _tmp_109;
      end 
      if(_mystream_stream_oready) begin
        _tmp_111 <= _tmp_110;
      end 
      if(_mystream_stream_oready) begin
        _tmp_112 <= _tmp_111;
      end 
      if(_mystream_stream_oready) begin
        _tmp_113 <= _mystream_sink_busy;
      end 
      if(!_mystream_sink_busy && _tmp_113) begin
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
      if(_mystream_stream_oready && _tmp_84) begin
        _mystream_stream_ivalid <= 1;
      end 
      if(_mystream_stream_oready && _tmp_94) begin
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
          if(_mystream_stream_oready && (_mystream_a0_idle && _mystream_a1_idle && _mystream_a2_idle && _mystream_a3_idle && _mystream_b0_idle && _mystream_b1_idle && _mystream_b2_idle && _mystream_b3_idle && _mystream_bias0_idle && _mystream_bias1_idle && _mystream_bias2_idle && _mystream_bias3_idle && (_mystream_fsm == 3))) begin
            _mystream_source_busy <= 0;
          end 
          if(_mystream_stream_oready && (_mystream_a0_idle && _mystream_a1_idle && _mystream_a2_idle && _mystream_a3_idle && _mystream_b0_idle && _mystream_b1_idle && _mystream_b2_idle && _mystream_b3_idle && _mystream_bias0_idle && _mystream_bias1_idle && _mystream_bias2_idle && _mystream_bias3_idle && (_mystream_fsm == 3)) && _mystream_run_flag) begin
            _mystream_source_start <= 1;
          end 
          if(_mystream_stream_oready && (_mystream_a0_idle && _mystream_a1_idle && _mystream_a2_idle && _mystream_a3_idle && _mystream_b0_idle && _mystream_b1_idle && _mystream_b2_idle && _mystream_b3_idle && _mystream_bias0_idle && _mystream_bias1_idle && _mystream_bias2_idle && _mystream_bias3_idle && (_mystream_fsm == 3))) begin
            _mystream_fsm <= _mystream_fsm_init;
          end 
          if(_mystream_stream_oready && (_mystream_a0_idle && _mystream_a1_idle && _mystream_a2_idle && _mystream_a3_idle && _mystream_b0_idle && _mystream_b1_idle && _mystream_b2_idle && _mystream_b3_idle && _mystream_bias0_idle && _mystream_bias1_idle && _mystream_bias2_idle && _mystream_bias3_idle && (_mystream_fsm == 3)) && _mystream_run_flag) begin
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

  always @(posedge CLK) begin
    if(RST) begin
      th_comp <= th_comp_init;
      _th_comp_size_0 <= 0;
      _th_comp_offset_1 <= 0;
      _th_comp_size_2 <= 0;
      _th_comp_offset_3 <= 0;
      _th_comp_start_time_4 <= 0;
      _th_comp_end_time_5 <= 0;
      _th_comp_exec_time_6 <= 0;
      _th_comp_size_7 <= 0;
      _th_comp_offset_8 <= 0;
      _th_comp_sum_9 <= 0;
      _th_comp_i_10 <= 0;
      read_rdata_166 <= 0;
      _th_comp_a_11 <= 0;
      read_rdata_169 <= 0;
      _th_comp_b_12 <= 0;
      _th_comp_c_13 <= 0;
      _th_comp_size_14 <= 0;
      _th_comp_offset_stream_15 <= 0;
      _th_comp_offset_seq_16 <= 0;
      _th_comp_all_ok_17 <= 0;
      _th_comp_i_18 <= 0;
      read_rdata_188 <= 0;
      _th_comp_st_19 <= 0;
      read_rdata_191 <= 0;
      _th_comp_sq_20 <= 0;
    end else begin
      case(th_comp)
        th_comp_init: begin
          _th_comp_size_0 <= 64;
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
          _th_comp_size_2 <= _th_comp_size_0;
          _th_comp_offset_3 <= _th_comp_offset_1;
          th_comp <= th_comp_7;
        end
        th_comp_7: begin
          _th_comp_start_time_4 <= counter;
          th_comp <= th_comp_8;
        end
        th_comp_8: begin
          th_comp <= th_comp_9;
        end
        th_comp_9: begin
          th_comp <= th_comp_10;
        end
        th_comp_10: begin
          th_comp <= th_comp_11;
        end
        th_comp_11: begin
          th_comp <= th_comp_12;
        end
        th_comp_12: begin
          th_comp <= th_comp_13;
        end
        th_comp_13: begin
          $display("ssss: %d", (_th_comp_size_2 >>> 2));
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
          if(_mystream_stream_oready) begin
            th_comp <= th_comp_19;
          end 
        end
        th_comp_19: begin
          th_comp <= th_comp_20;
        end
        th_comp_20: begin
          if(_mystream_busy) begin
            th_comp <= th_comp_21;
          end 
        end
        th_comp_21: begin
          if(!_mystream_busy) begin
            th_comp <= th_comp_22;
          end 
        end
        th_comp_22: begin
          _th_comp_end_time_5 <= counter;
          th_comp <= th_comp_23;
        end
        th_comp_23: begin
          _th_comp_exec_time_6 <= _th_comp_end_time_5 - _th_comp_start_time_4;
          th_comp <= th_comp_24;
        end
        th_comp_24: begin
          $display("# para = %d, exec_time = %d", 4, _th_comp_exec_time_6);
          th_comp <= th_comp_25;
        end
        th_comp_25: begin
          if(_myaxi_write_req_idle) begin
            th_comp <= th_comp_26;
          end 
        end
        th_comp_26: begin
          if(_myaxi_write_idle && (outstanding_wcount_0 == 0)) begin
            th_comp <= th_comp_27;
          end 
        end
        th_comp_27: begin
          _th_comp_offset_1 <= 512;
          th_comp <= th_comp_28;
        end
        th_comp_28: begin
          if(_myaxi_read_req_idle) begin
            th_comp <= th_comp_29;
          end 
        end
        th_comp_29: begin
          if(_myaxi_read_idle) begin
            th_comp <= th_comp_30;
          end 
        end
        th_comp_30: begin
          if(_myaxi_read_req_idle) begin
            th_comp <= th_comp_31;
          end 
        end
        th_comp_31: begin
          if(_myaxi_read_idle) begin
            th_comp <= th_comp_32;
          end 
        end
        th_comp_32: begin
          _th_comp_size_7 <= _th_comp_size_0;
          _th_comp_offset_8 <= _th_comp_offset_1;
          th_comp <= th_comp_33;
        end
        th_comp_33: begin
          _th_comp_sum_9 <= 0;
          th_comp <= th_comp_34;
        end
        th_comp_34: begin
          _th_comp_i_10 <= 0;
          th_comp <= th_comp_35;
        end
        th_comp_35: begin
          if(_th_comp_i_10 < _th_comp_size_7) begin
            th_comp <= th_comp_36;
          end else begin
            th_comp <= th_comp_43;
          end
        end
        th_comp_36: begin
          if(__tmp_165_1) begin
            read_rdata_166 <= ram_x_0_rdata;
          end 
          if(__tmp_165_1) begin
            th_comp <= th_comp_37;
          end 
        end
        th_comp_37: begin
          _th_comp_a_11 <= read_rdata_166;
          th_comp <= th_comp_38;
        end
        th_comp_38: begin
          if(__tmp_168_1) begin
            read_rdata_169 <= ram_y_0_rdata;
          end 
          if(__tmp_168_1) begin
            th_comp <= th_comp_39;
          end 
        end
        th_comp_39: begin
          _th_comp_b_12 <= read_rdata_169;
          th_comp <= th_comp_40;
        end
        th_comp_40: begin
          _th_comp_c_13 <= _th_comp_a_11 + _th_comp_b_12;
          th_comp <= th_comp_41;
        end
        th_comp_41: begin
          _th_comp_sum_9 <= _th_comp_sum_9 + _th_comp_c_13;
          th_comp <= th_comp_42;
        end
        th_comp_42: begin
          _th_comp_i_10 <= _th_comp_i_10 + 1;
          th_comp <= th_comp_35;
        end
        th_comp_43: begin
          th_comp <= th_comp_44;
        end
        th_comp_44: begin
          if(_myaxi_write_req_idle) begin
            th_comp <= th_comp_45;
          end 
        end
        th_comp_45: begin
          if(_myaxi_write_idle && (outstanding_wcount_0 == 0)) begin
            th_comp <= th_comp_46;
          end 
        end
        th_comp_46: begin
          if(_myaxi_read_req_idle) begin
            th_comp <= th_comp_47;
          end 
        end
        th_comp_47: begin
          if(_myaxi_read_idle) begin
            th_comp <= th_comp_48;
          end 
        end
        th_comp_48: begin
          _th_comp_size_14 <= 1;
          _th_comp_offset_stream_15 <= 0;
          _th_comp_offset_seq_16 <= _th_comp_offset_1;
          th_comp <= th_comp_49;
        end
        th_comp_49: begin
          _th_comp_all_ok_17 <= 1;
          th_comp <= th_comp_50;
        end
        th_comp_50: begin
          _th_comp_i_18 <= 0;
          th_comp <= th_comp_51;
        end
        th_comp_51: begin
          if(_th_comp_i_18 < _th_comp_size_14) begin
            th_comp <= th_comp_52;
          end else begin
            th_comp <= th_comp_61;
          end
        end
        th_comp_52: begin
          if(__tmp_187_1) begin
            read_rdata_188 <= ram_c_0_rdata;
          end 
          if(__tmp_187_1) begin
            th_comp <= th_comp_53;
          end 
        end
        th_comp_53: begin
          _th_comp_st_19 <= read_rdata_188;
          th_comp <= th_comp_54;
        end
        th_comp_54: begin
          if(__tmp_190_1) begin
            read_rdata_191 <= ram_c_0_rdata;
          end 
          if(__tmp_190_1) begin
            th_comp <= th_comp_55;
          end 
        end
        th_comp_55: begin
          _th_comp_sq_20 <= read_rdata_191;
          th_comp <= th_comp_56;
        end
        th_comp_56: begin
          $display("%d", _th_comp_st_19);
          th_comp <= th_comp_57;
        end
        th_comp_57: begin
          $display("%d", _th_comp_sq_20);
          th_comp <= th_comp_58;
        end
        th_comp_58: begin
          if(_th_comp_st_19 !== _th_comp_sq_20) begin
            th_comp <= th_comp_59;
          end else begin
            th_comp <= th_comp_60;
          end
        end
        th_comp_59: begin
          _th_comp_all_ok_17 <= 0;
          th_comp <= th_comp_60;
        end
        th_comp_60: begin
          _th_comp_i_18 <= _th_comp_i_18 + 1;
          th_comp <= th_comp_51;
        end
        th_comp_61: begin
          if(_th_comp_all_ok_17) begin
            th_comp <= th_comp_62;
          end else begin
            th_comp <= th_comp_64;
          end
        end
        th_comp_62: begin
          $display("# verify: PASSED");
          th_comp <= th_comp_63;
        end
        th_comp_63: begin
          th_comp <= th_comp_65;
        end
        th_comp_64: begin
          $display("# verify: FAILED");
          th_comp <= th_comp_65;
        end
        th_comp_65: begin
          $finish;
          th_comp <= th_comp_66;
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

  localparam _myaxi_read_data_fsm_1 = 1;
  localparam _myaxi_read_data_fsm_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _myaxi_read_data_fsm <= _myaxi_read_data_fsm_init;
    end else begin
      case(_myaxi_read_data_fsm)
        _myaxi_read_data_fsm_init: begin
          if(_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 1)) begin
            _myaxi_read_data_fsm <= _myaxi_read_data_fsm_1;
          end 
          if(_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 2)) begin
            _myaxi_read_data_fsm <= _myaxi_read_data_fsm_1;
          end 
          if(_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 3)) begin
            _myaxi_read_data_fsm <= _myaxi_read_data_fsm_1;
          end 
          if(_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 4)) begin
            _myaxi_read_data_fsm <= _myaxi_read_data_fsm_1;
          end 
          if(_myaxi_read_data_idle && !_myaxi_read_req_fifo_empty && (_myaxi_read_op_sel_fifo == 5)) begin
            _myaxi_read_data_fsm <= _myaxi_read_data_fsm_1;
          end 
        end
        _myaxi_read_data_fsm_1: begin
          _myaxi_read_data_fsm <= _myaxi_read_data_fsm_2;
          _myaxi_read_data_fsm <= _myaxi_read_data_fsm_2;
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

  localparam write_burst_fsm_0_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_fsm_0 <= write_burst_fsm_0_init;
      write_burst_addr_33 <= 0;
      write_burst_stride_34 <= 0;
      write_burst_length_35 <= 0;
      write_burst_done_36 <= 0;
    end else begin
      case(write_burst_fsm_0)
        write_burst_fsm_0_init: begin
          write_burst_addr_33 <= _myaxi_read_local_addr_buf;
          write_burst_stride_34 <= _myaxi_read_local_stride_buf;
          write_burst_length_35 <= _myaxi_read_local_size_buf;
          write_burst_done_36 <= 0;
          if((_myaxi_read_data_fsm == 1) && (_myaxi_read_op_sel_buf == 1) && (_myaxi_read_local_size_buf > 0)) begin
            write_burst_fsm_0 <= write_burst_fsm_0_1;
          end 
        end
        write_burst_fsm_0_1: begin
          if(myaxi_rvalid) begin
            write_burst_addr_33 <= write_burst_addr_33 + write_burst_stride_34;
            write_burst_length_35 <= write_burst_length_35 - 1;
            write_burst_done_36 <= 0;
          end 
          if(myaxi_rvalid && (write_burst_length_35 <= 1)) begin
            write_burst_done_36 <= 1;
          end 
          if(myaxi_rvalid && 0) begin
            write_burst_done_36 <= 1;
          end 
          if(myaxi_rvalid && (write_burst_length_35 <= 1)) begin
            write_burst_fsm_0 <= write_burst_fsm_0_init;
          end 
          if(myaxi_rvalid && 0) begin
            write_burst_fsm_0 <= write_burst_fsm_0_init;
          end 
          if(0) begin
            write_burst_fsm_0 <= write_burst_fsm_0_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_fsm_1_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_fsm_1 <= write_burst_fsm_1_init;
      write_burst_addr_40 <= 0;
      write_burst_stride_41 <= 0;
      write_burst_length_42 <= 0;
      write_burst_done_43 <= 0;
    end else begin
      case(write_burst_fsm_1)
        write_burst_fsm_1_init: begin
          write_burst_addr_40 <= _myaxi_read_local_addr_buf;
          write_burst_stride_41 <= _myaxi_read_local_stride_buf;
          write_burst_length_42 <= _myaxi_read_local_size_buf;
          write_burst_done_43 <= 0;
          if((_myaxi_read_data_fsm == 1) && (_myaxi_read_op_sel_buf == 2) && (_myaxi_read_local_size_buf > 0)) begin
            write_burst_fsm_1 <= write_burst_fsm_1_1;
          end 
        end
        write_burst_fsm_1_1: begin
          if(myaxi_rvalid) begin
            write_burst_addr_40 <= write_burst_addr_40 + write_burst_stride_41;
            write_burst_length_42 <= write_burst_length_42 - 1;
            write_burst_done_43 <= 0;
          end 
          if(myaxi_rvalid && (write_burst_length_42 <= 1)) begin
            write_burst_done_43 <= 1;
          end 
          if(myaxi_rvalid && 0) begin
            write_burst_done_43 <= 1;
          end 
          if(myaxi_rvalid && (write_burst_length_42 <= 1)) begin
            write_burst_fsm_1 <= write_burst_fsm_1_init;
          end 
          if(myaxi_rvalid && 0) begin
            write_burst_fsm_1 <= write_burst_fsm_1_init;
          end 
          if(0) begin
            write_burst_fsm_1 <= write_burst_fsm_1_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_a0_source_fsm_0_1 = 1;
  localparam _mystream_a0_source_fsm_0_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_a0_source_fsm_0 <= _mystream_a0_source_fsm_0_init;
    end else begin
      case(_mystream_a0_source_fsm_0)
        _mystream_a0_source_fsm_0_init: begin
          if(_mystream_source_start && _mystream_a0_source_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_a0_source_fsm_0 <= _mystream_a0_source_fsm_0_1;
          end 
        end
        _mystream_a0_source_fsm_0_1: begin
          if(_mystream_stream_oready) begin
            _mystream_a0_source_fsm_0 <= _mystream_a0_source_fsm_0_2;
          end 
        end
        _mystream_a0_source_fsm_0_2: begin
          if((_mystream_a0_source_count == 1) && _mystream_stream_oready) begin
            _mystream_a0_source_fsm_0 <= _mystream_a0_source_fsm_0_init;
          end 
          if(_mystream_source_stop && _mystream_stream_oready) begin
            _mystream_a0_source_fsm_0 <= _mystream_a0_source_fsm_0_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_a1_source_fsm_1_1 = 1;
  localparam _mystream_a1_source_fsm_1_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_a1_source_fsm_1 <= _mystream_a1_source_fsm_1_init;
    end else begin
      case(_mystream_a1_source_fsm_1)
        _mystream_a1_source_fsm_1_init: begin
          if(_mystream_source_start && _mystream_a1_source_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_a1_source_fsm_1 <= _mystream_a1_source_fsm_1_1;
          end 
        end
        _mystream_a1_source_fsm_1_1: begin
          if(_mystream_stream_oready) begin
            _mystream_a1_source_fsm_1 <= _mystream_a1_source_fsm_1_2;
          end 
        end
        _mystream_a1_source_fsm_1_2: begin
          if((_mystream_a1_source_count == 1) && _mystream_stream_oready) begin
            _mystream_a1_source_fsm_1 <= _mystream_a1_source_fsm_1_init;
          end 
          if(_mystream_source_stop && _mystream_stream_oready) begin
            _mystream_a1_source_fsm_1 <= _mystream_a1_source_fsm_1_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_a2_source_fsm_2_1 = 1;
  localparam _mystream_a2_source_fsm_2_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_a2_source_fsm_2 <= _mystream_a2_source_fsm_2_init;
    end else begin
      case(_mystream_a2_source_fsm_2)
        _mystream_a2_source_fsm_2_init: begin
          if(_mystream_source_start && _mystream_a2_source_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_a2_source_fsm_2 <= _mystream_a2_source_fsm_2_1;
          end 
        end
        _mystream_a2_source_fsm_2_1: begin
          if(_mystream_stream_oready) begin
            _mystream_a2_source_fsm_2 <= _mystream_a2_source_fsm_2_2;
          end 
        end
        _mystream_a2_source_fsm_2_2: begin
          if((_mystream_a2_source_count == 1) && _mystream_stream_oready) begin
            _mystream_a2_source_fsm_2 <= _mystream_a2_source_fsm_2_init;
          end 
          if(_mystream_source_stop && _mystream_stream_oready) begin
            _mystream_a2_source_fsm_2 <= _mystream_a2_source_fsm_2_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_a3_source_fsm_3_1 = 1;
  localparam _mystream_a3_source_fsm_3_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_a3_source_fsm_3 <= _mystream_a3_source_fsm_3_init;
    end else begin
      case(_mystream_a3_source_fsm_3)
        _mystream_a3_source_fsm_3_init: begin
          if(_mystream_source_start && _mystream_a3_source_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_a3_source_fsm_3 <= _mystream_a3_source_fsm_3_1;
          end 
        end
        _mystream_a3_source_fsm_3_1: begin
          if(_mystream_stream_oready) begin
            _mystream_a3_source_fsm_3 <= _mystream_a3_source_fsm_3_2;
          end 
        end
        _mystream_a3_source_fsm_3_2: begin
          if((_mystream_a3_source_count == 1) && _mystream_stream_oready) begin
            _mystream_a3_source_fsm_3 <= _mystream_a3_source_fsm_3_init;
          end 
          if(_mystream_source_stop && _mystream_stream_oready) begin
            _mystream_a3_source_fsm_3 <= _mystream_a3_source_fsm_3_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_b0_source_fsm_4_1 = 1;
  localparam _mystream_b0_source_fsm_4_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_b0_source_fsm_4 <= _mystream_b0_source_fsm_4_init;
    end else begin
      case(_mystream_b0_source_fsm_4)
        _mystream_b0_source_fsm_4_init: begin
          if(_mystream_source_start && _mystream_b0_source_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_b0_source_fsm_4 <= _mystream_b0_source_fsm_4_1;
          end 
        end
        _mystream_b0_source_fsm_4_1: begin
          if(_mystream_stream_oready) begin
            _mystream_b0_source_fsm_4 <= _mystream_b0_source_fsm_4_2;
          end 
        end
        _mystream_b0_source_fsm_4_2: begin
          if((_mystream_b0_source_count == 1) && _mystream_stream_oready) begin
            _mystream_b0_source_fsm_4 <= _mystream_b0_source_fsm_4_init;
          end 
          if(_mystream_source_stop && _mystream_stream_oready) begin
            _mystream_b0_source_fsm_4 <= _mystream_b0_source_fsm_4_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_b1_source_fsm_5_1 = 1;
  localparam _mystream_b1_source_fsm_5_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_b1_source_fsm_5 <= _mystream_b1_source_fsm_5_init;
    end else begin
      case(_mystream_b1_source_fsm_5)
        _mystream_b1_source_fsm_5_init: begin
          if(_mystream_source_start && _mystream_b1_source_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_b1_source_fsm_5 <= _mystream_b1_source_fsm_5_1;
          end 
        end
        _mystream_b1_source_fsm_5_1: begin
          if(_mystream_stream_oready) begin
            _mystream_b1_source_fsm_5 <= _mystream_b1_source_fsm_5_2;
          end 
        end
        _mystream_b1_source_fsm_5_2: begin
          if((_mystream_b1_source_count == 1) && _mystream_stream_oready) begin
            _mystream_b1_source_fsm_5 <= _mystream_b1_source_fsm_5_init;
          end 
          if(_mystream_source_stop && _mystream_stream_oready) begin
            _mystream_b1_source_fsm_5 <= _mystream_b1_source_fsm_5_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_b2_source_fsm_6_1 = 1;
  localparam _mystream_b2_source_fsm_6_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_b2_source_fsm_6 <= _mystream_b2_source_fsm_6_init;
    end else begin
      case(_mystream_b2_source_fsm_6)
        _mystream_b2_source_fsm_6_init: begin
          if(_mystream_source_start && _mystream_b2_source_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_b2_source_fsm_6 <= _mystream_b2_source_fsm_6_1;
          end 
        end
        _mystream_b2_source_fsm_6_1: begin
          if(_mystream_stream_oready) begin
            _mystream_b2_source_fsm_6 <= _mystream_b2_source_fsm_6_2;
          end 
        end
        _mystream_b2_source_fsm_6_2: begin
          if((_mystream_b2_source_count == 1) && _mystream_stream_oready) begin
            _mystream_b2_source_fsm_6 <= _mystream_b2_source_fsm_6_init;
          end 
          if(_mystream_source_stop && _mystream_stream_oready) begin
            _mystream_b2_source_fsm_6 <= _mystream_b2_source_fsm_6_init;
          end 
        end
      endcase
    end
  end

  localparam _mystream_b3_source_fsm_7_1 = 1;
  localparam _mystream_b3_source_fsm_7_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      _mystream_b3_source_fsm_7 <= _mystream_b3_source_fsm_7_init;
    end else begin
      case(_mystream_b3_source_fsm_7)
        _mystream_b3_source_fsm_7_init: begin
          if(_mystream_source_start && _mystream_b3_source_mode & 5'b1 && _mystream_stream_oready) begin
            _mystream_b3_source_fsm_7 <= _mystream_b3_source_fsm_7_1;
          end 
        end
        _mystream_b3_source_fsm_7_1: begin
          if(_mystream_stream_oready) begin
            _mystream_b3_source_fsm_7 <= _mystream_b3_source_fsm_7_2;
          end 
        end
        _mystream_b3_source_fsm_7_2: begin
          if((_mystream_b3_source_count == 1) && _mystream_stream_oready) begin
            _mystream_b3_source_fsm_7 <= _mystream_b3_source_fsm_7_init;
          end 
          if(_mystream_source_stop && _mystream_stream_oready) begin
            _mystream_b3_source_fsm_7 <= _mystream_b3_source_fsm_7_init;
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
          if(mystream_sum_valid_data && (_mystream_sum_sink_count == 1) && _mystream_stream_oready) begin
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
          if((_myaxi_write_op_sel_buf == 1) && read_burst_rvalid_147 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0)) && read_burst_rlast_148) begin
            _myaxi_write_data_fsm <= _myaxi_write_data_fsm_init;
          end 
          if((_myaxi_write_op_sel_buf == 2) && read_burst_rvalid_175 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0)) && read_burst_rlast_176) begin
            _myaxi_write_data_fsm <= _myaxi_write_data_fsm_init;
          end 
        end
      endcase
    end
  end

  localparam read_burst_fsm_2_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      read_burst_fsm_2 <= read_burst_fsm_2_init;
      read_burst_addr_144 <= 0;
      read_burst_stride_145 <= 0;
      read_burst_length_146 <= 0;
      read_burst_rvalid_147 <= 0;
      read_burst_rlast_148 <= 0;
    end else begin
      case(read_burst_fsm_2)
        read_burst_fsm_2_init: begin
          read_burst_addr_144 <= _myaxi_write_local_addr_buf;
          read_burst_stride_145 <= _myaxi_write_local_stride_buf;
          read_burst_length_146 <= _myaxi_write_size_buf;
          read_burst_rvalid_147 <= 0;
          read_burst_rlast_148 <= 0;
          if((_myaxi_write_data_fsm == 1) && (_myaxi_write_op_sel_buf == 1) && (_myaxi_write_size_buf > 0)) begin
            read_burst_fsm_2 <= read_burst_fsm_2_1;
          end 
        end
        read_burst_fsm_2_1: begin
          if((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0) && (read_burst_length_146 > 0)) begin
            read_burst_addr_144 <= read_burst_addr_144 + read_burst_stride_145;
            read_burst_length_146 <= read_burst_length_146 - 1;
            read_burst_rvalid_147 <= 1;
          end 
          if((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0) && (read_burst_length_146 <= 1)) begin
            read_burst_rlast_148 <= 1;
          end 
          if(read_burst_rlast_148 && read_burst_rvalid_147 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0))) begin
            read_burst_rvalid_147 <= 0;
            read_burst_rlast_148 <= 0;
          end 
          if(0) begin
            read_burst_rvalid_147 <= 0;
            read_burst_rlast_148 <= 0;
          end 
          if(read_burst_rlast_148 && read_burst_rvalid_147 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0))) begin
            read_burst_fsm_2 <= read_burst_fsm_2_init;
          end 
          if(0) begin
            read_burst_fsm_2 <= read_burst_fsm_2_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_fsm_3_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_fsm_3 <= write_burst_fsm_3_init;
      write_burst_addr_154 <= 0;
      write_burst_stride_155 <= 0;
      write_burst_length_156 <= 0;
      write_burst_done_157 <= 0;
    end else begin
      case(write_burst_fsm_3)
        write_burst_fsm_3_init: begin
          write_burst_addr_154 <= _myaxi_read_local_addr_buf;
          write_burst_stride_155 <= _myaxi_read_local_stride_buf;
          write_burst_length_156 <= _myaxi_read_local_size_buf;
          write_burst_done_157 <= 0;
          if((_myaxi_read_data_fsm == 1) && (_myaxi_read_op_sel_buf == 3) && (_myaxi_read_local_size_buf > 0)) begin
            write_burst_fsm_3 <= write_burst_fsm_3_1;
          end 
        end
        write_burst_fsm_3_1: begin
          if(myaxi_rvalid) begin
            write_burst_addr_154 <= write_burst_addr_154 + write_burst_stride_155;
            write_burst_length_156 <= write_burst_length_156 - 1;
            write_burst_done_157 <= 0;
          end 
          if(myaxi_rvalid && (write_burst_length_156 <= 1)) begin
            write_burst_done_157 <= 1;
          end 
          if(myaxi_rvalid && 0) begin
            write_burst_done_157 <= 1;
          end 
          if(myaxi_rvalid && (write_burst_length_156 <= 1)) begin
            write_burst_fsm_3 <= write_burst_fsm_3_init;
          end 
          if(myaxi_rvalid && 0) begin
            write_burst_fsm_3 <= write_burst_fsm_3_init;
          end 
          if(0) begin
            write_burst_fsm_3 <= write_burst_fsm_3_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_fsm_4_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_fsm_4 <= write_burst_fsm_4_init;
      write_burst_addr_160 <= 0;
      write_burst_stride_161 <= 0;
      write_burst_length_162 <= 0;
      write_burst_done_163 <= 0;
    end else begin
      case(write_burst_fsm_4)
        write_burst_fsm_4_init: begin
          write_burst_addr_160 <= _myaxi_read_local_addr_buf;
          write_burst_stride_161 <= _myaxi_read_local_stride_buf;
          write_burst_length_162 <= _myaxi_read_local_size_buf;
          write_burst_done_163 <= 0;
          if((_myaxi_read_data_fsm == 1) && (_myaxi_read_op_sel_buf == 4) && (_myaxi_read_local_size_buf > 0)) begin
            write_burst_fsm_4 <= write_burst_fsm_4_1;
          end 
        end
        write_burst_fsm_4_1: begin
          if(myaxi_rvalid) begin
            write_burst_addr_160 <= write_burst_addr_160 + write_burst_stride_161;
            write_burst_length_162 <= write_burst_length_162 - 1;
            write_burst_done_163 <= 0;
          end 
          if(myaxi_rvalid && (write_burst_length_162 <= 1)) begin
            write_burst_done_163 <= 1;
          end 
          if(myaxi_rvalid && 0) begin
            write_burst_done_163 <= 1;
          end 
          if(myaxi_rvalid && (write_burst_length_162 <= 1)) begin
            write_burst_fsm_4 <= write_burst_fsm_4_init;
          end 
          if(myaxi_rvalid && 0) begin
            write_burst_fsm_4 <= write_burst_fsm_4_init;
          end 
          if(0) begin
            write_burst_fsm_4 <= write_burst_fsm_4_init;
          end 
        end
      endcase
    end
  end

  localparam read_burst_fsm_5_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      read_burst_fsm_5 <= read_burst_fsm_5_init;
      read_burst_addr_172 <= 0;
      read_burst_stride_173 <= 0;
      read_burst_length_174 <= 0;
      read_burst_rvalid_175 <= 0;
      read_burst_rlast_176 <= 0;
    end else begin
      case(read_burst_fsm_5)
        read_burst_fsm_5_init: begin
          read_burst_addr_172 <= _myaxi_write_local_addr_buf;
          read_burst_stride_173 <= _myaxi_write_local_stride_buf;
          read_burst_length_174 <= _myaxi_write_size_buf;
          read_burst_rvalid_175 <= 0;
          read_burst_rlast_176 <= 0;
          if((_myaxi_write_data_fsm == 1) && (_myaxi_write_op_sel_buf == 2) && (_myaxi_write_size_buf > 0)) begin
            read_burst_fsm_5 <= read_burst_fsm_5_1;
          end 
        end
        read_burst_fsm_5_1: begin
          if((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0) && (read_burst_length_174 > 0)) begin
            read_burst_addr_172 <= read_burst_addr_172 + read_burst_stride_173;
            read_burst_length_174 <= read_burst_length_174 - 1;
            read_burst_rvalid_175 <= 1;
          end 
          if((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0) && (read_burst_length_174 <= 1)) begin
            read_burst_rlast_176 <= 1;
          end 
          if(read_burst_rlast_176 && read_burst_rvalid_175 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0))) begin
            read_burst_rvalid_175 <= 0;
            read_burst_rlast_176 <= 0;
          end 
          if(0) begin
            read_burst_rvalid_175 <= 0;
            read_burst_rlast_176 <= 0;
          end 
          if(read_burst_rlast_176 && read_burst_rvalid_175 && ((myaxi_wready || !myaxi_wvalid) && (_myaxi_write_size_buf > 0))) begin
            read_burst_fsm_5 <= read_burst_fsm_5_init;
          end 
          if(0) begin
            read_burst_fsm_5 <= read_burst_fsm_5_init;
          end 
        end
      endcase
    end
  end

  localparam write_burst_fsm_6_1 = 1;

  always @(posedge CLK) begin
    if(RST) begin
      write_burst_fsm_6 <= write_burst_fsm_6_init;
      write_burst_addr_182 <= 0;
      write_burst_stride_183 <= 0;
      write_burst_length_184 <= 0;
      write_burst_done_185 <= 0;
    end else begin
      case(write_burst_fsm_6)
        write_burst_fsm_6_init: begin
          write_burst_addr_182 <= _myaxi_read_local_addr_buf;
          write_burst_stride_183 <= _myaxi_read_local_stride_buf;
          write_burst_length_184 <= _myaxi_read_local_size_buf;
          write_burst_done_185 <= 0;
          if((_myaxi_read_data_fsm == 1) && (_myaxi_read_op_sel_buf == 5) && (_myaxi_read_local_size_buf > 0)) begin
            write_burst_fsm_6 <= write_burst_fsm_6_1;
          end 
        end
        write_burst_fsm_6_1: begin
          if(myaxi_rvalid) begin
            write_burst_addr_182 <= write_burst_addr_182 + write_burst_stride_183;
            write_burst_length_184 <= write_burst_length_184 - 1;
            write_burst_done_185 <= 0;
          end 
          if(myaxi_rvalid && (write_burst_length_184 <= 1)) begin
            write_burst_done_185 <= 1;
          end 
          if(myaxi_rvalid && 0) begin
            write_burst_done_185 <= 1;
          end 
          if(myaxi_rvalid && (write_burst_length_184 <= 1)) begin
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



module ram_a_0
(
  input CLK,
  input [10-1:0] ram_a_0_0_addr,
  output [32-1:0] ram_a_0_0_rdata,
  input [32-1:0] ram_a_0_0_wdata,
  input ram_a_0_0_wenable,
  input ram_a_0_0_enable
);

  reg [32-1:0] ram_a_0_0_rdata_out;
  assign ram_a_0_0_rdata = ram_a_0_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

  always @(posedge CLK) begin
    if(ram_a_0_0_enable) begin
      if(ram_a_0_0_wenable) begin
        mem[ram_a_0_0_addr] <= ram_a_0_0_wdata;
        ram_a_0_0_rdata_out <= ram_a_0_0_wdata;
      end else begin
        ram_a_0_0_rdata_out <= mem[ram_a_0_0_addr];
      end
    end 
  end


endmodule



module ram_a_1
(
  input CLK,
  input [10-1:0] ram_a_1_0_addr,
  output [32-1:0] ram_a_1_0_rdata,
  input [32-1:0] ram_a_1_0_wdata,
  input ram_a_1_0_wenable,
  input ram_a_1_0_enable
);

  reg [32-1:0] ram_a_1_0_rdata_out;
  assign ram_a_1_0_rdata = ram_a_1_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

  always @(posedge CLK) begin
    if(ram_a_1_0_enable) begin
      if(ram_a_1_0_wenable) begin
        mem[ram_a_1_0_addr] <= ram_a_1_0_wdata;
        ram_a_1_0_rdata_out <= ram_a_1_0_wdata;
      end else begin
        ram_a_1_0_rdata_out <= mem[ram_a_1_0_addr];
      end
    end 
  end


endmodule



module ram_a_2
(
  input CLK,
  input [10-1:0] ram_a_2_0_addr,
  output [32-1:0] ram_a_2_0_rdata,
  input [32-1:0] ram_a_2_0_wdata,
  input ram_a_2_0_wenable,
  input ram_a_2_0_enable
);

  reg [32-1:0] ram_a_2_0_rdata_out;
  assign ram_a_2_0_rdata = ram_a_2_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

  always @(posedge CLK) begin
    if(ram_a_2_0_enable) begin
      if(ram_a_2_0_wenable) begin
        mem[ram_a_2_0_addr] <= ram_a_2_0_wdata;
        ram_a_2_0_rdata_out <= ram_a_2_0_wdata;
      end else begin
        ram_a_2_0_rdata_out <= mem[ram_a_2_0_addr];
      end
    end 
  end


endmodule



module ram_a_3
(
  input CLK,
  input [10-1:0] ram_a_3_0_addr,
  output [32-1:0] ram_a_3_0_rdata,
  input [32-1:0] ram_a_3_0_wdata,
  input ram_a_3_0_wenable,
  input ram_a_3_0_enable
);

  reg [32-1:0] ram_a_3_0_rdata_out;
  assign ram_a_3_0_rdata = ram_a_3_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

  always @(posedge CLK) begin
    if(ram_a_3_0_enable) begin
      if(ram_a_3_0_wenable) begin
        mem[ram_a_3_0_addr] <= ram_a_3_0_wdata;
        ram_a_3_0_rdata_out <= ram_a_3_0_wdata;
      end else begin
        ram_a_3_0_rdata_out <= mem[ram_a_3_0_addr];
      end
    end 
  end


endmodule



module ram_b_0
(
  input CLK,
  input [10-1:0] ram_b_0_0_addr,
  output [32-1:0] ram_b_0_0_rdata,
  input [32-1:0] ram_b_0_0_wdata,
  input ram_b_0_0_wenable,
  input ram_b_0_0_enable
);

  reg [32-1:0] ram_b_0_0_rdata_out;
  assign ram_b_0_0_rdata = ram_b_0_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

  always @(posedge CLK) begin
    if(ram_b_0_0_enable) begin
      if(ram_b_0_0_wenable) begin
        mem[ram_b_0_0_addr] <= ram_b_0_0_wdata;
        ram_b_0_0_rdata_out <= ram_b_0_0_wdata;
      end else begin
        ram_b_0_0_rdata_out <= mem[ram_b_0_0_addr];
      end
    end 
  end


endmodule



module ram_b_1
(
  input CLK,
  input [10-1:0] ram_b_1_0_addr,
  output [32-1:0] ram_b_1_0_rdata,
  input [32-1:0] ram_b_1_0_wdata,
  input ram_b_1_0_wenable,
  input ram_b_1_0_enable
);

  reg [32-1:0] ram_b_1_0_rdata_out;
  assign ram_b_1_0_rdata = ram_b_1_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

  always @(posedge CLK) begin
    if(ram_b_1_0_enable) begin
      if(ram_b_1_0_wenable) begin
        mem[ram_b_1_0_addr] <= ram_b_1_0_wdata;
        ram_b_1_0_rdata_out <= ram_b_1_0_wdata;
      end else begin
        ram_b_1_0_rdata_out <= mem[ram_b_1_0_addr];
      end
    end 
  end


endmodule



module ram_b_2
(
  input CLK,
  input [10-1:0] ram_b_2_0_addr,
  output [32-1:0] ram_b_2_0_rdata,
  input [32-1:0] ram_b_2_0_wdata,
  input ram_b_2_0_wenable,
  input ram_b_2_0_enable
);

  reg [32-1:0] ram_b_2_0_rdata_out;
  assign ram_b_2_0_rdata = ram_b_2_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

  always @(posedge CLK) begin
    if(ram_b_2_0_enable) begin
      if(ram_b_2_0_wenable) begin
        mem[ram_b_2_0_addr] <= ram_b_2_0_wdata;
        ram_b_2_0_rdata_out <= ram_b_2_0_wdata;
      end else begin
        ram_b_2_0_rdata_out <= mem[ram_b_2_0_addr];
      end
    end 
  end


endmodule



module ram_b_3
(
  input CLK,
  input [10-1:0] ram_b_3_0_addr,
  output [32-1:0] ram_b_3_0_rdata,
  input [32-1:0] ram_b_3_0_wdata,
  input ram_b_3_0_wenable,
  input ram_b_3_0_enable
);

  reg [32-1:0] ram_b_3_0_rdata_out;
  assign ram_b_3_0_rdata = ram_b_3_0_rdata_out;
  reg [32-1:0] mem [0:1024-1];

  always @(posedge CLK) begin
    if(ram_b_3_0_enable) begin
      if(ram_b_3_0_wenable) begin
        mem[ram_b_3_0_addr] <= ram_b_3_0_wdata;
        ram_b_3_0_rdata_out <= ram_b_3_0_wdata;
      end else begin
        ram_b_3_0_rdata_out <= mem[ram_b_3_0_addr];
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

