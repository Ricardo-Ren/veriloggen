import led

expected_verilog = """
module test;
  reg CLK;
  reg RST;
  reg [32-1:0] x;
  reg vx;
  wire [32-1:0] y;
  wire vy;

  blinkled
  uut
  (
    .CLK(CLK),
    .RST(RST),
    .x(x),
    .vx(vx),
    .y(y),
    .vy(vy)
  );

  reg reset_done;

  initial begin
    $dumpfile("uut.vcd");
    $dumpvars(0, uut);
  end

  initial begin
    CLK = 0;
    forever begin
      #5 CLK = (!CLK);
    end
  end

  initial begin
    RST = 0;
    reset_done = 0;
    x = 0;
    vx = 0;
    #100;
    RST = 1;
    #100;
    RST = 0;
    #1000;
    reset_done = 1;
    @(posedge CLK);
    #1;
    #10000;
    $finish;
  end

  reg [32-1:0] _tmp_0;
  reg [32-1:0] xfsm;
  localparam xfsm_init = 0;
  localparam xfsm_1 = 1;
  localparam xfsm_2 = 2;

  always @(posedge CLK) begin
    if(RST) begin
      xfsm <= xfsm_init;
      _tmp_0 <= 0;
    end else begin
      case(xfsm)
        xfsm_init: begin
          vx <= 0;
          if(reset_done) begin
            xfsm <= xfsm_1;
          end 
        end
        xfsm_1: begin
          vx <= 1;
          x <= (x + 1);
          _tmp_0 <= (_tmp_0 + 1);
          if(_tmp_0 == 10) begin
            xfsm <= xfsm_2;
          end 
        end
        xfsm_2: begin
          vx <= 0;
        end
      endcase
    end
  end

  always @(posedge CLK) begin
    if(reset_done) begin
      if(vx) begin
        $display("x=%d", x);
      end 
      if(vy) begin
        $display("y=%d", y);
      end 
    end 
  end

endmodule

module blinkled
(
  input CLK,
  input RST,
  input [32-1:0] x,
  input vx,
  output reg [32-1:0] y,
  output reg vy
);

  reg [32-1:0] _pipe_data_0;
  reg _pipe_valid_0;
  wire _pipe_nvalid_0;
  assign _pipe_nvalid_0 = (vx && _pipe_valid_0);
  reg [32-1:0] _pipe_data_1;
  reg _pipe_valid_1;
  wire _pipe_nvalid_1;
  assign _pipe_nvalid_1 = (vx && _pipe_valid_1);
  reg [32-1:0] _pipe_data_2;
  reg _pipe_valid_2;
  wire _pipe_nvalid_2;
  assign _pipe_nvalid_2 = (vx && _pipe_valid_2);
  reg [32-1:0] _pipe_data_3;
  reg _pipe_valid_3;
  reg [32-1:0] _pipe_data_4;
  reg _pipe_valid_4;
  reg [32-1:0] _pipe_data_5;
  reg _pipe_valid_5;

  always @(posedge CLK) begin
    if(RST) begin
      _pipe_data_0 <= 0;
      _pipe_valid_0 <= 0;
      _pipe_data_1 <= 0;
      _pipe_valid_1 <= 0;
      _pipe_data_2 <= 0;
      _pipe_valid_2 <= 0;
      _pipe_data_3 <= 0;
      _pipe_valid_3 <= 0;
      _pipe_data_4 <= 0;
      _pipe_valid_4 <= 0;
      _pipe_data_5 <= 0;
      _pipe_valid_5 <= 0;
      y <= 0;
      vy <= 0;
    end else begin
      if(vx) begin
        _pipe_data_0 <= x;
      end 
      if(vx) begin
        _pipe_valid_0 <= vx;
      end 
      if(_pipe_nvalid_0) begin
        _pipe_data_1 <= _pipe_data_0;
      end 
      if(_pipe_nvalid_0) begin
        _pipe_valid_1 <= _pipe_nvalid_0;
      end 
      if(_pipe_nvalid_1) begin
        _pipe_data_2 <= _pipe_data_1;
      end 
      if(_pipe_nvalid_1) begin
        _pipe_valid_2 <= _pipe_nvalid_1;
      end 
      if(_pipe_nvalid_1 && _pipe_nvalid_2) begin
        _pipe_data_3 <= (_pipe_data_1 + _pipe_data_2);
      end 
      _pipe_valid_3 <= (_pipe_nvalid_1 && _pipe_nvalid_2);
      if(_pipe_nvalid_0) begin
        _pipe_data_4 <= _pipe_data_0;
      end 
      _pipe_valid_4 <= _pipe_nvalid_0;
      if(_pipe_valid_3 && _pipe_valid_4) begin
        _pipe_data_5 <= (_pipe_data_3 + _pipe_data_4);
      end 
      _pipe_valid_5 <= (_pipe_valid_3 && _pipe_valid_4);
      y <= _pipe_data_5;
      vy <= _pipe_valid_5;
    end
  end

endmodule
"""

def test_led():
    test_module = led.mkTest()
    code = test_module.to_verilog()

    from pyverilog.vparser.parser import VerilogParser
    from pyverilog.ast_code_generator.codegen import ASTCodeGenerator
    parser = VerilogParser()
    expected_ast = parser.parse(expected_verilog)
    codegen = ASTCodeGenerator()
    expected_code = codegen.visit(expected_ast)

    assert(expected_code == code)
