module addition_layer(
  input  [7:0]  io_round_in,
  input  [63:0] io_x2_in,
  output [63:0] io_x2_out,
  input         io_clk,
  input         io_rst
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] constant; // @[layers.scala 40:8]
  wire  _T = 8'h0 == io_round_in; // @[Conditional.scala 37:30]
  wire  _T_1 = 8'h1 == io_round_in; // @[Conditional.scala 37:30]
  wire  _T_2 = 8'h2 == io_round_in; // @[Conditional.scala 37:30]
  wire  _T_3 = 8'h3 == io_round_in; // @[Conditional.scala 37:30]
  wire  _T_4 = 8'h4 == io_round_in; // @[Conditional.scala 37:30]
  wire  _T_5 = 8'h5 == io_round_in; // @[Conditional.scala 37:30]
  wire  _T_6 = 8'h6 == io_round_in; // @[Conditional.scala 37:30]
  wire  _T_7 = 8'h7 == io_round_in; // @[Conditional.scala 37:30]
  wire  _T_8 = 8'h8 == io_round_in; // @[Conditional.scala 37:30]
  wire  _T_9 = 8'h9 == io_round_in; // @[Conditional.scala 37:30]
  wire  _T_10 = 8'ha == io_round_in; // @[Conditional.scala 37:30]
  wire  _T_11 = 8'hb == io_round_in; // @[Conditional.scala 37:30]
  assign io_x2_out = io_x2_in ^ constant; // @[layers.scala 86:13]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  constant = _RAND_0[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge io_clk) begin
    if (io_rst) begin
      constant <= 64'h0;
    end else if (_T) begin
      constant <= 64'hf0;
    end else if (_T_1) begin
      constant <= 64'he1;
    end else if (_T_2) begin
      constant <= 64'hd2;
    end else if (_T_3) begin
      constant <= 64'hc3;
    end else if (_T_4) begin
      constant <= 64'hb4;
    end else if (_T_5) begin
      constant <= 64'ha5;
    end else if (_T_6) begin
      constant <= 64'h96;
    end else if (_T_7) begin
      constant <= 64'h87;
    end else if (_T_8) begin
      constant <= 64'h78;
    end else if (_T_9) begin
      constant <= 64'h69;
    end else if (_T_10) begin
      constant <= 64'h5a;
    end else if (_T_11) begin
      constant <= 64'h4b;
    end
  end
endmodule
module substitution_layer(
  input  [63:0] io_x_in_0,
  input  [63:0] io_x_in_1,
  input  [63:0] io_x_in_2,
  input  [63:0] io_x_in_3,
  input  [63:0] io_x_in_4,
  output [63:0] io_x_out_0,
  output [63:0] io_x_out_1,
  output [63:0] io_x_out_2,
  output [63:0] io_x_out_3,
  output [63:0] io_x_out_4
);
  wire [4:0] _T_8 = {io_x_in_0[0],io_x_in_1[0],io_x_in_2[0],io_x_in_3[0],io_x_in_4[0]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1 = 5'h1 == _T_8 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_2 = 5'h2 == _T_8 ? 5'h1f : _GEN_1; // @[layers.scala 132:13]
  wire [4:0] _GEN_3 = 5'h3 == _T_8 ? 5'h14 : _GEN_2; // @[layers.scala 132:13]
  wire [4:0] _GEN_4 = 5'h4 == _T_8 ? 5'h1a : _GEN_3; // @[layers.scala 132:13]
  wire [4:0] _GEN_5 = 5'h5 == _T_8 ? 5'h15 : _GEN_4; // @[layers.scala 132:13]
  wire [4:0] _GEN_6 = 5'h6 == _T_8 ? 5'h9 : _GEN_5; // @[layers.scala 132:13]
  wire [4:0] _GEN_7 = 5'h7 == _T_8 ? 5'h2 : _GEN_6; // @[layers.scala 132:13]
  wire [4:0] _GEN_8 = 5'h8 == _T_8 ? 5'h1b : _GEN_7; // @[layers.scala 132:13]
  wire [4:0] _GEN_9 = 5'h9 == _T_8 ? 5'h5 : _GEN_8; // @[layers.scala 132:13]
  wire [4:0] _GEN_10 = 5'ha == _T_8 ? 5'h8 : _GEN_9; // @[layers.scala 132:13]
  wire [4:0] _GEN_11 = 5'hb == _T_8 ? 5'h12 : _GEN_10; // @[layers.scala 132:13]
  wire [4:0] _GEN_12 = 5'hc == _T_8 ? 5'h1d : _GEN_11; // @[layers.scala 132:13]
  wire [4:0] _GEN_13 = 5'hd == _T_8 ? 5'h3 : _GEN_12; // @[layers.scala 132:13]
  wire [4:0] _GEN_14 = 5'he == _T_8 ? 5'h6 : _GEN_13; // @[layers.scala 132:13]
  wire [4:0] _GEN_15 = 5'hf == _T_8 ? 5'h1c : _GEN_14; // @[layers.scala 132:13]
  wire [4:0] _GEN_16 = 5'h10 == _T_8 ? 5'h1e : _GEN_15; // @[layers.scala 132:13]
  wire [4:0] _GEN_17 = 5'h11 == _T_8 ? 5'h13 : _GEN_16; // @[layers.scala 132:13]
  wire [4:0] _GEN_18 = 5'h12 == _T_8 ? 5'h7 : _GEN_17; // @[layers.scala 132:13]
  wire [4:0] _GEN_19 = 5'h13 == _T_8 ? 5'he : _GEN_18; // @[layers.scala 132:13]
  wire [4:0] _GEN_20 = 5'h14 == _T_8 ? 5'h0 : _GEN_19; // @[layers.scala 132:13]
  wire [4:0] _GEN_21 = 5'h15 == _T_8 ? 5'hd : _GEN_20; // @[layers.scala 132:13]
  wire [4:0] _GEN_22 = 5'h16 == _T_8 ? 5'h11 : _GEN_21; // @[layers.scala 132:13]
  wire [4:0] _GEN_23 = 5'h17 == _T_8 ? 5'h18 : _GEN_22; // @[layers.scala 132:13]
  wire [4:0] _GEN_24 = 5'h18 == _T_8 ? 5'h10 : _GEN_23; // @[layers.scala 132:13]
  wire [4:0] _GEN_25 = 5'h19 == _T_8 ? 5'hc : _GEN_24; // @[layers.scala 132:13]
  wire [4:0] _GEN_26 = 5'h1a == _T_8 ? 5'h1 : _GEN_25; // @[layers.scala 132:13]
  wire [4:0] _GEN_27 = 5'h1b == _T_8 ? 5'h19 : _GEN_26; // @[layers.scala 132:13]
  wire [4:0] _GEN_28 = 5'h1c == _T_8 ? 5'h16 : _GEN_27; // @[layers.scala 132:13]
  wire [4:0] _GEN_29 = 5'h1d == _T_8 ? 5'ha : _GEN_28; // @[layers.scala 132:13]
  wire [4:0] _GEN_30 = 5'h1e == _T_8 ? 5'hf : _GEN_29; // @[layers.scala 132:13]
  wire [4:0] temp_0 = 5'h1f == _T_8 ? 5'h17 : _GEN_30; // @[layers.scala 132:13]
  wire [4:0] _T_17 = {io_x_in_0[1],io_x_in_1[1],io_x_in_2[1],io_x_in_3[1],io_x_in_4[1]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_33 = 5'h1 == _T_17 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_34 = 5'h2 == _T_17 ? 5'h1f : _GEN_33; // @[layers.scala 132:13]
  wire [4:0] _GEN_35 = 5'h3 == _T_17 ? 5'h14 : _GEN_34; // @[layers.scala 132:13]
  wire [4:0] _GEN_36 = 5'h4 == _T_17 ? 5'h1a : _GEN_35; // @[layers.scala 132:13]
  wire [4:0] _GEN_37 = 5'h5 == _T_17 ? 5'h15 : _GEN_36; // @[layers.scala 132:13]
  wire [4:0] _GEN_38 = 5'h6 == _T_17 ? 5'h9 : _GEN_37; // @[layers.scala 132:13]
  wire [4:0] _GEN_39 = 5'h7 == _T_17 ? 5'h2 : _GEN_38; // @[layers.scala 132:13]
  wire [4:0] _GEN_40 = 5'h8 == _T_17 ? 5'h1b : _GEN_39; // @[layers.scala 132:13]
  wire [4:0] _GEN_41 = 5'h9 == _T_17 ? 5'h5 : _GEN_40; // @[layers.scala 132:13]
  wire [4:0] _GEN_42 = 5'ha == _T_17 ? 5'h8 : _GEN_41; // @[layers.scala 132:13]
  wire [4:0] _GEN_43 = 5'hb == _T_17 ? 5'h12 : _GEN_42; // @[layers.scala 132:13]
  wire [4:0] _GEN_44 = 5'hc == _T_17 ? 5'h1d : _GEN_43; // @[layers.scala 132:13]
  wire [4:0] _GEN_45 = 5'hd == _T_17 ? 5'h3 : _GEN_44; // @[layers.scala 132:13]
  wire [4:0] _GEN_46 = 5'he == _T_17 ? 5'h6 : _GEN_45; // @[layers.scala 132:13]
  wire [4:0] _GEN_47 = 5'hf == _T_17 ? 5'h1c : _GEN_46; // @[layers.scala 132:13]
  wire [4:0] _GEN_48 = 5'h10 == _T_17 ? 5'h1e : _GEN_47; // @[layers.scala 132:13]
  wire [4:0] _GEN_49 = 5'h11 == _T_17 ? 5'h13 : _GEN_48; // @[layers.scala 132:13]
  wire [4:0] _GEN_50 = 5'h12 == _T_17 ? 5'h7 : _GEN_49; // @[layers.scala 132:13]
  wire [4:0] _GEN_51 = 5'h13 == _T_17 ? 5'he : _GEN_50; // @[layers.scala 132:13]
  wire [4:0] _GEN_52 = 5'h14 == _T_17 ? 5'h0 : _GEN_51; // @[layers.scala 132:13]
  wire [4:0] _GEN_53 = 5'h15 == _T_17 ? 5'hd : _GEN_52; // @[layers.scala 132:13]
  wire [4:0] _GEN_54 = 5'h16 == _T_17 ? 5'h11 : _GEN_53; // @[layers.scala 132:13]
  wire [4:0] _GEN_55 = 5'h17 == _T_17 ? 5'h18 : _GEN_54; // @[layers.scala 132:13]
  wire [4:0] _GEN_56 = 5'h18 == _T_17 ? 5'h10 : _GEN_55; // @[layers.scala 132:13]
  wire [4:0] _GEN_57 = 5'h19 == _T_17 ? 5'hc : _GEN_56; // @[layers.scala 132:13]
  wire [4:0] _GEN_58 = 5'h1a == _T_17 ? 5'h1 : _GEN_57; // @[layers.scala 132:13]
  wire [4:0] _GEN_59 = 5'h1b == _T_17 ? 5'h19 : _GEN_58; // @[layers.scala 132:13]
  wire [4:0] _GEN_60 = 5'h1c == _T_17 ? 5'h16 : _GEN_59; // @[layers.scala 132:13]
  wire [4:0] _GEN_61 = 5'h1d == _T_17 ? 5'ha : _GEN_60; // @[layers.scala 132:13]
  wire [4:0] _GEN_62 = 5'h1e == _T_17 ? 5'hf : _GEN_61; // @[layers.scala 132:13]
  wire [4:0] temp_1 = 5'h1f == _T_17 ? 5'h17 : _GEN_62; // @[layers.scala 132:13]
  wire [4:0] _T_26 = {io_x_in_0[2],io_x_in_1[2],io_x_in_2[2],io_x_in_3[2],io_x_in_4[2]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_65 = 5'h1 == _T_26 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_66 = 5'h2 == _T_26 ? 5'h1f : _GEN_65; // @[layers.scala 132:13]
  wire [4:0] _GEN_67 = 5'h3 == _T_26 ? 5'h14 : _GEN_66; // @[layers.scala 132:13]
  wire [4:0] _GEN_68 = 5'h4 == _T_26 ? 5'h1a : _GEN_67; // @[layers.scala 132:13]
  wire [4:0] _GEN_69 = 5'h5 == _T_26 ? 5'h15 : _GEN_68; // @[layers.scala 132:13]
  wire [4:0] _GEN_70 = 5'h6 == _T_26 ? 5'h9 : _GEN_69; // @[layers.scala 132:13]
  wire [4:0] _GEN_71 = 5'h7 == _T_26 ? 5'h2 : _GEN_70; // @[layers.scala 132:13]
  wire [4:0] _GEN_72 = 5'h8 == _T_26 ? 5'h1b : _GEN_71; // @[layers.scala 132:13]
  wire [4:0] _GEN_73 = 5'h9 == _T_26 ? 5'h5 : _GEN_72; // @[layers.scala 132:13]
  wire [4:0] _GEN_74 = 5'ha == _T_26 ? 5'h8 : _GEN_73; // @[layers.scala 132:13]
  wire [4:0] _GEN_75 = 5'hb == _T_26 ? 5'h12 : _GEN_74; // @[layers.scala 132:13]
  wire [4:0] _GEN_76 = 5'hc == _T_26 ? 5'h1d : _GEN_75; // @[layers.scala 132:13]
  wire [4:0] _GEN_77 = 5'hd == _T_26 ? 5'h3 : _GEN_76; // @[layers.scala 132:13]
  wire [4:0] _GEN_78 = 5'he == _T_26 ? 5'h6 : _GEN_77; // @[layers.scala 132:13]
  wire [4:0] _GEN_79 = 5'hf == _T_26 ? 5'h1c : _GEN_78; // @[layers.scala 132:13]
  wire [4:0] _GEN_80 = 5'h10 == _T_26 ? 5'h1e : _GEN_79; // @[layers.scala 132:13]
  wire [4:0] _GEN_81 = 5'h11 == _T_26 ? 5'h13 : _GEN_80; // @[layers.scala 132:13]
  wire [4:0] _GEN_82 = 5'h12 == _T_26 ? 5'h7 : _GEN_81; // @[layers.scala 132:13]
  wire [4:0] _GEN_83 = 5'h13 == _T_26 ? 5'he : _GEN_82; // @[layers.scala 132:13]
  wire [4:0] _GEN_84 = 5'h14 == _T_26 ? 5'h0 : _GEN_83; // @[layers.scala 132:13]
  wire [4:0] _GEN_85 = 5'h15 == _T_26 ? 5'hd : _GEN_84; // @[layers.scala 132:13]
  wire [4:0] _GEN_86 = 5'h16 == _T_26 ? 5'h11 : _GEN_85; // @[layers.scala 132:13]
  wire [4:0] _GEN_87 = 5'h17 == _T_26 ? 5'h18 : _GEN_86; // @[layers.scala 132:13]
  wire [4:0] _GEN_88 = 5'h18 == _T_26 ? 5'h10 : _GEN_87; // @[layers.scala 132:13]
  wire [4:0] _GEN_89 = 5'h19 == _T_26 ? 5'hc : _GEN_88; // @[layers.scala 132:13]
  wire [4:0] _GEN_90 = 5'h1a == _T_26 ? 5'h1 : _GEN_89; // @[layers.scala 132:13]
  wire [4:0] _GEN_91 = 5'h1b == _T_26 ? 5'h19 : _GEN_90; // @[layers.scala 132:13]
  wire [4:0] _GEN_92 = 5'h1c == _T_26 ? 5'h16 : _GEN_91; // @[layers.scala 132:13]
  wire [4:0] _GEN_93 = 5'h1d == _T_26 ? 5'ha : _GEN_92; // @[layers.scala 132:13]
  wire [4:0] _GEN_94 = 5'h1e == _T_26 ? 5'hf : _GEN_93; // @[layers.scala 132:13]
  wire [4:0] temp_2 = 5'h1f == _T_26 ? 5'h17 : _GEN_94; // @[layers.scala 132:13]
  wire [4:0] _T_35 = {io_x_in_0[3],io_x_in_1[3],io_x_in_2[3],io_x_in_3[3],io_x_in_4[3]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_97 = 5'h1 == _T_35 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_98 = 5'h2 == _T_35 ? 5'h1f : _GEN_97; // @[layers.scala 132:13]
  wire [4:0] _GEN_99 = 5'h3 == _T_35 ? 5'h14 : _GEN_98; // @[layers.scala 132:13]
  wire [4:0] _GEN_100 = 5'h4 == _T_35 ? 5'h1a : _GEN_99; // @[layers.scala 132:13]
  wire [4:0] _GEN_101 = 5'h5 == _T_35 ? 5'h15 : _GEN_100; // @[layers.scala 132:13]
  wire [4:0] _GEN_102 = 5'h6 == _T_35 ? 5'h9 : _GEN_101; // @[layers.scala 132:13]
  wire [4:0] _GEN_103 = 5'h7 == _T_35 ? 5'h2 : _GEN_102; // @[layers.scala 132:13]
  wire [4:0] _GEN_104 = 5'h8 == _T_35 ? 5'h1b : _GEN_103; // @[layers.scala 132:13]
  wire [4:0] _GEN_105 = 5'h9 == _T_35 ? 5'h5 : _GEN_104; // @[layers.scala 132:13]
  wire [4:0] _GEN_106 = 5'ha == _T_35 ? 5'h8 : _GEN_105; // @[layers.scala 132:13]
  wire [4:0] _GEN_107 = 5'hb == _T_35 ? 5'h12 : _GEN_106; // @[layers.scala 132:13]
  wire [4:0] _GEN_108 = 5'hc == _T_35 ? 5'h1d : _GEN_107; // @[layers.scala 132:13]
  wire [4:0] _GEN_109 = 5'hd == _T_35 ? 5'h3 : _GEN_108; // @[layers.scala 132:13]
  wire [4:0] _GEN_110 = 5'he == _T_35 ? 5'h6 : _GEN_109; // @[layers.scala 132:13]
  wire [4:0] _GEN_111 = 5'hf == _T_35 ? 5'h1c : _GEN_110; // @[layers.scala 132:13]
  wire [4:0] _GEN_112 = 5'h10 == _T_35 ? 5'h1e : _GEN_111; // @[layers.scala 132:13]
  wire [4:0] _GEN_113 = 5'h11 == _T_35 ? 5'h13 : _GEN_112; // @[layers.scala 132:13]
  wire [4:0] _GEN_114 = 5'h12 == _T_35 ? 5'h7 : _GEN_113; // @[layers.scala 132:13]
  wire [4:0] _GEN_115 = 5'h13 == _T_35 ? 5'he : _GEN_114; // @[layers.scala 132:13]
  wire [4:0] _GEN_116 = 5'h14 == _T_35 ? 5'h0 : _GEN_115; // @[layers.scala 132:13]
  wire [4:0] _GEN_117 = 5'h15 == _T_35 ? 5'hd : _GEN_116; // @[layers.scala 132:13]
  wire [4:0] _GEN_118 = 5'h16 == _T_35 ? 5'h11 : _GEN_117; // @[layers.scala 132:13]
  wire [4:0] _GEN_119 = 5'h17 == _T_35 ? 5'h18 : _GEN_118; // @[layers.scala 132:13]
  wire [4:0] _GEN_120 = 5'h18 == _T_35 ? 5'h10 : _GEN_119; // @[layers.scala 132:13]
  wire [4:0] _GEN_121 = 5'h19 == _T_35 ? 5'hc : _GEN_120; // @[layers.scala 132:13]
  wire [4:0] _GEN_122 = 5'h1a == _T_35 ? 5'h1 : _GEN_121; // @[layers.scala 132:13]
  wire [4:0] _GEN_123 = 5'h1b == _T_35 ? 5'h19 : _GEN_122; // @[layers.scala 132:13]
  wire [4:0] _GEN_124 = 5'h1c == _T_35 ? 5'h16 : _GEN_123; // @[layers.scala 132:13]
  wire [4:0] _GEN_125 = 5'h1d == _T_35 ? 5'ha : _GEN_124; // @[layers.scala 132:13]
  wire [4:0] _GEN_126 = 5'h1e == _T_35 ? 5'hf : _GEN_125; // @[layers.scala 132:13]
  wire [4:0] temp_3 = 5'h1f == _T_35 ? 5'h17 : _GEN_126; // @[layers.scala 132:13]
  wire [4:0] _T_44 = {io_x_in_0[4],io_x_in_1[4],io_x_in_2[4],io_x_in_3[4],io_x_in_4[4]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_129 = 5'h1 == _T_44 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_130 = 5'h2 == _T_44 ? 5'h1f : _GEN_129; // @[layers.scala 132:13]
  wire [4:0] _GEN_131 = 5'h3 == _T_44 ? 5'h14 : _GEN_130; // @[layers.scala 132:13]
  wire [4:0] _GEN_132 = 5'h4 == _T_44 ? 5'h1a : _GEN_131; // @[layers.scala 132:13]
  wire [4:0] _GEN_133 = 5'h5 == _T_44 ? 5'h15 : _GEN_132; // @[layers.scala 132:13]
  wire [4:0] _GEN_134 = 5'h6 == _T_44 ? 5'h9 : _GEN_133; // @[layers.scala 132:13]
  wire [4:0] _GEN_135 = 5'h7 == _T_44 ? 5'h2 : _GEN_134; // @[layers.scala 132:13]
  wire [4:0] _GEN_136 = 5'h8 == _T_44 ? 5'h1b : _GEN_135; // @[layers.scala 132:13]
  wire [4:0] _GEN_137 = 5'h9 == _T_44 ? 5'h5 : _GEN_136; // @[layers.scala 132:13]
  wire [4:0] _GEN_138 = 5'ha == _T_44 ? 5'h8 : _GEN_137; // @[layers.scala 132:13]
  wire [4:0] _GEN_139 = 5'hb == _T_44 ? 5'h12 : _GEN_138; // @[layers.scala 132:13]
  wire [4:0] _GEN_140 = 5'hc == _T_44 ? 5'h1d : _GEN_139; // @[layers.scala 132:13]
  wire [4:0] _GEN_141 = 5'hd == _T_44 ? 5'h3 : _GEN_140; // @[layers.scala 132:13]
  wire [4:0] _GEN_142 = 5'he == _T_44 ? 5'h6 : _GEN_141; // @[layers.scala 132:13]
  wire [4:0] _GEN_143 = 5'hf == _T_44 ? 5'h1c : _GEN_142; // @[layers.scala 132:13]
  wire [4:0] _GEN_144 = 5'h10 == _T_44 ? 5'h1e : _GEN_143; // @[layers.scala 132:13]
  wire [4:0] _GEN_145 = 5'h11 == _T_44 ? 5'h13 : _GEN_144; // @[layers.scala 132:13]
  wire [4:0] _GEN_146 = 5'h12 == _T_44 ? 5'h7 : _GEN_145; // @[layers.scala 132:13]
  wire [4:0] _GEN_147 = 5'h13 == _T_44 ? 5'he : _GEN_146; // @[layers.scala 132:13]
  wire [4:0] _GEN_148 = 5'h14 == _T_44 ? 5'h0 : _GEN_147; // @[layers.scala 132:13]
  wire [4:0] _GEN_149 = 5'h15 == _T_44 ? 5'hd : _GEN_148; // @[layers.scala 132:13]
  wire [4:0] _GEN_150 = 5'h16 == _T_44 ? 5'h11 : _GEN_149; // @[layers.scala 132:13]
  wire [4:0] _GEN_151 = 5'h17 == _T_44 ? 5'h18 : _GEN_150; // @[layers.scala 132:13]
  wire [4:0] _GEN_152 = 5'h18 == _T_44 ? 5'h10 : _GEN_151; // @[layers.scala 132:13]
  wire [4:0] _GEN_153 = 5'h19 == _T_44 ? 5'hc : _GEN_152; // @[layers.scala 132:13]
  wire [4:0] _GEN_154 = 5'h1a == _T_44 ? 5'h1 : _GEN_153; // @[layers.scala 132:13]
  wire [4:0] _GEN_155 = 5'h1b == _T_44 ? 5'h19 : _GEN_154; // @[layers.scala 132:13]
  wire [4:0] _GEN_156 = 5'h1c == _T_44 ? 5'h16 : _GEN_155; // @[layers.scala 132:13]
  wire [4:0] _GEN_157 = 5'h1d == _T_44 ? 5'ha : _GEN_156; // @[layers.scala 132:13]
  wire [4:0] _GEN_158 = 5'h1e == _T_44 ? 5'hf : _GEN_157; // @[layers.scala 132:13]
  wire [4:0] temp_4 = 5'h1f == _T_44 ? 5'h17 : _GEN_158; // @[layers.scala 132:13]
  wire [4:0] _T_53 = {io_x_in_0[5],io_x_in_1[5],io_x_in_2[5],io_x_in_3[5],io_x_in_4[5]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_161 = 5'h1 == _T_53 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_162 = 5'h2 == _T_53 ? 5'h1f : _GEN_161; // @[layers.scala 132:13]
  wire [4:0] _GEN_163 = 5'h3 == _T_53 ? 5'h14 : _GEN_162; // @[layers.scala 132:13]
  wire [4:0] _GEN_164 = 5'h4 == _T_53 ? 5'h1a : _GEN_163; // @[layers.scala 132:13]
  wire [4:0] _GEN_165 = 5'h5 == _T_53 ? 5'h15 : _GEN_164; // @[layers.scala 132:13]
  wire [4:0] _GEN_166 = 5'h6 == _T_53 ? 5'h9 : _GEN_165; // @[layers.scala 132:13]
  wire [4:0] _GEN_167 = 5'h7 == _T_53 ? 5'h2 : _GEN_166; // @[layers.scala 132:13]
  wire [4:0] _GEN_168 = 5'h8 == _T_53 ? 5'h1b : _GEN_167; // @[layers.scala 132:13]
  wire [4:0] _GEN_169 = 5'h9 == _T_53 ? 5'h5 : _GEN_168; // @[layers.scala 132:13]
  wire [4:0] _GEN_170 = 5'ha == _T_53 ? 5'h8 : _GEN_169; // @[layers.scala 132:13]
  wire [4:0] _GEN_171 = 5'hb == _T_53 ? 5'h12 : _GEN_170; // @[layers.scala 132:13]
  wire [4:0] _GEN_172 = 5'hc == _T_53 ? 5'h1d : _GEN_171; // @[layers.scala 132:13]
  wire [4:0] _GEN_173 = 5'hd == _T_53 ? 5'h3 : _GEN_172; // @[layers.scala 132:13]
  wire [4:0] _GEN_174 = 5'he == _T_53 ? 5'h6 : _GEN_173; // @[layers.scala 132:13]
  wire [4:0] _GEN_175 = 5'hf == _T_53 ? 5'h1c : _GEN_174; // @[layers.scala 132:13]
  wire [4:0] _GEN_176 = 5'h10 == _T_53 ? 5'h1e : _GEN_175; // @[layers.scala 132:13]
  wire [4:0] _GEN_177 = 5'h11 == _T_53 ? 5'h13 : _GEN_176; // @[layers.scala 132:13]
  wire [4:0] _GEN_178 = 5'h12 == _T_53 ? 5'h7 : _GEN_177; // @[layers.scala 132:13]
  wire [4:0] _GEN_179 = 5'h13 == _T_53 ? 5'he : _GEN_178; // @[layers.scala 132:13]
  wire [4:0] _GEN_180 = 5'h14 == _T_53 ? 5'h0 : _GEN_179; // @[layers.scala 132:13]
  wire [4:0] _GEN_181 = 5'h15 == _T_53 ? 5'hd : _GEN_180; // @[layers.scala 132:13]
  wire [4:0] _GEN_182 = 5'h16 == _T_53 ? 5'h11 : _GEN_181; // @[layers.scala 132:13]
  wire [4:0] _GEN_183 = 5'h17 == _T_53 ? 5'h18 : _GEN_182; // @[layers.scala 132:13]
  wire [4:0] _GEN_184 = 5'h18 == _T_53 ? 5'h10 : _GEN_183; // @[layers.scala 132:13]
  wire [4:0] _GEN_185 = 5'h19 == _T_53 ? 5'hc : _GEN_184; // @[layers.scala 132:13]
  wire [4:0] _GEN_186 = 5'h1a == _T_53 ? 5'h1 : _GEN_185; // @[layers.scala 132:13]
  wire [4:0] _GEN_187 = 5'h1b == _T_53 ? 5'h19 : _GEN_186; // @[layers.scala 132:13]
  wire [4:0] _GEN_188 = 5'h1c == _T_53 ? 5'h16 : _GEN_187; // @[layers.scala 132:13]
  wire [4:0] _GEN_189 = 5'h1d == _T_53 ? 5'ha : _GEN_188; // @[layers.scala 132:13]
  wire [4:0] _GEN_190 = 5'h1e == _T_53 ? 5'hf : _GEN_189; // @[layers.scala 132:13]
  wire [4:0] temp_5 = 5'h1f == _T_53 ? 5'h17 : _GEN_190; // @[layers.scala 132:13]
  wire [4:0] _T_62 = {io_x_in_0[6],io_x_in_1[6],io_x_in_2[6],io_x_in_3[6],io_x_in_4[6]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_193 = 5'h1 == _T_62 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_194 = 5'h2 == _T_62 ? 5'h1f : _GEN_193; // @[layers.scala 132:13]
  wire [4:0] _GEN_195 = 5'h3 == _T_62 ? 5'h14 : _GEN_194; // @[layers.scala 132:13]
  wire [4:0] _GEN_196 = 5'h4 == _T_62 ? 5'h1a : _GEN_195; // @[layers.scala 132:13]
  wire [4:0] _GEN_197 = 5'h5 == _T_62 ? 5'h15 : _GEN_196; // @[layers.scala 132:13]
  wire [4:0] _GEN_198 = 5'h6 == _T_62 ? 5'h9 : _GEN_197; // @[layers.scala 132:13]
  wire [4:0] _GEN_199 = 5'h7 == _T_62 ? 5'h2 : _GEN_198; // @[layers.scala 132:13]
  wire [4:0] _GEN_200 = 5'h8 == _T_62 ? 5'h1b : _GEN_199; // @[layers.scala 132:13]
  wire [4:0] _GEN_201 = 5'h9 == _T_62 ? 5'h5 : _GEN_200; // @[layers.scala 132:13]
  wire [4:0] _GEN_202 = 5'ha == _T_62 ? 5'h8 : _GEN_201; // @[layers.scala 132:13]
  wire [4:0] _GEN_203 = 5'hb == _T_62 ? 5'h12 : _GEN_202; // @[layers.scala 132:13]
  wire [4:0] _GEN_204 = 5'hc == _T_62 ? 5'h1d : _GEN_203; // @[layers.scala 132:13]
  wire [4:0] _GEN_205 = 5'hd == _T_62 ? 5'h3 : _GEN_204; // @[layers.scala 132:13]
  wire [4:0] _GEN_206 = 5'he == _T_62 ? 5'h6 : _GEN_205; // @[layers.scala 132:13]
  wire [4:0] _GEN_207 = 5'hf == _T_62 ? 5'h1c : _GEN_206; // @[layers.scala 132:13]
  wire [4:0] _GEN_208 = 5'h10 == _T_62 ? 5'h1e : _GEN_207; // @[layers.scala 132:13]
  wire [4:0] _GEN_209 = 5'h11 == _T_62 ? 5'h13 : _GEN_208; // @[layers.scala 132:13]
  wire [4:0] _GEN_210 = 5'h12 == _T_62 ? 5'h7 : _GEN_209; // @[layers.scala 132:13]
  wire [4:0] _GEN_211 = 5'h13 == _T_62 ? 5'he : _GEN_210; // @[layers.scala 132:13]
  wire [4:0] _GEN_212 = 5'h14 == _T_62 ? 5'h0 : _GEN_211; // @[layers.scala 132:13]
  wire [4:0] _GEN_213 = 5'h15 == _T_62 ? 5'hd : _GEN_212; // @[layers.scala 132:13]
  wire [4:0] _GEN_214 = 5'h16 == _T_62 ? 5'h11 : _GEN_213; // @[layers.scala 132:13]
  wire [4:0] _GEN_215 = 5'h17 == _T_62 ? 5'h18 : _GEN_214; // @[layers.scala 132:13]
  wire [4:0] _GEN_216 = 5'h18 == _T_62 ? 5'h10 : _GEN_215; // @[layers.scala 132:13]
  wire [4:0] _GEN_217 = 5'h19 == _T_62 ? 5'hc : _GEN_216; // @[layers.scala 132:13]
  wire [4:0] _GEN_218 = 5'h1a == _T_62 ? 5'h1 : _GEN_217; // @[layers.scala 132:13]
  wire [4:0] _GEN_219 = 5'h1b == _T_62 ? 5'h19 : _GEN_218; // @[layers.scala 132:13]
  wire [4:0] _GEN_220 = 5'h1c == _T_62 ? 5'h16 : _GEN_219; // @[layers.scala 132:13]
  wire [4:0] _GEN_221 = 5'h1d == _T_62 ? 5'ha : _GEN_220; // @[layers.scala 132:13]
  wire [4:0] _GEN_222 = 5'h1e == _T_62 ? 5'hf : _GEN_221; // @[layers.scala 132:13]
  wire [4:0] temp_6 = 5'h1f == _T_62 ? 5'h17 : _GEN_222; // @[layers.scala 132:13]
  wire [4:0] _T_71 = {io_x_in_0[7],io_x_in_1[7],io_x_in_2[7],io_x_in_3[7],io_x_in_4[7]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_225 = 5'h1 == _T_71 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_226 = 5'h2 == _T_71 ? 5'h1f : _GEN_225; // @[layers.scala 132:13]
  wire [4:0] _GEN_227 = 5'h3 == _T_71 ? 5'h14 : _GEN_226; // @[layers.scala 132:13]
  wire [4:0] _GEN_228 = 5'h4 == _T_71 ? 5'h1a : _GEN_227; // @[layers.scala 132:13]
  wire [4:0] _GEN_229 = 5'h5 == _T_71 ? 5'h15 : _GEN_228; // @[layers.scala 132:13]
  wire [4:0] _GEN_230 = 5'h6 == _T_71 ? 5'h9 : _GEN_229; // @[layers.scala 132:13]
  wire [4:0] _GEN_231 = 5'h7 == _T_71 ? 5'h2 : _GEN_230; // @[layers.scala 132:13]
  wire [4:0] _GEN_232 = 5'h8 == _T_71 ? 5'h1b : _GEN_231; // @[layers.scala 132:13]
  wire [4:0] _GEN_233 = 5'h9 == _T_71 ? 5'h5 : _GEN_232; // @[layers.scala 132:13]
  wire [4:0] _GEN_234 = 5'ha == _T_71 ? 5'h8 : _GEN_233; // @[layers.scala 132:13]
  wire [4:0] _GEN_235 = 5'hb == _T_71 ? 5'h12 : _GEN_234; // @[layers.scala 132:13]
  wire [4:0] _GEN_236 = 5'hc == _T_71 ? 5'h1d : _GEN_235; // @[layers.scala 132:13]
  wire [4:0] _GEN_237 = 5'hd == _T_71 ? 5'h3 : _GEN_236; // @[layers.scala 132:13]
  wire [4:0] _GEN_238 = 5'he == _T_71 ? 5'h6 : _GEN_237; // @[layers.scala 132:13]
  wire [4:0] _GEN_239 = 5'hf == _T_71 ? 5'h1c : _GEN_238; // @[layers.scala 132:13]
  wire [4:0] _GEN_240 = 5'h10 == _T_71 ? 5'h1e : _GEN_239; // @[layers.scala 132:13]
  wire [4:0] _GEN_241 = 5'h11 == _T_71 ? 5'h13 : _GEN_240; // @[layers.scala 132:13]
  wire [4:0] _GEN_242 = 5'h12 == _T_71 ? 5'h7 : _GEN_241; // @[layers.scala 132:13]
  wire [4:0] _GEN_243 = 5'h13 == _T_71 ? 5'he : _GEN_242; // @[layers.scala 132:13]
  wire [4:0] _GEN_244 = 5'h14 == _T_71 ? 5'h0 : _GEN_243; // @[layers.scala 132:13]
  wire [4:0] _GEN_245 = 5'h15 == _T_71 ? 5'hd : _GEN_244; // @[layers.scala 132:13]
  wire [4:0] _GEN_246 = 5'h16 == _T_71 ? 5'h11 : _GEN_245; // @[layers.scala 132:13]
  wire [4:0] _GEN_247 = 5'h17 == _T_71 ? 5'h18 : _GEN_246; // @[layers.scala 132:13]
  wire [4:0] _GEN_248 = 5'h18 == _T_71 ? 5'h10 : _GEN_247; // @[layers.scala 132:13]
  wire [4:0] _GEN_249 = 5'h19 == _T_71 ? 5'hc : _GEN_248; // @[layers.scala 132:13]
  wire [4:0] _GEN_250 = 5'h1a == _T_71 ? 5'h1 : _GEN_249; // @[layers.scala 132:13]
  wire [4:0] _GEN_251 = 5'h1b == _T_71 ? 5'h19 : _GEN_250; // @[layers.scala 132:13]
  wire [4:0] _GEN_252 = 5'h1c == _T_71 ? 5'h16 : _GEN_251; // @[layers.scala 132:13]
  wire [4:0] _GEN_253 = 5'h1d == _T_71 ? 5'ha : _GEN_252; // @[layers.scala 132:13]
  wire [4:0] _GEN_254 = 5'h1e == _T_71 ? 5'hf : _GEN_253; // @[layers.scala 132:13]
  wire [4:0] temp_7 = 5'h1f == _T_71 ? 5'h17 : _GEN_254; // @[layers.scala 132:13]
  wire [4:0] _T_80 = {io_x_in_0[8],io_x_in_1[8],io_x_in_2[8],io_x_in_3[8],io_x_in_4[8]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_257 = 5'h1 == _T_80 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_258 = 5'h2 == _T_80 ? 5'h1f : _GEN_257; // @[layers.scala 132:13]
  wire [4:0] _GEN_259 = 5'h3 == _T_80 ? 5'h14 : _GEN_258; // @[layers.scala 132:13]
  wire [4:0] _GEN_260 = 5'h4 == _T_80 ? 5'h1a : _GEN_259; // @[layers.scala 132:13]
  wire [4:0] _GEN_261 = 5'h5 == _T_80 ? 5'h15 : _GEN_260; // @[layers.scala 132:13]
  wire [4:0] _GEN_262 = 5'h6 == _T_80 ? 5'h9 : _GEN_261; // @[layers.scala 132:13]
  wire [4:0] _GEN_263 = 5'h7 == _T_80 ? 5'h2 : _GEN_262; // @[layers.scala 132:13]
  wire [4:0] _GEN_264 = 5'h8 == _T_80 ? 5'h1b : _GEN_263; // @[layers.scala 132:13]
  wire [4:0] _GEN_265 = 5'h9 == _T_80 ? 5'h5 : _GEN_264; // @[layers.scala 132:13]
  wire [4:0] _GEN_266 = 5'ha == _T_80 ? 5'h8 : _GEN_265; // @[layers.scala 132:13]
  wire [4:0] _GEN_267 = 5'hb == _T_80 ? 5'h12 : _GEN_266; // @[layers.scala 132:13]
  wire [4:0] _GEN_268 = 5'hc == _T_80 ? 5'h1d : _GEN_267; // @[layers.scala 132:13]
  wire [4:0] _GEN_269 = 5'hd == _T_80 ? 5'h3 : _GEN_268; // @[layers.scala 132:13]
  wire [4:0] _GEN_270 = 5'he == _T_80 ? 5'h6 : _GEN_269; // @[layers.scala 132:13]
  wire [4:0] _GEN_271 = 5'hf == _T_80 ? 5'h1c : _GEN_270; // @[layers.scala 132:13]
  wire [4:0] _GEN_272 = 5'h10 == _T_80 ? 5'h1e : _GEN_271; // @[layers.scala 132:13]
  wire [4:0] _GEN_273 = 5'h11 == _T_80 ? 5'h13 : _GEN_272; // @[layers.scala 132:13]
  wire [4:0] _GEN_274 = 5'h12 == _T_80 ? 5'h7 : _GEN_273; // @[layers.scala 132:13]
  wire [4:0] _GEN_275 = 5'h13 == _T_80 ? 5'he : _GEN_274; // @[layers.scala 132:13]
  wire [4:0] _GEN_276 = 5'h14 == _T_80 ? 5'h0 : _GEN_275; // @[layers.scala 132:13]
  wire [4:0] _GEN_277 = 5'h15 == _T_80 ? 5'hd : _GEN_276; // @[layers.scala 132:13]
  wire [4:0] _GEN_278 = 5'h16 == _T_80 ? 5'h11 : _GEN_277; // @[layers.scala 132:13]
  wire [4:0] _GEN_279 = 5'h17 == _T_80 ? 5'h18 : _GEN_278; // @[layers.scala 132:13]
  wire [4:0] _GEN_280 = 5'h18 == _T_80 ? 5'h10 : _GEN_279; // @[layers.scala 132:13]
  wire [4:0] _GEN_281 = 5'h19 == _T_80 ? 5'hc : _GEN_280; // @[layers.scala 132:13]
  wire [4:0] _GEN_282 = 5'h1a == _T_80 ? 5'h1 : _GEN_281; // @[layers.scala 132:13]
  wire [4:0] _GEN_283 = 5'h1b == _T_80 ? 5'h19 : _GEN_282; // @[layers.scala 132:13]
  wire [4:0] _GEN_284 = 5'h1c == _T_80 ? 5'h16 : _GEN_283; // @[layers.scala 132:13]
  wire [4:0] _GEN_285 = 5'h1d == _T_80 ? 5'ha : _GEN_284; // @[layers.scala 132:13]
  wire [4:0] _GEN_286 = 5'h1e == _T_80 ? 5'hf : _GEN_285; // @[layers.scala 132:13]
  wire [4:0] temp_8 = 5'h1f == _T_80 ? 5'h17 : _GEN_286; // @[layers.scala 132:13]
  wire [4:0] _T_89 = {io_x_in_0[9],io_x_in_1[9],io_x_in_2[9],io_x_in_3[9],io_x_in_4[9]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_289 = 5'h1 == _T_89 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_290 = 5'h2 == _T_89 ? 5'h1f : _GEN_289; // @[layers.scala 132:13]
  wire [4:0] _GEN_291 = 5'h3 == _T_89 ? 5'h14 : _GEN_290; // @[layers.scala 132:13]
  wire [4:0] _GEN_292 = 5'h4 == _T_89 ? 5'h1a : _GEN_291; // @[layers.scala 132:13]
  wire [4:0] _GEN_293 = 5'h5 == _T_89 ? 5'h15 : _GEN_292; // @[layers.scala 132:13]
  wire [4:0] _GEN_294 = 5'h6 == _T_89 ? 5'h9 : _GEN_293; // @[layers.scala 132:13]
  wire [4:0] _GEN_295 = 5'h7 == _T_89 ? 5'h2 : _GEN_294; // @[layers.scala 132:13]
  wire [4:0] _GEN_296 = 5'h8 == _T_89 ? 5'h1b : _GEN_295; // @[layers.scala 132:13]
  wire [4:0] _GEN_297 = 5'h9 == _T_89 ? 5'h5 : _GEN_296; // @[layers.scala 132:13]
  wire [4:0] _GEN_298 = 5'ha == _T_89 ? 5'h8 : _GEN_297; // @[layers.scala 132:13]
  wire [4:0] _GEN_299 = 5'hb == _T_89 ? 5'h12 : _GEN_298; // @[layers.scala 132:13]
  wire [4:0] _GEN_300 = 5'hc == _T_89 ? 5'h1d : _GEN_299; // @[layers.scala 132:13]
  wire [4:0] _GEN_301 = 5'hd == _T_89 ? 5'h3 : _GEN_300; // @[layers.scala 132:13]
  wire [4:0] _GEN_302 = 5'he == _T_89 ? 5'h6 : _GEN_301; // @[layers.scala 132:13]
  wire [4:0] _GEN_303 = 5'hf == _T_89 ? 5'h1c : _GEN_302; // @[layers.scala 132:13]
  wire [4:0] _GEN_304 = 5'h10 == _T_89 ? 5'h1e : _GEN_303; // @[layers.scala 132:13]
  wire [4:0] _GEN_305 = 5'h11 == _T_89 ? 5'h13 : _GEN_304; // @[layers.scala 132:13]
  wire [4:0] _GEN_306 = 5'h12 == _T_89 ? 5'h7 : _GEN_305; // @[layers.scala 132:13]
  wire [4:0] _GEN_307 = 5'h13 == _T_89 ? 5'he : _GEN_306; // @[layers.scala 132:13]
  wire [4:0] _GEN_308 = 5'h14 == _T_89 ? 5'h0 : _GEN_307; // @[layers.scala 132:13]
  wire [4:0] _GEN_309 = 5'h15 == _T_89 ? 5'hd : _GEN_308; // @[layers.scala 132:13]
  wire [4:0] _GEN_310 = 5'h16 == _T_89 ? 5'h11 : _GEN_309; // @[layers.scala 132:13]
  wire [4:0] _GEN_311 = 5'h17 == _T_89 ? 5'h18 : _GEN_310; // @[layers.scala 132:13]
  wire [4:0] _GEN_312 = 5'h18 == _T_89 ? 5'h10 : _GEN_311; // @[layers.scala 132:13]
  wire [4:0] _GEN_313 = 5'h19 == _T_89 ? 5'hc : _GEN_312; // @[layers.scala 132:13]
  wire [4:0] _GEN_314 = 5'h1a == _T_89 ? 5'h1 : _GEN_313; // @[layers.scala 132:13]
  wire [4:0] _GEN_315 = 5'h1b == _T_89 ? 5'h19 : _GEN_314; // @[layers.scala 132:13]
  wire [4:0] _GEN_316 = 5'h1c == _T_89 ? 5'h16 : _GEN_315; // @[layers.scala 132:13]
  wire [4:0] _GEN_317 = 5'h1d == _T_89 ? 5'ha : _GEN_316; // @[layers.scala 132:13]
  wire [4:0] _GEN_318 = 5'h1e == _T_89 ? 5'hf : _GEN_317; // @[layers.scala 132:13]
  wire [4:0] temp_9 = 5'h1f == _T_89 ? 5'h17 : _GEN_318; // @[layers.scala 132:13]
  wire [4:0] _T_98 = {io_x_in_0[10],io_x_in_1[10],io_x_in_2[10],io_x_in_3[10],io_x_in_4[10]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_321 = 5'h1 == _T_98 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_322 = 5'h2 == _T_98 ? 5'h1f : _GEN_321; // @[layers.scala 132:13]
  wire [4:0] _GEN_323 = 5'h3 == _T_98 ? 5'h14 : _GEN_322; // @[layers.scala 132:13]
  wire [4:0] _GEN_324 = 5'h4 == _T_98 ? 5'h1a : _GEN_323; // @[layers.scala 132:13]
  wire [4:0] _GEN_325 = 5'h5 == _T_98 ? 5'h15 : _GEN_324; // @[layers.scala 132:13]
  wire [4:0] _GEN_326 = 5'h6 == _T_98 ? 5'h9 : _GEN_325; // @[layers.scala 132:13]
  wire [4:0] _GEN_327 = 5'h7 == _T_98 ? 5'h2 : _GEN_326; // @[layers.scala 132:13]
  wire [4:0] _GEN_328 = 5'h8 == _T_98 ? 5'h1b : _GEN_327; // @[layers.scala 132:13]
  wire [4:0] _GEN_329 = 5'h9 == _T_98 ? 5'h5 : _GEN_328; // @[layers.scala 132:13]
  wire [4:0] _GEN_330 = 5'ha == _T_98 ? 5'h8 : _GEN_329; // @[layers.scala 132:13]
  wire [4:0] _GEN_331 = 5'hb == _T_98 ? 5'h12 : _GEN_330; // @[layers.scala 132:13]
  wire [4:0] _GEN_332 = 5'hc == _T_98 ? 5'h1d : _GEN_331; // @[layers.scala 132:13]
  wire [4:0] _GEN_333 = 5'hd == _T_98 ? 5'h3 : _GEN_332; // @[layers.scala 132:13]
  wire [4:0] _GEN_334 = 5'he == _T_98 ? 5'h6 : _GEN_333; // @[layers.scala 132:13]
  wire [4:0] _GEN_335 = 5'hf == _T_98 ? 5'h1c : _GEN_334; // @[layers.scala 132:13]
  wire [4:0] _GEN_336 = 5'h10 == _T_98 ? 5'h1e : _GEN_335; // @[layers.scala 132:13]
  wire [4:0] _GEN_337 = 5'h11 == _T_98 ? 5'h13 : _GEN_336; // @[layers.scala 132:13]
  wire [4:0] _GEN_338 = 5'h12 == _T_98 ? 5'h7 : _GEN_337; // @[layers.scala 132:13]
  wire [4:0] _GEN_339 = 5'h13 == _T_98 ? 5'he : _GEN_338; // @[layers.scala 132:13]
  wire [4:0] _GEN_340 = 5'h14 == _T_98 ? 5'h0 : _GEN_339; // @[layers.scala 132:13]
  wire [4:0] _GEN_341 = 5'h15 == _T_98 ? 5'hd : _GEN_340; // @[layers.scala 132:13]
  wire [4:0] _GEN_342 = 5'h16 == _T_98 ? 5'h11 : _GEN_341; // @[layers.scala 132:13]
  wire [4:0] _GEN_343 = 5'h17 == _T_98 ? 5'h18 : _GEN_342; // @[layers.scala 132:13]
  wire [4:0] _GEN_344 = 5'h18 == _T_98 ? 5'h10 : _GEN_343; // @[layers.scala 132:13]
  wire [4:0] _GEN_345 = 5'h19 == _T_98 ? 5'hc : _GEN_344; // @[layers.scala 132:13]
  wire [4:0] _GEN_346 = 5'h1a == _T_98 ? 5'h1 : _GEN_345; // @[layers.scala 132:13]
  wire [4:0] _GEN_347 = 5'h1b == _T_98 ? 5'h19 : _GEN_346; // @[layers.scala 132:13]
  wire [4:0] _GEN_348 = 5'h1c == _T_98 ? 5'h16 : _GEN_347; // @[layers.scala 132:13]
  wire [4:0] _GEN_349 = 5'h1d == _T_98 ? 5'ha : _GEN_348; // @[layers.scala 132:13]
  wire [4:0] _GEN_350 = 5'h1e == _T_98 ? 5'hf : _GEN_349; // @[layers.scala 132:13]
  wire [4:0] temp_10 = 5'h1f == _T_98 ? 5'h17 : _GEN_350; // @[layers.scala 132:13]
  wire [4:0] _T_107 = {io_x_in_0[11],io_x_in_1[11],io_x_in_2[11],io_x_in_3[11],io_x_in_4[11]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_353 = 5'h1 == _T_107 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_354 = 5'h2 == _T_107 ? 5'h1f : _GEN_353; // @[layers.scala 132:13]
  wire [4:0] _GEN_355 = 5'h3 == _T_107 ? 5'h14 : _GEN_354; // @[layers.scala 132:13]
  wire [4:0] _GEN_356 = 5'h4 == _T_107 ? 5'h1a : _GEN_355; // @[layers.scala 132:13]
  wire [4:0] _GEN_357 = 5'h5 == _T_107 ? 5'h15 : _GEN_356; // @[layers.scala 132:13]
  wire [4:0] _GEN_358 = 5'h6 == _T_107 ? 5'h9 : _GEN_357; // @[layers.scala 132:13]
  wire [4:0] _GEN_359 = 5'h7 == _T_107 ? 5'h2 : _GEN_358; // @[layers.scala 132:13]
  wire [4:0] _GEN_360 = 5'h8 == _T_107 ? 5'h1b : _GEN_359; // @[layers.scala 132:13]
  wire [4:0] _GEN_361 = 5'h9 == _T_107 ? 5'h5 : _GEN_360; // @[layers.scala 132:13]
  wire [4:0] _GEN_362 = 5'ha == _T_107 ? 5'h8 : _GEN_361; // @[layers.scala 132:13]
  wire [4:0] _GEN_363 = 5'hb == _T_107 ? 5'h12 : _GEN_362; // @[layers.scala 132:13]
  wire [4:0] _GEN_364 = 5'hc == _T_107 ? 5'h1d : _GEN_363; // @[layers.scala 132:13]
  wire [4:0] _GEN_365 = 5'hd == _T_107 ? 5'h3 : _GEN_364; // @[layers.scala 132:13]
  wire [4:0] _GEN_366 = 5'he == _T_107 ? 5'h6 : _GEN_365; // @[layers.scala 132:13]
  wire [4:0] _GEN_367 = 5'hf == _T_107 ? 5'h1c : _GEN_366; // @[layers.scala 132:13]
  wire [4:0] _GEN_368 = 5'h10 == _T_107 ? 5'h1e : _GEN_367; // @[layers.scala 132:13]
  wire [4:0] _GEN_369 = 5'h11 == _T_107 ? 5'h13 : _GEN_368; // @[layers.scala 132:13]
  wire [4:0] _GEN_370 = 5'h12 == _T_107 ? 5'h7 : _GEN_369; // @[layers.scala 132:13]
  wire [4:0] _GEN_371 = 5'h13 == _T_107 ? 5'he : _GEN_370; // @[layers.scala 132:13]
  wire [4:0] _GEN_372 = 5'h14 == _T_107 ? 5'h0 : _GEN_371; // @[layers.scala 132:13]
  wire [4:0] _GEN_373 = 5'h15 == _T_107 ? 5'hd : _GEN_372; // @[layers.scala 132:13]
  wire [4:0] _GEN_374 = 5'h16 == _T_107 ? 5'h11 : _GEN_373; // @[layers.scala 132:13]
  wire [4:0] _GEN_375 = 5'h17 == _T_107 ? 5'h18 : _GEN_374; // @[layers.scala 132:13]
  wire [4:0] _GEN_376 = 5'h18 == _T_107 ? 5'h10 : _GEN_375; // @[layers.scala 132:13]
  wire [4:0] _GEN_377 = 5'h19 == _T_107 ? 5'hc : _GEN_376; // @[layers.scala 132:13]
  wire [4:0] _GEN_378 = 5'h1a == _T_107 ? 5'h1 : _GEN_377; // @[layers.scala 132:13]
  wire [4:0] _GEN_379 = 5'h1b == _T_107 ? 5'h19 : _GEN_378; // @[layers.scala 132:13]
  wire [4:0] _GEN_380 = 5'h1c == _T_107 ? 5'h16 : _GEN_379; // @[layers.scala 132:13]
  wire [4:0] _GEN_381 = 5'h1d == _T_107 ? 5'ha : _GEN_380; // @[layers.scala 132:13]
  wire [4:0] _GEN_382 = 5'h1e == _T_107 ? 5'hf : _GEN_381; // @[layers.scala 132:13]
  wire [4:0] temp_11 = 5'h1f == _T_107 ? 5'h17 : _GEN_382; // @[layers.scala 132:13]
  wire [4:0] _T_116 = {io_x_in_0[12],io_x_in_1[12],io_x_in_2[12],io_x_in_3[12],io_x_in_4[12]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_385 = 5'h1 == _T_116 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_386 = 5'h2 == _T_116 ? 5'h1f : _GEN_385; // @[layers.scala 132:13]
  wire [4:0] _GEN_387 = 5'h3 == _T_116 ? 5'h14 : _GEN_386; // @[layers.scala 132:13]
  wire [4:0] _GEN_388 = 5'h4 == _T_116 ? 5'h1a : _GEN_387; // @[layers.scala 132:13]
  wire [4:0] _GEN_389 = 5'h5 == _T_116 ? 5'h15 : _GEN_388; // @[layers.scala 132:13]
  wire [4:0] _GEN_390 = 5'h6 == _T_116 ? 5'h9 : _GEN_389; // @[layers.scala 132:13]
  wire [4:0] _GEN_391 = 5'h7 == _T_116 ? 5'h2 : _GEN_390; // @[layers.scala 132:13]
  wire [4:0] _GEN_392 = 5'h8 == _T_116 ? 5'h1b : _GEN_391; // @[layers.scala 132:13]
  wire [4:0] _GEN_393 = 5'h9 == _T_116 ? 5'h5 : _GEN_392; // @[layers.scala 132:13]
  wire [4:0] _GEN_394 = 5'ha == _T_116 ? 5'h8 : _GEN_393; // @[layers.scala 132:13]
  wire [4:0] _GEN_395 = 5'hb == _T_116 ? 5'h12 : _GEN_394; // @[layers.scala 132:13]
  wire [4:0] _GEN_396 = 5'hc == _T_116 ? 5'h1d : _GEN_395; // @[layers.scala 132:13]
  wire [4:0] _GEN_397 = 5'hd == _T_116 ? 5'h3 : _GEN_396; // @[layers.scala 132:13]
  wire [4:0] _GEN_398 = 5'he == _T_116 ? 5'h6 : _GEN_397; // @[layers.scala 132:13]
  wire [4:0] _GEN_399 = 5'hf == _T_116 ? 5'h1c : _GEN_398; // @[layers.scala 132:13]
  wire [4:0] _GEN_400 = 5'h10 == _T_116 ? 5'h1e : _GEN_399; // @[layers.scala 132:13]
  wire [4:0] _GEN_401 = 5'h11 == _T_116 ? 5'h13 : _GEN_400; // @[layers.scala 132:13]
  wire [4:0] _GEN_402 = 5'h12 == _T_116 ? 5'h7 : _GEN_401; // @[layers.scala 132:13]
  wire [4:0] _GEN_403 = 5'h13 == _T_116 ? 5'he : _GEN_402; // @[layers.scala 132:13]
  wire [4:0] _GEN_404 = 5'h14 == _T_116 ? 5'h0 : _GEN_403; // @[layers.scala 132:13]
  wire [4:0] _GEN_405 = 5'h15 == _T_116 ? 5'hd : _GEN_404; // @[layers.scala 132:13]
  wire [4:0] _GEN_406 = 5'h16 == _T_116 ? 5'h11 : _GEN_405; // @[layers.scala 132:13]
  wire [4:0] _GEN_407 = 5'h17 == _T_116 ? 5'h18 : _GEN_406; // @[layers.scala 132:13]
  wire [4:0] _GEN_408 = 5'h18 == _T_116 ? 5'h10 : _GEN_407; // @[layers.scala 132:13]
  wire [4:0] _GEN_409 = 5'h19 == _T_116 ? 5'hc : _GEN_408; // @[layers.scala 132:13]
  wire [4:0] _GEN_410 = 5'h1a == _T_116 ? 5'h1 : _GEN_409; // @[layers.scala 132:13]
  wire [4:0] _GEN_411 = 5'h1b == _T_116 ? 5'h19 : _GEN_410; // @[layers.scala 132:13]
  wire [4:0] _GEN_412 = 5'h1c == _T_116 ? 5'h16 : _GEN_411; // @[layers.scala 132:13]
  wire [4:0] _GEN_413 = 5'h1d == _T_116 ? 5'ha : _GEN_412; // @[layers.scala 132:13]
  wire [4:0] _GEN_414 = 5'h1e == _T_116 ? 5'hf : _GEN_413; // @[layers.scala 132:13]
  wire [4:0] temp_12 = 5'h1f == _T_116 ? 5'h17 : _GEN_414; // @[layers.scala 132:13]
  wire [4:0] _T_125 = {io_x_in_0[13],io_x_in_1[13],io_x_in_2[13],io_x_in_3[13],io_x_in_4[13]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_417 = 5'h1 == _T_125 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_418 = 5'h2 == _T_125 ? 5'h1f : _GEN_417; // @[layers.scala 132:13]
  wire [4:0] _GEN_419 = 5'h3 == _T_125 ? 5'h14 : _GEN_418; // @[layers.scala 132:13]
  wire [4:0] _GEN_420 = 5'h4 == _T_125 ? 5'h1a : _GEN_419; // @[layers.scala 132:13]
  wire [4:0] _GEN_421 = 5'h5 == _T_125 ? 5'h15 : _GEN_420; // @[layers.scala 132:13]
  wire [4:0] _GEN_422 = 5'h6 == _T_125 ? 5'h9 : _GEN_421; // @[layers.scala 132:13]
  wire [4:0] _GEN_423 = 5'h7 == _T_125 ? 5'h2 : _GEN_422; // @[layers.scala 132:13]
  wire [4:0] _GEN_424 = 5'h8 == _T_125 ? 5'h1b : _GEN_423; // @[layers.scala 132:13]
  wire [4:0] _GEN_425 = 5'h9 == _T_125 ? 5'h5 : _GEN_424; // @[layers.scala 132:13]
  wire [4:0] _GEN_426 = 5'ha == _T_125 ? 5'h8 : _GEN_425; // @[layers.scala 132:13]
  wire [4:0] _GEN_427 = 5'hb == _T_125 ? 5'h12 : _GEN_426; // @[layers.scala 132:13]
  wire [4:0] _GEN_428 = 5'hc == _T_125 ? 5'h1d : _GEN_427; // @[layers.scala 132:13]
  wire [4:0] _GEN_429 = 5'hd == _T_125 ? 5'h3 : _GEN_428; // @[layers.scala 132:13]
  wire [4:0] _GEN_430 = 5'he == _T_125 ? 5'h6 : _GEN_429; // @[layers.scala 132:13]
  wire [4:0] _GEN_431 = 5'hf == _T_125 ? 5'h1c : _GEN_430; // @[layers.scala 132:13]
  wire [4:0] _GEN_432 = 5'h10 == _T_125 ? 5'h1e : _GEN_431; // @[layers.scala 132:13]
  wire [4:0] _GEN_433 = 5'h11 == _T_125 ? 5'h13 : _GEN_432; // @[layers.scala 132:13]
  wire [4:0] _GEN_434 = 5'h12 == _T_125 ? 5'h7 : _GEN_433; // @[layers.scala 132:13]
  wire [4:0] _GEN_435 = 5'h13 == _T_125 ? 5'he : _GEN_434; // @[layers.scala 132:13]
  wire [4:0] _GEN_436 = 5'h14 == _T_125 ? 5'h0 : _GEN_435; // @[layers.scala 132:13]
  wire [4:0] _GEN_437 = 5'h15 == _T_125 ? 5'hd : _GEN_436; // @[layers.scala 132:13]
  wire [4:0] _GEN_438 = 5'h16 == _T_125 ? 5'h11 : _GEN_437; // @[layers.scala 132:13]
  wire [4:0] _GEN_439 = 5'h17 == _T_125 ? 5'h18 : _GEN_438; // @[layers.scala 132:13]
  wire [4:0] _GEN_440 = 5'h18 == _T_125 ? 5'h10 : _GEN_439; // @[layers.scala 132:13]
  wire [4:0] _GEN_441 = 5'h19 == _T_125 ? 5'hc : _GEN_440; // @[layers.scala 132:13]
  wire [4:0] _GEN_442 = 5'h1a == _T_125 ? 5'h1 : _GEN_441; // @[layers.scala 132:13]
  wire [4:0] _GEN_443 = 5'h1b == _T_125 ? 5'h19 : _GEN_442; // @[layers.scala 132:13]
  wire [4:0] _GEN_444 = 5'h1c == _T_125 ? 5'h16 : _GEN_443; // @[layers.scala 132:13]
  wire [4:0] _GEN_445 = 5'h1d == _T_125 ? 5'ha : _GEN_444; // @[layers.scala 132:13]
  wire [4:0] _GEN_446 = 5'h1e == _T_125 ? 5'hf : _GEN_445; // @[layers.scala 132:13]
  wire [4:0] temp_13 = 5'h1f == _T_125 ? 5'h17 : _GEN_446; // @[layers.scala 132:13]
  wire [4:0] _T_134 = {io_x_in_0[14],io_x_in_1[14],io_x_in_2[14],io_x_in_3[14],io_x_in_4[14]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_449 = 5'h1 == _T_134 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_450 = 5'h2 == _T_134 ? 5'h1f : _GEN_449; // @[layers.scala 132:13]
  wire [4:0] _GEN_451 = 5'h3 == _T_134 ? 5'h14 : _GEN_450; // @[layers.scala 132:13]
  wire [4:0] _GEN_452 = 5'h4 == _T_134 ? 5'h1a : _GEN_451; // @[layers.scala 132:13]
  wire [4:0] _GEN_453 = 5'h5 == _T_134 ? 5'h15 : _GEN_452; // @[layers.scala 132:13]
  wire [4:0] _GEN_454 = 5'h6 == _T_134 ? 5'h9 : _GEN_453; // @[layers.scala 132:13]
  wire [4:0] _GEN_455 = 5'h7 == _T_134 ? 5'h2 : _GEN_454; // @[layers.scala 132:13]
  wire [4:0] _GEN_456 = 5'h8 == _T_134 ? 5'h1b : _GEN_455; // @[layers.scala 132:13]
  wire [4:0] _GEN_457 = 5'h9 == _T_134 ? 5'h5 : _GEN_456; // @[layers.scala 132:13]
  wire [4:0] _GEN_458 = 5'ha == _T_134 ? 5'h8 : _GEN_457; // @[layers.scala 132:13]
  wire [4:0] _GEN_459 = 5'hb == _T_134 ? 5'h12 : _GEN_458; // @[layers.scala 132:13]
  wire [4:0] _GEN_460 = 5'hc == _T_134 ? 5'h1d : _GEN_459; // @[layers.scala 132:13]
  wire [4:0] _GEN_461 = 5'hd == _T_134 ? 5'h3 : _GEN_460; // @[layers.scala 132:13]
  wire [4:0] _GEN_462 = 5'he == _T_134 ? 5'h6 : _GEN_461; // @[layers.scala 132:13]
  wire [4:0] _GEN_463 = 5'hf == _T_134 ? 5'h1c : _GEN_462; // @[layers.scala 132:13]
  wire [4:0] _GEN_464 = 5'h10 == _T_134 ? 5'h1e : _GEN_463; // @[layers.scala 132:13]
  wire [4:0] _GEN_465 = 5'h11 == _T_134 ? 5'h13 : _GEN_464; // @[layers.scala 132:13]
  wire [4:0] _GEN_466 = 5'h12 == _T_134 ? 5'h7 : _GEN_465; // @[layers.scala 132:13]
  wire [4:0] _GEN_467 = 5'h13 == _T_134 ? 5'he : _GEN_466; // @[layers.scala 132:13]
  wire [4:0] _GEN_468 = 5'h14 == _T_134 ? 5'h0 : _GEN_467; // @[layers.scala 132:13]
  wire [4:0] _GEN_469 = 5'h15 == _T_134 ? 5'hd : _GEN_468; // @[layers.scala 132:13]
  wire [4:0] _GEN_470 = 5'h16 == _T_134 ? 5'h11 : _GEN_469; // @[layers.scala 132:13]
  wire [4:0] _GEN_471 = 5'h17 == _T_134 ? 5'h18 : _GEN_470; // @[layers.scala 132:13]
  wire [4:0] _GEN_472 = 5'h18 == _T_134 ? 5'h10 : _GEN_471; // @[layers.scala 132:13]
  wire [4:0] _GEN_473 = 5'h19 == _T_134 ? 5'hc : _GEN_472; // @[layers.scala 132:13]
  wire [4:0] _GEN_474 = 5'h1a == _T_134 ? 5'h1 : _GEN_473; // @[layers.scala 132:13]
  wire [4:0] _GEN_475 = 5'h1b == _T_134 ? 5'h19 : _GEN_474; // @[layers.scala 132:13]
  wire [4:0] _GEN_476 = 5'h1c == _T_134 ? 5'h16 : _GEN_475; // @[layers.scala 132:13]
  wire [4:0] _GEN_477 = 5'h1d == _T_134 ? 5'ha : _GEN_476; // @[layers.scala 132:13]
  wire [4:0] _GEN_478 = 5'h1e == _T_134 ? 5'hf : _GEN_477; // @[layers.scala 132:13]
  wire [4:0] temp_14 = 5'h1f == _T_134 ? 5'h17 : _GEN_478; // @[layers.scala 132:13]
  wire [4:0] _T_143 = {io_x_in_0[15],io_x_in_1[15],io_x_in_2[15],io_x_in_3[15],io_x_in_4[15]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_481 = 5'h1 == _T_143 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_482 = 5'h2 == _T_143 ? 5'h1f : _GEN_481; // @[layers.scala 132:13]
  wire [4:0] _GEN_483 = 5'h3 == _T_143 ? 5'h14 : _GEN_482; // @[layers.scala 132:13]
  wire [4:0] _GEN_484 = 5'h4 == _T_143 ? 5'h1a : _GEN_483; // @[layers.scala 132:13]
  wire [4:0] _GEN_485 = 5'h5 == _T_143 ? 5'h15 : _GEN_484; // @[layers.scala 132:13]
  wire [4:0] _GEN_486 = 5'h6 == _T_143 ? 5'h9 : _GEN_485; // @[layers.scala 132:13]
  wire [4:0] _GEN_487 = 5'h7 == _T_143 ? 5'h2 : _GEN_486; // @[layers.scala 132:13]
  wire [4:0] _GEN_488 = 5'h8 == _T_143 ? 5'h1b : _GEN_487; // @[layers.scala 132:13]
  wire [4:0] _GEN_489 = 5'h9 == _T_143 ? 5'h5 : _GEN_488; // @[layers.scala 132:13]
  wire [4:0] _GEN_490 = 5'ha == _T_143 ? 5'h8 : _GEN_489; // @[layers.scala 132:13]
  wire [4:0] _GEN_491 = 5'hb == _T_143 ? 5'h12 : _GEN_490; // @[layers.scala 132:13]
  wire [4:0] _GEN_492 = 5'hc == _T_143 ? 5'h1d : _GEN_491; // @[layers.scala 132:13]
  wire [4:0] _GEN_493 = 5'hd == _T_143 ? 5'h3 : _GEN_492; // @[layers.scala 132:13]
  wire [4:0] _GEN_494 = 5'he == _T_143 ? 5'h6 : _GEN_493; // @[layers.scala 132:13]
  wire [4:0] _GEN_495 = 5'hf == _T_143 ? 5'h1c : _GEN_494; // @[layers.scala 132:13]
  wire [4:0] _GEN_496 = 5'h10 == _T_143 ? 5'h1e : _GEN_495; // @[layers.scala 132:13]
  wire [4:0] _GEN_497 = 5'h11 == _T_143 ? 5'h13 : _GEN_496; // @[layers.scala 132:13]
  wire [4:0] _GEN_498 = 5'h12 == _T_143 ? 5'h7 : _GEN_497; // @[layers.scala 132:13]
  wire [4:0] _GEN_499 = 5'h13 == _T_143 ? 5'he : _GEN_498; // @[layers.scala 132:13]
  wire [4:0] _GEN_500 = 5'h14 == _T_143 ? 5'h0 : _GEN_499; // @[layers.scala 132:13]
  wire [4:0] _GEN_501 = 5'h15 == _T_143 ? 5'hd : _GEN_500; // @[layers.scala 132:13]
  wire [4:0] _GEN_502 = 5'h16 == _T_143 ? 5'h11 : _GEN_501; // @[layers.scala 132:13]
  wire [4:0] _GEN_503 = 5'h17 == _T_143 ? 5'h18 : _GEN_502; // @[layers.scala 132:13]
  wire [4:0] _GEN_504 = 5'h18 == _T_143 ? 5'h10 : _GEN_503; // @[layers.scala 132:13]
  wire [4:0] _GEN_505 = 5'h19 == _T_143 ? 5'hc : _GEN_504; // @[layers.scala 132:13]
  wire [4:0] _GEN_506 = 5'h1a == _T_143 ? 5'h1 : _GEN_505; // @[layers.scala 132:13]
  wire [4:0] _GEN_507 = 5'h1b == _T_143 ? 5'h19 : _GEN_506; // @[layers.scala 132:13]
  wire [4:0] _GEN_508 = 5'h1c == _T_143 ? 5'h16 : _GEN_507; // @[layers.scala 132:13]
  wire [4:0] _GEN_509 = 5'h1d == _T_143 ? 5'ha : _GEN_508; // @[layers.scala 132:13]
  wire [4:0] _GEN_510 = 5'h1e == _T_143 ? 5'hf : _GEN_509; // @[layers.scala 132:13]
  wire [4:0] temp_15 = 5'h1f == _T_143 ? 5'h17 : _GEN_510; // @[layers.scala 132:13]
  wire [4:0] _T_152 = {io_x_in_0[16],io_x_in_1[16],io_x_in_2[16],io_x_in_3[16],io_x_in_4[16]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_513 = 5'h1 == _T_152 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_514 = 5'h2 == _T_152 ? 5'h1f : _GEN_513; // @[layers.scala 132:13]
  wire [4:0] _GEN_515 = 5'h3 == _T_152 ? 5'h14 : _GEN_514; // @[layers.scala 132:13]
  wire [4:0] _GEN_516 = 5'h4 == _T_152 ? 5'h1a : _GEN_515; // @[layers.scala 132:13]
  wire [4:0] _GEN_517 = 5'h5 == _T_152 ? 5'h15 : _GEN_516; // @[layers.scala 132:13]
  wire [4:0] _GEN_518 = 5'h6 == _T_152 ? 5'h9 : _GEN_517; // @[layers.scala 132:13]
  wire [4:0] _GEN_519 = 5'h7 == _T_152 ? 5'h2 : _GEN_518; // @[layers.scala 132:13]
  wire [4:0] _GEN_520 = 5'h8 == _T_152 ? 5'h1b : _GEN_519; // @[layers.scala 132:13]
  wire [4:0] _GEN_521 = 5'h9 == _T_152 ? 5'h5 : _GEN_520; // @[layers.scala 132:13]
  wire [4:0] _GEN_522 = 5'ha == _T_152 ? 5'h8 : _GEN_521; // @[layers.scala 132:13]
  wire [4:0] _GEN_523 = 5'hb == _T_152 ? 5'h12 : _GEN_522; // @[layers.scala 132:13]
  wire [4:0] _GEN_524 = 5'hc == _T_152 ? 5'h1d : _GEN_523; // @[layers.scala 132:13]
  wire [4:0] _GEN_525 = 5'hd == _T_152 ? 5'h3 : _GEN_524; // @[layers.scala 132:13]
  wire [4:0] _GEN_526 = 5'he == _T_152 ? 5'h6 : _GEN_525; // @[layers.scala 132:13]
  wire [4:0] _GEN_527 = 5'hf == _T_152 ? 5'h1c : _GEN_526; // @[layers.scala 132:13]
  wire [4:0] _GEN_528 = 5'h10 == _T_152 ? 5'h1e : _GEN_527; // @[layers.scala 132:13]
  wire [4:0] _GEN_529 = 5'h11 == _T_152 ? 5'h13 : _GEN_528; // @[layers.scala 132:13]
  wire [4:0] _GEN_530 = 5'h12 == _T_152 ? 5'h7 : _GEN_529; // @[layers.scala 132:13]
  wire [4:0] _GEN_531 = 5'h13 == _T_152 ? 5'he : _GEN_530; // @[layers.scala 132:13]
  wire [4:0] _GEN_532 = 5'h14 == _T_152 ? 5'h0 : _GEN_531; // @[layers.scala 132:13]
  wire [4:0] _GEN_533 = 5'h15 == _T_152 ? 5'hd : _GEN_532; // @[layers.scala 132:13]
  wire [4:0] _GEN_534 = 5'h16 == _T_152 ? 5'h11 : _GEN_533; // @[layers.scala 132:13]
  wire [4:0] _GEN_535 = 5'h17 == _T_152 ? 5'h18 : _GEN_534; // @[layers.scala 132:13]
  wire [4:0] _GEN_536 = 5'h18 == _T_152 ? 5'h10 : _GEN_535; // @[layers.scala 132:13]
  wire [4:0] _GEN_537 = 5'h19 == _T_152 ? 5'hc : _GEN_536; // @[layers.scala 132:13]
  wire [4:0] _GEN_538 = 5'h1a == _T_152 ? 5'h1 : _GEN_537; // @[layers.scala 132:13]
  wire [4:0] _GEN_539 = 5'h1b == _T_152 ? 5'h19 : _GEN_538; // @[layers.scala 132:13]
  wire [4:0] _GEN_540 = 5'h1c == _T_152 ? 5'h16 : _GEN_539; // @[layers.scala 132:13]
  wire [4:0] _GEN_541 = 5'h1d == _T_152 ? 5'ha : _GEN_540; // @[layers.scala 132:13]
  wire [4:0] _GEN_542 = 5'h1e == _T_152 ? 5'hf : _GEN_541; // @[layers.scala 132:13]
  wire [4:0] temp_16 = 5'h1f == _T_152 ? 5'h17 : _GEN_542; // @[layers.scala 132:13]
  wire [4:0] _T_161 = {io_x_in_0[17],io_x_in_1[17],io_x_in_2[17],io_x_in_3[17],io_x_in_4[17]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_545 = 5'h1 == _T_161 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_546 = 5'h2 == _T_161 ? 5'h1f : _GEN_545; // @[layers.scala 132:13]
  wire [4:0] _GEN_547 = 5'h3 == _T_161 ? 5'h14 : _GEN_546; // @[layers.scala 132:13]
  wire [4:0] _GEN_548 = 5'h4 == _T_161 ? 5'h1a : _GEN_547; // @[layers.scala 132:13]
  wire [4:0] _GEN_549 = 5'h5 == _T_161 ? 5'h15 : _GEN_548; // @[layers.scala 132:13]
  wire [4:0] _GEN_550 = 5'h6 == _T_161 ? 5'h9 : _GEN_549; // @[layers.scala 132:13]
  wire [4:0] _GEN_551 = 5'h7 == _T_161 ? 5'h2 : _GEN_550; // @[layers.scala 132:13]
  wire [4:0] _GEN_552 = 5'h8 == _T_161 ? 5'h1b : _GEN_551; // @[layers.scala 132:13]
  wire [4:0] _GEN_553 = 5'h9 == _T_161 ? 5'h5 : _GEN_552; // @[layers.scala 132:13]
  wire [4:0] _GEN_554 = 5'ha == _T_161 ? 5'h8 : _GEN_553; // @[layers.scala 132:13]
  wire [4:0] _GEN_555 = 5'hb == _T_161 ? 5'h12 : _GEN_554; // @[layers.scala 132:13]
  wire [4:0] _GEN_556 = 5'hc == _T_161 ? 5'h1d : _GEN_555; // @[layers.scala 132:13]
  wire [4:0] _GEN_557 = 5'hd == _T_161 ? 5'h3 : _GEN_556; // @[layers.scala 132:13]
  wire [4:0] _GEN_558 = 5'he == _T_161 ? 5'h6 : _GEN_557; // @[layers.scala 132:13]
  wire [4:0] _GEN_559 = 5'hf == _T_161 ? 5'h1c : _GEN_558; // @[layers.scala 132:13]
  wire [4:0] _GEN_560 = 5'h10 == _T_161 ? 5'h1e : _GEN_559; // @[layers.scala 132:13]
  wire [4:0] _GEN_561 = 5'h11 == _T_161 ? 5'h13 : _GEN_560; // @[layers.scala 132:13]
  wire [4:0] _GEN_562 = 5'h12 == _T_161 ? 5'h7 : _GEN_561; // @[layers.scala 132:13]
  wire [4:0] _GEN_563 = 5'h13 == _T_161 ? 5'he : _GEN_562; // @[layers.scala 132:13]
  wire [4:0] _GEN_564 = 5'h14 == _T_161 ? 5'h0 : _GEN_563; // @[layers.scala 132:13]
  wire [4:0] _GEN_565 = 5'h15 == _T_161 ? 5'hd : _GEN_564; // @[layers.scala 132:13]
  wire [4:0] _GEN_566 = 5'h16 == _T_161 ? 5'h11 : _GEN_565; // @[layers.scala 132:13]
  wire [4:0] _GEN_567 = 5'h17 == _T_161 ? 5'h18 : _GEN_566; // @[layers.scala 132:13]
  wire [4:0] _GEN_568 = 5'h18 == _T_161 ? 5'h10 : _GEN_567; // @[layers.scala 132:13]
  wire [4:0] _GEN_569 = 5'h19 == _T_161 ? 5'hc : _GEN_568; // @[layers.scala 132:13]
  wire [4:0] _GEN_570 = 5'h1a == _T_161 ? 5'h1 : _GEN_569; // @[layers.scala 132:13]
  wire [4:0] _GEN_571 = 5'h1b == _T_161 ? 5'h19 : _GEN_570; // @[layers.scala 132:13]
  wire [4:0] _GEN_572 = 5'h1c == _T_161 ? 5'h16 : _GEN_571; // @[layers.scala 132:13]
  wire [4:0] _GEN_573 = 5'h1d == _T_161 ? 5'ha : _GEN_572; // @[layers.scala 132:13]
  wire [4:0] _GEN_574 = 5'h1e == _T_161 ? 5'hf : _GEN_573; // @[layers.scala 132:13]
  wire [4:0] temp_17 = 5'h1f == _T_161 ? 5'h17 : _GEN_574; // @[layers.scala 132:13]
  wire [4:0] _T_170 = {io_x_in_0[18],io_x_in_1[18],io_x_in_2[18],io_x_in_3[18],io_x_in_4[18]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_577 = 5'h1 == _T_170 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_578 = 5'h2 == _T_170 ? 5'h1f : _GEN_577; // @[layers.scala 132:13]
  wire [4:0] _GEN_579 = 5'h3 == _T_170 ? 5'h14 : _GEN_578; // @[layers.scala 132:13]
  wire [4:0] _GEN_580 = 5'h4 == _T_170 ? 5'h1a : _GEN_579; // @[layers.scala 132:13]
  wire [4:0] _GEN_581 = 5'h5 == _T_170 ? 5'h15 : _GEN_580; // @[layers.scala 132:13]
  wire [4:0] _GEN_582 = 5'h6 == _T_170 ? 5'h9 : _GEN_581; // @[layers.scala 132:13]
  wire [4:0] _GEN_583 = 5'h7 == _T_170 ? 5'h2 : _GEN_582; // @[layers.scala 132:13]
  wire [4:0] _GEN_584 = 5'h8 == _T_170 ? 5'h1b : _GEN_583; // @[layers.scala 132:13]
  wire [4:0] _GEN_585 = 5'h9 == _T_170 ? 5'h5 : _GEN_584; // @[layers.scala 132:13]
  wire [4:0] _GEN_586 = 5'ha == _T_170 ? 5'h8 : _GEN_585; // @[layers.scala 132:13]
  wire [4:0] _GEN_587 = 5'hb == _T_170 ? 5'h12 : _GEN_586; // @[layers.scala 132:13]
  wire [4:0] _GEN_588 = 5'hc == _T_170 ? 5'h1d : _GEN_587; // @[layers.scala 132:13]
  wire [4:0] _GEN_589 = 5'hd == _T_170 ? 5'h3 : _GEN_588; // @[layers.scala 132:13]
  wire [4:0] _GEN_590 = 5'he == _T_170 ? 5'h6 : _GEN_589; // @[layers.scala 132:13]
  wire [4:0] _GEN_591 = 5'hf == _T_170 ? 5'h1c : _GEN_590; // @[layers.scala 132:13]
  wire [4:0] _GEN_592 = 5'h10 == _T_170 ? 5'h1e : _GEN_591; // @[layers.scala 132:13]
  wire [4:0] _GEN_593 = 5'h11 == _T_170 ? 5'h13 : _GEN_592; // @[layers.scala 132:13]
  wire [4:0] _GEN_594 = 5'h12 == _T_170 ? 5'h7 : _GEN_593; // @[layers.scala 132:13]
  wire [4:0] _GEN_595 = 5'h13 == _T_170 ? 5'he : _GEN_594; // @[layers.scala 132:13]
  wire [4:0] _GEN_596 = 5'h14 == _T_170 ? 5'h0 : _GEN_595; // @[layers.scala 132:13]
  wire [4:0] _GEN_597 = 5'h15 == _T_170 ? 5'hd : _GEN_596; // @[layers.scala 132:13]
  wire [4:0] _GEN_598 = 5'h16 == _T_170 ? 5'h11 : _GEN_597; // @[layers.scala 132:13]
  wire [4:0] _GEN_599 = 5'h17 == _T_170 ? 5'h18 : _GEN_598; // @[layers.scala 132:13]
  wire [4:0] _GEN_600 = 5'h18 == _T_170 ? 5'h10 : _GEN_599; // @[layers.scala 132:13]
  wire [4:0] _GEN_601 = 5'h19 == _T_170 ? 5'hc : _GEN_600; // @[layers.scala 132:13]
  wire [4:0] _GEN_602 = 5'h1a == _T_170 ? 5'h1 : _GEN_601; // @[layers.scala 132:13]
  wire [4:0] _GEN_603 = 5'h1b == _T_170 ? 5'h19 : _GEN_602; // @[layers.scala 132:13]
  wire [4:0] _GEN_604 = 5'h1c == _T_170 ? 5'h16 : _GEN_603; // @[layers.scala 132:13]
  wire [4:0] _GEN_605 = 5'h1d == _T_170 ? 5'ha : _GEN_604; // @[layers.scala 132:13]
  wire [4:0] _GEN_606 = 5'h1e == _T_170 ? 5'hf : _GEN_605; // @[layers.scala 132:13]
  wire [4:0] temp_18 = 5'h1f == _T_170 ? 5'h17 : _GEN_606; // @[layers.scala 132:13]
  wire [4:0] _T_179 = {io_x_in_0[19],io_x_in_1[19],io_x_in_2[19],io_x_in_3[19],io_x_in_4[19]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_609 = 5'h1 == _T_179 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_610 = 5'h2 == _T_179 ? 5'h1f : _GEN_609; // @[layers.scala 132:13]
  wire [4:0] _GEN_611 = 5'h3 == _T_179 ? 5'h14 : _GEN_610; // @[layers.scala 132:13]
  wire [4:0] _GEN_612 = 5'h4 == _T_179 ? 5'h1a : _GEN_611; // @[layers.scala 132:13]
  wire [4:0] _GEN_613 = 5'h5 == _T_179 ? 5'h15 : _GEN_612; // @[layers.scala 132:13]
  wire [4:0] _GEN_614 = 5'h6 == _T_179 ? 5'h9 : _GEN_613; // @[layers.scala 132:13]
  wire [4:0] _GEN_615 = 5'h7 == _T_179 ? 5'h2 : _GEN_614; // @[layers.scala 132:13]
  wire [4:0] _GEN_616 = 5'h8 == _T_179 ? 5'h1b : _GEN_615; // @[layers.scala 132:13]
  wire [4:0] _GEN_617 = 5'h9 == _T_179 ? 5'h5 : _GEN_616; // @[layers.scala 132:13]
  wire [4:0] _GEN_618 = 5'ha == _T_179 ? 5'h8 : _GEN_617; // @[layers.scala 132:13]
  wire [4:0] _GEN_619 = 5'hb == _T_179 ? 5'h12 : _GEN_618; // @[layers.scala 132:13]
  wire [4:0] _GEN_620 = 5'hc == _T_179 ? 5'h1d : _GEN_619; // @[layers.scala 132:13]
  wire [4:0] _GEN_621 = 5'hd == _T_179 ? 5'h3 : _GEN_620; // @[layers.scala 132:13]
  wire [4:0] _GEN_622 = 5'he == _T_179 ? 5'h6 : _GEN_621; // @[layers.scala 132:13]
  wire [4:0] _GEN_623 = 5'hf == _T_179 ? 5'h1c : _GEN_622; // @[layers.scala 132:13]
  wire [4:0] _GEN_624 = 5'h10 == _T_179 ? 5'h1e : _GEN_623; // @[layers.scala 132:13]
  wire [4:0] _GEN_625 = 5'h11 == _T_179 ? 5'h13 : _GEN_624; // @[layers.scala 132:13]
  wire [4:0] _GEN_626 = 5'h12 == _T_179 ? 5'h7 : _GEN_625; // @[layers.scala 132:13]
  wire [4:0] _GEN_627 = 5'h13 == _T_179 ? 5'he : _GEN_626; // @[layers.scala 132:13]
  wire [4:0] _GEN_628 = 5'h14 == _T_179 ? 5'h0 : _GEN_627; // @[layers.scala 132:13]
  wire [4:0] _GEN_629 = 5'h15 == _T_179 ? 5'hd : _GEN_628; // @[layers.scala 132:13]
  wire [4:0] _GEN_630 = 5'h16 == _T_179 ? 5'h11 : _GEN_629; // @[layers.scala 132:13]
  wire [4:0] _GEN_631 = 5'h17 == _T_179 ? 5'h18 : _GEN_630; // @[layers.scala 132:13]
  wire [4:0] _GEN_632 = 5'h18 == _T_179 ? 5'h10 : _GEN_631; // @[layers.scala 132:13]
  wire [4:0] _GEN_633 = 5'h19 == _T_179 ? 5'hc : _GEN_632; // @[layers.scala 132:13]
  wire [4:0] _GEN_634 = 5'h1a == _T_179 ? 5'h1 : _GEN_633; // @[layers.scala 132:13]
  wire [4:0] _GEN_635 = 5'h1b == _T_179 ? 5'h19 : _GEN_634; // @[layers.scala 132:13]
  wire [4:0] _GEN_636 = 5'h1c == _T_179 ? 5'h16 : _GEN_635; // @[layers.scala 132:13]
  wire [4:0] _GEN_637 = 5'h1d == _T_179 ? 5'ha : _GEN_636; // @[layers.scala 132:13]
  wire [4:0] _GEN_638 = 5'h1e == _T_179 ? 5'hf : _GEN_637; // @[layers.scala 132:13]
  wire [4:0] temp_19 = 5'h1f == _T_179 ? 5'h17 : _GEN_638; // @[layers.scala 132:13]
  wire [4:0] _T_188 = {io_x_in_0[20],io_x_in_1[20],io_x_in_2[20],io_x_in_3[20],io_x_in_4[20]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_641 = 5'h1 == _T_188 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_642 = 5'h2 == _T_188 ? 5'h1f : _GEN_641; // @[layers.scala 132:13]
  wire [4:0] _GEN_643 = 5'h3 == _T_188 ? 5'h14 : _GEN_642; // @[layers.scala 132:13]
  wire [4:0] _GEN_644 = 5'h4 == _T_188 ? 5'h1a : _GEN_643; // @[layers.scala 132:13]
  wire [4:0] _GEN_645 = 5'h5 == _T_188 ? 5'h15 : _GEN_644; // @[layers.scala 132:13]
  wire [4:0] _GEN_646 = 5'h6 == _T_188 ? 5'h9 : _GEN_645; // @[layers.scala 132:13]
  wire [4:0] _GEN_647 = 5'h7 == _T_188 ? 5'h2 : _GEN_646; // @[layers.scala 132:13]
  wire [4:0] _GEN_648 = 5'h8 == _T_188 ? 5'h1b : _GEN_647; // @[layers.scala 132:13]
  wire [4:0] _GEN_649 = 5'h9 == _T_188 ? 5'h5 : _GEN_648; // @[layers.scala 132:13]
  wire [4:0] _GEN_650 = 5'ha == _T_188 ? 5'h8 : _GEN_649; // @[layers.scala 132:13]
  wire [4:0] _GEN_651 = 5'hb == _T_188 ? 5'h12 : _GEN_650; // @[layers.scala 132:13]
  wire [4:0] _GEN_652 = 5'hc == _T_188 ? 5'h1d : _GEN_651; // @[layers.scala 132:13]
  wire [4:0] _GEN_653 = 5'hd == _T_188 ? 5'h3 : _GEN_652; // @[layers.scala 132:13]
  wire [4:0] _GEN_654 = 5'he == _T_188 ? 5'h6 : _GEN_653; // @[layers.scala 132:13]
  wire [4:0] _GEN_655 = 5'hf == _T_188 ? 5'h1c : _GEN_654; // @[layers.scala 132:13]
  wire [4:0] _GEN_656 = 5'h10 == _T_188 ? 5'h1e : _GEN_655; // @[layers.scala 132:13]
  wire [4:0] _GEN_657 = 5'h11 == _T_188 ? 5'h13 : _GEN_656; // @[layers.scala 132:13]
  wire [4:0] _GEN_658 = 5'h12 == _T_188 ? 5'h7 : _GEN_657; // @[layers.scala 132:13]
  wire [4:0] _GEN_659 = 5'h13 == _T_188 ? 5'he : _GEN_658; // @[layers.scala 132:13]
  wire [4:0] _GEN_660 = 5'h14 == _T_188 ? 5'h0 : _GEN_659; // @[layers.scala 132:13]
  wire [4:0] _GEN_661 = 5'h15 == _T_188 ? 5'hd : _GEN_660; // @[layers.scala 132:13]
  wire [4:0] _GEN_662 = 5'h16 == _T_188 ? 5'h11 : _GEN_661; // @[layers.scala 132:13]
  wire [4:0] _GEN_663 = 5'h17 == _T_188 ? 5'h18 : _GEN_662; // @[layers.scala 132:13]
  wire [4:0] _GEN_664 = 5'h18 == _T_188 ? 5'h10 : _GEN_663; // @[layers.scala 132:13]
  wire [4:0] _GEN_665 = 5'h19 == _T_188 ? 5'hc : _GEN_664; // @[layers.scala 132:13]
  wire [4:0] _GEN_666 = 5'h1a == _T_188 ? 5'h1 : _GEN_665; // @[layers.scala 132:13]
  wire [4:0] _GEN_667 = 5'h1b == _T_188 ? 5'h19 : _GEN_666; // @[layers.scala 132:13]
  wire [4:0] _GEN_668 = 5'h1c == _T_188 ? 5'h16 : _GEN_667; // @[layers.scala 132:13]
  wire [4:0] _GEN_669 = 5'h1d == _T_188 ? 5'ha : _GEN_668; // @[layers.scala 132:13]
  wire [4:0] _GEN_670 = 5'h1e == _T_188 ? 5'hf : _GEN_669; // @[layers.scala 132:13]
  wire [4:0] temp_20 = 5'h1f == _T_188 ? 5'h17 : _GEN_670; // @[layers.scala 132:13]
  wire [4:0] _T_197 = {io_x_in_0[21],io_x_in_1[21],io_x_in_2[21],io_x_in_3[21],io_x_in_4[21]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_673 = 5'h1 == _T_197 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_674 = 5'h2 == _T_197 ? 5'h1f : _GEN_673; // @[layers.scala 132:13]
  wire [4:0] _GEN_675 = 5'h3 == _T_197 ? 5'h14 : _GEN_674; // @[layers.scala 132:13]
  wire [4:0] _GEN_676 = 5'h4 == _T_197 ? 5'h1a : _GEN_675; // @[layers.scala 132:13]
  wire [4:0] _GEN_677 = 5'h5 == _T_197 ? 5'h15 : _GEN_676; // @[layers.scala 132:13]
  wire [4:0] _GEN_678 = 5'h6 == _T_197 ? 5'h9 : _GEN_677; // @[layers.scala 132:13]
  wire [4:0] _GEN_679 = 5'h7 == _T_197 ? 5'h2 : _GEN_678; // @[layers.scala 132:13]
  wire [4:0] _GEN_680 = 5'h8 == _T_197 ? 5'h1b : _GEN_679; // @[layers.scala 132:13]
  wire [4:0] _GEN_681 = 5'h9 == _T_197 ? 5'h5 : _GEN_680; // @[layers.scala 132:13]
  wire [4:0] _GEN_682 = 5'ha == _T_197 ? 5'h8 : _GEN_681; // @[layers.scala 132:13]
  wire [4:0] _GEN_683 = 5'hb == _T_197 ? 5'h12 : _GEN_682; // @[layers.scala 132:13]
  wire [4:0] _GEN_684 = 5'hc == _T_197 ? 5'h1d : _GEN_683; // @[layers.scala 132:13]
  wire [4:0] _GEN_685 = 5'hd == _T_197 ? 5'h3 : _GEN_684; // @[layers.scala 132:13]
  wire [4:0] _GEN_686 = 5'he == _T_197 ? 5'h6 : _GEN_685; // @[layers.scala 132:13]
  wire [4:0] _GEN_687 = 5'hf == _T_197 ? 5'h1c : _GEN_686; // @[layers.scala 132:13]
  wire [4:0] _GEN_688 = 5'h10 == _T_197 ? 5'h1e : _GEN_687; // @[layers.scala 132:13]
  wire [4:0] _GEN_689 = 5'h11 == _T_197 ? 5'h13 : _GEN_688; // @[layers.scala 132:13]
  wire [4:0] _GEN_690 = 5'h12 == _T_197 ? 5'h7 : _GEN_689; // @[layers.scala 132:13]
  wire [4:0] _GEN_691 = 5'h13 == _T_197 ? 5'he : _GEN_690; // @[layers.scala 132:13]
  wire [4:0] _GEN_692 = 5'h14 == _T_197 ? 5'h0 : _GEN_691; // @[layers.scala 132:13]
  wire [4:0] _GEN_693 = 5'h15 == _T_197 ? 5'hd : _GEN_692; // @[layers.scala 132:13]
  wire [4:0] _GEN_694 = 5'h16 == _T_197 ? 5'h11 : _GEN_693; // @[layers.scala 132:13]
  wire [4:0] _GEN_695 = 5'h17 == _T_197 ? 5'h18 : _GEN_694; // @[layers.scala 132:13]
  wire [4:0] _GEN_696 = 5'h18 == _T_197 ? 5'h10 : _GEN_695; // @[layers.scala 132:13]
  wire [4:0] _GEN_697 = 5'h19 == _T_197 ? 5'hc : _GEN_696; // @[layers.scala 132:13]
  wire [4:0] _GEN_698 = 5'h1a == _T_197 ? 5'h1 : _GEN_697; // @[layers.scala 132:13]
  wire [4:0] _GEN_699 = 5'h1b == _T_197 ? 5'h19 : _GEN_698; // @[layers.scala 132:13]
  wire [4:0] _GEN_700 = 5'h1c == _T_197 ? 5'h16 : _GEN_699; // @[layers.scala 132:13]
  wire [4:0] _GEN_701 = 5'h1d == _T_197 ? 5'ha : _GEN_700; // @[layers.scala 132:13]
  wire [4:0] _GEN_702 = 5'h1e == _T_197 ? 5'hf : _GEN_701; // @[layers.scala 132:13]
  wire [4:0] temp_21 = 5'h1f == _T_197 ? 5'h17 : _GEN_702; // @[layers.scala 132:13]
  wire [4:0] _T_206 = {io_x_in_0[22],io_x_in_1[22],io_x_in_2[22],io_x_in_3[22],io_x_in_4[22]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_705 = 5'h1 == _T_206 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_706 = 5'h2 == _T_206 ? 5'h1f : _GEN_705; // @[layers.scala 132:13]
  wire [4:0] _GEN_707 = 5'h3 == _T_206 ? 5'h14 : _GEN_706; // @[layers.scala 132:13]
  wire [4:0] _GEN_708 = 5'h4 == _T_206 ? 5'h1a : _GEN_707; // @[layers.scala 132:13]
  wire [4:0] _GEN_709 = 5'h5 == _T_206 ? 5'h15 : _GEN_708; // @[layers.scala 132:13]
  wire [4:0] _GEN_710 = 5'h6 == _T_206 ? 5'h9 : _GEN_709; // @[layers.scala 132:13]
  wire [4:0] _GEN_711 = 5'h7 == _T_206 ? 5'h2 : _GEN_710; // @[layers.scala 132:13]
  wire [4:0] _GEN_712 = 5'h8 == _T_206 ? 5'h1b : _GEN_711; // @[layers.scala 132:13]
  wire [4:0] _GEN_713 = 5'h9 == _T_206 ? 5'h5 : _GEN_712; // @[layers.scala 132:13]
  wire [4:0] _GEN_714 = 5'ha == _T_206 ? 5'h8 : _GEN_713; // @[layers.scala 132:13]
  wire [4:0] _GEN_715 = 5'hb == _T_206 ? 5'h12 : _GEN_714; // @[layers.scala 132:13]
  wire [4:0] _GEN_716 = 5'hc == _T_206 ? 5'h1d : _GEN_715; // @[layers.scala 132:13]
  wire [4:0] _GEN_717 = 5'hd == _T_206 ? 5'h3 : _GEN_716; // @[layers.scala 132:13]
  wire [4:0] _GEN_718 = 5'he == _T_206 ? 5'h6 : _GEN_717; // @[layers.scala 132:13]
  wire [4:0] _GEN_719 = 5'hf == _T_206 ? 5'h1c : _GEN_718; // @[layers.scala 132:13]
  wire [4:0] _GEN_720 = 5'h10 == _T_206 ? 5'h1e : _GEN_719; // @[layers.scala 132:13]
  wire [4:0] _GEN_721 = 5'h11 == _T_206 ? 5'h13 : _GEN_720; // @[layers.scala 132:13]
  wire [4:0] _GEN_722 = 5'h12 == _T_206 ? 5'h7 : _GEN_721; // @[layers.scala 132:13]
  wire [4:0] _GEN_723 = 5'h13 == _T_206 ? 5'he : _GEN_722; // @[layers.scala 132:13]
  wire [4:0] _GEN_724 = 5'h14 == _T_206 ? 5'h0 : _GEN_723; // @[layers.scala 132:13]
  wire [4:0] _GEN_725 = 5'h15 == _T_206 ? 5'hd : _GEN_724; // @[layers.scala 132:13]
  wire [4:0] _GEN_726 = 5'h16 == _T_206 ? 5'h11 : _GEN_725; // @[layers.scala 132:13]
  wire [4:0] _GEN_727 = 5'h17 == _T_206 ? 5'h18 : _GEN_726; // @[layers.scala 132:13]
  wire [4:0] _GEN_728 = 5'h18 == _T_206 ? 5'h10 : _GEN_727; // @[layers.scala 132:13]
  wire [4:0] _GEN_729 = 5'h19 == _T_206 ? 5'hc : _GEN_728; // @[layers.scala 132:13]
  wire [4:0] _GEN_730 = 5'h1a == _T_206 ? 5'h1 : _GEN_729; // @[layers.scala 132:13]
  wire [4:0] _GEN_731 = 5'h1b == _T_206 ? 5'h19 : _GEN_730; // @[layers.scala 132:13]
  wire [4:0] _GEN_732 = 5'h1c == _T_206 ? 5'h16 : _GEN_731; // @[layers.scala 132:13]
  wire [4:0] _GEN_733 = 5'h1d == _T_206 ? 5'ha : _GEN_732; // @[layers.scala 132:13]
  wire [4:0] _GEN_734 = 5'h1e == _T_206 ? 5'hf : _GEN_733; // @[layers.scala 132:13]
  wire [4:0] temp_22 = 5'h1f == _T_206 ? 5'h17 : _GEN_734; // @[layers.scala 132:13]
  wire [4:0] _T_215 = {io_x_in_0[23],io_x_in_1[23],io_x_in_2[23],io_x_in_3[23],io_x_in_4[23]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_737 = 5'h1 == _T_215 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_738 = 5'h2 == _T_215 ? 5'h1f : _GEN_737; // @[layers.scala 132:13]
  wire [4:0] _GEN_739 = 5'h3 == _T_215 ? 5'h14 : _GEN_738; // @[layers.scala 132:13]
  wire [4:0] _GEN_740 = 5'h4 == _T_215 ? 5'h1a : _GEN_739; // @[layers.scala 132:13]
  wire [4:0] _GEN_741 = 5'h5 == _T_215 ? 5'h15 : _GEN_740; // @[layers.scala 132:13]
  wire [4:0] _GEN_742 = 5'h6 == _T_215 ? 5'h9 : _GEN_741; // @[layers.scala 132:13]
  wire [4:0] _GEN_743 = 5'h7 == _T_215 ? 5'h2 : _GEN_742; // @[layers.scala 132:13]
  wire [4:0] _GEN_744 = 5'h8 == _T_215 ? 5'h1b : _GEN_743; // @[layers.scala 132:13]
  wire [4:0] _GEN_745 = 5'h9 == _T_215 ? 5'h5 : _GEN_744; // @[layers.scala 132:13]
  wire [4:0] _GEN_746 = 5'ha == _T_215 ? 5'h8 : _GEN_745; // @[layers.scala 132:13]
  wire [4:0] _GEN_747 = 5'hb == _T_215 ? 5'h12 : _GEN_746; // @[layers.scala 132:13]
  wire [4:0] _GEN_748 = 5'hc == _T_215 ? 5'h1d : _GEN_747; // @[layers.scala 132:13]
  wire [4:0] _GEN_749 = 5'hd == _T_215 ? 5'h3 : _GEN_748; // @[layers.scala 132:13]
  wire [4:0] _GEN_750 = 5'he == _T_215 ? 5'h6 : _GEN_749; // @[layers.scala 132:13]
  wire [4:0] _GEN_751 = 5'hf == _T_215 ? 5'h1c : _GEN_750; // @[layers.scala 132:13]
  wire [4:0] _GEN_752 = 5'h10 == _T_215 ? 5'h1e : _GEN_751; // @[layers.scala 132:13]
  wire [4:0] _GEN_753 = 5'h11 == _T_215 ? 5'h13 : _GEN_752; // @[layers.scala 132:13]
  wire [4:0] _GEN_754 = 5'h12 == _T_215 ? 5'h7 : _GEN_753; // @[layers.scala 132:13]
  wire [4:0] _GEN_755 = 5'h13 == _T_215 ? 5'he : _GEN_754; // @[layers.scala 132:13]
  wire [4:0] _GEN_756 = 5'h14 == _T_215 ? 5'h0 : _GEN_755; // @[layers.scala 132:13]
  wire [4:0] _GEN_757 = 5'h15 == _T_215 ? 5'hd : _GEN_756; // @[layers.scala 132:13]
  wire [4:0] _GEN_758 = 5'h16 == _T_215 ? 5'h11 : _GEN_757; // @[layers.scala 132:13]
  wire [4:0] _GEN_759 = 5'h17 == _T_215 ? 5'h18 : _GEN_758; // @[layers.scala 132:13]
  wire [4:0] _GEN_760 = 5'h18 == _T_215 ? 5'h10 : _GEN_759; // @[layers.scala 132:13]
  wire [4:0] _GEN_761 = 5'h19 == _T_215 ? 5'hc : _GEN_760; // @[layers.scala 132:13]
  wire [4:0] _GEN_762 = 5'h1a == _T_215 ? 5'h1 : _GEN_761; // @[layers.scala 132:13]
  wire [4:0] _GEN_763 = 5'h1b == _T_215 ? 5'h19 : _GEN_762; // @[layers.scala 132:13]
  wire [4:0] _GEN_764 = 5'h1c == _T_215 ? 5'h16 : _GEN_763; // @[layers.scala 132:13]
  wire [4:0] _GEN_765 = 5'h1d == _T_215 ? 5'ha : _GEN_764; // @[layers.scala 132:13]
  wire [4:0] _GEN_766 = 5'h1e == _T_215 ? 5'hf : _GEN_765; // @[layers.scala 132:13]
  wire [4:0] temp_23 = 5'h1f == _T_215 ? 5'h17 : _GEN_766; // @[layers.scala 132:13]
  wire [4:0] _T_224 = {io_x_in_0[24],io_x_in_1[24],io_x_in_2[24],io_x_in_3[24],io_x_in_4[24]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_769 = 5'h1 == _T_224 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_770 = 5'h2 == _T_224 ? 5'h1f : _GEN_769; // @[layers.scala 132:13]
  wire [4:0] _GEN_771 = 5'h3 == _T_224 ? 5'h14 : _GEN_770; // @[layers.scala 132:13]
  wire [4:0] _GEN_772 = 5'h4 == _T_224 ? 5'h1a : _GEN_771; // @[layers.scala 132:13]
  wire [4:0] _GEN_773 = 5'h5 == _T_224 ? 5'h15 : _GEN_772; // @[layers.scala 132:13]
  wire [4:0] _GEN_774 = 5'h6 == _T_224 ? 5'h9 : _GEN_773; // @[layers.scala 132:13]
  wire [4:0] _GEN_775 = 5'h7 == _T_224 ? 5'h2 : _GEN_774; // @[layers.scala 132:13]
  wire [4:0] _GEN_776 = 5'h8 == _T_224 ? 5'h1b : _GEN_775; // @[layers.scala 132:13]
  wire [4:0] _GEN_777 = 5'h9 == _T_224 ? 5'h5 : _GEN_776; // @[layers.scala 132:13]
  wire [4:0] _GEN_778 = 5'ha == _T_224 ? 5'h8 : _GEN_777; // @[layers.scala 132:13]
  wire [4:0] _GEN_779 = 5'hb == _T_224 ? 5'h12 : _GEN_778; // @[layers.scala 132:13]
  wire [4:0] _GEN_780 = 5'hc == _T_224 ? 5'h1d : _GEN_779; // @[layers.scala 132:13]
  wire [4:0] _GEN_781 = 5'hd == _T_224 ? 5'h3 : _GEN_780; // @[layers.scala 132:13]
  wire [4:0] _GEN_782 = 5'he == _T_224 ? 5'h6 : _GEN_781; // @[layers.scala 132:13]
  wire [4:0] _GEN_783 = 5'hf == _T_224 ? 5'h1c : _GEN_782; // @[layers.scala 132:13]
  wire [4:0] _GEN_784 = 5'h10 == _T_224 ? 5'h1e : _GEN_783; // @[layers.scala 132:13]
  wire [4:0] _GEN_785 = 5'h11 == _T_224 ? 5'h13 : _GEN_784; // @[layers.scala 132:13]
  wire [4:0] _GEN_786 = 5'h12 == _T_224 ? 5'h7 : _GEN_785; // @[layers.scala 132:13]
  wire [4:0] _GEN_787 = 5'h13 == _T_224 ? 5'he : _GEN_786; // @[layers.scala 132:13]
  wire [4:0] _GEN_788 = 5'h14 == _T_224 ? 5'h0 : _GEN_787; // @[layers.scala 132:13]
  wire [4:0] _GEN_789 = 5'h15 == _T_224 ? 5'hd : _GEN_788; // @[layers.scala 132:13]
  wire [4:0] _GEN_790 = 5'h16 == _T_224 ? 5'h11 : _GEN_789; // @[layers.scala 132:13]
  wire [4:0] _GEN_791 = 5'h17 == _T_224 ? 5'h18 : _GEN_790; // @[layers.scala 132:13]
  wire [4:0] _GEN_792 = 5'h18 == _T_224 ? 5'h10 : _GEN_791; // @[layers.scala 132:13]
  wire [4:0] _GEN_793 = 5'h19 == _T_224 ? 5'hc : _GEN_792; // @[layers.scala 132:13]
  wire [4:0] _GEN_794 = 5'h1a == _T_224 ? 5'h1 : _GEN_793; // @[layers.scala 132:13]
  wire [4:0] _GEN_795 = 5'h1b == _T_224 ? 5'h19 : _GEN_794; // @[layers.scala 132:13]
  wire [4:0] _GEN_796 = 5'h1c == _T_224 ? 5'h16 : _GEN_795; // @[layers.scala 132:13]
  wire [4:0] _GEN_797 = 5'h1d == _T_224 ? 5'ha : _GEN_796; // @[layers.scala 132:13]
  wire [4:0] _GEN_798 = 5'h1e == _T_224 ? 5'hf : _GEN_797; // @[layers.scala 132:13]
  wire [4:0] temp_24 = 5'h1f == _T_224 ? 5'h17 : _GEN_798; // @[layers.scala 132:13]
  wire [4:0] _T_233 = {io_x_in_0[25],io_x_in_1[25],io_x_in_2[25],io_x_in_3[25],io_x_in_4[25]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_801 = 5'h1 == _T_233 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_802 = 5'h2 == _T_233 ? 5'h1f : _GEN_801; // @[layers.scala 132:13]
  wire [4:0] _GEN_803 = 5'h3 == _T_233 ? 5'h14 : _GEN_802; // @[layers.scala 132:13]
  wire [4:0] _GEN_804 = 5'h4 == _T_233 ? 5'h1a : _GEN_803; // @[layers.scala 132:13]
  wire [4:0] _GEN_805 = 5'h5 == _T_233 ? 5'h15 : _GEN_804; // @[layers.scala 132:13]
  wire [4:0] _GEN_806 = 5'h6 == _T_233 ? 5'h9 : _GEN_805; // @[layers.scala 132:13]
  wire [4:0] _GEN_807 = 5'h7 == _T_233 ? 5'h2 : _GEN_806; // @[layers.scala 132:13]
  wire [4:0] _GEN_808 = 5'h8 == _T_233 ? 5'h1b : _GEN_807; // @[layers.scala 132:13]
  wire [4:0] _GEN_809 = 5'h9 == _T_233 ? 5'h5 : _GEN_808; // @[layers.scala 132:13]
  wire [4:0] _GEN_810 = 5'ha == _T_233 ? 5'h8 : _GEN_809; // @[layers.scala 132:13]
  wire [4:0] _GEN_811 = 5'hb == _T_233 ? 5'h12 : _GEN_810; // @[layers.scala 132:13]
  wire [4:0] _GEN_812 = 5'hc == _T_233 ? 5'h1d : _GEN_811; // @[layers.scala 132:13]
  wire [4:0] _GEN_813 = 5'hd == _T_233 ? 5'h3 : _GEN_812; // @[layers.scala 132:13]
  wire [4:0] _GEN_814 = 5'he == _T_233 ? 5'h6 : _GEN_813; // @[layers.scala 132:13]
  wire [4:0] _GEN_815 = 5'hf == _T_233 ? 5'h1c : _GEN_814; // @[layers.scala 132:13]
  wire [4:0] _GEN_816 = 5'h10 == _T_233 ? 5'h1e : _GEN_815; // @[layers.scala 132:13]
  wire [4:0] _GEN_817 = 5'h11 == _T_233 ? 5'h13 : _GEN_816; // @[layers.scala 132:13]
  wire [4:0] _GEN_818 = 5'h12 == _T_233 ? 5'h7 : _GEN_817; // @[layers.scala 132:13]
  wire [4:0] _GEN_819 = 5'h13 == _T_233 ? 5'he : _GEN_818; // @[layers.scala 132:13]
  wire [4:0] _GEN_820 = 5'h14 == _T_233 ? 5'h0 : _GEN_819; // @[layers.scala 132:13]
  wire [4:0] _GEN_821 = 5'h15 == _T_233 ? 5'hd : _GEN_820; // @[layers.scala 132:13]
  wire [4:0] _GEN_822 = 5'h16 == _T_233 ? 5'h11 : _GEN_821; // @[layers.scala 132:13]
  wire [4:0] _GEN_823 = 5'h17 == _T_233 ? 5'h18 : _GEN_822; // @[layers.scala 132:13]
  wire [4:0] _GEN_824 = 5'h18 == _T_233 ? 5'h10 : _GEN_823; // @[layers.scala 132:13]
  wire [4:0] _GEN_825 = 5'h19 == _T_233 ? 5'hc : _GEN_824; // @[layers.scala 132:13]
  wire [4:0] _GEN_826 = 5'h1a == _T_233 ? 5'h1 : _GEN_825; // @[layers.scala 132:13]
  wire [4:0] _GEN_827 = 5'h1b == _T_233 ? 5'h19 : _GEN_826; // @[layers.scala 132:13]
  wire [4:0] _GEN_828 = 5'h1c == _T_233 ? 5'h16 : _GEN_827; // @[layers.scala 132:13]
  wire [4:0] _GEN_829 = 5'h1d == _T_233 ? 5'ha : _GEN_828; // @[layers.scala 132:13]
  wire [4:0] _GEN_830 = 5'h1e == _T_233 ? 5'hf : _GEN_829; // @[layers.scala 132:13]
  wire [4:0] temp_25 = 5'h1f == _T_233 ? 5'h17 : _GEN_830; // @[layers.scala 132:13]
  wire [4:0] _T_242 = {io_x_in_0[26],io_x_in_1[26],io_x_in_2[26],io_x_in_3[26],io_x_in_4[26]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_833 = 5'h1 == _T_242 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_834 = 5'h2 == _T_242 ? 5'h1f : _GEN_833; // @[layers.scala 132:13]
  wire [4:0] _GEN_835 = 5'h3 == _T_242 ? 5'h14 : _GEN_834; // @[layers.scala 132:13]
  wire [4:0] _GEN_836 = 5'h4 == _T_242 ? 5'h1a : _GEN_835; // @[layers.scala 132:13]
  wire [4:0] _GEN_837 = 5'h5 == _T_242 ? 5'h15 : _GEN_836; // @[layers.scala 132:13]
  wire [4:0] _GEN_838 = 5'h6 == _T_242 ? 5'h9 : _GEN_837; // @[layers.scala 132:13]
  wire [4:0] _GEN_839 = 5'h7 == _T_242 ? 5'h2 : _GEN_838; // @[layers.scala 132:13]
  wire [4:0] _GEN_840 = 5'h8 == _T_242 ? 5'h1b : _GEN_839; // @[layers.scala 132:13]
  wire [4:0] _GEN_841 = 5'h9 == _T_242 ? 5'h5 : _GEN_840; // @[layers.scala 132:13]
  wire [4:0] _GEN_842 = 5'ha == _T_242 ? 5'h8 : _GEN_841; // @[layers.scala 132:13]
  wire [4:0] _GEN_843 = 5'hb == _T_242 ? 5'h12 : _GEN_842; // @[layers.scala 132:13]
  wire [4:0] _GEN_844 = 5'hc == _T_242 ? 5'h1d : _GEN_843; // @[layers.scala 132:13]
  wire [4:0] _GEN_845 = 5'hd == _T_242 ? 5'h3 : _GEN_844; // @[layers.scala 132:13]
  wire [4:0] _GEN_846 = 5'he == _T_242 ? 5'h6 : _GEN_845; // @[layers.scala 132:13]
  wire [4:0] _GEN_847 = 5'hf == _T_242 ? 5'h1c : _GEN_846; // @[layers.scala 132:13]
  wire [4:0] _GEN_848 = 5'h10 == _T_242 ? 5'h1e : _GEN_847; // @[layers.scala 132:13]
  wire [4:0] _GEN_849 = 5'h11 == _T_242 ? 5'h13 : _GEN_848; // @[layers.scala 132:13]
  wire [4:0] _GEN_850 = 5'h12 == _T_242 ? 5'h7 : _GEN_849; // @[layers.scala 132:13]
  wire [4:0] _GEN_851 = 5'h13 == _T_242 ? 5'he : _GEN_850; // @[layers.scala 132:13]
  wire [4:0] _GEN_852 = 5'h14 == _T_242 ? 5'h0 : _GEN_851; // @[layers.scala 132:13]
  wire [4:0] _GEN_853 = 5'h15 == _T_242 ? 5'hd : _GEN_852; // @[layers.scala 132:13]
  wire [4:0] _GEN_854 = 5'h16 == _T_242 ? 5'h11 : _GEN_853; // @[layers.scala 132:13]
  wire [4:0] _GEN_855 = 5'h17 == _T_242 ? 5'h18 : _GEN_854; // @[layers.scala 132:13]
  wire [4:0] _GEN_856 = 5'h18 == _T_242 ? 5'h10 : _GEN_855; // @[layers.scala 132:13]
  wire [4:0] _GEN_857 = 5'h19 == _T_242 ? 5'hc : _GEN_856; // @[layers.scala 132:13]
  wire [4:0] _GEN_858 = 5'h1a == _T_242 ? 5'h1 : _GEN_857; // @[layers.scala 132:13]
  wire [4:0] _GEN_859 = 5'h1b == _T_242 ? 5'h19 : _GEN_858; // @[layers.scala 132:13]
  wire [4:0] _GEN_860 = 5'h1c == _T_242 ? 5'h16 : _GEN_859; // @[layers.scala 132:13]
  wire [4:0] _GEN_861 = 5'h1d == _T_242 ? 5'ha : _GEN_860; // @[layers.scala 132:13]
  wire [4:0] _GEN_862 = 5'h1e == _T_242 ? 5'hf : _GEN_861; // @[layers.scala 132:13]
  wire [4:0] temp_26 = 5'h1f == _T_242 ? 5'h17 : _GEN_862; // @[layers.scala 132:13]
  wire [4:0] _T_251 = {io_x_in_0[27],io_x_in_1[27],io_x_in_2[27],io_x_in_3[27],io_x_in_4[27]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_865 = 5'h1 == _T_251 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_866 = 5'h2 == _T_251 ? 5'h1f : _GEN_865; // @[layers.scala 132:13]
  wire [4:0] _GEN_867 = 5'h3 == _T_251 ? 5'h14 : _GEN_866; // @[layers.scala 132:13]
  wire [4:0] _GEN_868 = 5'h4 == _T_251 ? 5'h1a : _GEN_867; // @[layers.scala 132:13]
  wire [4:0] _GEN_869 = 5'h5 == _T_251 ? 5'h15 : _GEN_868; // @[layers.scala 132:13]
  wire [4:0] _GEN_870 = 5'h6 == _T_251 ? 5'h9 : _GEN_869; // @[layers.scala 132:13]
  wire [4:0] _GEN_871 = 5'h7 == _T_251 ? 5'h2 : _GEN_870; // @[layers.scala 132:13]
  wire [4:0] _GEN_872 = 5'h8 == _T_251 ? 5'h1b : _GEN_871; // @[layers.scala 132:13]
  wire [4:0] _GEN_873 = 5'h9 == _T_251 ? 5'h5 : _GEN_872; // @[layers.scala 132:13]
  wire [4:0] _GEN_874 = 5'ha == _T_251 ? 5'h8 : _GEN_873; // @[layers.scala 132:13]
  wire [4:0] _GEN_875 = 5'hb == _T_251 ? 5'h12 : _GEN_874; // @[layers.scala 132:13]
  wire [4:0] _GEN_876 = 5'hc == _T_251 ? 5'h1d : _GEN_875; // @[layers.scala 132:13]
  wire [4:0] _GEN_877 = 5'hd == _T_251 ? 5'h3 : _GEN_876; // @[layers.scala 132:13]
  wire [4:0] _GEN_878 = 5'he == _T_251 ? 5'h6 : _GEN_877; // @[layers.scala 132:13]
  wire [4:0] _GEN_879 = 5'hf == _T_251 ? 5'h1c : _GEN_878; // @[layers.scala 132:13]
  wire [4:0] _GEN_880 = 5'h10 == _T_251 ? 5'h1e : _GEN_879; // @[layers.scala 132:13]
  wire [4:0] _GEN_881 = 5'h11 == _T_251 ? 5'h13 : _GEN_880; // @[layers.scala 132:13]
  wire [4:0] _GEN_882 = 5'h12 == _T_251 ? 5'h7 : _GEN_881; // @[layers.scala 132:13]
  wire [4:0] _GEN_883 = 5'h13 == _T_251 ? 5'he : _GEN_882; // @[layers.scala 132:13]
  wire [4:0] _GEN_884 = 5'h14 == _T_251 ? 5'h0 : _GEN_883; // @[layers.scala 132:13]
  wire [4:0] _GEN_885 = 5'h15 == _T_251 ? 5'hd : _GEN_884; // @[layers.scala 132:13]
  wire [4:0] _GEN_886 = 5'h16 == _T_251 ? 5'h11 : _GEN_885; // @[layers.scala 132:13]
  wire [4:0] _GEN_887 = 5'h17 == _T_251 ? 5'h18 : _GEN_886; // @[layers.scala 132:13]
  wire [4:0] _GEN_888 = 5'h18 == _T_251 ? 5'h10 : _GEN_887; // @[layers.scala 132:13]
  wire [4:0] _GEN_889 = 5'h19 == _T_251 ? 5'hc : _GEN_888; // @[layers.scala 132:13]
  wire [4:0] _GEN_890 = 5'h1a == _T_251 ? 5'h1 : _GEN_889; // @[layers.scala 132:13]
  wire [4:0] _GEN_891 = 5'h1b == _T_251 ? 5'h19 : _GEN_890; // @[layers.scala 132:13]
  wire [4:0] _GEN_892 = 5'h1c == _T_251 ? 5'h16 : _GEN_891; // @[layers.scala 132:13]
  wire [4:0] _GEN_893 = 5'h1d == _T_251 ? 5'ha : _GEN_892; // @[layers.scala 132:13]
  wire [4:0] _GEN_894 = 5'h1e == _T_251 ? 5'hf : _GEN_893; // @[layers.scala 132:13]
  wire [4:0] temp_27 = 5'h1f == _T_251 ? 5'h17 : _GEN_894; // @[layers.scala 132:13]
  wire [4:0] _T_260 = {io_x_in_0[28],io_x_in_1[28],io_x_in_2[28],io_x_in_3[28],io_x_in_4[28]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_897 = 5'h1 == _T_260 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_898 = 5'h2 == _T_260 ? 5'h1f : _GEN_897; // @[layers.scala 132:13]
  wire [4:0] _GEN_899 = 5'h3 == _T_260 ? 5'h14 : _GEN_898; // @[layers.scala 132:13]
  wire [4:0] _GEN_900 = 5'h4 == _T_260 ? 5'h1a : _GEN_899; // @[layers.scala 132:13]
  wire [4:0] _GEN_901 = 5'h5 == _T_260 ? 5'h15 : _GEN_900; // @[layers.scala 132:13]
  wire [4:0] _GEN_902 = 5'h6 == _T_260 ? 5'h9 : _GEN_901; // @[layers.scala 132:13]
  wire [4:0] _GEN_903 = 5'h7 == _T_260 ? 5'h2 : _GEN_902; // @[layers.scala 132:13]
  wire [4:0] _GEN_904 = 5'h8 == _T_260 ? 5'h1b : _GEN_903; // @[layers.scala 132:13]
  wire [4:0] _GEN_905 = 5'h9 == _T_260 ? 5'h5 : _GEN_904; // @[layers.scala 132:13]
  wire [4:0] _GEN_906 = 5'ha == _T_260 ? 5'h8 : _GEN_905; // @[layers.scala 132:13]
  wire [4:0] _GEN_907 = 5'hb == _T_260 ? 5'h12 : _GEN_906; // @[layers.scala 132:13]
  wire [4:0] _GEN_908 = 5'hc == _T_260 ? 5'h1d : _GEN_907; // @[layers.scala 132:13]
  wire [4:0] _GEN_909 = 5'hd == _T_260 ? 5'h3 : _GEN_908; // @[layers.scala 132:13]
  wire [4:0] _GEN_910 = 5'he == _T_260 ? 5'h6 : _GEN_909; // @[layers.scala 132:13]
  wire [4:0] _GEN_911 = 5'hf == _T_260 ? 5'h1c : _GEN_910; // @[layers.scala 132:13]
  wire [4:0] _GEN_912 = 5'h10 == _T_260 ? 5'h1e : _GEN_911; // @[layers.scala 132:13]
  wire [4:0] _GEN_913 = 5'h11 == _T_260 ? 5'h13 : _GEN_912; // @[layers.scala 132:13]
  wire [4:0] _GEN_914 = 5'h12 == _T_260 ? 5'h7 : _GEN_913; // @[layers.scala 132:13]
  wire [4:0] _GEN_915 = 5'h13 == _T_260 ? 5'he : _GEN_914; // @[layers.scala 132:13]
  wire [4:0] _GEN_916 = 5'h14 == _T_260 ? 5'h0 : _GEN_915; // @[layers.scala 132:13]
  wire [4:0] _GEN_917 = 5'h15 == _T_260 ? 5'hd : _GEN_916; // @[layers.scala 132:13]
  wire [4:0] _GEN_918 = 5'h16 == _T_260 ? 5'h11 : _GEN_917; // @[layers.scala 132:13]
  wire [4:0] _GEN_919 = 5'h17 == _T_260 ? 5'h18 : _GEN_918; // @[layers.scala 132:13]
  wire [4:0] _GEN_920 = 5'h18 == _T_260 ? 5'h10 : _GEN_919; // @[layers.scala 132:13]
  wire [4:0] _GEN_921 = 5'h19 == _T_260 ? 5'hc : _GEN_920; // @[layers.scala 132:13]
  wire [4:0] _GEN_922 = 5'h1a == _T_260 ? 5'h1 : _GEN_921; // @[layers.scala 132:13]
  wire [4:0] _GEN_923 = 5'h1b == _T_260 ? 5'h19 : _GEN_922; // @[layers.scala 132:13]
  wire [4:0] _GEN_924 = 5'h1c == _T_260 ? 5'h16 : _GEN_923; // @[layers.scala 132:13]
  wire [4:0] _GEN_925 = 5'h1d == _T_260 ? 5'ha : _GEN_924; // @[layers.scala 132:13]
  wire [4:0] _GEN_926 = 5'h1e == _T_260 ? 5'hf : _GEN_925; // @[layers.scala 132:13]
  wire [4:0] temp_28 = 5'h1f == _T_260 ? 5'h17 : _GEN_926; // @[layers.scala 132:13]
  wire [4:0] _T_269 = {io_x_in_0[29],io_x_in_1[29],io_x_in_2[29],io_x_in_3[29],io_x_in_4[29]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_929 = 5'h1 == _T_269 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_930 = 5'h2 == _T_269 ? 5'h1f : _GEN_929; // @[layers.scala 132:13]
  wire [4:0] _GEN_931 = 5'h3 == _T_269 ? 5'h14 : _GEN_930; // @[layers.scala 132:13]
  wire [4:0] _GEN_932 = 5'h4 == _T_269 ? 5'h1a : _GEN_931; // @[layers.scala 132:13]
  wire [4:0] _GEN_933 = 5'h5 == _T_269 ? 5'h15 : _GEN_932; // @[layers.scala 132:13]
  wire [4:0] _GEN_934 = 5'h6 == _T_269 ? 5'h9 : _GEN_933; // @[layers.scala 132:13]
  wire [4:0] _GEN_935 = 5'h7 == _T_269 ? 5'h2 : _GEN_934; // @[layers.scala 132:13]
  wire [4:0] _GEN_936 = 5'h8 == _T_269 ? 5'h1b : _GEN_935; // @[layers.scala 132:13]
  wire [4:0] _GEN_937 = 5'h9 == _T_269 ? 5'h5 : _GEN_936; // @[layers.scala 132:13]
  wire [4:0] _GEN_938 = 5'ha == _T_269 ? 5'h8 : _GEN_937; // @[layers.scala 132:13]
  wire [4:0] _GEN_939 = 5'hb == _T_269 ? 5'h12 : _GEN_938; // @[layers.scala 132:13]
  wire [4:0] _GEN_940 = 5'hc == _T_269 ? 5'h1d : _GEN_939; // @[layers.scala 132:13]
  wire [4:0] _GEN_941 = 5'hd == _T_269 ? 5'h3 : _GEN_940; // @[layers.scala 132:13]
  wire [4:0] _GEN_942 = 5'he == _T_269 ? 5'h6 : _GEN_941; // @[layers.scala 132:13]
  wire [4:0] _GEN_943 = 5'hf == _T_269 ? 5'h1c : _GEN_942; // @[layers.scala 132:13]
  wire [4:0] _GEN_944 = 5'h10 == _T_269 ? 5'h1e : _GEN_943; // @[layers.scala 132:13]
  wire [4:0] _GEN_945 = 5'h11 == _T_269 ? 5'h13 : _GEN_944; // @[layers.scala 132:13]
  wire [4:0] _GEN_946 = 5'h12 == _T_269 ? 5'h7 : _GEN_945; // @[layers.scala 132:13]
  wire [4:0] _GEN_947 = 5'h13 == _T_269 ? 5'he : _GEN_946; // @[layers.scala 132:13]
  wire [4:0] _GEN_948 = 5'h14 == _T_269 ? 5'h0 : _GEN_947; // @[layers.scala 132:13]
  wire [4:0] _GEN_949 = 5'h15 == _T_269 ? 5'hd : _GEN_948; // @[layers.scala 132:13]
  wire [4:0] _GEN_950 = 5'h16 == _T_269 ? 5'h11 : _GEN_949; // @[layers.scala 132:13]
  wire [4:0] _GEN_951 = 5'h17 == _T_269 ? 5'h18 : _GEN_950; // @[layers.scala 132:13]
  wire [4:0] _GEN_952 = 5'h18 == _T_269 ? 5'h10 : _GEN_951; // @[layers.scala 132:13]
  wire [4:0] _GEN_953 = 5'h19 == _T_269 ? 5'hc : _GEN_952; // @[layers.scala 132:13]
  wire [4:0] _GEN_954 = 5'h1a == _T_269 ? 5'h1 : _GEN_953; // @[layers.scala 132:13]
  wire [4:0] _GEN_955 = 5'h1b == _T_269 ? 5'h19 : _GEN_954; // @[layers.scala 132:13]
  wire [4:0] _GEN_956 = 5'h1c == _T_269 ? 5'h16 : _GEN_955; // @[layers.scala 132:13]
  wire [4:0] _GEN_957 = 5'h1d == _T_269 ? 5'ha : _GEN_956; // @[layers.scala 132:13]
  wire [4:0] _GEN_958 = 5'h1e == _T_269 ? 5'hf : _GEN_957; // @[layers.scala 132:13]
  wire [4:0] temp_29 = 5'h1f == _T_269 ? 5'h17 : _GEN_958; // @[layers.scala 132:13]
  wire [4:0] _T_278 = {io_x_in_0[30],io_x_in_1[30],io_x_in_2[30],io_x_in_3[30],io_x_in_4[30]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_961 = 5'h1 == _T_278 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_962 = 5'h2 == _T_278 ? 5'h1f : _GEN_961; // @[layers.scala 132:13]
  wire [4:0] _GEN_963 = 5'h3 == _T_278 ? 5'h14 : _GEN_962; // @[layers.scala 132:13]
  wire [4:0] _GEN_964 = 5'h4 == _T_278 ? 5'h1a : _GEN_963; // @[layers.scala 132:13]
  wire [4:0] _GEN_965 = 5'h5 == _T_278 ? 5'h15 : _GEN_964; // @[layers.scala 132:13]
  wire [4:0] _GEN_966 = 5'h6 == _T_278 ? 5'h9 : _GEN_965; // @[layers.scala 132:13]
  wire [4:0] _GEN_967 = 5'h7 == _T_278 ? 5'h2 : _GEN_966; // @[layers.scala 132:13]
  wire [4:0] _GEN_968 = 5'h8 == _T_278 ? 5'h1b : _GEN_967; // @[layers.scala 132:13]
  wire [4:0] _GEN_969 = 5'h9 == _T_278 ? 5'h5 : _GEN_968; // @[layers.scala 132:13]
  wire [4:0] _GEN_970 = 5'ha == _T_278 ? 5'h8 : _GEN_969; // @[layers.scala 132:13]
  wire [4:0] _GEN_971 = 5'hb == _T_278 ? 5'h12 : _GEN_970; // @[layers.scala 132:13]
  wire [4:0] _GEN_972 = 5'hc == _T_278 ? 5'h1d : _GEN_971; // @[layers.scala 132:13]
  wire [4:0] _GEN_973 = 5'hd == _T_278 ? 5'h3 : _GEN_972; // @[layers.scala 132:13]
  wire [4:0] _GEN_974 = 5'he == _T_278 ? 5'h6 : _GEN_973; // @[layers.scala 132:13]
  wire [4:0] _GEN_975 = 5'hf == _T_278 ? 5'h1c : _GEN_974; // @[layers.scala 132:13]
  wire [4:0] _GEN_976 = 5'h10 == _T_278 ? 5'h1e : _GEN_975; // @[layers.scala 132:13]
  wire [4:0] _GEN_977 = 5'h11 == _T_278 ? 5'h13 : _GEN_976; // @[layers.scala 132:13]
  wire [4:0] _GEN_978 = 5'h12 == _T_278 ? 5'h7 : _GEN_977; // @[layers.scala 132:13]
  wire [4:0] _GEN_979 = 5'h13 == _T_278 ? 5'he : _GEN_978; // @[layers.scala 132:13]
  wire [4:0] _GEN_980 = 5'h14 == _T_278 ? 5'h0 : _GEN_979; // @[layers.scala 132:13]
  wire [4:0] _GEN_981 = 5'h15 == _T_278 ? 5'hd : _GEN_980; // @[layers.scala 132:13]
  wire [4:0] _GEN_982 = 5'h16 == _T_278 ? 5'h11 : _GEN_981; // @[layers.scala 132:13]
  wire [4:0] _GEN_983 = 5'h17 == _T_278 ? 5'h18 : _GEN_982; // @[layers.scala 132:13]
  wire [4:0] _GEN_984 = 5'h18 == _T_278 ? 5'h10 : _GEN_983; // @[layers.scala 132:13]
  wire [4:0] _GEN_985 = 5'h19 == _T_278 ? 5'hc : _GEN_984; // @[layers.scala 132:13]
  wire [4:0] _GEN_986 = 5'h1a == _T_278 ? 5'h1 : _GEN_985; // @[layers.scala 132:13]
  wire [4:0] _GEN_987 = 5'h1b == _T_278 ? 5'h19 : _GEN_986; // @[layers.scala 132:13]
  wire [4:0] _GEN_988 = 5'h1c == _T_278 ? 5'h16 : _GEN_987; // @[layers.scala 132:13]
  wire [4:0] _GEN_989 = 5'h1d == _T_278 ? 5'ha : _GEN_988; // @[layers.scala 132:13]
  wire [4:0] _GEN_990 = 5'h1e == _T_278 ? 5'hf : _GEN_989; // @[layers.scala 132:13]
  wire [4:0] temp_30 = 5'h1f == _T_278 ? 5'h17 : _GEN_990; // @[layers.scala 132:13]
  wire [4:0] _T_287 = {io_x_in_0[31],io_x_in_1[31],io_x_in_2[31],io_x_in_3[31],io_x_in_4[31]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_993 = 5'h1 == _T_287 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_994 = 5'h2 == _T_287 ? 5'h1f : _GEN_993; // @[layers.scala 132:13]
  wire [4:0] _GEN_995 = 5'h3 == _T_287 ? 5'h14 : _GEN_994; // @[layers.scala 132:13]
  wire [4:0] _GEN_996 = 5'h4 == _T_287 ? 5'h1a : _GEN_995; // @[layers.scala 132:13]
  wire [4:0] _GEN_997 = 5'h5 == _T_287 ? 5'h15 : _GEN_996; // @[layers.scala 132:13]
  wire [4:0] _GEN_998 = 5'h6 == _T_287 ? 5'h9 : _GEN_997; // @[layers.scala 132:13]
  wire [4:0] _GEN_999 = 5'h7 == _T_287 ? 5'h2 : _GEN_998; // @[layers.scala 132:13]
  wire [4:0] _GEN_1000 = 5'h8 == _T_287 ? 5'h1b : _GEN_999; // @[layers.scala 132:13]
  wire [4:0] _GEN_1001 = 5'h9 == _T_287 ? 5'h5 : _GEN_1000; // @[layers.scala 132:13]
  wire [4:0] _GEN_1002 = 5'ha == _T_287 ? 5'h8 : _GEN_1001; // @[layers.scala 132:13]
  wire [4:0] _GEN_1003 = 5'hb == _T_287 ? 5'h12 : _GEN_1002; // @[layers.scala 132:13]
  wire [4:0] _GEN_1004 = 5'hc == _T_287 ? 5'h1d : _GEN_1003; // @[layers.scala 132:13]
  wire [4:0] _GEN_1005 = 5'hd == _T_287 ? 5'h3 : _GEN_1004; // @[layers.scala 132:13]
  wire [4:0] _GEN_1006 = 5'he == _T_287 ? 5'h6 : _GEN_1005; // @[layers.scala 132:13]
  wire [4:0] _GEN_1007 = 5'hf == _T_287 ? 5'h1c : _GEN_1006; // @[layers.scala 132:13]
  wire [4:0] _GEN_1008 = 5'h10 == _T_287 ? 5'h1e : _GEN_1007; // @[layers.scala 132:13]
  wire [4:0] _GEN_1009 = 5'h11 == _T_287 ? 5'h13 : _GEN_1008; // @[layers.scala 132:13]
  wire [4:0] _GEN_1010 = 5'h12 == _T_287 ? 5'h7 : _GEN_1009; // @[layers.scala 132:13]
  wire [4:0] _GEN_1011 = 5'h13 == _T_287 ? 5'he : _GEN_1010; // @[layers.scala 132:13]
  wire [4:0] _GEN_1012 = 5'h14 == _T_287 ? 5'h0 : _GEN_1011; // @[layers.scala 132:13]
  wire [4:0] _GEN_1013 = 5'h15 == _T_287 ? 5'hd : _GEN_1012; // @[layers.scala 132:13]
  wire [4:0] _GEN_1014 = 5'h16 == _T_287 ? 5'h11 : _GEN_1013; // @[layers.scala 132:13]
  wire [4:0] _GEN_1015 = 5'h17 == _T_287 ? 5'h18 : _GEN_1014; // @[layers.scala 132:13]
  wire [4:0] _GEN_1016 = 5'h18 == _T_287 ? 5'h10 : _GEN_1015; // @[layers.scala 132:13]
  wire [4:0] _GEN_1017 = 5'h19 == _T_287 ? 5'hc : _GEN_1016; // @[layers.scala 132:13]
  wire [4:0] _GEN_1018 = 5'h1a == _T_287 ? 5'h1 : _GEN_1017; // @[layers.scala 132:13]
  wire [4:0] _GEN_1019 = 5'h1b == _T_287 ? 5'h19 : _GEN_1018; // @[layers.scala 132:13]
  wire [4:0] _GEN_1020 = 5'h1c == _T_287 ? 5'h16 : _GEN_1019; // @[layers.scala 132:13]
  wire [4:0] _GEN_1021 = 5'h1d == _T_287 ? 5'ha : _GEN_1020; // @[layers.scala 132:13]
  wire [4:0] _GEN_1022 = 5'h1e == _T_287 ? 5'hf : _GEN_1021; // @[layers.scala 132:13]
  wire [4:0] temp_31 = 5'h1f == _T_287 ? 5'h17 : _GEN_1022; // @[layers.scala 132:13]
  wire [4:0] _T_296 = {io_x_in_0[32],io_x_in_1[32],io_x_in_2[32],io_x_in_3[32],io_x_in_4[32]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1025 = 5'h1 == _T_296 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1026 = 5'h2 == _T_296 ? 5'h1f : _GEN_1025; // @[layers.scala 132:13]
  wire [4:0] _GEN_1027 = 5'h3 == _T_296 ? 5'h14 : _GEN_1026; // @[layers.scala 132:13]
  wire [4:0] _GEN_1028 = 5'h4 == _T_296 ? 5'h1a : _GEN_1027; // @[layers.scala 132:13]
  wire [4:0] _GEN_1029 = 5'h5 == _T_296 ? 5'h15 : _GEN_1028; // @[layers.scala 132:13]
  wire [4:0] _GEN_1030 = 5'h6 == _T_296 ? 5'h9 : _GEN_1029; // @[layers.scala 132:13]
  wire [4:0] _GEN_1031 = 5'h7 == _T_296 ? 5'h2 : _GEN_1030; // @[layers.scala 132:13]
  wire [4:0] _GEN_1032 = 5'h8 == _T_296 ? 5'h1b : _GEN_1031; // @[layers.scala 132:13]
  wire [4:0] _GEN_1033 = 5'h9 == _T_296 ? 5'h5 : _GEN_1032; // @[layers.scala 132:13]
  wire [4:0] _GEN_1034 = 5'ha == _T_296 ? 5'h8 : _GEN_1033; // @[layers.scala 132:13]
  wire [4:0] _GEN_1035 = 5'hb == _T_296 ? 5'h12 : _GEN_1034; // @[layers.scala 132:13]
  wire [4:0] _GEN_1036 = 5'hc == _T_296 ? 5'h1d : _GEN_1035; // @[layers.scala 132:13]
  wire [4:0] _GEN_1037 = 5'hd == _T_296 ? 5'h3 : _GEN_1036; // @[layers.scala 132:13]
  wire [4:0] _GEN_1038 = 5'he == _T_296 ? 5'h6 : _GEN_1037; // @[layers.scala 132:13]
  wire [4:0] _GEN_1039 = 5'hf == _T_296 ? 5'h1c : _GEN_1038; // @[layers.scala 132:13]
  wire [4:0] _GEN_1040 = 5'h10 == _T_296 ? 5'h1e : _GEN_1039; // @[layers.scala 132:13]
  wire [4:0] _GEN_1041 = 5'h11 == _T_296 ? 5'h13 : _GEN_1040; // @[layers.scala 132:13]
  wire [4:0] _GEN_1042 = 5'h12 == _T_296 ? 5'h7 : _GEN_1041; // @[layers.scala 132:13]
  wire [4:0] _GEN_1043 = 5'h13 == _T_296 ? 5'he : _GEN_1042; // @[layers.scala 132:13]
  wire [4:0] _GEN_1044 = 5'h14 == _T_296 ? 5'h0 : _GEN_1043; // @[layers.scala 132:13]
  wire [4:0] _GEN_1045 = 5'h15 == _T_296 ? 5'hd : _GEN_1044; // @[layers.scala 132:13]
  wire [4:0] _GEN_1046 = 5'h16 == _T_296 ? 5'h11 : _GEN_1045; // @[layers.scala 132:13]
  wire [4:0] _GEN_1047 = 5'h17 == _T_296 ? 5'h18 : _GEN_1046; // @[layers.scala 132:13]
  wire [4:0] _GEN_1048 = 5'h18 == _T_296 ? 5'h10 : _GEN_1047; // @[layers.scala 132:13]
  wire [4:0] _GEN_1049 = 5'h19 == _T_296 ? 5'hc : _GEN_1048; // @[layers.scala 132:13]
  wire [4:0] _GEN_1050 = 5'h1a == _T_296 ? 5'h1 : _GEN_1049; // @[layers.scala 132:13]
  wire [4:0] _GEN_1051 = 5'h1b == _T_296 ? 5'h19 : _GEN_1050; // @[layers.scala 132:13]
  wire [4:0] _GEN_1052 = 5'h1c == _T_296 ? 5'h16 : _GEN_1051; // @[layers.scala 132:13]
  wire [4:0] _GEN_1053 = 5'h1d == _T_296 ? 5'ha : _GEN_1052; // @[layers.scala 132:13]
  wire [4:0] _GEN_1054 = 5'h1e == _T_296 ? 5'hf : _GEN_1053; // @[layers.scala 132:13]
  wire [4:0] temp_32 = 5'h1f == _T_296 ? 5'h17 : _GEN_1054; // @[layers.scala 132:13]
  wire [4:0] _T_305 = {io_x_in_0[33],io_x_in_1[33],io_x_in_2[33],io_x_in_3[33],io_x_in_4[33]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1057 = 5'h1 == _T_305 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1058 = 5'h2 == _T_305 ? 5'h1f : _GEN_1057; // @[layers.scala 132:13]
  wire [4:0] _GEN_1059 = 5'h3 == _T_305 ? 5'h14 : _GEN_1058; // @[layers.scala 132:13]
  wire [4:0] _GEN_1060 = 5'h4 == _T_305 ? 5'h1a : _GEN_1059; // @[layers.scala 132:13]
  wire [4:0] _GEN_1061 = 5'h5 == _T_305 ? 5'h15 : _GEN_1060; // @[layers.scala 132:13]
  wire [4:0] _GEN_1062 = 5'h6 == _T_305 ? 5'h9 : _GEN_1061; // @[layers.scala 132:13]
  wire [4:0] _GEN_1063 = 5'h7 == _T_305 ? 5'h2 : _GEN_1062; // @[layers.scala 132:13]
  wire [4:0] _GEN_1064 = 5'h8 == _T_305 ? 5'h1b : _GEN_1063; // @[layers.scala 132:13]
  wire [4:0] _GEN_1065 = 5'h9 == _T_305 ? 5'h5 : _GEN_1064; // @[layers.scala 132:13]
  wire [4:0] _GEN_1066 = 5'ha == _T_305 ? 5'h8 : _GEN_1065; // @[layers.scala 132:13]
  wire [4:0] _GEN_1067 = 5'hb == _T_305 ? 5'h12 : _GEN_1066; // @[layers.scala 132:13]
  wire [4:0] _GEN_1068 = 5'hc == _T_305 ? 5'h1d : _GEN_1067; // @[layers.scala 132:13]
  wire [4:0] _GEN_1069 = 5'hd == _T_305 ? 5'h3 : _GEN_1068; // @[layers.scala 132:13]
  wire [4:0] _GEN_1070 = 5'he == _T_305 ? 5'h6 : _GEN_1069; // @[layers.scala 132:13]
  wire [4:0] _GEN_1071 = 5'hf == _T_305 ? 5'h1c : _GEN_1070; // @[layers.scala 132:13]
  wire [4:0] _GEN_1072 = 5'h10 == _T_305 ? 5'h1e : _GEN_1071; // @[layers.scala 132:13]
  wire [4:0] _GEN_1073 = 5'h11 == _T_305 ? 5'h13 : _GEN_1072; // @[layers.scala 132:13]
  wire [4:0] _GEN_1074 = 5'h12 == _T_305 ? 5'h7 : _GEN_1073; // @[layers.scala 132:13]
  wire [4:0] _GEN_1075 = 5'h13 == _T_305 ? 5'he : _GEN_1074; // @[layers.scala 132:13]
  wire [4:0] _GEN_1076 = 5'h14 == _T_305 ? 5'h0 : _GEN_1075; // @[layers.scala 132:13]
  wire [4:0] _GEN_1077 = 5'h15 == _T_305 ? 5'hd : _GEN_1076; // @[layers.scala 132:13]
  wire [4:0] _GEN_1078 = 5'h16 == _T_305 ? 5'h11 : _GEN_1077; // @[layers.scala 132:13]
  wire [4:0] _GEN_1079 = 5'h17 == _T_305 ? 5'h18 : _GEN_1078; // @[layers.scala 132:13]
  wire [4:0] _GEN_1080 = 5'h18 == _T_305 ? 5'h10 : _GEN_1079; // @[layers.scala 132:13]
  wire [4:0] _GEN_1081 = 5'h19 == _T_305 ? 5'hc : _GEN_1080; // @[layers.scala 132:13]
  wire [4:0] _GEN_1082 = 5'h1a == _T_305 ? 5'h1 : _GEN_1081; // @[layers.scala 132:13]
  wire [4:0] _GEN_1083 = 5'h1b == _T_305 ? 5'h19 : _GEN_1082; // @[layers.scala 132:13]
  wire [4:0] _GEN_1084 = 5'h1c == _T_305 ? 5'h16 : _GEN_1083; // @[layers.scala 132:13]
  wire [4:0] _GEN_1085 = 5'h1d == _T_305 ? 5'ha : _GEN_1084; // @[layers.scala 132:13]
  wire [4:0] _GEN_1086 = 5'h1e == _T_305 ? 5'hf : _GEN_1085; // @[layers.scala 132:13]
  wire [4:0] temp_33 = 5'h1f == _T_305 ? 5'h17 : _GEN_1086; // @[layers.scala 132:13]
  wire [4:0] _T_314 = {io_x_in_0[34],io_x_in_1[34],io_x_in_2[34],io_x_in_3[34],io_x_in_4[34]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1089 = 5'h1 == _T_314 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1090 = 5'h2 == _T_314 ? 5'h1f : _GEN_1089; // @[layers.scala 132:13]
  wire [4:0] _GEN_1091 = 5'h3 == _T_314 ? 5'h14 : _GEN_1090; // @[layers.scala 132:13]
  wire [4:0] _GEN_1092 = 5'h4 == _T_314 ? 5'h1a : _GEN_1091; // @[layers.scala 132:13]
  wire [4:0] _GEN_1093 = 5'h5 == _T_314 ? 5'h15 : _GEN_1092; // @[layers.scala 132:13]
  wire [4:0] _GEN_1094 = 5'h6 == _T_314 ? 5'h9 : _GEN_1093; // @[layers.scala 132:13]
  wire [4:0] _GEN_1095 = 5'h7 == _T_314 ? 5'h2 : _GEN_1094; // @[layers.scala 132:13]
  wire [4:0] _GEN_1096 = 5'h8 == _T_314 ? 5'h1b : _GEN_1095; // @[layers.scala 132:13]
  wire [4:0] _GEN_1097 = 5'h9 == _T_314 ? 5'h5 : _GEN_1096; // @[layers.scala 132:13]
  wire [4:0] _GEN_1098 = 5'ha == _T_314 ? 5'h8 : _GEN_1097; // @[layers.scala 132:13]
  wire [4:0] _GEN_1099 = 5'hb == _T_314 ? 5'h12 : _GEN_1098; // @[layers.scala 132:13]
  wire [4:0] _GEN_1100 = 5'hc == _T_314 ? 5'h1d : _GEN_1099; // @[layers.scala 132:13]
  wire [4:0] _GEN_1101 = 5'hd == _T_314 ? 5'h3 : _GEN_1100; // @[layers.scala 132:13]
  wire [4:0] _GEN_1102 = 5'he == _T_314 ? 5'h6 : _GEN_1101; // @[layers.scala 132:13]
  wire [4:0] _GEN_1103 = 5'hf == _T_314 ? 5'h1c : _GEN_1102; // @[layers.scala 132:13]
  wire [4:0] _GEN_1104 = 5'h10 == _T_314 ? 5'h1e : _GEN_1103; // @[layers.scala 132:13]
  wire [4:0] _GEN_1105 = 5'h11 == _T_314 ? 5'h13 : _GEN_1104; // @[layers.scala 132:13]
  wire [4:0] _GEN_1106 = 5'h12 == _T_314 ? 5'h7 : _GEN_1105; // @[layers.scala 132:13]
  wire [4:0] _GEN_1107 = 5'h13 == _T_314 ? 5'he : _GEN_1106; // @[layers.scala 132:13]
  wire [4:0] _GEN_1108 = 5'h14 == _T_314 ? 5'h0 : _GEN_1107; // @[layers.scala 132:13]
  wire [4:0] _GEN_1109 = 5'h15 == _T_314 ? 5'hd : _GEN_1108; // @[layers.scala 132:13]
  wire [4:0] _GEN_1110 = 5'h16 == _T_314 ? 5'h11 : _GEN_1109; // @[layers.scala 132:13]
  wire [4:0] _GEN_1111 = 5'h17 == _T_314 ? 5'h18 : _GEN_1110; // @[layers.scala 132:13]
  wire [4:0] _GEN_1112 = 5'h18 == _T_314 ? 5'h10 : _GEN_1111; // @[layers.scala 132:13]
  wire [4:0] _GEN_1113 = 5'h19 == _T_314 ? 5'hc : _GEN_1112; // @[layers.scala 132:13]
  wire [4:0] _GEN_1114 = 5'h1a == _T_314 ? 5'h1 : _GEN_1113; // @[layers.scala 132:13]
  wire [4:0] _GEN_1115 = 5'h1b == _T_314 ? 5'h19 : _GEN_1114; // @[layers.scala 132:13]
  wire [4:0] _GEN_1116 = 5'h1c == _T_314 ? 5'h16 : _GEN_1115; // @[layers.scala 132:13]
  wire [4:0] _GEN_1117 = 5'h1d == _T_314 ? 5'ha : _GEN_1116; // @[layers.scala 132:13]
  wire [4:0] _GEN_1118 = 5'h1e == _T_314 ? 5'hf : _GEN_1117; // @[layers.scala 132:13]
  wire [4:0] temp_34 = 5'h1f == _T_314 ? 5'h17 : _GEN_1118; // @[layers.scala 132:13]
  wire [4:0] _T_323 = {io_x_in_0[35],io_x_in_1[35],io_x_in_2[35],io_x_in_3[35],io_x_in_4[35]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1121 = 5'h1 == _T_323 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1122 = 5'h2 == _T_323 ? 5'h1f : _GEN_1121; // @[layers.scala 132:13]
  wire [4:0] _GEN_1123 = 5'h3 == _T_323 ? 5'h14 : _GEN_1122; // @[layers.scala 132:13]
  wire [4:0] _GEN_1124 = 5'h4 == _T_323 ? 5'h1a : _GEN_1123; // @[layers.scala 132:13]
  wire [4:0] _GEN_1125 = 5'h5 == _T_323 ? 5'h15 : _GEN_1124; // @[layers.scala 132:13]
  wire [4:0] _GEN_1126 = 5'h6 == _T_323 ? 5'h9 : _GEN_1125; // @[layers.scala 132:13]
  wire [4:0] _GEN_1127 = 5'h7 == _T_323 ? 5'h2 : _GEN_1126; // @[layers.scala 132:13]
  wire [4:0] _GEN_1128 = 5'h8 == _T_323 ? 5'h1b : _GEN_1127; // @[layers.scala 132:13]
  wire [4:0] _GEN_1129 = 5'h9 == _T_323 ? 5'h5 : _GEN_1128; // @[layers.scala 132:13]
  wire [4:0] _GEN_1130 = 5'ha == _T_323 ? 5'h8 : _GEN_1129; // @[layers.scala 132:13]
  wire [4:0] _GEN_1131 = 5'hb == _T_323 ? 5'h12 : _GEN_1130; // @[layers.scala 132:13]
  wire [4:0] _GEN_1132 = 5'hc == _T_323 ? 5'h1d : _GEN_1131; // @[layers.scala 132:13]
  wire [4:0] _GEN_1133 = 5'hd == _T_323 ? 5'h3 : _GEN_1132; // @[layers.scala 132:13]
  wire [4:0] _GEN_1134 = 5'he == _T_323 ? 5'h6 : _GEN_1133; // @[layers.scala 132:13]
  wire [4:0] _GEN_1135 = 5'hf == _T_323 ? 5'h1c : _GEN_1134; // @[layers.scala 132:13]
  wire [4:0] _GEN_1136 = 5'h10 == _T_323 ? 5'h1e : _GEN_1135; // @[layers.scala 132:13]
  wire [4:0] _GEN_1137 = 5'h11 == _T_323 ? 5'h13 : _GEN_1136; // @[layers.scala 132:13]
  wire [4:0] _GEN_1138 = 5'h12 == _T_323 ? 5'h7 : _GEN_1137; // @[layers.scala 132:13]
  wire [4:0] _GEN_1139 = 5'h13 == _T_323 ? 5'he : _GEN_1138; // @[layers.scala 132:13]
  wire [4:0] _GEN_1140 = 5'h14 == _T_323 ? 5'h0 : _GEN_1139; // @[layers.scala 132:13]
  wire [4:0] _GEN_1141 = 5'h15 == _T_323 ? 5'hd : _GEN_1140; // @[layers.scala 132:13]
  wire [4:0] _GEN_1142 = 5'h16 == _T_323 ? 5'h11 : _GEN_1141; // @[layers.scala 132:13]
  wire [4:0] _GEN_1143 = 5'h17 == _T_323 ? 5'h18 : _GEN_1142; // @[layers.scala 132:13]
  wire [4:0] _GEN_1144 = 5'h18 == _T_323 ? 5'h10 : _GEN_1143; // @[layers.scala 132:13]
  wire [4:0] _GEN_1145 = 5'h19 == _T_323 ? 5'hc : _GEN_1144; // @[layers.scala 132:13]
  wire [4:0] _GEN_1146 = 5'h1a == _T_323 ? 5'h1 : _GEN_1145; // @[layers.scala 132:13]
  wire [4:0] _GEN_1147 = 5'h1b == _T_323 ? 5'h19 : _GEN_1146; // @[layers.scala 132:13]
  wire [4:0] _GEN_1148 = 5'h1c == _T_323 ? 5'h16 : _GEN_1147; // @[layers.scala 132:13]
  wire [4:0] _GEN_1149 = 5'h1d == _T_323 ? 5'ha : _GEN_1148; // @[layers.scala 132:13]
  wire [4:0] _GEN_1150 = 5'h1e == _T_323 ? 5'hf : _GEN_1149; // @[layers.scala 132:13]
  wire [4:0] temp_35 = 5'h1f == _T_323 ? 5'h17 : _GEN_1150; // @[layers.scala 132:13]
  wire [4:0] _T_332 = {io_x_in_0[36],io_x_in_1[36],io_x_in_2[36],io_x_in_3[36],io_x_in_4[36]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1153 = 5'h1 == _T_332 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1154 = 5'h2 == _T_332 ? 5'h1f : _GEN_1153; // @[layers.scala 132:13]
  wire [4:0] _GEN_1155 = 5'h3 == _T_332 ? 5'h14 : _GEN_1154; // @[layers.scala 132:13]
  wire [4:0] _GEN_1156 = 5'h4 == _T_332 ? 5'h1a : _GEN_1155; // @[layers.scala 132:13]
  wire [4:0] _GEN_1157 = 5'h5 == _T_332 ? 5'h15 : _GEN_1156; // @[layers.scala 132:13]
  wire [4:0] _GEN_1158 = 5'h6 == _T_332 ? 5'h9 : _GEN_1157; // @[layers.scala 132:13]
  wire [4:0] _GEN_1159 = 5'h7 == _T_332 ? 5'h2 : _GEN_1158; // @[layers.scala 132:13]
  wire [4:0] _GEN_1160 = 5'h8 == _T_332 ? 5'h1b : _GEN_1159; // @[layers.scala 132:13]
  wire [4:0] _GEN_1161 = 5'h9 == _T_332 ? 5'h5 : _GEN_1160; // @[layers.scala 132:13]
  wire [4:0] _GEN_1162 = 5'ha == _T_332 ? 5'h8 : _GEN_1161; // @[layers.scala 132:13]
  wire [4:0] _GEN_1163 = 5'hb == _T_332 ? 5'h12 : _GEN_1162; // @[layers.scala 132:13]
  wire [4:0] _GEN_1164 = 5'hc == _T_332 ? 5'h1d : _GEN_1163; // @[layers.scala 132:13]
  wire [4:0] _GEN_1165 = 5'hd == _T_332 ? 5'h3 : _GEN_1164; // @[layers.scala 132:13]
  wire [4:0] _GEN_1166 = 5'he == _T_332 ? 5'h6 : _GEN_1165; // @[layers.scala 132:13]
  wire [4:0] _GEN_1167 = 5'hf == _T_332 ? 5'h1c : _GEN_1166; // @[layers.scala 132:13]
  wire [4:0] _GEN_1168 = 5'h10 == _T_332 ? 5'h1e : _GEN_1167; // @[layers.scala 132:13]
  wire [4:0] _GEN_1169 = 5'h11 == _T_332 ? 5'h13 : _GEN_1168; // @[layers.scala 132:13]
  wire [4:0] _GEN_1170 = 5'h12 == _T_332 ? 5'h7 : _GEN_1169; // @[layers.scala 132:13]
  wire [4:0] _GEN_1171 = 5'h13 == _T_332 ? 5'he : _GEN_1170; // @[layers.scala 132:13]
  wire [4:0] _GEN_1172 = 5'h14 == _T_332 ? 5'h0 : _GEN_1171; // @[layers.scala 132:13]
  wire [4:0] _GEN_1173 = 5'h15 == _T_332 ? 5'hd : _GEN_1172; // @[layers.scala 132:13]
  wire [4:0] _GEN_1174 = 5'h16 == _T_332 ? 5'h11 : _GEN_1173; // @[layers.scala 132:13]
  wire [4:0] _GEN_1175 = 5'h17 == _T_332 ? 5'h18 : _GEN_1174; // @[layers.scala 132:13]
  wire [4:0] _GEN_1176 = 5'h18 == _T_332 ? 5'h10 : _GEN_1175; // @[layers.scala 132:13]
  wire [4:0] _GEN_1177 = 5'h19 == _T_332 ? 5'hc : _GEN_1176; // @[layers.scala 132:13]
  wire [4:0] _GEN_1178 = 5'h1a == _T_332 ? 5'h1 : _GEN_1177; // @[layers.scala 132:13]
  wire [4:0] _GEN_1179 = 5'h1b == _T_332 ? 5'h19 : _GEN_1178; // @[layers.scala 132:13]
  wire [4:0] _GEN_1180 = 5'h1c == _T_332 ? 5'h16 : _GEN_1179; // @[layers.scala 132:13]
  wire [4:0] _GEN_1181 = 5'h1d == _T_332 ? 5'ha : _GEN_1180; // @[layers.scala 132:13]
  wire [4:0] _GEN_1182 = 5'h1e == _T_332 ? 5'hf : _GEN_1181; // @[layers.scala 132:13]
  wire [4:0] temp_36 = 5'h1f == _T_332 ? 5'h17 : _GEN_1182; // @[layers.scala 132:13]
  wire [4:0] _T_341 = {io_x_in_0[37],io_x_in_1[37],io_x_in_2[37],io_x_in_3[37],io_x_in_4[37]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1185 = 5'h1 == _T_341 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1186 = 5'h2 == _T_341 ? 5'h1f : _GEN_1185; // @[layers.scala 132:13]
  wire [4:0] _GEN_1187 = 5'h3 == _T_341 ? 5'h14 : _GEN_1186; // @[layers.scala 132:13]
  wire [4:0] _GEN_1188 = 5'h4 == _T_341 ? 5'h1a : _GEN_1187; // @[layers.scala 132:13]
  wire [4:0] _GEN_1189 = 5'h5 == _T_341 ? 5'h15 : _GEN_1188; // @[layers.scala 132:13]
  wire [4:0] _GEN_1190 = 5'h6 == _T_341 ? 5'h9 : _GEN_1189; // @[layers.scala 132:13]
  wire [4:0] _GEN_1191 = 5'h7 == _T_341 ? 5'h2 : _GEN_1190; // @[layers.scala 132:13]
  wire [4:0] _GEN_1192 = 5'h8 == _T_341 ? 5'h1b : _GEN_1191; // @[layers.scala 132:13]
  wire [4:0] _GEN_1193 = 5'h9 == _T_341 ? 5'h5 : _GEN_1192; // @[layers.scala 132:13]
  wire [4:0] _GEN_1194 = 5'ha == _T_341 ? 5'h8 : _GEN_1193; // @[layers.scala 132:13]
  wire [4:0] _GEN_1195 = 5'hb == _T_341 ? 5'h12 : _GEN_1194; // @[layers.scala 132:13]
  wire [4:0] _GEN_1196 = 5'hc == _T_341 ? 5'h1d : _GEN_1195; // @[layers.scala 132:13]
  wire [4:0] _GEN_1197 = 5'hd == _T_341 ? 5'h3 : _GEN_1196; // @[layers.scala 132:13]
  wire [4:0] _GEN_1198 = 5'he == _T_341 ? 5'h6 : _GEN_1197; // @[layers.scala 132:13]
  wire [4:0] _GEN_1199 = 5'hf == _T_341 ? 5'h1c : _GEN_1198; // @[layers.scala 132:13]
  wire [4:0] _GEN_1200 = 5'h10 == _T_341 ? 5'h1e : _GEN_1199; // @[layers.scala 132:13]
  wire [4:0] _GEN_1201 = 5'h11 == _T_341 ? 5'h13 : _GEN_1200; // @[layers.scala 132:13]
  wire [4:0] _GEN_1202 = 5'h12 == _T_341 ? 5'h7 : _GEN_1201; // @[layers.scala 132:13]
  wire [4:0] _GEN_1203 = 5'h13 == _T_341 ? 5'he : _GEN_1202; // @[layers.scala 132:13]
  wire [4:0] _GEN_1204 = 5'h14 == _T_341 ? 5'h0 : _GEN_1203; // @[layers.scala 132:13]
  wire [4:0] _GEN_1205 = 5'h15 == _T_341 ? 5'hd : _GEN_1204; // @[layers.scala 132:13]
  wire [4:0] _GEN_1206 = 5'h16 == _T_341 ? 5'h11 : _GEN_1205; // @[layers.scala 132:13]
  wire [4:0] _GEN_1207 = 5'h17 == _T_341 ? 5'h18 : _GEN_1206; // @[layers.scala 132:13]
  wire [4:0] _GEN_1208 = 5'h18 == _T_341 ? 5'h10 : _GEN_1207; // @[layers.scala 132:13]
  wire [4:0] _GEN_1209 = 5'h19 == _T_341 ? 5'hc : _GEN_1208; // @[layers.scala 132:13]
  wire [4:0] _GEN_1210 = 5'h1a == _T_341 ? 5'h1 : _GEN_1209; // @[layers.scala 132:13]
  wire [4:0] _GEN_1211 = 5'h1b == _T_341 ? 5'h19 : _GEN_1210; // @[layers.scala 132:13]
  wire [4:0] _GEN_1212 = 5'h1c == _T_341 ? 5'h16 : _GEN_1211; // @[layers.scala 132:13]
  wire [4:0] _GEN_1213 = 5'h1d == _T_341 ? 5'ha : _GEN_1212; // @[layers.scala 132:13]
  wire [4:0] _GEN_1214 = 5'h1e == _T_341 ? 5'hf : _GEN_1213; // @[layers.scala 132:13]
  wire [4:0] temp_37 = 5'h1f == _T_341 ? 5'h17 : _GEN_1214; // @[layers.scala 132:13]
  wire [4:0] _T_350 = {io_x_in_0[38],io_x_in_1[38],io_x_in_2[38],io_x_in_3[38],io_x_in_4[38]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1217 = 5'h1 == _T_350 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1218 = 5'h2 == _T_350 ? 5'h1f : _GEN_1217; // @[layers.scala 132:13]
  wire [4:0] _GEN_1219 = 5'h3 == _T_350 ? 5'h14 : _GEN_1218; // @[layers.scala 132:13]
  wire [4:0] _GEN_1220 = 5'h4 == _T_350 ? 5'h1a : _GEN_1219; // @[layers.scala 132:13]
  wire [4:0] _GEN_1221 = 5'h5 == _T_350 ? 5'h15 : _GEN_1220; // @[layers.scala 132:13]
  wire [4:0] _GEN_1222 = 5'h6 == _T_350 ? 5'h9 : _GEN_1221; // @[layers.scala 132:13]
  wire [4:0] _GEN_1223 = 5'h7 == _T_350 ? 5'h2 : _GEN_1222; // @[layers.scala 132:13]
  wire [4:0] _GEN_1224 = 5'h8 == _T_350 ? 5'h1b : _GEN_1223; // @[layers.scala 132:13]
  wire [4:0] _GEN_1225 = 5'h9 == _T_350 ? 5'h5 : _GEN_1224; // @[layers.scala 132:13]
  wire [4:0] _GEN_1226 = 5'ha == _T_350 ? 5'h8 : _GEN_1225; // @[layers.scala 132:13]
  wire [4:0] _GEN_1227 = 5'hb == _T_350 ? 5'h12 : _GEN_1226; // @[layers.scala 132:13]
  wire [4:0] _GEN_1228 = 5'hc == _T_350 ? 5'h1d : _GEN_1227; // @[layers.scala 132:13]
  wire [4:0] _GEN_1229 = 5'hd == _T_350 ? 5'h3 : _GEN_1228; // @[layers.scala 132:13]
  wire [4:0] _GEN_1230 = 5'he == _T_350 ? 5'h6 : _GEN_1229; // @[layers.scala 132:13]
  wire [4:0] _GEN_1231 = 5'hf == _T_350 ? 5'h1c : _GEN_1230; // @[layers.scala 132:13]
  wire [4:0] _GEN_1232 = 5'h10 == _T_350 ? 5'h1e : _GEN_1231; // @[layers.scala 132:13]
  wire [4:0] _GEN_1233 = 5'h11 == _T_350 ? 5'h13 : _GEN_1232; // @[layers.scala 132:13]
  wire [4:0] _GEN_1234 = 5'h12 == _T_350 ? 5'h7 : _GEN_1233; // @[layers.scala 132:13]
  wire [4:0] _GEN_1235 = 5'h13 == _T_350 ? 5'he : _GEN_1234; // @[layers.scala 132:13]
  wire [4:0] _GEN_1236 = 5'h14 == _T_350 ? 5'h0 : _GEN_1235; // @[layers.scala 132:13]
  wire [4:0] _GEN_1237 = 5'h15 == _T_350 ? 5'hd : _GEN_1236; // @[layers.scala 132:13]
  wire [4:0] _GEN_1238 = 5'h16 == _T_350 ? 5'h11 : _GEN_1237; // @[layers.scala 132:13]
  wire [4:0] _GEN_1239 = 5'h17 == _T_350 ? 5'h18 : _GEN_1238; // @[layers.scala 132:13]
  wire [4:0] _GEN_1240 = 5'h18 == _T_350 ? 5'h10 : _GEN_1239; // @[layers.scala 132:13]
  wire [4:0] _GEN_1241 = 5'h19 == _T_350 ? 5'hc : _GEN_1240; // @[layers.scala 132:13]
  wire [4:0] _GEN_1242 = 5'h1a == _T_350 ? 5'h1 : _GEN_1241; // @[layers.scala 132:13]
  wire [4:0] _GEN_1243 = 5'h1b == _T_350 ? 5'h19 : _GEN_1242; // @[layers.scala 132:13]
  wire [4:0] _GEN_1244 = 5'h1c == _T_350 ? 5'h16 : _GEN_1243; // @[layers.scala 132:13]
  wire [4:0] _GEN_1245 = 5'h1d == _T_350 ? 5'ha : _GEN_1244; // @[layers.scala 132:13]
  wire [4:0] _GEN_1246 = 5'h1e == _T_350 ? 5'hf : _GEN_1245; // @[layers.scala 132:13]
  wire [4:0] temp_38 = 5'h1f == _T_350 ? 5'h17 : _GEN_1246; // @[layers.scala 132:13]
  wire [4:0] _T_359 = {io_x_in_0[39],io_x_in_1[39],io_x_in_2[39],io_x_in_3[39],io_x_in_4[39]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1249 = 5'h1 == _T_359 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1250 = 5'h2 == _T_359 ? 5'h1f : _GEN_1249; // @[layers.scala 132:13]
  wire [4:0] _GEN_1251 = 5'h3 == _T_359 ? 5'h14 : _GEN_1250; // @[layers.scala 132:13]
  wire [4:0] _GEN_1252 = 5'h4 == _T_359 ? 5'h1a : _GEN_1251; // @[layers.scala 132:13]
  wire [4:0] _GEN_1253 = 5'h5 == _T_359 ? 5'h15 : _GEN_1252; // @[layers.scala 132:13]
  wire [4:0] _GEN_1254 = 5'h6 == _T_359 ? 5'h9 : _GEN_1253; // @[layers.scala 132:13]
  wire [4:0] _GEN_1255 = 5'h7 == _T_359 ? 5'h2 : _GEN_1254; // @[layers.scala 132:13]
  wire [4:0] _GEN_1256 = 5'h8 == _T_359 ? 5'h1b : _GEN_1255; // @[layers.scala 132:13]
  wire [4:0] _GEN_1257 = 5'h9 == _T_359 ? 5'h5 : _GEN_1256; // @[layers.scala 132:13]
  wire [4:0] _GEN_1258 = 5'ha == _T_359 ? 5'h8 : _GEN_1257; // @[layers.scala 132:13]
  wire [4:0] _GEN_1259 = 5'hb == _T_359 ? 5'h12 : _GEN_1258; // @[layers.scala 132:13]
  wire [4:0] _GEN_1260 = 5'hc == _T_359 ? 5'h1d : _GEN_1259; // @[layers.scala 132:13]
  wire [4:0] _GEN_1261 = 5'hd == _T_359 ? 5'h3 : _GEN_1260; // @[layers.scala 132:13]
  wire [4:0] _GEN_1262 = 5'he == _T_359 ? 5'h6 : _GEN_1261; // @[layers.scala 132:13]
  wire [4:0] _GEN_1263 = 5'hf == _T_359 ? 5'h1c : _GEN_1262; // @[layers.scala 132:13]
  wire [4:0] _GEN_1264 = 5'h10 == _T_359 ? 5'h1e : _GEN_1263; // @[layers.scala 132:13]
  wire [4:0] _GEN_1265 = 5'h11 == _T_359 ? 5'h13 : _GEN_1264; // @[layers.scala 132:13]
  wire [4:0] _GEN_1266 = 5'h12 == _T_359 ? 5'h7 : _GEN_1265; // @[layers.scala 132:13]
  wire [4:0] _GEN_1267 = 5'h13 == _T_359 ? 5'he : _GEN_1266; // @[layers.scala 132:13]
  wire [4:0] _GEN_1268 = 5'h14 == _T_359 ? 5'h0 : _GEN_1267; // @[layers.scala 132:13]
  wire [4:0] _GEN_1269 = 5'h15 == _T_359 ? 5'hd : _GEN_1268; // @[layers.scala 132:13]
  wire [4:0] _GEN_1270 = 5'h16 == _T_359 ? 5'h11 : _GEN_1269; // @[layers.scala 132:13]
  wire [4:0] _GEN_1271 = 5'h17 == _T_359 ? 5'h18 : _GEN_1270; // @[layers.scala 132:13]
  wire [4:0] _GEN_1272 = 5'h18 == _T_359 ? 5'h10 : _GEN_1271; // @[layers.scala 132:13]
  wire [4:0] _GEN_1273 = 5'h19 == _T_359 ? 5'hc : _GEN_1272; // @[layers.scala 132:13]
  wire [4:0] _GEN_1274 = 5'h1a == _T_359 ? 5'h1 : _GEN_1273; // @[layers.scala 132:13]
  wire [4:0] _GEN_1275 = 5'h1b == _T_359 ? 5'h19 : _GEN_1274; // @[layers.scala 132:13]
  wire [4:0] _GEN_1276 = 5'h1c == _T_359 ? 5'h16 : _GEN_1275; // @[layers.scala 132:13]
  wire [4:0] _GEN_1277 = 5'h1d == _T_359 ? 5'ha : _GEN_1276; // @[layers.scala 132:13]
  wire [4:0] _GEN_1278 = 5'h1e == _T_359 ? 5'hf : _GEN_1277; // @[layers.scala 132:13]
  wire [4:0] temp_39 = 5'h1f == _T_359 ? 5'h17 : _GEN_1278; // @[layers.scala 132:13]
  wire [4:0] _T_368 = {io_x_in_0[40],io_x_in_1[40],io_x_in_2[40],io_x_in_3[40],io_x_in_4[40]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1281 = 5'h1 == _T_368 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1282 = 5'h2 == _T_368 ? 5'h1f : _GEN_1281; // @[layers.scala 132:13]
  wire [4:0] _GEN_1283 = 5'h3 == _T_368 ? 5'h14 : _GEN_1282; // @[layers.scala 132:13]
  wire [4:0] _GEN_1284 = 5'h4 == _T_368 ? 5'h1a : _GEN_1283; // @[layers.scala 132:13]
  wire [4:0] _GEN_1285 = 5'h5 == _T_368 ? 5'h15 : _GEN_1284; // @[layers.scala 132:13]
  wire [4:0] _GEN_1286 = 5'h6 == _T_368 ? 5'h9 : _GEN_1285; // @[layers.scala 132:13]
  wire [4:0] _GEN_1287 = 5'h7 == _T_368 ? 5'h2 : _GEN_1286; // @[layers.scala 132:13]
  wire [4:0] _GEN_1288 = 5'h8 == _T_368 ? 5'h1b : _GEN_1287; // @[layers.scala 132:13]
  wire [4:0] _GEN_1289 = 5'h9 == _T_368 ? 5'h5 : _GEN_1288; // @[layers.scala 132:13]
  wire [4:0] _GEN_1290 = 5'ha == _T_368 ? 5'h8 : _GEN_1289; // @[layers.scala 132:13]
  wire [4:0] _GEN_1291 = 5'hb == _T_368 ? 5'h12 : _GEN_1290; // @[layers.scala 132:13]
  wire [4:0] _GEN_1292 = 5'hc == _T_368 ? 5'h1d : _GEN_1291; // @[layers.scala 132:13]
  wire [4:0] _GEN_1293 = 5'hd == _T_368 ? 5'h3 : _GEN_1292; // @[layers.scala 132:13]
  wire [4:0] _GEN_1294 = 5'he == _T_368 ? 5'h6 : _GEN_1293; // @[layers.scala 132:13]
  wire [4:0] _GEN_1295 = 5'hf == _T_368 ? 5'h1c : _GEN_1294; // @[layers.scala 132:13]
  wire [4:0] _GEN_1296 = 5'h10 == _T_368 ? 5'h1e : _GEN_1295; // @[layers.scala 132:13]
  wire [4:0] _GEN_1297 = 5'h11 == _T_368 ? 5'h13 : _GEN_1296; // @[layers.scala 132:13]
  wire [4:0] _GEN_1298 = 5'h12 == _T_368 ? 5'h7 : _GEN_1297; // @[layers.scala 132:13]
  wire [4:0] _GEN_1299 = 5'h13 == _T_368 ? 5'he : _GEN_1298; // @[layers.scala 132:13]
  wire [4:0] _GEN_1300 = 5'h14 == _T_368 ? 5'h0 : _GEN_1299; // @[layers.scala 132:13]
  wire [4:0] _GEN_1301 = 5'h15 == _T_368 ? 5'hd : _GEN_1300; // @[layers.scala 132:13]
  wire [4:0] _GEN_1302 = 5'h16 == _T_368 ? 5'h11 : _GEN_1301; // @[layers.scala 132:13]
  wire [4:0] _GEN_1303 = 5'h17 == _T_368 ? 5'h18 : _GEN_1302; // @[layers.scala 132:13]
  wire [4:0] _GEN_1304 = 5'h18 == _T_368 ? 5'h10 : _GEN_1303; // @[layers.scala 132:13]
  wire [4:0] _GEN_1305 = 5'h19 == _T_368 ? 5'hc : _GEN_1304; // @[layers.scala 132:13]
  wire [4:0] _GEN_1306 = 5'h1a == _T_368 ? 5'h1 : _GEN_1305; // @[layers.scala 132:13]
  wire [4:0] _GEN_1307 = 5'h1b == _T_368 ? 5'h19 : _GEN_1306; // @[layers.scala 132:13]
  wire [4:0] _GEN_1308 = 5'h1c == _T_368 ? 5'h16 : _GEN_1307; // @[layers.scala 132:13]
  wire [4:0] _GEN_1309 = 5'h1d == _T_368 ? 5'ha : _GEN_1308; // @[layers.scala 132:13]
  wire [4:0] _GEN_1310 = 5'h1e == _T_368 ? 5'hf : _GEN_1309; // @[layers.scala 132:13]
  wire [4:0] temp_40 = 5'h1f == _T_368 ? 5'h17 : _GEN_1310; // @[layers.scala 132:13]
  wire [4:0] _T_377 = {io_x_in_0[41],io_x_in_1[41],io_x_in_2[41],io_x_in_3[41],io_x_in_4[41]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1313 = 5'h1 == _T_377 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1314 = 5'h2 == _T_377 ? 5'h1f : _GEN_1313; // @[layers.scala 132:13]
  wire [4:0] _GEN_1315 = 5'h3 == _T_377 ? 5'h14 : _GEN_1314; // @[layers.scala 132:13]
  wire [4:0] _GEN_1316 = 5'h4 == _T_377 ? 5'h1a : _GEN_1315; // @[layers.scala 132:13]
  wire [4:0] _GEN_1317 = 5'h5 == _T_377 ? 5'h15 : _GEN_1316; // @[layers.scala 132:13]
  wire [4:0] _GEN_1318 = 5'h6 == _T_377 ? 5'h9 : _GEN_1317; // @[layers.scala 132:13]
  wire [4:0] _GEN_1319 = 5'h7 == _T_377 ? 5'h2 : _GEN_1318; // @[layers.scala 132:13]
  wire [4:0] _GEN_1320 = 5'h8 == _T_377 ? 5'h1b : _GEN_1319; // @[layers.scala 132:13]
  wire [4:0] _GEN_1321 = 5'h9 == _T_377 ? 5'h5 : _GEN_1320; // @[layers.scala 132:13]
  wire [4:0] _GEN_1322 = 5'ha == _T_377 ? 5'h8 : _GEN_1321; // @[layers.scala 132:13]
  wire [4:0] _GEN_1323 = 5'hb == _T_377 ? 5'h12 : _GEN_1322; // @[layers.scala 132:13]
  wire [4:0] _GEN_1324 = 5'hc == _T_377 ? 5'h1d : _GEN_1323; // @[layers.scala 132:13]
  wire [4:0] _GEN_1325 = 5'hd == _T_377 ? 5'h3 : _GEN_1324; // @[layers.scala 132:13]
  wire [4:0] _GEN_1326 = 5'he == _T_377 ? 5'h6 : _GEN_1325; // @[layers.scala 132:13]
  wire [4:0] _GEN_1327 = 5'hf == _T_377 ? 5'h1c : _GEN_1326; // @[layers.scala 132:13]
  wire [4:0] _GEN_1328 = 5'h10 == _T_377 ? 5'h1e : _GEN_1327; // @[layers.scala 132:13]
  wire [4:0] _GEN_1329 = 5'h11 == _T_377 ? 5'h13 : _GEN_1328; // @[layers.scala 132:13]
  wire [4:0] _GEN_1330 = 5'h12 == _T_377 ? 5'h7 : _GEN_1329; // @[layers.scala 132:13]
  wire [4:0] _GEN_1331 = 5'h13 == _T_377 ? 5'he : _GEN_1330; // @[layers.scala 132:13]
  wire [4:0] _GEN_1332 = 5'h14 == _T_377 ? 5'h0 : _GEN_1331; // @[layers.scala 132:13]
  wire [4:0] _GEN_1333 = 5'h15 == _T_377 ? 5'hd : _GEN_1332; // @[layers.scala 132:13]
  wire [4:0] _GEN_1334 = 5'h16 == _T_377 ? 5'h11 : _GEN_1333; // @[layers.scala 132:13]
  wire [4:0] _GEN_1335 = 5'h17 == _T_377 ? 5'h18 : _GEN_1334; // @[layers.scala 132:13]
  wire [4:0] _GEN_1336 = 5'h18 == _T_377 ? 5'h10 : _GEN_1335; // @[layers.scala 132:13]
  wire [4:0] _GEN_1337 = 5'h19 == _T_377 ? 5'hc : _GEN_1336; // @[layers.scala 132:13]
  wire [4:0] _GEN_1338 = 5'h1a == _T_377 ? 5'h1 : _GEN_1337; // @[layers.scala 132:13]
  wire [4:0] _GEN_1339 = 5'h1b == _T_377 ? 5'h19 : _GEN_1338; // @[layers.scala 132:13]
  wire [4:0] _GEN_1340 = 5'h1c == _T_377 ? 5'h16 : _GEN_1339; // @[layers.scala 132:13]
  wire [4:0] _GEN_1341 = 5'h1d == _T_377 ? 5'ha : _GEN_1340; // @[layers.scala 132:13]
  wire [4:0] _GEN_1342 = 5'h1e == _T_377 ? 5'hf : _GEN_1341; // @[layers.scala 132:13]
  wire [4:0] temp_41 = 5'h1f == _T_377 ? 5'h17 : _GEN_1342; // @[layers.scala 132:13]
  wire [4:0] _T_386 = {io_x_in_0[42],io_x_in_1[42],io_x_in_2[42],io_x_in_3[42],io_x_in_4[42]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1345 = 5'h1 == _T_386 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1346 = 5'h2 == _T_386 ? 5'h1f : _GEN_1345; // @[layers.scala 132:13]
  wire [4:0] _GEN_1347 = 5'h3 == _T_386 ? 5'h14 : _GEN_1346; // @[layers.scala 132:13]
  wire [4:0] _GEN_1348 = 5'h4 == _T_386 ? 5'h1a : _GEN_1347; // @[layers.scala 132:13]
  wire [4:0] _GEN_1349 = 5'h5 == _T_386 ? 5'h15 : _GEN_1348; // @[layers.scala 132:13]
  wire [4:0] _GEN_1350 = 5'h6 == _T_386 ? 5'h9 : _GEN_1349; // @[layers.scala 132:13]
  wire [4:0] _GEN_1351 = 5'h7 == _T_386 ? 5'h2 : _GEN_1350; // @[layers.scala 132:13]
  wire [4:0] _GEN_1352 = 5'h8 == _T_386 ? 5'h1b : _GEN_1351; // @[layers.scala 132:13]
  wire [4:0] _GEN_1353 = 5'h9 == _T_386 ? 5'h5 : _GEN_1352; // @[layers.scala 132:13]
  wire [4:0] _GEN_1354 = 5'ha == _T_386 ? 5'h8 : _GEN_1353; // @[layers.scala 132:13]
  wire [4:0] _GEN_1355 = 5'hb == _T_386 ? 5'h12 : _GEN_1354; // @[layers.scala 132:13]
  wire [4:0] _GEN_1356 = 5'hc == _T_386 ? 5'h1d : _GEN_1355; // @[layers.scala 132:13]
  wire [4:0] _GEN_1357 = 5'hd == _T_386 ? 5'h3 : _GEN_1356; // @[layers.scala 132:13]
  wire [4:0] _GEN_1358 = 5'he == _T_386 ? 5'h6 : _GEN_1357; // @[layers.scala 132:13]
  wire [4:0] _GEN_1359 = 5'hf == _T_386 ? 5'h1c : _GEN_1358; // @[layers.scala 132:13]
  wire [4:0] _GEN_1360 = 5'h10 == _T_386 ? 5'h1e : _GEN_1359; // @[layers.scala 132:13]
  wire [4:0] _GEN_1361 = 5'h11 == _T_386 ? 5'h13 : _GEN_1360; // @[layers.scala 132:13]
  wire [4:0] _GEN_1362 = 5'h12 == _T_386 ? 5'h7 : _GEN_1361; // @[layers.scala 132:13]
  wire [4:0] _GEN_1363 = 5'h13 == _T_386 ? 5'he : _GEN_1362; // @[layers.scala 132:13]
  wire [4:0] _GEN_1364 = 5'h14 == _T_386 ? 5'h0 : _GEN_1363; // @[layers.scala 132:13]
  wire [4:0] _GEN_1365 = 5'h15 == _T_386 ? 5'hd : _GEN_1364; // @[layers.scala 132:13]
  wire [4:0] _GEN_1366 = 5'h16 == _T_386 ? 5'h11 : _GEN_1365; // @[layers.scala 132:13]
  wire [4:0] _GEN_1367 = 5'h17 == _T_386 ? 5'h18 : _GEN_1366; // @[layers.scala 132:13]
  wire [4:0] _GEN_1368 = 5'h18 == _T_386 ? 5'h10 : _GEN_1367; // @[layers.scala 132:13]
  wire [4:0] _GEN_1369 = 5'h19 == _T_386 ? 5'hc : _GEN_1368; // @[layers.scala 132:13]
  wire [4:0] _GEN_1370 = 5'h1a == _T_386 ? 5'h1 : _GEN_1369; // @[layers.scala 132:13]
  wire [4:0] _GEN_1371 = 5'h1b == _T_386 ? 5'h19 : _GEN_1370; // @[layers.scala 132:13]
  wire [4:0] _GEN_1372 = 5'h1c == _T_386 ? 5'h16 : _GEN_1371; // @[layers.scala 132:13]
  wire [4:0] _GEN_1373 = 5'h1d == _T_386 ? 5'ha : _GEN_1372; // @[layers.scala 132:13]
  wire [4:0] _GEN_1374 = 5'h1e == _T_386 ? 5'hf : _GEN_1373; // @[layers.scala 132:13]
  wire [4:0] temp_42 = 5'h1f == _T_386 ? 5'h17 : _GEN_1374; // @[layers.scala 132:13]
  wire [4:0] _T_395 = {io_x_in_0[43],io_x_in_1[43],io_x_in_2[43],io_x_in_3[43],io_x_in_4[43]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1377 = 5'h1 == _T_395 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1378 = 5'h2 == _T_395 ? 5'h1f : _GEN_1377; // @[layers.scala 132:13]
  wire [4:0] _GEN_1379 = 5'h3 == _T_395 ? 5'h14 : _GEN_1378; // @[layers.scala 132:13]
  wire [4:0] _GEN_1380 = 5'h4 == _T_395 ? 5'h1a : _GEN_1379; // @[layers.scala 132:13]
  wire [4:0] _GEN_1381 = 5'h5 == _T_395 ? 5'h15 : _GEN_1380; // @[layers.scala 132:13]
  wire [4:0] _GEN_1382 = 5'h6 == _T_395 ? 5'h9 : _GEN_1381; // @[layers.scala 132:13]
  wire [4:0] _GEN_1383 = 5'h7 == _T_395 ? 5'h2 : _GEN_1382; // @[layers.scala 132:13]
  wire [4:0] _GEN_1384 = 5'h8 == _T_395 ? 5'h1b : _GEN_1383; // @[layers.scala 132:13]
  wire [4:0] _GEN_1385 = 5'h9 == _T_395 ? 5'h5 : _GEN_1384; // @[layers.scala 132:13]
  wire [4:0] _GEN_1386 = 5'ha == _T_395 ? 5'h8 : _GEN_1385; // @[layers.scala 132:13]
  wire [4:0] _GEN_1387 = 5'hb == _T_395 ? 5'h12 : _GEN_1386; // @[layers.scala 132:13]
  wire [4:0] _GEN_1388 = 5'hc == _T_395 ? 5'h1d : _GEN_1387; // @[layers.scala 132:13]
  wire [4:0] _GEN_1389 = 5'hd == _T_395 ? 5'h3 : _GEN_1388; // @[layers.scala 132:13]
  wire [4:0] _GEN_1390 = 5'he == _T_395 ? 5'h6 : _GEN_1389; // @[layers.scala 132:13]
  wire [4:0] _GEN_1391 = 5'hf == _T_395 ? 5'h1c : _GEN_1390; // @[layers.scala 132:13]
  wire [4:0] _GEN_1392 = 5'h10 == _T_395 ? 5'h1e : _GEN_1391; // @[layers.scala 132:13]
  wire [4:0] _GEN_1393 = 5'h11 == _T_395 ? 5'h13 : _GEN_1392; // @[layers.scala 132:13]
  wire [4:0] _GEN_1394 = 5'h12 == _T_395 ? 5'h7 : _GEN_1393; // @[layers.scala 132:13]
  wire [4:0] _GEN_1395 = 5'h13 == _T_395 ? 5'he : _GEN_1394; // @[layers.scala 132:13]
  wire [4:0] _GEN_1396 = 5'h14 == _T_395 ? 5'h0 : _GEN_1395; // @[layers.scala 132:13]
  wire [4:0] _GEN_1397 = 5'h15 == _T_395 ? 5'hd : _GEN_1396; // @[layers.scala 132:13]
  wire [4:0] _GEN_1398 = 5'h16 == _T_395 ? 5'h11 : _GEN_1397; // @[layers.scala 132:13]
  wire [4:0] _GEN_1399 = 5'h17 == _T_395 ? 5'h18 : _GEN_1398; // @[layers.scala 132:13]
  wire [4:0] _GEN_1400 = 5'h18 == _T_395 ? 5'h10 : _GEN_1399; // @[layers.scala 132:13]
  wire [4:0] _GEN_1401 = 5'h19 == _T_395 ? 5'hc : _GEN_1400; // @[layers.scala 132:13]
  wire [4:0] _GEN_1402 = 5'h1a == _T_395 ? 5'h1 : _GEN_1401; // @[layers.scala 132:13]
  wire [4:0] _GEN_1403 = 5'h1b == _T_395 ? 5'h19 : _GEN_1402; // @[layers.scala 132:13]
  wire [4:0] _GEN_1404 = 5'h1c == _T_395 ? 5'h16 : _GEN_1403; // @[layers.scala 132:13]
  wire [4:0] _GEN_1405 = 5'h1d == _T_395 ? 5'ha : _GEN_1404; // @[layers.scala 132:13]
  wire [4:0] _GEN_1406 = 5'h1e == _T_395 ? 5'hf : _GEN_1405; // @[layers.scala 132:13]
  wire [4:0] temp_43 = 5'h1f == _T_395 ? 5'h17 : _GEN_1406; // @[layers.scala 132:13]
  wire [4:0] _T_404 = {io_x_in_0[44],io_x_in_1[44],io_x_in_2[44],io_x_in_3[44],io_x_in_4[44]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1409 = 5'h1 == _T_404 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1410 = 5'h2 == _T_404 ? 5'h1f : _GEN_1409; // @[layers.scala 132:13]
  wire [4:0] _GEN_1411 = 5'h3 == _T_404 ? 5'h14 : _GEN_1410; // @[layers.scala 132:13]
  wire [4:0] _GEN_1412 = 5'h4 == _T_404 ? 5'h1a : _GEN_1411; // @[layers.scala 132:13]
  wire [4:0] _GEN_1413 = 5'h5 == _T_404 ? 5'h15 : _GEN_1412; // @[layers.scala 132:13]
  wire [4:0] _GEN_1414 = 5'h6 == _T_404 ? 5'h9 : _GEN_1413; // @[layers.scala 132:13]
  wire [4:0] _GEN_1415 = 5'h7 == _T_404 ? 5'h2 : _GEN_1414; // @[layers.scala 132:13]
  wire [4:0] _GEN_1416 = 5'h8 == _T_404 ? 5'h1b : _GEN_1415; // @[layers.scala 132:13]
  wire [4:0] _GEN_1417 = 5'h9 == _T_404 ? 5'h5 : _GEN_1416; // @[layers.scala 132:13]
  wire [4:0] _GEN_1418 = 5'ha == _T_404 ? 5'h8 : _GEN_1417; // @[layers.scala 132:13]
  wire [4:0] _GEN_1419 = 5'hb == _T_404 ? 5'h12 : _GEN_1418; // @[layers.scala 132:13]
  wire [4:0] _GEN_1420 = 5'hc == _T_404 ? 5'h1d : _GEN_1419; // @[layers.scala 132:13]
  wire [4:0] _GEN_1421 = 5'hd == _T_404 ? 5'h3 : _GEN_1420; // @[layers.scala 132:13]
  wire [4:0] _GEN_1422 = 5'he == _T_404 ? 5'h6 : _GEN_1421; // @[layers.scala 132:13]
  wire [4:0] _GEN_1423 = 5'hf == _T_404 ? 5'h1c : _GEN_1422; // @[layers.scala 132:13]
  wire [4:0] _GEN_1424 = 5'h10 == _T_404 ? 5'h1e : _GEN_1423; // @[layers.scala 132:13]
  wire [4:0] _GEN_1425 = 5'h11 == _T_404 ? 5'h13 : _GEN_1424; // @[layers.scala 132:13]
  wire [4:0] _GEN_1426 = 5'h12 == _T_404 ? 5'h7 : _GEN_1425; // @[layers.scala 132:13]
  wire [4:0] _GEN_1427 = 5'h13 == _T_404 ? 5'he : _GEN_1426; // @[layers.scala 132:13]
  wire [4:0] _GEN_1428 = 5'h14 == _T_404 ? 5'h0 : _GEN_1427; // @[layers.scala 132:13]
  wire [4:0] _GEN_1429 = 5'h15 == _T_404 ? 5'hd : _GEN_1428; // @[layers.scala 132:13]
  wire [4:0] _GEN_1430 = 5'h16 == _T_404 ? 5'h11 : _GEN_1429; // @[layers.scala 132:13]
  wire [4:0] _GEN_1431 = 5'h17 == _T_404 ? 5'h18 : _GEN_1430; // @[layers.scala 132:13]
  wire [4:0] _GEN_1432 = 5'h18 == _T_404 ? 5'h10 : _GEN_1431; // @[layers.scala 132:13]
  wire [4:0] _GEN_1433 = 5'h19 == _T_404 ? 5'hc : _GEN_1432; // @[layers.scala 132:13]
  wire [4:0] _GEN_1434 = 5'h1a == _T_404 ? 5'h1 : _GEN_1433; // @[layers.scala 132:13]
  wire [4:0] _GEN_1435 = 5'h1b == _T_404 ? 5'h19 : _GEN_1434; // @[layers.scala 132:13]
  wire [4:0] _GEN_1436 = 5'h1c == _T_404 ? 5'h16 : _GEN_1435; // @[layers.scala 132:13]
  wire [4:0] _GEN_1437 = 5'h1d == _T_404 ? 5'ha : _GEN_1436; // @[layers.scala 132:13]
  wire [4:0] _GEN_1438 = 5'h1e == _T_404 ? 5'hf : _GEN_1437; // @[layers.scala 132:13]
  wire [4:0] temp_44 = 5'h1f == _T_404 ? 5'h17 : _GEN_1438; // @[layers.scala 132:13]
  wire [4:0] _T_413 = {io_x_in_0[45],io_x_in_1[45],io_x_in_2[45],io_x_in_3[45],io_x_in_4[45]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1441 = 5'h1 == _T_413 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1442 = 5'h2 == _T_413 ? 5'h1f : _GEN_1441; // @[layers.scala 132:13]
  wire [4:0] _GEN_1443 = 5'h3 == _T_413 ? 5'h14 : _GEN_1442; // @[layers.scala 132:13]
  wire [4:0] _GEN_1444 = 5'h4 == _T_413 ? 5'h1a : _GEN_1443; // @[layers.scala 132:13]
  wire [4:0] _GEN_1445 = 5'h5 == _T_413 ? 5'h15 : _GEN_1444; // @[layers.scala 132:13]
  wire [4:0] _GEN_1446 = 5'h6 == _T_413 ? 5'h9 : _GEN_1445; // @[layers.scala 132:13]
  wire [4:0] _GEN_1447 = 5'h7 == _T_413 ? 5'h2 : _GEN_1446; // @[layers.scala 132:13]
  wire [4:0] _GEN_1448 = 5'h8 == _T_413 ? 5'h1b : _GEN_1447; // @[layers.scala 132:13]
  wire [4:0] _GEN_1449 = 5'h9 == _T_413 ? 5'h5 : _GEN_1448; // @[layers.scala 132:13]
  wire [4:0] _GEN_1450 = 5'ha == _T_413 ? 5'h8 : _GEN_1449; // @[layers.scala 132:13]
  wire [4:0] _GEN_1451 = 5'hb == _T_413 ? 5'h12 : _GEN_1450; // @[layers.scala 132:13]
  wire [4:0] _GEN_1452 = 5'hc == _T_413 ? 5'h1d : _GEN_1451; // @[layers.scala 132:13]
  wire [4:0] _GEN_1453 = 5'hd == _T_413 ? 5'h3 : _GEN_1452; // @[layers.scala 132:13]
  wire [4:0] _GEN_1454 = 5'he == _T_413 ? 5'h6 : _GEN_1453; // @[layers.scala 132:13]
  wire [4:0] _GEN_1455 = 5'hf == _T_413 ? 5'h1c : _GEN_1454; // @[layers.scala 132:13]
  wire [4:0] _GEN_1456 = 5'h10 == _T_413 ? 5'h1e : _GEN_1455; // @[layers.scala 132:13]
  wire [4:0] _GEN_1457 = 5'h11 == _T_413 ? 5'h13 : _GEN_1456; // @[layers.scala 132:13]
  wire [4:0] _GEN_1458 = 5'h12 == _T_413 ? 5'h7 : _GEN_1457; // @[layers.scala 132:13]
  wire [4:0] _GEN_1459 = 5'h13 == _T_413 ? 5'he : _GEN_1458; // @[layers.scala 132:13]
  wire [4:0] _GEN_1460 = 5'h14 == _T_413 ? 5'h0 : _GEN_1459; // @[layers.scala 132:13]
  wire [4:0] _GEN_1461 = 5'h15 == _T_413 ? 5'hd : _GEN_1460; // @[layers.scala 132:13]
  wire [4:0] _GEN_1462 = 5'h16 == _T_413 ? 5'h11 : _GEN_1461; // @[layers.scala 132:13]
  wire [4:0] _GEN_1463 = 5'h17 == _T_413 ? 5'h18 : _GEN_1462; // @[layers.scala 132:13]
  wire [4:0] _GEN_1464 = 5'h18 == _T_413 ? 5'h10 : _GEN_1463; // @[layers.scala 132:13]
  wire [4:0] _GEN_1465 = 5'h19 == _T_413 ? 5'hc : _GEN_1464; // @[layers.scala 132:13]
  wire [4:0] _GEN_1466 = 5'h1a == _T_413 ? 5'h1 : _GEN_1465; // @[layers.scala 132:13]
  wire [4:0] _GEN_1467 = 5'h1b == _T_413 ? 5'h19 : _GEN_1466; // @[layers.scala 132:13]
  wire [4:0] _GEN_1468 = 5'h1c == _T_413 ? 5'h16 : _GEN_1467; // @[layers.scala 132:13]
  wire [4:0] _GEN_1469 = 5'h1d == _T_413 ? 5'ha : _GEN_1468; // @[layers.scala 132:13]
  wire [4:0] _GEN_1470 = 5'h1e == _T_413 ? 5'hf : _GEN_1469; // @[layers.scala 132:13]
  wire [4:0] temp_45 = 5'h1f == _T_413 ? 5'h17 : _GEN_1470; // @[layers.scala 132:13]
  wire [4:0] _T_422 = {io_x_in_0[46],io_x_in_1[46],io_x_in_2[46],io_x_in_3[46],io_x_in_4[46]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1473 = 5'h1 == _T_422 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1474 = 5'h2 == _T_422 ? 5'h1f : _GEN_1473; // @[layers.scala 132:13]
  wire [4:0] _GEN_1475 = 5'h3 == _T_422 ? 5'h14 : _GEN_1474; // @[layers.scala 132:13]
  wire [4:0] _GEN_1476 = 5'h4 == _T_422 ? 5'h1a : _GEN_1475; // @[layers.scala 132:13]
  wire [4:0] _GEN_1477 = 5'h5 == _T_422 ? 5'h15 : _GEN_1476; // @[layers.scala 132:13]
  wire [4:0] _GEN_1478 = 5'h6 == _T_422 ? 5'h9 : _GEN_1477; // @[layers.scala 132:13]
  wire [4:0] _GEN_1479 = 5'h7 == _T_422 ? 5'h2 : _GEN_1478; // @[layers.scala 132:13]
  wire [4:0] _GEN_1480 = 5'h8 == _T_422 ? 5'h1b : _GEN_1479; // @[layers.scala 132:13]
  wire [4:0] _GEN_1481 = 5'h9 == _T_422 ? 5'h5 : _GEN_1480; // @[layers.scala 132:13]
  wire [4:0] _GEN_1482 = 5'ha == _T_422 ? 5'h8 : _GEN_1481; // @[layers.scala 132:13]
  wire [4:0] _GEN_1483 = 5'hb == _T_422 ? 5'h12 : _GEN_1482; // @[layers.scala 132:13]
  wire [4:0] _GEN_1484 = 5'hc == _T_422 ? 5'h1d : _GEN_1483; // @[layers.scala 132:13]
  wire [4:0] _GEN_1485 = 5'hd == _T_422 ? 5'h3 : _GEN_1484; // @[layers.scala 132:13]
  wire [4:0] _GEN_1486 = 5'he == _T_422 ? 5'h6 : _GEN_1485; // @[layers.scala 132:13]
  wire [4:0] _GEN_1487 = 5'hf == _T_422 ? 5'h1c : _GEN_1486; // @[layers.scala 132:13]
  wire [4:0] _GEN_1488 = 5'h10 == _T_422 ? 5'h1e : _GEN_1487; // @[layers.scala 132:13]
  wire [4:0] _GEN_1489 = 5'h11 == _T_422 ? 5'h13 : _GEN_1488; // @[layers.scala 132:13]
  wire [4:0] _GEN_1490 = 5'h12 == _T_422 ? 5'h7 : _GEN_1489; // @[layers.scala 132:13]
  wire [4:0] _GEN_1491 = 5'h13 == _T_422 ? 5'he : _GEN_1490; // @[layers.scala 132:13]
  wire [4:0] _GEN_1492 = 5'h14 == _T_422 ? 5'h0 : _GEN_1491; // @[layers.scala 132:13]
  wire [4:0] _GEN_1493 = 5'h15 == _T_422 ? 5'hd : _GEN_1492; // @[layers.scala 132:13]
  wire [4:0] _GEN_1494 = 5'h16 == _T_422 ? 5'h11 : _GEN_1493; // @[layers.scala 132:13]
  wire [4:0] _GEN_1495 = 5'h17 == _T_422 ? 5'h18 : _GEN_1494; // @[layers.scala 132:13]
  wire [4:0] _GEN_1496 = 5'h18 == _T_422 ? 5'h10 : _GEN_1495; // @[layers.scala 132:13]
  wire [4:0] _GEN_1497 = 5'h19 == _T_422 ? 5'hc : _GEN_1496; // @[layers.scala 132:13]
  wire [4:0] _GEN_1498 = 5'h1a == _T_422 ? 5'h1 : _GEN_1497; // @[layers.scala 132:13]
  wire [4:0] _GEN_1499 = 5'h1b == _T_422 ? 5'h19 : _GEN_1498; // @[layers.scala 132:13]
  wire [4:0] _GEN_1500 = 5'h1c == _T_422 ? 5'h16 : _GEN_1499; // @[layers.scala 132:13]
  wire [4:0] _GEN_1501 = 5'h1d == _T_422 ? 5'ha : _GEN_1500; // @[layers.scala 132:13]
  wire [4:0] _GEN_1502 = 5'h1e == _T_422 ? 5'hf : _GEN_1501; // @[layers.scala 132:13]
  wire [4:0] temp_46 = 5'h1f == _T_422 ? 5'h17 : _GEN_1502; // @[layers.scala 132:13]
  wire [4:0] _T_431 = {io_x_in_0[47],io_x_in_1[47],io_x_in_2[47],io_x_in_3[47],io_x_in_4[47]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1505 = 5'h1 == _T_431 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1506 = 5'h2 == _T_431 ? 5'h1f : _GEN_1505; // @[layers.scala 132:13]
  wire [4:0] _GEN_1507 = 5'h3 == _T_431 ? 5'h14 : _GEN_1506; // @[layers.scala 132:13]
  wire [4:0] _GEN_1508 = 5'h4 == _T_431 ? 5'h1a : _GEN_1507; // @[layers.scala 132:13]
  wire [4:0] _GEN_1509 = 5'h5 == _T_431 ? 5'h15 : _GEN_1508; // @[layers.scala 132:13]
  wire [4:0] _GEN_1510 = 5'h6 == _T_431 ? 5'h9 : _GEN_1509; // @[layers.scala 132:13]
  wire [4:0] _GEN_1511 = 5'h7 == _T_431 ? 5'h2 : _GEN_1510; // @[layers.scala 132:13]
  wire [4:0] _GEN_1512 = 5'h8 == _T_431 ? 5'h1b : _GEN_1511; // @[layers.scala 132:13]
  wire [4:0] _GEN_1513 = 5'h9 == _T_431 ? 5'h5 : _GEN_1512; // @[layers.scala 132:13]
  wire [4:0] _GEN_1514 = 5'ha == _T_431 ? 5'h8 : _GEN_1513; // @[layers.scala 132:13]
  wire [4:0] _GEN_1515 = 5'hb == _T_431 ? 5'h12 : _GEN_1514; // @[layers.scala 132:13]
  wire [4:0] _GEN_1516 = 5'hc == _T_431 ? 5'h1d : _GEN_1515; // @[layers.scala 132:13]
  wire [4:0] _GEN_1517 = 5'hd == _T_431 ? 5'h3 : _GEN_1516; // @[layers.scala 132:13]
  wire [4:0] _GEN_1518 = 5'he == _T_431 ? 5'h6 : _GEN_1517; // @[layers.scala 132:13]
  wire [4:0] _GEN_1519 = 5'hf == _T_431 ? 5'h1c : _GEN_1518; // @[layers.scala 132:13]
  wire [4:0] _GEN_1520 = 5'h10 == _T_431 ? 5'h1e : _GEN_1519; // @[layers.scala 132:13]
  wire [4:0] _GEN_1521 = 5'h11 == _T_431 ? 5'h13 : _GEN_1520; // @[layers.scala 132:13]
  wire [4:0] _GEN_1522 = 5'h12 == _T_431 ? 5'h7 : _GEN_1521; // @[layers.scala 132:13]
  wire [4:0] _GEN_1523 = 5'h13 == _T_431 ? 5'he : _GEN_1522; // @[layers.scala 132:13]
  wire [4:0] _GEN_1524 = 5'h14 == _T_431 ? 5'h0 : _GEN_1523; // @[layers.scala 132:13]
  wire [4:0] _GEN_1525 = 5'h15 == _T_431 ? 5'hd : _GEN_1524; // @[layers.scala 132:13]
  wire [4:0] _GEN_1526 = 5'h16 == _T_431 ? 5'h11 : _GEN_1525; // @[layers.scala 132:13]
  wire [4:0] _GEN_1527 = 5'h17 == _T_431 ? 5'h18 : _GEN_1526; // @[layers.scala 132:13]
  wire [4:0] _GEN_1528 = 5'h18 == _T_431 ? 5'h10 : _GEN_1527; // @[layers.scala 132:13]
  wire [4:0] _GEN_1529 = 5'h19 == _T_431 ? 5'hc : _GEN_1528; // @[layers.scala 132:13]
  wire [4:0] _GEN_1530 = 5'h1a == _T_431 ? 5'h1 : _GEN_1529; // @[layers.scala 132:13]
  wire [4:0] _GEN_1531 = 5'h1b == _T_431 ? 5'h19 : _GEN_1530; // @[layers.scala 132:13]
  wire [4:0] _GEN_1532 = 5'h1c == _T_431 ? 5'h16 : _GEN_1531; // @[layers.scala 132:13]
  wire [4:0] _GEN_1533 = 5'h1d == _T_431 ? 5'ha : _GEN_1532; // @[layers.scala 132:13]
  wire [4:0] _GEN_1534 = 5'h1e == _T_431 ? 5'hf : _GEN_1533; // @[layers.scala 132:13]
  wire [4:0] temp_47 = 5'h1f == _T_431 ? 5'h17 : _GEN_1534; // @[layers.scala 132:13]
  wire [4:0] _T_440 = {io_x_in_0[48],io_x_in_1[48],io_x_in_2[48],io_x_in_3[48],io_x_in_4[48]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1537 = 5'h1 == _T_440 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1538 = 5'h2 == _T_440 ? 5'h1f : _GEN_1537; // @[layers.scala 132:13]
  wire [4:0] _GEN_1539 = 5'h3 == _T_440 ? 5'h14 : _GEN_1538; // @[layers.scala 132:13]
  wire [4:0] _GEN_1540 = 5'h4 == _T_440 ? 5'h1a : _GEN_1539; // @[layers.scala 132:13]
  wire [4:0] _GEN_1541 = 5'h5 == _T_440 ? 5'h15 : _GEN_1540; // @[layers.scala 132:13]
  wire [4:0] _GEN_1542 = 5'h6 == _T_440 ? 5'h9 : _GEN_1541; // @[layers.scala 132:13]
  wire [4:0] _GEN_1543 = 5'h7 == _T_440 ? 5'h2 : _GEN_1542; // @[layers.scala 132:13]
  wire [4:0] _GEN_1544 = 5'h8 == _T_440 ? 5'h1b : _GEN_1543; // @[layers.scala 132:13]
  wire [4:0] _GEN_1545 = 5'h9 == _T_440 ? 5'h5 : _GEN_1544; // @[layers.scala 132:13]
  wire [4:0] _GEN_1546 = 5'ha == _T_440 ? 5'h8 : _GEN_1545; // @[layers.scala 132:13]
  wire [4:0] _GEN_1547 = 5'hb == _T_440 ? 5'h12 : _GEN_1546; // @[layers.scala 132:13]
  wire [4:0] _GEN_1548 = 5'hc == _T_440 ? 5'h1d : _GEN_1547; // @[layers.scala 132:13]
  wire [4:0] _GEN_1549 = 5'hd == _T_440 ? 5'h3 : _GEN_1548; // @[layers.scala 132:13]
  wire [4:0] _GEN_1550 = 5'he == _T_440 ? 5'h6 : _GEN_1549; // @[layers.scala 132:13]
  wire [4:0] _GEN_1551 = 5'hf == _T_440 ? 5'h1c : _GEN_1550; // @[layers.scala 132:13]
  wire [4:0] _GEN_1552 = 5'h10 == _T_440 ? 5'h1e : _GEN_1551; // @[layers.scala 132:13]
  wire [4:0] _GEN_1553 = 5'h11 == _T_440 ? 5'h13 : _GEN_1552; // @[layers.scala 132:13]
  wire [4:0] _GEN_1554 = 5'h12 == _T_440 ? 5'h7 : _GEN_1553; // @[layers.scala 132:13]
  wire [4:0] _GEN_1555 = 5'h13 == _T_440 ? 5'he : _GEN_1554; // @[layers.scala 132:13]
  wire [4:0] _GEN_1556 = 5'h14 == _T_440 ? 5'h0 : _GEN_1555; // @[layers.scala 132:13]
  wire [4:0] _GEN_1557 = 5'h15 == _T_440 ? 5'hd : _GEN_1556; // @[layers.scala 132:13]
  wire [4:0] _GEN_1558 = 5'h16 == _T_440 ? 5'h11 : _GEN_1557; // @[layers.scala 132:13]
  wire [4:0] _GEN_1559 = 5'h17 == _T_440 ? 5'h18 : _GEN_1558; // @[layers.scala 132:13]
  wire [4:0] _GEN_1560 = 5'h18 == _T_440 ? 5'h10 : _GEN_1559; // @[layers.scala 132:13]
  wire [4:0] _GEN_1561 = 5'h19 == _T_440 ? 5'hc : _GEN_1560; // @[layers.scala 132:13]
  wire [4:0] _GEN_1562 = 5'h1a == _T_440 ? 5'h1 : _GEN_1561; // @[layers.scala 132:13]
  wire [4:0] _GEN_1563 = 5'h1b == _T_440 ? 5'h19 : _GEN_1562; // @[layers.scala 132:13]
  wire [4:0] _GEN_1564 = 5'h1c == _T_440 ? 5'h16 : _GEN_1563; // @[layers.scala 132:13]
  wire [4:0] _GEN_1565 = 5'h1d == _T_440 ? 5'ha : _GEN_1564; // @[layers.scala 132:13]
  wire [4:0] _GEN_1566 = 5'h1e == _T_440 ? 5'hf : _GEN_1565; // @[layers.scala 132:13]
  wire [4:0] temp_48 = 5'h1f == _T_440 ? 5'h17 : _GEN_1566; // @[layers.scala 132:13]
  wire [4:0] _T_449 = {io_x_in_0[49],io_x_in_1[49],io_x_in_2[49],io_x_in_3[49],io_x_in_4[49]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1569 = 5'h1 == _T_449 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1570 = 5'h2 == _T_449 ? 5'h1f : _GEN_1569; // @[layers.scala 132:13]
  wire [4:0] _GEN_1571 = 5'h3 == _T_449 ? 5'h14 : _GEN_1570; // @[layers.scala 132:13]
  wire [4:0] _GEN_1572 = 5'h4 == _T_449 ? 5'h1a : _GEN_1571; // @[layers.scala 132:13]
  wire [4:0] _GEN_1573 = 5'h5 == _T_449 ? 5'h15 : _GEN_1572; // @[layers.scala 132:13]
  wire [4:0] _GEN_1574 = 5'h6 == _T_449 ? 5'h9 : _GEN_1573; // @[layers.scala 132:13]
  wire [4:0] _GEN_1575 = 5'h7 == _T_449 ? 5'h2 : _GEN_1574; // @[layers.scala 132:13]
  wire [4:0] _GEN_1576 = 5'h8 == _T_449 ? 5'h1b : _GEN_1575; // @[layers.scala 132:13]
  wire [4:0] _GEN_1577 = 5'h9 == _T_449 ? 5'h5 : _GEN_1576; // @[layers.scala 132:13]
  wire [4:0] _GEN_1578 = 5'ha == _T_449 ? 5'h8 : _GEN_1577; // @[layers.scala 132:13]
  wire [4:0] _GEN_1579 = 5'hb == _T_449 ? 5'h12 : _GEN_1578; // @[layers.scala 132:13]
  wire [4:0] _GEN_1580 = 5'hc == _T_449 ? 5'h1d : _GEN_1579; // @[layers.scala 132:13]
  wire [4:0] _GEN_1581 = 5'hd == _T_449 ? 5'h3 : _GEN_1580; // @[layers.scala 132:13]
  wire [4:0] _GEN_1582 = 5'he == _T_449 ? 5'h6 : _GEN_1581; // @[layers.scala 132:13]
  wire [4:0] _GEN_1583 = 5'hf == _T_449 ? 5'h1c : _GEN_1582; // @[layers.scala 132:13]
  wire [4:0] _GEN_1584 = 5'h10 == _T_449 ? 5'h1e : _GEN_1583; // @[layers.scala 132:13]
  wire [4:0] _GEN_1585 = 5'h11 == _T_449 ? 5'h13 : _GEN_1584; // @[layers.scala 132:13]
  wire [4:0] _GEN_1586 = 5'h12 == _T_449 ? 5'h7 : _GEN_1585; // @[layers.scala 132:13]
  wire [4:0] _GEN_1587 = 5'h13 == _T_449 ? 5'he : _GEN_1586; // @[layers.scala 132:13]
  wire [4:0] _GEN_1588 = 5'h14 == _T_449 ? 5'h0 : _GEN_1587; // @[layers.scala 132:13]
  wire [4:0] _GEN_1589 = 5'h15 == _T_449 ? 5'hd : _GEN_1588; // @[layers.scala 132:13]
  wire [4:0] _GEN_1590 = 5'h16 == _T_449 ? 5'h11 : _GEN_1589; // @[layers.scala 132:13]
  wire [4:0] _GEN_1591 = 5'h17 == _T_449 ? 5'h18 : _GEN_1590; // @[layers.scala 132:13]
  wire [4:0] _GEN_1592 = 5'h18 == _T_449 ? 5'h10 : _GEN_1591; // @[layers.scala 132:13]
  wire [4:0] _GEN_1593 = 5'h19 == _T_449 ? 5'hc : _GEN_1592; // @[layers.scala 132:13]
  wire [4:0] _GEN_1594 = 5'h1a == _T_449 ? 5'h1 : _GEN_1593; // @[layers.scala 132:13]
  wire [4:0] _GEN_1595 = 5'h1b == _T_449 ? 5'h19 : _GEN_1594; // @[layers.scala 132:13]
  wire [4:0] _GEN_1596 = 5'h1c == _T_449 ? 5'h16 : _GEN_1595; // @[layers.scala 132:13]
  wire [4:0] _GEN_1597 = 5'h1d == _T_449 ? 5'ha : _GEN_1596; // @[layers.scala 132:13]
  wire [4:0] _GEN_1598 = 5'h1e == _T_449 ? 5'hf : _GEN_1597; // @[layers.scala 132:13]
  wire [4:0] temp_49 = 5'h1f == _T_449 ? 5'h17 : _GEN_1598; // @[layers.scala 132:13]
  wire [4:0] _T_458 = {io_x_in_0[50],io_x_in_1[50],io_x_in_2[50],io_x_in_3[50],io_x_in_4[50]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1601 = 5'h1 == _T_458 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1602 = 5'h2 == _T_458 ? 5'h1f : _GEN_1601; // @[layers.scala 132:13]
  wire [4:0] _GEN_1603 = 5'h3 == _T_458 ? 5'h14 : _GEN_1602; // @[layers.scala 132:13]
  wire [4:0] _GEN_1604 = 5'h4 == _T_458 ? 5'h1a : _GEN_1603; // @[layers.scala 132:13]
  wire [4:0] _GEN_1605 = 5'h5 == _T_458 ? 5'h15 : _GEN_1604; // @[layers.scala 132:13]
  wire [4:0] _GEN_1606 = 5'h6 == _T_458 ? 5'h9 : _GEN_1605; // @[layers.scala 132:13]
  wire [4:0] _GEN_1607 = 5'h7 == _T_458 ? 5'h2 : _GEN_1606; // @[layers.scala 132:13]
  wire [4:0] _GEN_1608 = 5'h8 == _T_458 ? 5'h1b : _GEN_1607; // @[layers.scala 132:13]
  wire [4:0] _GEN_1609 = 5'h9 == _T_458 ? 5'h5 : _GEN_1608; // @[layers.scala 132:13]
  wire [4:0] _GEN_1610 = 5'ha == _T_458 ? 5'h8 : _GEN_1609; // @[layers.scala 132:13]
  wire [4:0] _GEN_1611 = 5'hb == _T_458 ? 5'h12 : _GEN_1610; // @[layers.scala 132:13]
  wire [4:0] _GEN_1612 = 5'hc == _T_458 ? 5'h1d : _GEN_1611; // @[layers.scala 132:13]
  wire [4:0] _GEN_1613 = 5'hd == _T_458 ? 5'h3 : _GEN_1612; // @[layers.scala 132:13]
  wire [4:0] _GEN_1614 = 5'he == _T_458 ? 5'h6 : _GEN_1613; // @[layers.scala 132:13]
  wire [4:0] _GEN_1615 = 5'hf == _T_458 ? 5'h1c : _GEN_1614; // @[layers.scala 132:13]
  wire [4:0] _GEN_1616 = 5'h10 == _T_458 ? 5'h1e : _GEN_1615; // @[layers.scala 132:13]
  wire [4:0] _GEN_1617 = 5'h11 == _T_458 ? 5'h13 : _GEN_1616; // @[layers.scala 132:13]
  wire [4:0] _GEN_1618 = 5'h12 == _T_458 ? 5'h7 : _GEN_1617; // @[layers.scala 132:13]
  wire [4:0] _GEN_1619 = 5'h13 == _T_458 ? 5'he : _GEN_1618; // @[layers.scala 132:13]
  wire [4:0] _GEN_1620 = 5'h14 == _T_458 ? 5'h0 : _GEN_1619; // @[layers.scala 132:13]
  wire [4:0] _GEN_1621 = 5'h15 == _T_458 ? 5'hd : _GEN_1620; // @[layers.scala 132:13]
  wire [4:0] _GEN_1622 = 5'h16 == _T_458 ? 5'h11 : _GEN_1621; // @[layers.scala 132:13]
  wire [4:0] _GEN_1623 = 5'h17 == _T_458 ? 5'h18 : _GEN_1622; // @[layers.scala 132:13]
  wire [4:0] _GEN_1624 = 5'h18 == _T_458 ? 5'h10 : _GEN_1623; // @[layers.scala 132:13]
  wire [4:0] _GEN_1625 = 5'h19 == _T_458 ? 5'hc : _GEN_1624; // @[layers.scala 132:13]
  wire [4:0] _GEN_1626 = 5'h1a == _T_458 ? 5'h1 : _GEN_1625; // @[layers.scala 132:13]
  wire [4:0] _GEN_1627 = 5'h1b == _T_458 ? 5'h19 : _GEN_1626; // @[layers.scala 132:13]
  wire [4:0] _GEN_1628 = 5'h1c == _T_458 ? 5'h16 : _GEN_1627; // @[layers.scala 132:13]
  wire [4:0] _GEN_1629 = 5'h1d == _T_458 ? 5'ha : _GEN_1628; // @[layers.scala 132:13]
  wire [4:0] _GEN_1630 = 5'h1e == _T_458 ? 5'hf : _GEN_1629; // @[layers.scala 132:13]
  wire [4:0] temp_50 = 5'h1f == _T_458 ? 5'h17 : _GEN_1630; // @[layers.scala 132:13]
  wire [4:0] _T_467 = {io_x_in_0[51],io_x_in_1[51],io_x_in_2[51],io_x_in_3[51],io_x_in_4[51]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1633 = 5'h1 == _T_467 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1634 = 5'h2 == _T_467 ? 5'h1f : _GEN_1633; // @[layers.scala 132:13]
  wire [4:0] _GEN_1635 = 5'h3 == _T_467 ? 5'h14 : _GEN_1634; // @[layers.scala 132:13]
  wire [4:0] _GEN_1636 = 5'h4 == _T_467 ? 5'h1a : _GEN_1635; // @[layers.scala 132:13]
  wire [4:0] _GEN_1637 = 5'h5 == _T_467 ? 5'h15 : _GEN_1636; // @[layers.scala 132:13]
  wire [4:0] _GEN_1638 = 5'h6 == _T_467 ? 5'h9 : _GEN_1637; // @[layers.scala 132:13]
  wire [4:0] _GEN_1639 = 5'h7 == _T_467 ? 5'h2 : _GEN_1638; // @[layers.scala 132:13]
  wire [4:0] _GEN_1640 = 5'h8 == _T_467 ? 5'h1b : _GEN_1639; // @[layers.scala 132:13]
  wire [4:0] _GEN_1641 = 5'h9 == _T_467 ? 5'h5 : _GEN_1640; // @[layers.scala 132:13]
  wire [4:0] _GEN_1642 = 5'ha == _T_467 ? 5'h8 : _GEN_1641; // @[layers.scala 132:13]
  wire [4:0] _GEN_1643 = 5'hb == _T_467 ? 5'h12 : _GEN_1642; // @[layers.scala 132:13]
  wire [4:0] _GEN_1644 = 5'hc == _T_467 ? 5'h1d : _GEN_1643; // @[layers.scala 132:13]
  wire [4:0] _GEN_1645 = 5'hd == _T_467 ? 5'h3 : _GEN_1644; // @[layers.scala 132:13]
  wire [4:0] _GEN_1646 = 5'he == _T_467 ? 5'h6 : _GEN_1645; // @[layers.scala 132:13]
  wire [4:0] _GEN_1647 = 5'hf == _T_467 ? 5'h1c : _GEN_1646; // @[layers.scala 132:13]
  wire [4:0] _GEN_1648 = 5'h10 == _T_467 ? 5'h1e : _GEN_1647; // @[layers.scala 132:13]
  wire [4:0] _GEN_1649 = 5'h11 == _T_467 ? 5'h13 : _GEN_1648; // @[layers.scala 132:13]
  wire [4:0] _GEN_1650 = 5'h12 == _T_467 ? 5'h7 : _GEN_1649; // @[layers.scala 132:13]
  wire [4:0] _GEN_1651 = 5'h13 == _T_467 ? 5'he : _GEN_1650; // @[layers.scala 132:13]
  wire [4:0] _GEN_1652 = 5'h14 == _T_467 ? 5'h0 : _GEN_1651; // @[layers.scala 132:13]
  wire [4:0] _GEN_1653 = 5'h15 == _T_467 ? 5'hd : _GEN_1652; // @[layers.scala 132:13]
  wire [4:0] _GEN_1654 = 5'h16 == _T_467 ? 5'h11 : _GEN_1653; // @[layers.scala 132:13]
  wire [4:0] _GEN_1655 = 5'h17 == _T_467 ? 5'h18 : _GEN_1654; // @[layers.scala 132:13]
  wire [4:0] _GEN_1656 = 5'h18 == _T_467 ? 5'h10 : _GEN_1655; // @[layers.scala 132:13]
  wire [4:0] _GEN_1657 = 5'h19 == _T_467 ? 5'hc : _GEN_1656; // @[layers.scala 132:13]
  wire [4:0] _GEN_1658 = 5'h1a == _T_467 ? 5'h1 : _GEN_1657; // @[layers.scala 132:13]
  wire [4:0] _GEN_1659 = 5'h1b == _T_467 ? 5'h19 : _GEN_1658; // @[layers.scala 132:13]
  wire [4:0] _GEN_1660 = 5'h1c == _T_467 ? 5'h16 : _GEN_1659; // @[layers.scala 132:13]
  wire [4:0] _GEN_1661 = 5'h1d == _T_467 ? 5'ha : _GEN_1660; // @[layers.scala 132:13]
  wire [4:0] _GEN_1662 = 5'h1e == _T_467 ? 5'hf : _GEN_1661; // @[layers.scala 132:13]
  wire [4:0] temp_51 = 5'h1f == _T_467 ? 5'h17 : _GEN_1662; // @[layers.scala 132:13]
  wire [4:0] _T_476 = {io_x_in_0[52],io_x_in_1[52],io_x_in_2[52],io_x_in_3[52],io_x_in_4[52]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1665 = 5'h1 == _T_476 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1666 = 5'h2 == _T_476 ? 5'h1f : _GEN_1665; // @[layers.scala 132:13]
  wire [4:0] _GEN_1667 = 5'h3 == _T_476 ? 5'h14 : _GEN_1666; // @[layers.scala 132:13]
  wire [4:0] _GEN_1668 = 5'h4 == _T_476 ? 5'h1a : _GEN_1667; // @[layers.scala 132:13]
  wire [4:0] _GEN_1669 = 5'h5 == _T_476 ? 5'h15 : _GEN_1668; // @[layers.scala 132:13]
  wire [4:0] _GEN_1670 = 5'h6 == _T_476 ? 5'h9 : _GEN_1669; // @[layers.scala 132:13]
  wire [4:0] _GEN_1671 = 5'h7 == _T_476 ? 5'h2 : _GEN_1670; // @[layers.scala 132:13]
  wire [4:0] _GEN_1672 = 5'h8 == _T_476 ? 5'h1b : _GEN_1671; // @[layers.scala 132:13]
  wire [4:0] _GEN_1673 = 5'h9 == _T_476 ? 5'h5 : _GEN_1672; // @[layers.scala 132:13]
  wire [4:0] _GEN_1674 = 5'ha == _T_476 ? 5'h8 : _GEN_1673; // @[layers.scala 132:13]
  wire [4:0] _GEN_1675 = 5'hb == _T_476 ? 5'h12 : _GEN_1674; // @[layers.scala 132:13]
  wire [4:0] _GEN_1676 = 5'hc == _T_476 ? 5'h1d : _GEN_1675; // @[layers.scala 132:13]
  wire [4:0] _GEN_1677 = 5'hd == _T_476 ? 5'h3 : _GEN_1676; // @[layers.scala 132:13]
  wire [4:0] _GEN_1678 = 5'he == _T_476 ? 5'h6 : _GEN_1677; // @[layers.scala 132:13]
  wire [4:0] _GEN_1679 = 5'hf == _T_476 ? 5'h1c : _GEN_1678; // @[layers.scala 132:13]
  wire [4:0] _GEN_1680 = 5'h10 == _T_476 ? 5'h1e : _GEN_1679; // @[layers.scala 132:13]
  wire [4:0] _GEN_1681 = 5'h11 == _T_476 ? 5'h13 : _GEN_1680; // @[layers.scala 132:13]
  wire [4:0] _GEN_1682 = 5'h12 == _T_476 ? 5'h7 : _GEN_1681; // @[layers.scala 132:13]
  wire [4:0] _GEN_1683 = 5'h13 == _T_476 ? 5'he : _GEN_1682; // @[layers.scala 132:13]
  wire [4:0] _GEN_1684 = 5'h14 == _T_476 ? 5'h0 : _GEN_1683; // @[layers.scala 132:13]
  wire [4:0] _GEN_1685 = 5'h15 == _T_476 ? 5'hd : _GEN_1684; // @[layers.scala 132:13]
  wire [4:0] _GEN_1686 = 5'h16 == _T_476 ? 5'h11 : _GEN_1685; // @[layers.scala 132:13]
  wire [4:0] _GEN_1687 = 5'h17 == _T_476 ? 5'h18 : _GEN_1686; // @[layers.scala 132:13]
  wire [4:0] _GEN_1688 = 5'h18 == _T_476 ? 5'h10 : _GEN_1687; // @[layers.scala 132:13]
  wire [4:0] _GEN_1689 = 5'h19 == _T_476 ? 5'hc : _GEN_1688; // @[layers.scala 132:13]
  wire [4:0] _GEN_1690 = 5'h1a == _T_476 ? 5'h1 : _GEN_1689; // @[layers.scala 132:13]
  wire [4:0] _GEN_1691 = 5'h1b == _T_476 ? 5'h19 : _GEN_1690; // @[layers.scala 132:13]
  wire [4:0] _GEN_1692 = 5'h1c == _T_476 ? 5'h16 : _GEN_1691; // @[layers.scala 132:13]
  wire [4:0] _GEN_1693 = 5'h1d == _T_476 ? 5'ha : _GEN_1692; // @[layers.scala 132:13]
  wire [4:0] _GEN_1694 = 5'h1e == _T_476 ? 5'hf : _GEN_1693; // @[layers.scala 132:13]
  wire [4:0] temp_52 = 5'h1f == _T_476 ? 5'h17 : _GEN_1694; // @[layers.scala 132:13]
  wire [4:0] _T_485 = {io_x_in_0[53],io_x_in_1[53],io_x_in_2[53],io_x_in_3[53],io_x_in_4[53]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1697 = 5'h1 == _T_485 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1698 = 5'h2 == _T_485 ? 5'h1f : _GEN_1697; // @[layers.scala 132:13]
  wire [4:0] _GEN_1699 = 5'h3 == _T_485 ? 5'h14 : _GEN_1698; // @[layers.scala 132:13]
  wire [4:0] _GEN_1700 = 5'h4 == _T_485 ? 5'h1a : _GEN_1699; // @[layers.scala 132:13]
  wire [4:0] _GEN_1701 = 5'h5 == _T_485 ? 5'h15 : _GEN_1700; // @[layers.scala 132:13]
  wire [4:0] _GEN_1702 = 5'h6 == _T_485 ? 5'h9 : _GEN_1701; // @[layers.scala 132:13]
  wire [4:0] _GEN_1703 = 5'h7 == _T_485 ? 5'h2 : _GEN_1702; // @[layers.scala 132:13]
  wire [4:0] _GEN_1704 = 5'h8 == _T_485 ? 5'h1b : _GEN_1703; // @[layers.scala 132:13]
  wire [4:0] _GEN_1705 = 5'h9 == _T_485 ? 5'h5 : _GEN_1704; // @[layers.scala 132:13]
  wire [4:0] _GEN_1706 = 5'ha == _T_485 ? 5'h8 : _GEN_1705; // @[layers.scala 132:13]
  wire [4:0] _GEN_1707 = 5'hb == _T_485 ? 5'h12 : _GEN_1706; // @[layers.scala 132:13]
  wire [4:0] _GEN_1708 = 5'hc == _T_485 ? 5'h1d : _GEN_1707; // @[layers.scala 132:13]
  wire [4:0] _GEN_1709 = 5'hd == _T_485 ? 5'h3 : _GEN_1708; // @[layers.scala 132:13]
  wire [4:0] _GEN_1710 = 5'he == _T_485 ? 5'h6 : _GEN_1709; // @[layers.scala 132:13]
  wire [4:0] _GEN_1711 = 5'hf == _T_485 ? 5'h1c : _GEN_1710; // @[layers.scala 132:13]
  wire [4:0] _GEN_1712 = 5'h10 == _T_485 ? 5'h1e : _GEN_1711; // @[layers.scala 132:13]
  wire [4:0] _GEN_1713 = 5'h11 == _T_485 ? 5'h13 : _GEN_1712; // @[layers.scala 132:13]
  wire [4:0] _GEN_1714 = 5'h12 == _T_485 ? 5'h7 : _GEN_1713; // @[layers.scala 132:13]
  wire [4:0] _GEN_1715 = 5'h13 == _T_485 ? 5'he : _GEN_1714; // @[layers.scala 132:13]
  wire [4:0] _GEN_1716 = 5'h14 == _T_485 ? 5'h0 : _GEN_1715; // @[layers.scala 132:13]
  wire [4:0] _GEN_1717 = 5'h15 == _T_485 ? 5'hd : _GEN_1716; // @[layers.scala 132:13]
  wire [4:0] _GEN_1718 = 5'h16 == _T_485 ? 5'h11 : _GEN_1717; // @[layers.scala 132:13]
  wire [4:0] _GEN_1719 = 5'h17 == _T_485 ? 5'h18 : _GEN_1718; // @[layers.scala 132:13]
  wire [4:0] _GEN_1720 = 5'h18 == _T_485 ? 5'h10 : _GEN_1719; // @[layers.scala 132:13]
  wire [4:0] _GEN_1721 = 5'h19 == _T_485 ? 5'hc : _GEN_1720; // @[layers.scala 132:13]
  wire [4:0] _GEN_1722 = 5'h1a == _T_485 ? 5'h1 : _GEN_1721; // @[layers.scala 132:13]
  wire [4:0] _GEN_1723 = 5'h1b == _T_485 ? 5'h19 : _GEN_1722; // @[layers.scala 132:13]
  wire [4:0] _GEN_1724 = 5'h1c == _T_485 ? 5'h16 : _GEN_1723; // @[layers.scala 132:13]
  wire [4:0] _GEN_1725 = 5'h1d == _T_485 ? 5'ha : _GEN_1724; // @[layers.scala 132:13]
  wire [4:0] _GEN_1726 = 5'h1e == _T_485 ? 5'hf : _GEN_1725; // @[layers.scala 132:13]
  wire [4:0] temp_53 = 5'h1f == _T_485 ? 5'h17 : _GEN_1726; // @[layers.scala 132:13]
  wire [4:0] _T_494 = {io_x_in_0[54],io_x_in_1[54],io_x_in_2[54],io_x_in_3[54],io_x_in_4[54]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1729 = 5'h1 == _T_494 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1730 = 5'h2 == _T_494 ? 5'h1f : _GEN_1729; // @[layers.scala 132:13]
  wire [4:0] _GEN_1731 = 5'h3 == _T_494 ? 5'h14 : _GEN_1730; // @[layers.scala 132:13]
  wire [4:0] _GEN_1732 = 5'h4 == _T_494 ? 5'h1a : _GEN_1731; // @[layers.scala 132:13]
  wire [4:0] _GEN_1733 = 5'h5 == _T_494 ? 5'h15 : _GEN_1732; // @[layers.scala 132:13]
  wire [4:0] _GEN_1734 = 5'h6 == _T_494 ? 5'h9 : _GEN_1733; // @[layers.scala 132:13]
  wire [4:0] _GEN_1735 = 5'h7 == _T_494 ? 5'h2 : _GEN_1734; // @[layers.scala 132:13]
  wire [4:0] _GEN_1736 = 5'h8 == _T_494 ? 5'h1b : _GEN_1735; // @[layers.scala 132:13]
  wire [4:0] _GEN_1737 = 5'h9 == _T_494 ? 5'h5 : _GEN_1736; // @[layers.scala 132:13]
  wire [4:0] _GEN_1738 = 5'ha == _T_494 ? 5'h8 : _GEN_1737; // @[layers.scala 132:13]
  wire [4:0] _GEN_1739 = 5'hb == _T_494 ? 5'h12 : _GEN_1738; // @[layers.scala 132:13]
  wire [4:0] _GEN_1740 = 5'hc == _T_494 ? 5'h1d : _GEN_1739; // @[layers.scala 132:13]
  wire [4:0] _GEN_1741 = 5'hd == _T_494 ? 5'h3 : _GEN_1740; // @[layers.scala 132:13]
  wire [4:0] _GEN_1742 = 5'he == _T_494 ? 5'h6 : _GEN_1741; // @[layers.scala 132:13]
  wire [4:0] _GEN_1743 = 5'hf == _T_494 ? 5'h1c : _GEN_1742; // @[layers.scala 132:13]
  wire [4:0] _GEN_1744 = 5'h10 == _T_494 ? 5'h1e : _GEN_1743; // @[layers.scala 132:13]
  wire [4:0] _GEN_1745 = 5'h11 == _T_494 ? 5'h13 : _GEN_1744; // @[layers.scala 132:13]
  wire [4:0] _GEN_1746 = 5'h12 == _T_494 ? 5'h7 : _GEN_1745; // @[layers.scala 132:13]
  wire [4:0] _GEN_1747 = 5'h13 == _T_494 ? 5'he : _GEN_1746; // @[layers.scala 132:13]
  wire [4:0] _GEN_1748 = 5'h14 == _T_494 ? 5'h0 : _GEN_1747; // @[layers.scala 132:13]
  wire [4:0] _GEN_1749 = 5'h15 == _T_494 ? 5'hd : _GEN_1748; // @[layers.scala 132:13]
  wire [4:0] _GEN_1750 = 5'h16 == _T_494 ? 5'h11 : _GEN_1749; // @[layers.scala 132:13]
  wire [4:0] _GEN_1751 = 5'h17 == _T_494 ? 5'h18 : _GEN_1750; // @[layers.scala 132:13]
  wire [4:0] _GEN_1752 = 5'h18 == _T_494 ? 5'h10 : _GEN_1751; // @[layers.scala 132:13]
  wire [4:0] _GEN_1753 = 5'h19 == _T_494 ? 5'hc : _GEN_1752; // @[layers.scala 132:13]
  wire [4:0] _GEN_1754 = 5'h1a == _T_494 ? 5'h1 : _GEN_1753; // @[layers.scala 132:13]
  wire [4:0] _GEN_1755 = 5'h1b == _T_494 ? 5'h19 : _GEN_1754; // @[layers.scala 132:13]
  wire [4:0] _GEN_1756 = 5'h1c == _T_494 ? 5'h16 : _GEN_1755; // @[layers.scala 132:13]
  wire [4:0] _GEN_1757 = 5'h1d == _T_494 ? 5'ha : _GEN_1756; // @[layers.scala 132:13]
  wire [4:0] _GEN_1758 = 5'h1e == _T_494 ? 5'hf : _GEN_1757; // @[layers.scala 132:13]
  wire [4:0] temp_54 = 5'h1f == _T_494 ? 5'h17 : _GEN_1758; // @[layers.scala 132:13]
  wire [4:0] _T_503 = {io_x_in_0[55],io_x_in_1[55],io_x_in_2[55],io_x_in_3[55],io_x_in_4[55]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1761 = 5'h1 == _T_503 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1762 = 5'h2 == _T_503 ? 5'h1f : _GEN_1761; // @[layers.scala 132:13]
  wire [4:0] _GEN_1763 = 5'h3 == _T_503 ? 5'h14 : _GEN_1762; // @[layers.scala 132:13]
  wire [4:0] _GEN_1764 = 5'h4 == _T_503 ? 5'h1a : _GEN_1763; // @[layers.scala 132:13]
  wire [4:0] _GEN_1765 = 5'h5 == _T_503 ? 5'h15 : _GEN_1764; // @[layers.scala 132:13]
  wire [4:0] _GEN_1766 = 5'h6 == _T_503 ? 5'h9 : _GEN_1765; // @[layers.scala 132:13]
  wire [4:0] _GEN_1767 = 5'h7 == _T_503 ? 5'h2 : _GEN_1766; // @[layers.scala 132:13]
  wire [4:0] _GEN_1768 = 5'h8 == _T_503 ? 5'h1b : _GEN_1767; // @[layers.scala 132:13]
  wire [4:0] _GEN_1769 = 5'h9 == _T_503 ? 5'h5 : _GEN_1768; // @[layers.scala 132:13]
  wire [4:0] _GEN_1770 = 5'ha == _T_503 ? 5'h8 : _GEN_1769; // @[layers.scala 132:13]
  wire [4:0] _GEN_1771 = 5'hb == _T_503 ? 5'h12 : _GEN_1770; // @[layers.scala 132:13]
  wire [4:0] _GEN_1772 = 5'hc == _T_503 ? 5'h1d : _GEN_1771; // @[layers.scala 132:13]
  wire [4:0] _GEN_1773 = 5'hd == _T_503 ? 5'h3 : _GEN_1772; // @[layers.scala 132:13]
  wire [4:0] _GEN_1774 = 5'he == _T_503 ? 5'h6 : _GEN_1773; // @[layers.scala 132:13]
  wire [4:0] _GEN_1775 = 5'hf == _T_503 ? 5'h1c : _GEN_1774; // @[layers.scala 132:13]
  wire [4:0] _GEN_1776 = 5'h10 == _T_503 ? 5'h1e : _GEN_1775; // @[layers.scala 132:13]
  wire [4:0] _GEN_1777 = 5'h11 == _T_503 ? 5'h13 : _GEN_1776; // @[layers.scala 132:13]
  wire [4:0] _GEN_1778 = 5'h12 == _T_503 ? 5'h7 : _GEN_1777; // @[layers.scala 132:13]
  wire [4:0] _GEN_1779 = 5'h13 == _T_503 ? 5'he : _GEN_1778; // @[layers.scala 132:13]
  wire [4:0] _GEN_1780 = 5'h14 == _T_503 ? 5'h0 : _GEN_1779; // @[layers.scala 132:13]
  wire [4:0] _GEN_1781 = 5'h15 == _T_503 ? 5'hd : _GEN_1780; // @[layers.scala 132:13]
  wire [4:0] _GEN_1782 = 5'h16 == _T_503 ? 5'h11 : _GEN_1781; // @[layers.scala 132:13]
  wire [4:0] _GEN_1783 = 5'h17 == _T_503 ? 5'h18 : _GEN_1782; // @[layers.scala 132:13]
  wire [4:0] _GEN_1784 = 5'h18 == _T_503 ? 5'h10 : _GEN_1783; // @[layers.scala 132:13]
  wire [4:0] _GEN_1785 = 5'h19 == _T_503 ? 5'hc : _GEN_1784; // @[layers.scala 132:13]
  wire [4:0] _GEN_1786 = 5'h1a == _T_503 ? 5'h1 : _GEN_1785; // @[layers.scala 132:13]
  wire [4:0] _GEN_1787 = 5'h1b == _T_503 ? 5'h19 : _GEN_1786; // @[layers.scala 132:13]
  wire [4:0] _GEN_1788 = 5'h1c == _T_503 ? 5'h16 : _GEN_1787; // @[layers.scala 132:13]
  wire [4:0] _GEN_1789 = 5'h1d == _T_503 ? 5'ha : _GEN_1788; // @[layers.scala 132:13]
  wire [4:0] _GEN_1790 = 5'h1e == _T_503 ? 5'hf : _GEN_1789; // @[layers.scala 132:13]
  wire [4:0] temp_55 = 5'h1f == _T_503 ? 5'h17 : _GEN_1790; // @[layers.scala 132:13]
  wire [4:0] _T_512 = {io_x_in_0[56],io_x_in_1[56],io_x_in_2[56],io_x_in_3[56],io_x_in_4[56]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1793 = 5'h1 == _T_512 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1794 = 5'h2 == _T_512 ? 5'h1f : _GEN_1793; // @[layers.scala 132:13]
  wire [4:0] _GEN_1795 = 5'h3 == _T_512 ? 5'h14 : _GEN_1794; // @[layers.scala 132:13]
  wire [4:0] _GEN_1796 = 5'h4 == _T_512 ? 5'h1a : _GEN_1795; // @[layers.scala 132:13]
  wire [4:0] _GEN_1797 = 5'h5 == _T_512 ? 5'h15 : _GEN_1796; // @[layers.scala 132:13]
  wire [4:0] _GEN_1798 = 5'h6 == _T_512 ? 5'h9 : _GEN_1797; // @[layers.scala 132:13]
  wire [4:0] _GEN_1799 = 5'h7 == _T_512 ? 5'h2 : _GEN_1798; // @[layers.scala 132:13]
  wire [4:0] _GEN_1800 = 5'h8 == _T_512 ? 5'h1b : _GEN_1799; // @[layers.scala 132:13]
  wire [4:0] _GEN_1801 = 5'h9 == _T_512 ? 5'h5 : _GEN_1800; // @[layers.scala 132:13]
  wire [4:0] _GEN_1802 = 5'ha == _T_512 ? 5'h8 : _GEN_1801; // @[layers.scala 132:13]
  wire [4:0] _GEN_1803 = 5'hb == _T_512 ? 5'h12 : _GEN_1802; // @[layers.scala 132:13]
  wire [4:0] _GEN_1804 = 5'hc == _T_512 ? 5'h1d : _GEN_1803; // @[layers.scala 132:13]
  wire [4:0] _GEN_1805 = 5'hd == _T_512 ? 5'h3 : _GEN_1804; // @[layers.scala 132:13]
  wire [4:0] _GEN_1806 = 5'he == _T_512 ? 5'h6 : _GEN_1805; // @[layers.scala 132:13]
  wire [4:0] _GEN_1807 = 5'hf == _T_512 ? 5'h1c : _GEN_1806; // @[layers.scala 132:13]
  wire [4:0] _GEN_1808 = 5'h10 == _T_512 ? 5'h1e : _GEN_1807; // @[layers.scala 132:13]
  wire [4:0] _GEN_1809 = 5'h11 == _T_512 ? 5'h13 : _GEN_1808; // @[layers.scala 132:13]
  wire [4:0] _GEN_1810 = 5'h12 == _T_512 ? 5'h7 : _GEN_1809; // @[layers.scala 132:13]
  wire [4:0] _GEN_1811 = 5'h13 == _T_512 ? 5'he : _GEN_1810; // @[layers.scala 132:13]
  wire [4:0] _GEN_1812 = 5'h14 == _T_512 ? 5'h0 : _GEN_1811; // @[layers.scala 132:13]
  wire [4:0] _GEN_1813 = 5'h15 == _T_512 ? 5'hd : _GEN_1812; // @[layers.scala 132:13]
  wire [4:0] _GEN_1814 = 5'h16 == _T_512 ? 5'h11 : _GEN_1813; // @[layers.scala 132:13]
  wire [4:0] _GEN_1815 = 5'h17 == _T_512 ? 5'h18 : _GEN_1814; // @[layers.scala 132:13]
  wire [4:0] _GEN_1816 = 5'h18 == _T_512 ? 5'h10 : _GEN_1815; // @[layers.scala 132:13]
  wire [4:0] _GEN_1817 = 5'h19 == _T_512 ? 5'hc : _GEN_1816; // @[layers.scala 132:13]
  wire [4:0] _GEN_1818 = 5'h1a == _T_512 ? 5'h1 : _GEN_1817; // @[layers.scala 132:13]
  wire [4:0] _GEN_1819 = 5'h1b == _T_512 ? 5'h19 : _GEN_1818; // @[layers.scala 132:13]
  wire [4:0] _GEN_1820 = 5'h1c == _T_512 ? 5'h16 : _GEN_1819; // @[layers.scala 132:13]
  wire [4:0] _GEN_1821 = 5'h1d == _T_512 ? 5'ha : _GEN_1820; // @[layers.scala 132:13]
  wire [4:0] _GEN_1822 = 5'h1e == _T_512 ? 5'hf : _GEN_1821; // @[layers.scala 132:13]
  wire [4:0] temp_56 = 5'h1f == _T_512 ? 5'h17 : _GEN_1822; // @[layers.scala 132:13]
  wire [4:0] _T_521 = {io_x_in_0[57],io_x_in_1[57],io_x_in_2[57],io_x_in_3[57],io_x_in_4[57]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1825 = 5'h1 == _T_521 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1826 = 5'h2 == _T_521 ? 5'h1f : _GEN_1825; // @[layers.scala 132:13]
  wire [4:0] _GEN_1827 = 5'h3 == _T_521 ? 5'h14 : _GEN_1826; // @[layers.scala 132:13]
  wire [4:0] _GEN_1828 = 5'h4 == _T_521 ? 5'h1a : _GEN_1827; // @[layers.scala 132:13]
  wire [4:0] _GEN_1829 = 5'h5 == _T_521 ? 5'h15 : _GEN_1828; // @[layers.scala 132:13]
  wire [4:0] _GEN_1830 = 5'h6 == _T_521 ? 5'h9 : _GEN_1829; // @[layers.scala 132:13]
  wire [4:0] _GEN_1831 = 5'h7 == _T_521 ? 5'h2 : _GEN_1830; // @[layers.scala 132:13]
  wire [4:0] _GEN_1832 = 5'h8 == _T_521 ? 5'h1b : _GEN_1831; // @[layers.scala 132:13]
  wire [4:0] _GEN_1833 = 5'h9 == _T_521 ? 5'h5 : _GEN_1832; // @[layers.scala 132:13]
  wire [4:0] _GEN_1834 = 5'ha == _T_521 ? 5'h8 : _GEN_1833; // @[layers.scala 132:13]
  wire [4:0] _GEN_1835 = 5'hb == _T_521 ? 5'h12 : _GEN_1834; // @[layers.scala 132:13]
  wire [4:0] _GEN_1836 = 5'hc == _T_521 ? 5'h1d : _GEN_1835; // @[layers.scala 132:13]
  wire [4:0] _GEN_1837 = 5'hd == _T_521 ? 5'h3 : _GEN_1836; // @[layers.scala 132:13]
  wire [4:0] _GEN_1838 = 5'he == _T_521 ? 5'h6 : _GEN_1837; // @[layers.scala 132:13]
  wire [4:0] _GEN_1839 = 5'hf == _T_521 ? 5'h1c : _GEN_1838; // @[layers.scala 132:13]
  wire [4:0] _GEN_1840 = 5'h10 == _T_521 ? 5'h1e : _GEN_1839; // @[layers.scala 132:13]
  wire [4:0] _GEN_1841 = 5'h11 == _T_521 ? 5'h13 : _GEN_1840; // @[layers.scala 132:13]
  wire [4:0] _GEN_1842 = 5'h12 == _T_521 ? 5'h7 : _GEN_1841; // @[layers.scala 132:13]
  wire [4:0] _GEN_1843 = 5'h13 == _T_521 ? 5'he : _GEN_1842; // @[layers.scala 132:13]
  wire [4:0] _GEN_1844 = 5'h14 == _T_521 ? 5'h0 : _GEN_1843; // @[layers.scala 132:13]
  wire [4:0] _GEN_1845 = 5'h15 == _T_521 ? 5'hd : _GEN_1844; // @[layers.scala 132:13]
  wire [4:0] _GEN_1846 = 5'h16 == _T_521 ? 5'h11 : _GEN_1845; // @[layers.scala 132:13]
  wire [4:0] _GEN_1847 = 5'h17 == _T_521 ? 5'h18 : _GEN_1846; // @[layers.scala 132:13]
  wire [4:0] _GEN_1848 = 5'h18 == _T_521 ? 5'h10 : _GEN_1847; // @[layers.scala 132:13]
  wire [4:0] _GEN_1849 = 5'h19 == _T_521 ? 5'hc : _GEN_1848; // @[layers.scala 132:13]
  wire [4:0] _GEN_1850 = 5'h1a == _T_521 ? 5'h1 : _GEN_1849; // @[layers.scala 132:13]
  wire [4:0] _GEN_1851 = 5'h1b == _T_521 ? 5'h19 : _GEN_1850; // @[layers.scala 132:13]
  wire [4:0] _GEN_1852 = 5'h1c == _T_521 ? 5'h16 : _GEN_1851; // @[layers.scala 132:13]
  wire [4:0] _GEN_1853 = 5'h1d == _T_521 ? 5'ha : _GEN_1852; // @[layers.scala 132:13]
  wire [4:0] _GEN_1854 = 5'h1e == _T_521 ? 5'hf : _GEN_1853; // @[layers.scala 132:13]
  wire [4:0] temp_57 = 5'h1f == _T_521 ? 5'h17 : _GEN_1854; // @[layers.scala 132:13]
  wire [4:0] _T_530 = {io_x_in_0[58],io_x_in_1[58],io_x_in_2[58],io_x_in_3[58],io_x_in_4[58]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1857 = 5'h1 == _T_530 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1858 = 5'h2 == _T_530 ? 5'h1f : _GEN_1857; // @[layers.scala 132:13]
  wire [4:0] _GEN_1859 = 5'h3 == _T_530 ? 5'h14 : _GEN_1858; // @[layers.scala 132:13]
  wire [4:0] _GEN_1860 = 5'h4 == _T_530 ? 5'h1a : _GEN_1859; // @[layers.scala 132:13]
  wire [4:0] _GEN_1861 = 5'h5 == _T_530 ? 5'h15 : _GEN_1860; // @[layers.scala 132:13]
  wire [4:0] _GEN_1862 = 5'h6 == _T_530 ? 5'h9 : _GEN_1861; // @[layers.scala 132:13]
  wire [4:0] _GEN_1863 = 5'h7 == _T_530 ? 5'h2 : _GEN_1862; // @[layers.scala 132:13]
  wire [4:0] _GEN_1864 = 5'h8 == _T_530 ? 5'h1b : _GEN_1863; // @[layers.scala 132:13]
  wire [4:0] _GEN_1865 = 5'h9 == _T_530 ? 5'h5 : _GEN_1864; // @[layers.scala 132:13]
  wire [4:0] _GEN_1866 = 5'ha == _T_530 ? 5'h8 : _GEN_1865; // @[layers.scala 132:13]
  wire [4:0] _GEN_1867 = 5'hb == _T_530 ? 5'h12 : _GEN_1866; // @[layers.scala 132:13]
  wire [4:0] _GEN_1868 = 5'hc == _T_530 ? 5'h1d : _GEN_1867; // @[layers.scala 132:13]
  wire [4:0] _GEN_1869 = 5'hd == _T_530 ? 5'h3 : _GEN_1868; // @[layers.scala 132:13]
  wire [4:0] _GEN_1870 = 5'he == _T_530 ? 5'h6 : _GEN_1869; // @[layers.scala 132:13]
  wire [4:0] _GEN_1871 = 5'hf == _T_530 ? 5'h1c : _GEN_1870; // @[layers.scala 132:13]
  wire [4:0] _GEN_1872 = 5'h10 == _T_530 ? 5'h1e : _GEN_1871; // @[layers.scala 132:13]
  wire [4:0] _GEN_1873 = 5'h11 == _T_530 ? 5'h13 : _GEN_1872; // @[layers.scala 132:13]
  wire [4:0] _GEN_1874 = 5'h12 == _T_530 ? 5'h7 : _GEN_1873; // @[layers.scala 132:13]
  wire [4:0] _GEN_1875 = 5'h13 == _T_530 ? 5'he : _GEN_1874; // @[layers.scala 132:13]
  wire [4:0] _GEN_1876 = 5'h14 == _T_530 ? 5'h0 : _GEN_1875; // @[layers.scala 132:13]
  wire [4:0] _GEN_1877 = 5'h15 == _T_530 ? 5'hd : _GEN_1876; // @[layers.scala 132:13]
  wire [4:0] _GEN_1878 = 5'h16 == _T_530 ? 5'h11 : _GEN_1877; // @[layers.scala 132:13]
  wire [4:0] _GEN_1879 = 5'h17 == _T_530 ? 5'h18 : _GEN_1878; // @[layers.scala 132:13]
  wire [4:0] _GEN_1880 = 5'h18 == _T_530 ? 5'h10 : _GEN_1879; // @[layers.scala 132:13]
  wire [4:0] _GEN_1881 = 5'h19 == _T_530 ? 5'hc : _GEN_1880; // @[layers.scala 132:13]
  wire [4:0] _GEN_1882 = 5'h1a == _T_530 ? 5'h1 : _GEN_1881; // @[layers.scala 132:13]
  wire [4:0] _GEN_1883 = 5'h1b == _T_530 ? 5'h19 : _GEN_1882; // @[layers.scala 132:13]
  wire [4:0] _GEN_1884 = 5'h1c == _T_530 ? 5'h16 : _GEN_1883; // @[layers.scala 132:13]
  wire [4:0] _GEN_1885 = 5'h1d == _T_530 ? 5'ha : _GEN_1884; // @[layers.scala 132:13]
  wire [4:0] _GEN_1886 = 5'h1e == _T_530 ? 5'hf : _GEN_1885; // @[layers.scala 132:13]
  wire [4:0] temp_58 = 5'h1f == _T_530 ? 5'h17 : _GEN_1886; // @[layers.scala 132:13]
  wire [4:0] _T_539 = {io_x_in_0[59],io_x_in_1[59],io_x_in_2[59],io_x_in_3[59],io_x_in_4[59]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1889 = 5'h1 == _T_539 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1890 = 5'h2 == _T_539 ? 5'h1f : _GEN_1889; // @[layers.scala 132:13]
  wire [4:0] _GEN_1891 = 5'h3 == _T_539 ? 5'h14 : _GEN_1890; // @[layers.scala 132:13]
  wire [4:0] _GEN_1892 = 5'h4 == _T_539 ? 5'h1a : _GEN_1891; // @[layers.scala 132:13]
  wire [4:0] _GEN_1893 = 5'h5 == _T_539 ? 5'h15 : _GEN_1892; // @[layers.scala 132:13]
  wire [4:0] _GEN_1894 = 5'h6 == _T_539 ? 5'h9 : _GEN_1893; // @[layers.scala 132:13]
  wire [4:0] _GEN_1895 = 5'h7 == _T_539 ? 5'h2 : _GEN_1894; // @[layers.scala 132:13]
  wire [4:0] _GEN_1896 = 5'h8 == _T_539 ? 5'h1b : _GEN_1895; // @[layers.scala 132:13]
  wire [4:0] _GEN_1897 = 5'h9 == _T_539 ? 5'h5 : _GEN_1896; // @[layers.scala 132:13]
  wire [4:0] _GEN_1898 = 5'ha == _T_539 ? 5'h8 : _GEN_1897; // @[layers.scala 132:13]
  wire [4:0] _GEN_1899 = 5'hb == _T_539 ? 5'h12 : _GEN_1898; // @[layers.scala 132:13]
  wire [4:0] _GEN_1900 = 5'hc == _T_539 ? 5'h1d : _GEN_1899; // @[layers.scala 132:13]
  wire [4:0] _GEN_1901 = 5'hd == _T_539 ? 5'h3 : _GEN_1900; // @[layers.scala 132:13]
  wire [4:0] _GEN_1902 = 5'he == _T_539 ? 5'h6 : _GEN_1901; // @[layers.scala 132:13]
  wire [4:0] _GEN_1903 = 5'hf == _T_539 ? 5'h1c : _GEN_1902; // @[layers.scala 132:13]
  wire [4:0] _GEN_1904 = 5'h10 == _T_539 ? 5'h1e : _GEN_1903; // @[layers.scala 132:13]
  wire [4:0] _GEN_1905 = 5'h11 == _T_539 ? 5'h13 : _GEN_1904; // @[layers.scala 132:13]
  wire [4:0] _GEN_1906 = 5'h12 == _T_539 ? 5'h7 : _GEN_1905; // @[layers.scala 132:13]
  wire [4:0] _GEN_1907 = 5'h13 == _T_539 ? 5'he : _GEN_1906; // @[layers.scala 132:13]
  wire [4:0] _GEN_1908 = 5'h14 == _T_539 ? 5'h0 : _GEN_1907; // @[layers.scala 132:13]
  wire [4:0] _GEN_1909 = 5'h15 == _T_539 ? 5'hd : _GEN_1908; // @[layers.scala 132:13]
  wire [4:0] _GEN_1910 = 5'h16 == _T_539 ? 5'h11 : _GEN_1909; // @[layers.scala 132:13]
  wire [4:0] _GEN_1911 = 5'h17 == _T_539 ? 5'h18 : _GEN_1910; // @[layers.scala 132:13]
  wire [4:0] _GEN_1912 = 5'h18 == _T_539 ? 5'h10 : _GEN_1911; // @[layers.scala 132:13]
  wire [4:0] _GEN_1913 = 5'h19 == _T_539 ? 5'hc : _GEN_1912; // @[layers.scala 132:13]
  wire [4:0] _GEN_1914 = 5'h1a == _T_539 ? 5'h1 : _GEN_1913; // @[layers.scala 132:13]
  wire [4:0] _GEN_1915 = 5'h1b == _T_539 ? 5'h19 : _GEN_1914; // @[layers.scala 132:13]
  wire [4:0] _GEN_1916 = 5'h1c == _T_539 ? 5'h16 : _GEN_1915; // @[layers.scala 132:13]
  wire [4:0] _GEN_1917 = 5'h1d == _T_539 ? 5'ha : _GEN_1916; // @[layers.scala 132:13]
  wire [4:0] _GEN_1918 = 5'h1e == _T_539 ? 5'hf : _GEN_1917; // @[layers.scala 132:13]
  wire [4:0] temp_59 = 5'h1f == _T_539 ? 5'h17 : _GEN_1918; // @[layers.scala 132:13]
  wire [4:0] _T_548 = {io_x_in_0[60],io_x_in_1[60],io_x_in_2[60],io_x_in_3[60],io_x_in_4[60]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1921 = 5'h1 == _T_548 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1922 = 5'h2 == _T_548 ? 5'h1f : _GEN_1921; // @[layers.scala 132:13]
  wire [4:0] _GEN_1923 = 5'h3 == _T_548 ? 5'h14 : _GEN_1922; // @[layers.scala 132:13]
  wire [4:0] _GEN_1924 = 5'h4 == _T_548 ? 5'h1a : _GEN_1923; // @[layers.scala 132:13]
  wire [4:0] _GEN_1925 = 5'h5 == _T_548 ? 5'h15 : _GEN_1924; // @[layers.scala 132:13]
  wire [4:0] _GEN_1926 = 5'h6 == _T_548 ? 5'h9 : _GEN_1925; // @[layers.scala 132:13]
  wire [4:0] _GEN_1927 = 5'h7 == _T_548 ? 5'h2 : _GEN_1926; // @[layers.scala 132:13]
  wire [4:0] _GEN_1928 = 5'h8 == _T_548 ? 5'h1b : _GEN_1927; // @[layers.scala 132:13]
  wire [4:0] _GEN_1929 = 5'h9 == _T_548 ? 5'h5 : _GEN_1928; // @[layers.scala 132:13]
  wire [4:0] _GEN_1930 = 5'ha == _T_548 ? 5'h8 : _GEN_1929; // @[layers.scala 132:13]
  wire [4:0] _GEN_1931 = 5'hb == _T_548 ? 5'h12 : _GEN_1930; // @[layers.scala 132:13]
  wire [4:0] _GEN_1932 = 5'hc == _T_548 ? 5'h1d : _GEN_1931; // @[layers.scala 132:13]
  wire [4:0] _GEN_1933 = 5'hd == _T_548 ? 5'h3 : _GEN_1932; // @[layers.scala 132:13]
  wire [4:0] _GEN_1934 = 5'he == _T_548 ? 5'h6 : _GEN_1933; // @[layers.scala 132:13]
  wire [4:0] _GEN_1935 = 5'hf == _T_548 ? 5'h1c : _GEN_1934; // @[layers.scala 132:13]
  wire [4:0] _GEN_1936 = 5'h10 == _T_548 ? 5'h1e : _GEN_1935; // @[layers.scala 132:13]
  wire [4:0] _GEN_1937 = 5'h11 == _T_548 ? 5'h13 : _GEN_1936; // @[layers.scala 132:13]
  wire [4:0] _GEN_1938 = 5'h12 == _T_548 ? 5'h7 : _GEN_1937; // @[layers.scala 132:13]
  wire [4:0] _GEN_1939 = 5'h13 == _T_548 ? 5'he : _GEN_1938; // @[layers.scala 132:13]
  wire [4:0] _GEN_1940 = 5'h14 == _T_548 ? 5'h0 : _GEN_1939; // @[layers.scala 132:13]
  wire [4:0] _GEN_1941 = 5'h15 == _T_548 ? 5'hd : _GEN_1940; // @[layers.scala 132:13]
  wire [4:0] _GEN_1942 = 5'h16 == _T_548 ? 5'h11 : _GEN_1941; // @[layers.scala 132:13]
  wire [4:0] _GEN_1943 = 5'h17 == _T_548 ? 5'h18 : _GEN_1942; // @[layers.scala 132:13]
  wire [4:0] _GEN_1944 = 5'h18 == _T_548 ? 5'h10 : _GEN_1943; // @[layers.scala 132:13]
  wire [4:0] _GEN_1945 = 5'h19 == _T_548 ? 5'hc : _GEN_1944; // @[layers.scala 132:13]
  wire [4:0] _GEN_1946 = 5'h1a == _T_548 ? 5'h1 : _GEN_1945; // @[layers.scala 132:13]
  wire [4:0] _GEN_1947 = 5'h1b == _T_548 ? 5'h19 : _GEN_1946; // @[layers.scala 132:13]
  wire [4:0] _GEN_1948 = 5'h1c == _T_548 ? 5'h16 : _GEN_1947; // @[layers.scala 132:13]
  wire [4:0] _GEN_1949 = 5'h1d == _T_548 ? 5'ha : _GEN_1948; // @[layers.scala 132:13]
  wire [4:0] _GEN_1950 = 5'h1e == _T_548 ? 5'hf : _GEN_1949; // @[layers.scala 132:13]
  wire [4:0] temp_60 = 5'h1f == _T_548 ? 5'h17 : _GEN_1950; // @[layers.scala 132:13]
  wire [4:0] _T_557 = {io_x_in_0[61],io_x_in_1[61],io_x_in_2[61],io_x_in_3[61],io_x_in_4[61]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1953 = 5'h1 == _T_557 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1954 = 5'h2 == _T_557 ? 5'h1f : _GEN_1953; // @[layers.scala 132:13]
  wire [4:0] _GEN_1955 = 5'h3 == _T_557 ? 5'h14 : _GEN_1954; // @[layers.scala 132:13]
  wire [4:0] _GEN_1956 = 5'h4 == _T_557 ? 5'h1a : _GEN_1955; // @[layers.scala 132:13]
  wire [4:0] _GEN_1957 = 5'h5 == _T_557 ? 5'h15 : _GEN_1956; // @[layers.scala 132:13]
  wire [4:0] _GEN_1958 = 5'h6 == _T_557 ? 5'h9 : _GEN_1957; // @[layers.scala 132:13]
  wire [4:0] _GEN_1959 = 5'h7 == _T_557 ? 5'h2 : _GEN_1958; // @[layers.scala 132:13]
  wire [4:0] _GEN_1960 = 5'h8 == _T_557 ? 5'h1b : _GEN_1959; // @[layers.scala 132:13]
  wire [4:0] _GEN_1961 = 5'h9 == _T_557 ? 5'h5 : _GEN_1960; // @[layers.scala 132:13]
  wire [4:0] _GEN_1962 = 5'ha == _T_557 ? 5'h8 : _GEN_1961; // @[layers.scala 132:13]
  wire [4:0] _GEN_1963 = 5'hb == _T_557 ? 5'h12 : _GEN_1962; // @[layers.scala 132:13]
  wire [4:0] _GEN_1964 = 5'hc == _T_557 ? 5'h1d : _GEN_1963; // @[layers.scala 132:13]
  wire [4:0] _GEN_1965 = 5'hd == _T_557 ? 5'h3 : _GEN_1964; // @[layers.scala 132:13]
  wire [4:0] _GEN_1966 = 5'he == _T_557 ? 5'h6 : _GEN_1965; // @[layers.scala 132:13]
  wire [4:0] _GEN_1967 = 5'hf == _T_557 ? 5'h1c : _GEN_1966; // @[layers.scala 132:13]
  wire [4:0] _GEN_1968 = 5'h10 == _T_557 ? 5'h1e : _GEN_1967; // @[layers.scala 132:13]
  wire [4:0] _GEN_1969 = 5'h11 == _T_557 ? 5'h13 : _GEN_1968; // @[layers.scala 132:13]
  wire [4:0] _GEN_1970 = 5'h12 == _T_557 ? 5'h7 : _GEN_1969; // @[layers.scala 132:13]
  wire [4:0] _GEN_1971 = 5'h13 == _T_557 ? 5'he : _GEN_1970; // @[layers.scala 132:13]
  wire [4:0] _GEN_1972 = 5'h14 == _T_557 ? 5'h0 : _GEN_1971; // @[layers.scala 132:13]
  wire [4:0] _GEN_1973 = 5'h15 == _T_557 ? 5'hd : _GEN_1972; // @[layers.scala 132:13]
  wire [4:0] _GEN_1974 = 5'h16 == _T_557 ? 5'h11 : _GEN_1973; // @[layers.scala 132:13]
  wire [4:0] _GEN_1975 = 5'h17 == _T_557 ? 5'h18 : _GEN_1974; // @[layers.scala 132:13]
  wire [4:0] _GEN_1976 = 5'h18 == _T_557 ? 5'h10 : _GEN_1975; // @[layers.scala 132:13]
  wire [4:0] _GEN_1977 = 5'h19 == _T_557 ? 5'hc : _GEN_1976; // @[layers.scala 132:13]
  wire [4:0] _GEN_1978 = 5'h1a == _T_557 ? 5'h1 : _GEN_1977; // @[layers.scala 132:13]
  wire [4:0] _GEN_1979 = 5'h1b == _T_557 ? 5'h19 : _GEN_1978; // @[layers.scala 132:13]
  wire [4:0] _GEN_1980 = 5'h1c == _T_557 ? 5'h16 : _GEN_1979; // @[layers.scala 132:13]
  wire [4:0] _GEN_1981 = 5'h1d == _T_557 ? 5'ha : _GEN_1980; // @[layers.scala 132:13]
  wire [4:0] _GEN_1982 = 5'h1e == _T_557 ? 5'hf : _GEN_1981; // @[layers.scala 132:13]
  wire [4:0] temp_61 = 5'h1f == _T_557 ? 5'h17 : _GEN_1982; // @[layers.scala 132:13]
  wire [4:0] _T_566 = {io_x_in_0[62],io_x_in_1[62],io_x_in_2[62],io_x_in_3[62],io_x_in_4[62]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_1985 = 5'h1 == _T_566 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_1986 = 5'h2 == _T_566 ? 5'h1f : _GEN_1985; // @[layers.scala 132:13]
  wire [4:0] _GEN_1987 = 5'h3 == _T_566 ? 5'h14 : _GEN_1986; // @[layers.scala 132:13]
  wire [4:0] _GEN_1988 = 5'h4 == _T_566 ? 5'h1a : _GEN_1987; // @[layers.scala 132:13]
  wire [4:0] _GEN_1989 = 5'h5 == _T_566 ? 5'h15 : _GEN_1988; // @[layers.scala 132:13]
  wire [4:0] _GEN_1990 = 5'h6 == _T_566 ? 5'h9 : _GEN_1989; // @[layers.scala 132:13]
  wire [4:0] _GEN_1991 = 5'h7 == _T_566 ? 5'h2 : _GEN_1990; // @[layers.scala 132:13]
  wire [4:0] _GEN_1992 = 5'h8 == _T_566 ? 5'h1b : _GEN_1991; // @[layers.scala 132:13]
  wire [4:0] _GEN_1993 = 5'h9 == _T_566 ? 5'h5 : _GEN_1992; // @[layers.scala 132:13]
  wire [4:0] _GEN_1994 = 5'ha == _T_566 ? 5'h8 : _GEN_1993; // @[layers.scala 132:13]
  wire [4:0] _GEN_1995 = 5'hb == _T_566 ? 5'h12 : _GEN_1994; // @[layers.scala 132:13]
  wire [4:0] _GEN_1996 = 5'hc == _T_566 ? 5'h1d : _GEN_1995; // @[layers.scala 132:13]
  wire [4:0] _GEN_1997 = 5'hd == _T_566 ? 5'h3 : _GEN_1996; // @[layers.scala 132:13]
  wire [4:0] _GEN_1998 = 5'he == _T_566 ? 5'h6 : _GEN_1997; // @[layers.scala 132:13]
  wire [4:0] _GEN_1999 = 5'hf == _T_566 ? 5'h1c : _GEN_1998; // @[layers.scala 132:13]
  wire [4:0] _GEN_2000 = 5'h10 == _T_566 ? 5'h1e : _GEN_1999; // @[layers.scala 132:13]
  wire [4:0] _GEN_2001 = 5'h11 == _T_566 ? 5'h13 : _GEN_2000; // @[layers.scala 132:13]
  wire [4:0] _GEN_2002 = 5'h12 == _T_566 ? 5'h7 : _GEN_2001; // @[layers.scala 132:13]
  wire [4:0] _GEN_2003 = 5'h13 == _T_566 ? 5'he : _GEN_2002; // @[layers.scala 132:13]
  wire [4:0] _GEN_2004 = 5'h14 == _T_566 ? 5'h0 : _GEN_2003; // @[layers.scala 132:13]
  wire [4:0] _GEN_2005 = 5'h15 == _T_566 ? 5'hd : _GEN_2004; // @[layers.scala 132:13]
  wire [4:0] _GEN_2006 = 5'h16 == _T_566 ? 5'h11 : _GEN_2005; // @[layers.scala 132:13]
  wire [4:0] _GEN_2007 = 5'h17 == _T_566 ? 5'h18 : _GEN_2006; // @[layers.scala 132:13]
  wire [4:0] _GEN_2008 = 5'h18 == _T_566 ? 5'h10 : _GEN_2007; // @[layers.scala 132:13]
  wire [4:0] _GEN_2009 = 5'h19 == _T_566 ? 5'hc : _GEN_2008; // @[layers.scala 132:13]
  wire [4:0] _GEN_2010 = 5'h1a == _T_566 ? 5'h1 : _GEN_2009; // @[layers.scala 132:13]
  wire [4:0] _GEN_2011 = 5'h1b == _T_566 ? 5'h19 : _GEN_2010; // @[layers.scala 132:13]
  wire [4:0] _GEN_2012 = 5'h1c == _T_566 ? 5'h16 : _GEN_2011; // @[layers.scala 132:13]
  wire [4:0] _GEN_2013 = 5'h1d == _T_566 ? 5'ha : _GEN_2012; // @[layers.scala 132:13]
  wire [4:0] _GEN_2014 = 5'h1e == _T_566 ? 5'hf : _GEN_2013; // @[layers.scala 132:13]
  wire [4:0] temp_62 = 5'h1f == _T_566 ? 5'h17 : _GEN_2014; // @[layers.scala 132:13]
  wire [4:0] _T_575 = {io_x_in_0[63],io_x_in_1[63],io_x_in_2[63],io_x_in_3[63],io_x_in_4[63]}; // @[Cat.scala 29:58]
  wire [4:0] _GEN_2017 = 5'h1 == _T_575 ? 5'hb : 5'h4; // @[layers.scala 132:13]
  wire [4:0] _GEN_2018 = 5'h2 == _T_575 ? 5'h1f : _GEN_2017; // @[layers.scala 132:13]
  wire [4:0] _GEN_2019 = 5'h3 == _T_575 ? 5'h14 : _GEN_2018; // @[layers.scala 132:13]
  wire [4:0] _GEN_2020 = 5'h4 == _T_575 ? 5'h1a : _GEN_2019; // @[layers.scala 132:13]
  wire [4:0] _GEN_2021 = 5'h5 == _T_575 ? 5'h15 : _GEN_2020; // @[layers.scala 132:13]
  wire [4:0] _GEN_2022 = 5'h6 == _T_575 ? 5'h9 : _GEN_2021; // @[layers.scala 132:13]
  wire [4:0] _GEN_2023 = 5'h7 == _T_575 ? 5'h2 : _GEN_2022; // @[layers.scala 132:13]
  wire [4:0] _GEN_2024 = 5'h8 == _T_575 ? 5'h1b : _GEN_2023; // @[layers.scala 132:13]
  wire [4:0] _GEN_2025 = 5'h9 == _T_575 ? 5'h5 : _GEN_2024; // @[layers.scala 132:13]
  wire [4:0] _GEN_2026 = 5'ha == _T_575 ? 5'h8 : _GEN_2025; // @[layers.scala 132:13]
  wire [4:0] _GEN_2027 = 5'hb == _T_575 ? 5'h12 : _GEN_2026; // @[layers.scala 132:13]
  wire [4:0] _GEN_2028 = 5'hc == _T_575 ? 5'h1d : _GEN_2027; // @[layers.scala 132:13]
  wire [4:0] _GEN_2029 = 5'hd == _T_575 ? 5'h3 : _GEN_2028; // @[layers.scala 132:13]
  wire [4:0] _GEN_2030 = 5'he == _T_575 ? 5'h6 : _GEN_2029; // @[layers.scala 132:13]
  wire [4:0] _GEN_2031 = 5'hf == _T_575 ? 5'h1c : _GEN_2030; // @[layers.scala 132:13]
  wire [4:0] _GEN_2032 = 5'h10 == _T_575 ? 5'h1e : _GEN_2031; // @[layers.scala 132:13]
  wire [4:0] _GEN_2033 = 5'h11 == _T_575 ? 5'h13 : _GEN_2032; // @[layers.scala 132:13]
  wire [4:0] _GEN_2034 = 5'h12 == _T_575 ? 5'h7 : _GEN_2033; // @[layers.scala 132:13]
  wire [4:0] _GEN_2035 = 5'h13 == _T_575 ? 5'he : _GEN_2034; // @[layers.scala 132:13]
  wire [4:0] _GEN_2036 = 5'h14 == _T_575 ? 5'h0 : _GEN_2035; // @[layers.scala 132:13]
  wire [4:0] _GEN_2037 = 5'h15 == _T_575 ? 5'hd : _GEN_2036; // @[layers.scala 132:13]
  wire [4:0] _GEN_2038 = 5'h16 == _T_575 ? 5'h11 : _GEN_2037; // @[layers.scala 132:13]
  wire [4:0] _GEN_2039 = 5'h17 == _T_575 ? 5'h18 : _GEN_2038; // @[layers.scala 132:13]
  wire [4:0] _GEN_2040 = 5'h18 == _T_575 ? 5'h10 : _GEN_2039; // @[layers.scala 132:13]
  wire [4:0] _GEN_2041 = 5'h19 == _T_575 ? 5'hc : _GEN_2040; // @[layers.scala 132:13]
  wire [4:0] _GEN_2042 = 5'h1a == _T_575 ? 5'h1 : _GEN_2041; // @[layers.scala 132:13]
  wire [4:0] _GEN_2043 = 5'h1b == _T_575 ? 5'h19 : _GEN_2042; // @[layers.scala 132:13]
  wire [4:0] _GEN_2044 = 5'h1c == _T_575 ? 5'h16 : _GEN_2043; // @[layers.scala 132:13]
  wire [4:0] _GEN_2045 = 5'h1d == _T_575 ? 5'ha : _GEN_2044; // @[layers.scala 132:13]
  wire [4:0] _GEN_2046 = 5'h1e == _T_575 ? 5'hf : _GEN_2045; // @[layers.scala 132:13]
  wire [4:0] temp_63 = 5'h1f == _T_575 ? 5'h17 : _GEN_2046; // @[layers.scala 132:13]
  wire [7:0] _T_646 = {temp_7[4],temp_6[4],temp_5[4],temp_4[4],temp_3[4],temp_2[4],temp_1[4],temp_0[4]}; // @[Cat.scala 29:58]
  wire [15:0] _T_654 = {temp_15[4],temp_14[4],temp_13[4],temp_12[4],temp_11[4],temp_10[4],temp_9[4],temp_8[4],_T_646}; // @[Cat.scala 29:58]
  wire [7:0] _T_661 = {temp_23[4],temp_22[4],temp_21[4],temp_20[4],temp_19[4],temp_18[4],temp_17[4],temp_16[4]}; // @[Cat.scala 29:58]
  wire [31:0] _T_670 = {temp_31[4],temp_30[4],temp_29[4],temp_28[4],temp_27[4],temp_26[4],temp_25[4],temp_24[4],_T_661,_T_654}; // @[Cat.scala 29:58]
  wire [7:0] _T_677 = {temp_39[4],temp_38[4],temp_37[4],temp_36[4],temp_35[4],temp_34[4],temp_33[4],temp_32[4]}; // @[Cat.scala 29:58]
  wire [15:0] _T_685 = {temp_47[4],temp_46[4],temp_45[4],temp_44[4],temp_43[4],temp_42[4],temp_41[4],temp_40[4],_T_677}; // @[Cat.scala 29:58]
  wire [7:0] _T_692 = {temp_55[4],temp_54[4],temp_53[4],temp_52[4],temp_51[4],temp_50[4],temp_49[4],temp_48[4]}; // @[Cat.scala 29:58]
  wire [31:0] _T_701 = {temp_63[4],temp_62[4],temp_61[4],temp_60[4],temp_59[4],temp_58[4],temp_57[4],temp_56[4],_T_692,_T_685}; // @[Cat.scala 29:58]
  wire [7:0] _T_773 = {temp_7[3],temp_6[3],temp_5[3],temp_4[3],temp_3[3],temp_2[3],temp_1[3],temp_0[3]}; // @[Cat.scala 29:58]
  wire [15:0] _T_781 = {temp_15[3],temp_14[3],temp_13[3],temp_12[3],temp_11[3],temp_10[3],temp_9[3],temp_8[3],_T_773}; // @[Cat.scala 29:58]
  wire [7:0] _T_788 = {temp_23[3],temp_22[3],temp_21[3],temp_20[3],temp_19[3],temp_18[3],temp_17[3],temp_16[3]}; // @[Cat.scala 29:58]
  wire [31:0] _T_797 = {temp_31[3],temp_30[3],temp_29[3],temp_28[3],temp_27[3],temp_26[3],temp_25[3],temp_24[3],_T_788,_T_781}; // @[Cat.scala 29:58]
  wire [7:0] _T_804 = {temp_39[3],temp_38[3],temp_37[3],temp_36[3],temp_35[3],temp_34[3],temp_33[3],temp_32[3]}; // @[Cat.scala 29:58]
  wire [15:0] _T_812 = {temp_47[3],temp_46[3],temp_45[3],temp_44[3],temp_43[3],temp_42[3],temp_41[3],temp_40[3],_T_804}; // @[Cat.scala 29:58]
  wire [7:0] _T_819 = {temp_55[3],temp_54[3],temp_53[3],temp_52[3],temp_51[3],temp_50[3],temp_49[3],temp_48[3]}; // @[Cat.scala 29:58]
  wire [31:0] _T_828 = {temp_63[3],temp_62[3],temp_61[3],temp_60[3],temp_59[3],temp_58[3],temp_57[3],temp_56[3],_T_819,_T_812}; // @[Cat.scala 29:58]
  wire [7:0] _T_900 = {temp_7[2],temp_6[2],temp_5[2],temp_4[2],temp_3[2],temp_2[2],temp_1[2],temp_0[2]}; // @[Cat.scala 29:58]
  wire [15:0] _T_908 = {temp_15[2],temp_14[2],temp_13[2],temp_12[2],temp_11[2],temp_10[2],temp_9[2],temp_8[2],_T_900}; // @[Cat.scala 29:58]
  wire [7:0] _T_915 = {temp_23[2],temp_22[2],temp_21[2],temp_20[2],temp_19[2],temp_18[2],temp_17[2],temp_16[2]}; // @[Cat.scala 29:58]
  wire [31:0] _T_924 = {temp_31[2],temp_30[2],temp_29[2],temp_28[2],temp_27[2],temp_26[2],temp_25[2],temp_24[2],_T_915,_T_908}; // @[Cat.scala 29:58]
  wire [7:0] _T_931 = {temp_39[2],temp_38[2],temp_37[2],temp_36[2],temp_35[2],temp_34[2],temp_33[2],temp_32[2]}; // @[Cat.scala 29:58]
  wire [15:0] _T_939 = {temp_47[2],temp_46[2],temp_45[2],temp_44[2],temp_43[2],temp_42[2],temp_41[2],temp_40[2],_T_931}; // @[Cat.scala 29:58]
  wire [7:0] _T_946 = {temp_55[2],temp_54[2],temp_53[2],temp_52[2],temp_51[2],temp_50[2],temp_49[2],temp_48[2]}; // @[Cat.scala 29:58]
  wire [31:0] _T_955 = {temp_63[2],temp_62[2],temp_61[2],temp_60[2],temp_59[2],temp_58[2],temp_57[2],temp_56[2],_T_946,_T_939}; // @[Cat.scala 29:58]
  wire [7:0] _T_1027 = {temp_7[1],temp_6[1],temp_5[1],temp_4[1],temp_3[1],temp_2[1],temp_1[1],temp_0[1]}; // @[Cat.scala 29:58]
  wire [15:0] _T_1035 = {temp_15[1],temp_14[1],temp_13[1],temp_12[1],temp_11[1],temp_10[1],temp_9[1],temp_8[1],_T_1027}; // @[Cat.scala 29:58]
  wire [7:0] _T_1042 = {temp_23[1],temp_22[1],temp_21[1],temp_20[1],temp_19[1],temp_18[1],temp_17[1],temp_16[1]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1051 = {temp_31[1],temp_30[1],temp_29[1],temp_28[1],temp_27[1],temp_26[1],temp_25[1],temp_24[1],_T_1042,_T_1035}; // @[Cat.scala 29:58]
  wire [7:0] _T_1058 = {temp_39[1],temp_38[1],temp_37[1],temp_36[1],temp_35[1],temp_34[1],temp_33[1],temp_32[1]}; // @[Cat.scala 29:58]
  wire [15:0] _T_1066 = {temp_47[1],temp_46[1],temp_45[1],temp_44[1],temp_43[1],temp_42[1],temp_41[1],temp_40[1],_T_1058}; // @[Cat.scala 29:58]
  wire [7:0] _T_1073 = {temp_55[1],temp_54[1],temp_53[1],temp_52[1],temp_51[1],temp_50[1],temp_49[1],temp_48[1]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1082 = {temp_63[1],temp_62[1],temp_61[1],temp_60[1],temp_59[1],temp_58[1],temp_57[1],temp_56[1],_T_1073,_T_1066}; // @[Cat.scala 29:58]
  wire [7:0] _T_1154 = {temp_7[0],temp_6[0],temp_5[0],temp_4[0],temp_3[0],temp_2[0],temp_1[0],temp_0[0]}; // @[Cat.scala 29:58]
  wire [15:0] _T_1162 = {temp_15[0],temp_14[0],temp_13[0],temp_12[0],temp_11[0],temp_10[0],temp_9[0],temp_8[0],_T_1154}; // @[Cat.scala 29:58]
  wire [7:0] _T_1169 = {temp_23[0],temp_22[0],temp_21[0],temp_20[0],temp_19[0],temp_18[0],temp_17[0],temp_16[0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1178 = {temp_31[0],temp_30[0],temp_29[0],temp_28[0],temp_27[0],temp_26[0],temp_25[0],temp_24[0],_T_1169,_T_1162}; // @[Cat.scala 29:58]
  wire [7:0] _T_1185 = {temp_39[0],temp_38[0],temp_37[0],temp_36[0],temp_35[0],temp_34[0],temp_33[0],temp_32[0]}; // @[Cat.scala 29:58]
  wire [15:0] _T_1193 = {temp_47[0],temp_46[0],temp_45[0],temp_44[0],temp_43[0],temp_42[0],temp_41[0],temp_40[0],_T_1185}; // @[Cat.scala 29:58]
  wire [7:0] _T_1200 = {temp_55[0],temp_54[0],temp_53[0],temp_52[0],temp_51[0],temp_50[0],temp_49[0],temp_48[0]}; // @[Cat.scala 29:58]
  wire [31:0] _T_1209 = {temp_63[0],temp_62[0],temp_61[0],temp_60[0],temp_59[0],temp_58[0],temp_57[0],temp_56[0],_T_1200,_T_1193}; // @[Cat.scala 29:58]
  assign io_x_out_0 = {_T_701,_T_670}; // @[layers.scala 136:17]
  assign io_x_out_1 = {_T_828,_T_797}; // @[layers.scala 136:17]
  assign io_x_out_2 = {_T_955,_T_924}; // @[layers.scala 136:17]
  assign io_x_out_3 = {_T_1082,_T_1051}; // @[layers.scala 136:17]
  assign io_x_out_4 = {_T_1209,_T_1178}; // @[layers.scala 136:17]
endmodule
module diffusion_layer(
  input  [63:0] io_x_in_0,
  input  [63:0] io_x_in_1,
  input  [63:0] io_x_in_2,
  input  [63:0] io_x_in_3,
  input  [63:0] io_x_in_4,
  output [63:0] io_x_out_0,
  output [63:0] io_x_out_1,
  output [63:0] io_x_out_2,
  output [63:0] io_x_out_3,
  output [63:0] io_x_out_4
);
  wire [63:0] _T_2 = {io_x_in_0[18:0],io_x_in_0[63:19]}; // @[Cat.scala 29:58]
  wire [63:0] _T_3 = io_x_in_0 ^ _T_2; // @[layers.scala 148:31]
  wire [63:0] _T_6 = {io_x_in_0[27:0],io_x_in_0[63:28]}; // @[Cat.scala 29:58]
  wire [63:0] _T_10 = {io_x_in_1[60:0],io_x_in_1[63:61]}; // @[Cat.scala 29:58]
  wire [63:0] _T_11 = io_x_in_1 ^ _T_10; // @[layers.scala 149:31]
  wire [63:0] _T_14 = {io_x_in_1[38:0],io_x_in_1[63:39]}; // @[Cat.scala 29:58]
  wire [63:0] _T_18 = {io_x_in_2[0],io_x_in_2[63:1]}; // @[Cat.scala 29:58]
  wire [63:0] _T_19 = io_x_in_2 ^ _T_18; // @[layers.scala 150:31]
  wire [63:0] _T_22 = {io_x_in_2[5:0],io_x_in_2[63:6]}; // @[Cat.scala 29:58]
  wire [63:0] _T_26 = {io_x_in_3[9:0],io_x_in_3[63:10]}; // @[Cat.scala 29:58]
  wire [63:0] _T_27 = io_x_in_3 ^ _T_26; // @[layers.scala 151:31]
  wire [63:0] _T_30 = {io_x_in_3[16:0],io_x_in_3[63:17]}; // @[Cat.scala 29:58]
  wire [63:0] _T_34 = {io_x_in_4[6:0],io_x_in_4[63:7]}; // @[Cat.scala 29:58]
  wire [63:0] _T_35 = io_x_in_4 ^ _T_34; // @[layers.scala 152:31]
  wire [63:0] _T_38 = {io_x_in_4[40:0],io_x_in_4[63:41]}; // @[Cat.scala 29:58]
  assign io_x_out_0 = _T_3 ^ _T_6; // @[layers.scala 148:17]
  assign io_x_out_1 = _T_11 ^ _T_14; // @[layers.scala 149:17]
  assign io_x_out_2 = _T_19 ^ _T_22; // @[layers.scala 150:17]
  assign io_x_out_3 = _T_27 ^ _T_30; // @[layers.scala 151:17]
  assign io_x_out_4 = _T_35 ^ _T_38; // @[layers.scala 152:17]
endmodule
module permutation_two(
  input         clock,
  input  [7:0]  io_round_in,
  input  [63:0] io_x_in_0,
  input  [63:0] io_x_in_1,
  input  [63:0] io_x_in_2,
  input  [63:0] io_x_in_3,
  input  [63:0] io_x_in_4,
  output [63:0] io_x_out_0,
  output [63:0] io_x_out_1,
  output [63:0] io_x_out_2,
  output [63:0] io_x_out_3,
  output [63:0] io_x_out_4,
  input         io_clk,
  input         io_rst
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] addition_io_round_in; // @[permutation.scala 122:26]
  wire [63:0] addition_io_x2_in; // @[permutation.scala 122:26]
  wire [63:0] addition_io_x2_out; // @[permutation.scala 122:26]
  wire  addition_io_clk; // @[permutation.scala 122:26]
  wire  addition_io_rst; // @[permutation.scala 122:26]
  wire [63:0] substitution_io_x_in_0; // @[permutation.scala 123:30]
  wire [63:0] substitution_io_x_in_1; // @[permutation.scala 123:30]
  wire [63:0] substitution_io_x_in_2; // @[permutation.scala 123:30]
  wire [63:0] substitution_io_x_in_3; // @[permutation.scala 123:30]
  wire [63:0] substitution_io_x_in_4; // @[permutation.scala 123:30]
  wire [63:0] substitution_io_x_out_0; // @[permutation.scala 123:30]
  wire [63:0] substitution_io_x_out_1; // @[permutation.scala 123:30]
  wire [63:0] substitution_io_x_out_2; // @[permutation.scala 123:30]
  wire [63:0] substitution_io_x_out_3; // @[permutation.scala 123:30]
  wire [63:0] substitution_io_x_out_4; // @[permutation.scala 123:30]
  wire [63:0] diffusion_io_x_in_0; // @[permutation.scala 124:26]
  wire [63:0] diffusion_io_x_in_1; // @[permutation.scala 124:26]
  wire [63:0] diffusion_io_x_in_2; // @[permutation.scala 124:26]
  wire [63:0] diffusion_io_x_in_3; // @[permutation.scala 124:26]
  wire [63:0] diffusion_io_x_in_4; // @[permutation.scala 124:26]
  wire [63:0] diffusion_io_x_out_0; // @[permutation.scala 124:26]
  wire [63:0] diffusion_io_x_out_1; // @[permutation.scala 124:26]
  wire [63:0] diffusion_io_x_out_2; // @[permutation.scala 124:26]
  wire [63:0] diffusion_io_x_out_3; // @[permutation.scala 124:26]
  wire [63:0] diffusion_io_x_out_4; // @[permutation.scala 124:26]
  reg [63:0] substitution_reg_0; // @[permutation.scala 125:31]
  reg [63:0] substitution_reg_1; // @[permutation.scala 125:31]
  reg [63:0] substitution_reg_2; // @[permutation.scala 125:31]
  reg [63:0] substitution_reg_3; // @[permutation.scala 125:31]
  reg [63:0] substitution_reg_4; // @[permutation.scala 125:31]
  addition_layer addition ( // @[permutation.scala 122:26]
    .io_round_in(addition_io_round_in),
    .io_x2_in(addition_io_x2_in),
    .io_x2_out(addition_io_x2_out),
    .io_clk(addition_io_clk),
    .io_rst(addition_io_rst)
  );
  substitution_layer substitution ( // @[permutation.scala 123:30]
    .io_x_in_0(substitution_io_x_in_0),
    .io_x_in_1(substitution_io_x_in_1),
    .io_x_in_2(substitution_io_x_in_2),
    .io_x_in_3(substitution_io_x_in_3),
    .io_x_in_4(substitution_io_x_in_4),
    .io_x_out_0(substitution_io_x_out_0),
    .io_x_out_1(substitution_io_x_out_1),
    .io_x_out_2(substitution_io_x_out_2),
    .io_x_out_3(substitution_io_x_out_3),
    .io_x_out_4(substitution_io_x_out_4)
  );
  diffusion_layer diffusion ( // @[permutation.scala 124:26]
    .io_x_in_0(diffusion_io_x_in_0),
    .io_x_in_1(diffusion_io_x_in_1),
    .io_x_in_2(diffusion_io_x_in_2),
    .io_x_in_3(diffusion_io_x_in_3),
    .io_x_in_4(diffusion_io_x_in_4),
    .io_x_out_0(diffusion_io_x_out_0),
    .io_x_out_1(diffusion_io_x_out_1),
    .io_x_out_2(diffusion_io_x_out_2),
    .io_x_out_3(diffusion_io_x_out_3),
    .io_x_out_4(diffusion_io_x_out_4)
  );
  assign io_x_out_0 = diffusion_io_x_out_0; // @[permutation.scala 150:17]
  assign io_x_out_1 = diffusion_io_x_out_1; // @[permutation.scala 151:17]
  assign io_x_out_2 = diffusion_io_x_out_2; // @[permutation.scala 152:17]
  assign io_x_out_3 = diffusion_io_x_out_3; // @[permutation.scala 153:17]
  assign io_x_out_4 = diffusion_io_x_out_4; // @[permutation.scala 154:17]
  assign addition_io_round_in = io_round_in; // @[permutation.scala 129:26]
  assign addition_io_x2_in = io_x_in_2; // @[permutation.scala 130:23]
  assign addition_io_clk = io_clk; // @[permutation.scala 127:21]
  assign addition_io_rst = io_rst; // @[permutation.scala 128:21]
  assign substitution_io_x_in_0 = io_x_in_0; // @[permutation.scala 132:29]
  assign substitution_io_x_in_1 = io_x_in_1; // @[permutation.scala 133:29]
  assign substitution_io_x_in_2 = addition_io_x2_out; // @[permutation.scala 134:29]
  assign substitution_io_x_in_3 = io_x_in_3; // @[permutation.scala 135:29]
  assign substitution_io_x_in_4 = io_x_in_4; // @[permutation.scala 136:29]
  assign diffusion_io_x_in_0 = substitution_reg_0; // @[permutation.scala 144:26]
  assign diffusion_io_x_in_1 = substitution_reg_1; // @[permutation.scala 145:26]
  assign diffusion_io_x_in_2 = substitution_reg_2; // @[permutation.scala 146:26]
  assign diffusion_io_x_in_3 = substitution_reg_3; // @[permutation.scala 147:26]
  assign diffusion_io_x_in_4 = substitution_reg_4; // @[permutation.scala 148:26]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  substitution_reg_0 = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  substitution_reg_1 = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  substitution_reg_2 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  substitution_reg_3 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  substitution_reg_4 = _RAND_4[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    substitution_reg_0 <= substitution_io_x_out_0;
    substitution_reg_1 <= substitution_io_x_out_1;
    substitution_reg_2 <= substitution_io_x_out_2;
    substitution_reg_3 <= substitution_io_x_out_3;
    substitution_reg_4 <= substitution_io_x_out_4;
  end
endmodule
module permutation_two_wrapper(
  input          clock,
  input          reset,
  input  [319:0] io_s_in,
  input          io_start,
  input  [3:0]   io_round,
  output         io_done,
  output [319:0] io_s_out,
  input          io_clk,
  input          io_rst
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire  single_round_clock; // @[permutation.scala 175:30]
  wire [7:0] single_round_io_round_in; // @[permutation.scala 175:30]
  wire [63:0] single_round_io_x_in_0; // @[permutation.scala 175:30]
  wire [63:0] single_round_io_x_in_1; // @[permutation.scala 175:30]
  wire [63:0] single_round_io_x_in_2; // @[permutation.scala 175:30]
  wire [63:0] single_round_io_x_in_3; // @[permutation.scala 175:30]
  wire [63:0] single_round_io_x_in_4; // @[permutation.scala 175:30]
  wire [63:0] single_round_io_x_out_0; // @[permutation.scala 175:30]
  wire [63:0] single_round_io_x_out_1; // @[permutation.scala 175:30]
  wire [63:0] single_round_io_x_out_2; // @[permutation.scala 175:30]
  wire [63:0] single_round_io_x_out_3; // @[permutation.scala 175:30]
  wire [63:0] single_round_io_x_out_4; // @[permutation.scala 175:30]
  wire  single_round_io_clk; // @[permutation.scala 175:30]
  wire  single_round_io_rst; // @[permutation.scala 175:30]
  reg [63:0] x0_Reg; // @[permutation.scala 169:25]
  reg [63:0] x1_Reg; // @[permutation.scala 170:25]
  reg [63:0] x2_Reg; // @[permutation.scala 171:25]
  reg [63:0] x3_Reg; // @[permutation.scala 172:25]
  reg [63:0] x4_Reg; // @[permutation.scala 173:25]
  reg [7:0] current_round; // @[permutation.scala 174:32]
  reg  run; // @[permutation.scala 176:22]
  reg [1:0] counter; // @[permutation.scala 177:26]
  wire  _T = ~run; // @[permutation.scala 182:15]
  wire [3:0] _T_7 = 4'hc - io_round; // @[permutation.scala 188:29]
  wire  _T_9 = current_round == 8'hb; // @[permutation.scala 197:32]
  wire  _T_12 = counter == 2'h1; // @[permutation.scala 209:23]
  wire [7:0] _T_14 = current_round + 8'h1; // @[permutation.scala 210:42]
  wire [1:0] _T_16 = counter + 2'h1; // @[permutation.scala 214:30]
  wire  _T_19 = _T_9 & _T_12; // @[permutation.scala 219:34]
  wire [319:0] _T_23 = {single_round_io_x_out_0,single_round_io_x_out_1,single_round_io_x_out_2,single_round_io_x_out_3,single_round_io_x_out_4}; // @[Cat.scala 29:58]
  permutation_two single_round ( // @[permutation.scala 175:30]
    .clock(single_round_clock),
    .io_round_in(single_round_io_round_in),
    .io_x_in_0(single_round_io_x_in_0),
    .io_x_in_1(single_round_io_x_in_1),
    .io_x_in_2(single_round_io_x_in_2),
    .io_x_in_3(single_round_io_x_in_3),
    .io_x_in_4(single_round_io_x_in_4),
    .io_x_out_0(single_round_io_x_out_0),
    .io_x_out_1(single_round_io_x_out_1),
    .io_x_out_2(single_round_io_x_out_2),
    .io_x_out_3(single_round_io_x_out_3),
    .io_x_out_4(single_round_io_x_out_4),
    .io_clk(single_round_io_clk),
    .io_rst(single_round_io_rst)
  );
  assign io_done = _T_9 & _T_12; // @[permutation.scala 221:15 permutation.scala 225:15]
  assign io_s_out = _T_19 ? _T_23 : _T_23; // @[permutation.scala 222:16 permutation.scala 226:16]
  assign single_round_clock = clock;
  assign single_round_io_round_in = current_round; // @[permutation.scala 200:30]
  assign single_round_io_x_in_0 = x0_Reg; // @[permutation.scala 201:29]
  assign single_round_io_x_in_1 = x1_Reg; // @[permutation.scala 202:29]
  assign single_round_io_x_in_2 = x2_Reg; // @[permutation.scala 203:29]
  assign single_round_io_x_in_3 = x3_Reg; // @[permutation.scala 204:29]
  assign single_round_io_x_in_4 = x4_Reg; // @[permutation.scala 205:29]
  assign single_round_io_clk = io_clk; // @[permutation.scala 179:25]
  assign single_round_io_rst = io_rst; // @[permutation.scala 180:25]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  x0_Reg = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  x1_Reg = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  x2_Reg = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  x3_Reg = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  x4_Reg = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  current_round = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  run = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  counter = _RAND_7[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      x0_Reg <= 64'h0;
    end else if (_T) begin
      x0_Reg <= io_s_in[319:256];
    end else if (run) begin
      x0_Reg <= single_round_io_x_out_0;
    end
    if (reset) begin
      x1_Reg <= 64'h0;
    end else if (_T) begin
      x1_Reg <= io_s_in[255:192];
    end else if (run) begin
      x1_Reg <= single_round_io_x_out_1;
    end
    if (reset) begin
      x2_Reg <= 64'h0;
    end else if (_T) begin
      x2_Reg <= io_s_in[191:128];
    end else if (run) begin
      x2_Reg <= single_round_io_x_out_2;
    end
    if (reset) begin
      x3_Reg <= 64'h0;
    end else if (_T) begin
      x3_Reg <= io_s_in[127:64];
    end else if (run) begin
      x3_Reg <= single_round_io_x_out_3;
    end
    if (reset) begin
      x4_Reg <= 64'h0;
    end else if (_T) begin
      x4_Reg <= io_s_in[63:0];
    end else if (run) begin
      x4_Reg <= single_round_io_x_out_4;
    end
    if (reset) begin
      current_round <= 8'h0;
    end else if (run) begin
      if (_T_12) begin
        current_round <= _T_14;
      end else if (_T) begin
        current_round <= {{4'd0}, _T_7};
      end
    end else if (_T) begin
      current_round <= {{4'd0}, _T_7};
    end
    if (reset) begin
      run <= 1'h0;
    end else if (_T) begin
      run <= io_start;
    end else if (run) begin
      if (_T_9) begin
        run <= 1'h0;
      end else begin
        run <= 1'h1;
      end
    end
    if (reset) begin
      counter <= 2'h0;
    end else if (_T_19) begin
      counter <= 2'h0;
    end else if (run) begin
      if (_T_12) begin
        counter <= 2'h0;
      end else begin
        counter <= _T_16;
      end
    end
  end
endmodule
module ascon(
  input          clock,
  input          reset,
  input  [127:0] io_key,
  input  [127:0] io_nounce,
  input  [127:0] io_tagin,
  input  [127:0] io_message,
  input          io_start,
  input          io_empty,
  input          io_full,
  input  [2:0]   io_mode,
  output         io_push,
  output         io_pull,
  output [127:0] io_cipher,
  output [127:0] io_tagout,
  output         io_done,
  output         io_warning,
  output         io_valid,
  input          io_clk,
  input          io_rst
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [127:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [127:0] _RAND_4;
  reg [127:0] _RAND_5;
  reg [319:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  wire  permutation_clock; // @[ascon.scala 60:27]
  wire  permutation_reset; // @[ascon.scala 60:27]
  wire [319:0] permutation_io_s_in; // @[ascon.scala 60:27]
  wire  permutation_io_start; // @[ascon.scala 60:27]
  wire [3:0] permutation_io_round; // @[ascon.scala 60:27]
  wire  permutation_io_done; // @[ascon.scala 60:27]
  wire [319:0] permutation_io_s_out; // @[ascon.scala 60:27]
  wire  permutation_io_clk; // @[ascon.scala 60:27]
  wire  permutation_io_rst; // @[ascon.scala 60:27]
  reg  initReg; // @[ascon.scala 40:24]
  reg [2:0] stateReg; // @[ascon.scala 41:25]
  reg [127:0] kReg; // @[ascon.scala 46:21]
  reg [2:0] modeReg; // @[ascon.scala 47:24]
  reg [127:0] tagReg; // @[ascon.scala 48:23]
  reg [127:0] tagoutReg; // @[ascon.scala 49:26]
  reg [319:0] permut_outReg; // @[ascon.scala 54:30]
  reg  endReg; // @[ascon.scala 57:24]
  reg  doneReg; // @[ascon.scala 58:24]
  reg  warningReg; // @[ascon.scala 67:27]
  wire  _T_2 = ~io_mode[2]; // @[ascon.scala 69:39]
  wire  _T_3 = io_mode[0] & _T_2; // @[ascon.scala 69:36]
  wire [7:0] r = _T_3 ? 8'h80 : 8'h40; // @[ascon.scala 69:24]
  wire  _T_7 = ~io_mode[0]; // @[ascon.scala 71:25]
  wire  _T_9 = _T_7 & io_mode[2]; // @[ascon.scala 71:37]
  wire [3:0] _T_10 = _T_9 ? 4'hc : 4'h6; // @[ascon.scala 71:24]
  wire [3:0] _T_11 = io_mode[0] ? 4'h8 : _T_10; // @[ascon.scala 70:24]
  wire  _T_14 = ~modeReg[2]; // @[ascon.scala 72:39]
  wire  _T_15 = modeReg[0] & _T_14; // @[ascon.scala 72:36]
  wire [7:0] rReg = _T_15 ? 8'h80 : 8'h40; // @[ascon.scala 72:24]
  wire  _T_19 = ~modeReg[0]; // @[ascon.scala 74:25]
  wire  _T_21 = _T_19 & modeReg[2]; // @[ascon.scala 74:37]
  wire [3:0] _T_22 = _T_21 ? 4'hc : 4'h6; // @[ascon.scala 74:24]
  wire [3:0] _T_23 = modeReg[0] ? 4'h8 : _T_22; // @[ascon.scala 73:24]
  wire  _T_24 = stateReg != 3'h0; // @[ascon.scala 76:31]
  wire  _T_25 = modeReg != io_mode; // @[ascon.scala 76:53]
  wire  _T_26 = _T_24 & _T_25; // @[ascon.scala 76:41]
  wire  _T_27 = stateReg == 3'h1; // @[ascon.scala 81:30]
  wire  _T_28 = stateReg == 3'h2; // @[ascon.scala 81:52]
  wire  _T_29 = _T_27 | _T_28; // @[ascon.scala 81:41]
  wire  _T_31 = ~modeReg[1]; // @[ascon.scala 81:65]
  wire  _T_32 = _T_29 | _T_31; // @[ascon.scala 81:62]
  wire  _T_34 = _T_32 | modeReg[2]; // @[ascon.scala 81:77]
  wire  _T_35 = stateReg == 3'h3; // @[ascon.scala 82:30]
  wire  _T_36 = stateReg == 3'h4; // @[ascon.scala 82:52]
  wire  _T_37 = _T_35 | _T_36; // @[ascon.scala 82:41]
  wire  _T_38 = ~io_full; // @[ascon.scala 82:67]
  wire  _T_39 = _T_37 & _T_38; // @[ascon.scala 82:64]
  wire [127:0] _T_41 = permut_outReg[255:128] >> rReg; // @[ascon.scala 82:114]
  wire [127:0] _T_42 = io_message ^ _T_41; // @[ascon.scala 82:88]
  wire [127:0] _T_44 = _T_42 ^ permut_outReg[319:192]; // @[ascon.scala 82:123]
  wire  _T_48 = _T_37 & io_full; // @[ascon.scala 83:64]
  wire [127:0] _T_50 = _T_48 ? 128'h80000000000000000000000000000000 : 128'h0; // @[ascon.scala 83:20]
  wire [127:0] _T_51 = _T_39 ? _T_44 : _T_50; // @[ascon.scala 82:20]
  wire [127:0] head_update = _T_34 ? io_message : _T_51; // @[ascon.scala 81:21]
  wire  _T_55 = initReg & _T_14; // @[ascon.scala 85:30]
  wire [127:0] init_update = _T_55 ? kReg : 128'h0; // @[ascon.scala 85:21]
  wire  _T_59 = _T_35 & _T_38; // @[ascon.scala 87:41]
  wire  _T_62 = _T_59 & _T_14; // @[ascon.scala 87:53]
  wire  _T_64 = _T_35 & io_full; // @[ascon.scala 88:41]
  wire  _T_67 = _T_64 & _T_14; // @[ascon.scala 88:52]
  wire [7:0] _T_69 = 8'hc0 - rReg; // @[ascon.scala 88:96]
  wire [382:0] _GEN_33 = {{255'd0}, kReg}; // @[ascon.scala 88:87]
  wire [382:0] _T_70 = _GEN_33 << _T_69; // @[ascon.scala 88:87]
  wire [382:0] _T_71 = 383'h1 ^ _T_70; // @[ascon.scala 88:79]
  wire  _T_73 = _T_36 & io_full; // @[ascon.scala 89:41]
  wire  _T_76 = _T_73 & _T_14; // @[ascon.scala 89:52]
  wire [382:0] _T_80 = _T_76 ? _T_70 : 383'h0; // @[ascon.scala 89:21]
  wire [382:0] _T_81 = _T_67 ? _T_71 : _T_80; // @[ascon.scala 88:21]
  wire [382:0] _T_82 = _T_62 ? 383'h1 : _T_81; // @[ascon.scala 87:21]
  wire  _T_83 = stateReg == 3'h0; // @[ascon.scala 94:38]
  wire  _T_85 = _T_83 & io_mode[2]; // @[ascon.scala 94:46]
  wire [7:0] b = {{4'd0}, _T_11}; // @[ascon.scala 43:18 ascon.scala 70:18]
  wire [7:0] _T_87 = 8'hc - b; // @[ascon.scala 94:106]
  wire [319:0] _T_92 = {24'h400c,_T_87,32'h100,256'h0}; // @[Cat.scala 29:58]
  wire  _T_96 = _T_83 & _T_2; // @[ascon.scala 95:45]
  wire [319:0] _T_102 = {8'h80,r,8'hc,b,32'h0,io_key,io_nounce}; // @[Cat.scala 29:58]
  wire [319:0] _GEN_35 = {head_update, 192'h0}; // @[ascon.scala 95:138]
  wire [382:0] _T_103 = {{63'd0}, _GEN_35}; // @[ascon.scala 95:138]
  wire [382:0] _GEN_36 = {{63'd0}, permut_outReg}; // @[ascon.scala 95:148]
  wire [382:0] _T_104 = _T_103 ^ _GEN_36; // @[ascon.scala 95:148]
  wire [319:0] tail_update = _T_82[319:0]; // @[ascon.scala 53:25 ascon.scala 87:15]
  wire [382:0] _GEN_37 = {{63'd0}, tail_update}; // @[ascon.scala 95:164]
  wire [382:0] _T_105 = _T_104 ^ _GEN_37; // @[ascon.scala 95:164]
  wire [382:0] _GEN_38 = {{255'd0}, init_update}; // @[ascon.scala 95:178]
  wire [382:0] _T_106 = _T_105 ^ _GEN_38; // @[ascon.scala 95:178]
  wire [382:0] _T_107 = _T_96 ? {{63'd0}, _T_102} : _T_106; // @[ascon.scala 95:28]
  wire [382:0] _T_108 = _T_85 ? {{63'd0}, _T_92} : _T_107; // @[ascon.scala 94:29]
  wire  _T_110 = stateReg != 3'h5; // @[ascon.scala 97:68]
  wire  _T_113 = _T_110 & _T_14; // @[ascon.scala 97:75]
  wire  _T_116 = _T_38 & modeReg[2]; // @[ascon.scala 97:104]
  wire  _T_117 = _T_113 | _T_116; // @[ascon.scala 97:91]
  wire  _T_118 = _T_117 & doneReg; // @[ascon.scala 97:120]
  wire  _T_127 = _T_48 & _T_14; // @[ascon.scala 99:105]
  wire  _T_128 = _T_83 | _T_127; // @[ascon.scala 99:47]
  wire  _T_132 = _T_29 & io_empty; // @[ascon.scala 99:167]
  wire  _T_134 = _T_132 & modeReg[2]; // @[ascon.scala 99:179]
  wire  _T_135 = _T_128 | _T_134; // @[ascon.scala 99:121]
  wire [7:0] bReg = {{4'd0}, _T_23}; // @[ascon.scala 45:21 ascon.scala 73:18]
  wire [7:0] _T_136 = _T_135 ? 8'hc : bReg; // @[ascon.scala 99:30]
  wire  _T_145 = ~io_push; // @[ascon.scala 106:20]
  wire [127:0] _T_151 = permut_outReg[319:192] ^ io_message; // @[ascon.scala 107:69]
  wire [63:0] _T_154 = permut_outReg[319:256] ^ io_message[127:64]; // @[ascon.scala 107:106]
  wire [127:0] _T_155 = _T_15 ? _T_151 : {{64'd0}, _T_154}; // @[ascon.scala 107:19]
  wire  _T_158 = io_push & io_full; // @[ascon.scala 109:34]
  wire  _T_159 = stateReg == 3'h5; // @[ascon.scala 109:54]
  wire  _T_160 = _T_159 & doneReg; // @[ascon.scala 109:61]
  wire  end_ = modeReg[2] ? _T_158 : _T_160; // @[ascon.scala 109:13]
  wire [127:0] _T_163 = permut_outReg[127:0] ^ kReg; // @[ascon.scala 111:47]
  wire  _T_165 = tagReg == tagoutReg; // @[ascon.scala 115:32]
  wire  _T_167 = 3'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _GEN_3 = io_start | initReg; // @[ascon.scala 119:22]
  wire  _T_168 = 3'h1 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_169 = io_empty & doneReg; // @[ascon.scala 128:21]
  wire  _T_171 = _T_169 & modeReg[2]; // @[ascon.scala 128:32]
  wire  _T_174 = io_empty & _T_14; // @[ascon.scala 130:27]
  wire  _T_175 = ~doneReg; // @[ascon.scala 132:20]
  wire  _T_176 = ~io_empty; // @[ascon.scala 133:29]
  wire  _T_177 = doneReg & _T_176; // @[ascon.scala 133:26]
  wire  _T_178 = 3'h2 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_180 = doneReg & modeReg[2]; // @[ascon.scala 139:20]
  wire  _T_183 = doneReg & _T_14; // @[ascon.scala 141:26]
  wire  _T_184 = 3'h3 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_185 = doneReg & io_full; // @[ascon.scala 146:20]
  wire  _T_187 = doneReg & _T_38; // @[ascon.scala 149:26]
  wire  _T_188 = 3'h4 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_191 = _T_185 & modeReg[2]; // @[ascon.scala 155:31]
  wire  _T_195 = _T_185 & _T_14; // @[ascon.scala 157:37]
  wire  _T_196 = 3'h5 == stateReg; // @[Conditional.scala 37:30]
  permutation_two_wrapper permutation ( // @[ascon.scala 60:27]
    .clock(permutation_clock),
    .reset(permutation_reset),
    .io_s_in(permutation_io_s_in),
    .io_start(permutation_io_start),
    .io_round(permutation_io_round),
    .io_done(permutation_io_done),
    .io_s_out(permutation_io_s_out),
    .io_clk(permutation_io_clk),
    .io_rst(permutation_io_rst)
  );
  assign io_push = _T_37 & doneReg; // @[ascon.scala 102:11]
  assign io_pull = _T_29 & doneReg; // @[ascon.scala 101:11]
  assign io_cipher = _T_145 ? 128'h0 : _T_155; // @[ascon.scala 106:13]
  assign io_tagout = tagoutReg; // @[ascon.scala 112:13]
  assign io_done = endReg; // @[ascon.scala 113:11]
  assign io_warning = warningReg; // @[ascon.scala 77:18]
  assign io_valid = endReg & _T_165; // @[ascon.scala 115:12]
  assign permutation_clock = clock;
  assign permutation_reset = reset;
  assign permutation_io_s_in = _T_108[319:0]; // @[ascon.scala 94:23]
  assign permutation_io_start = _T_83 ? io_start : _T_118; // @[ascon.scala 97:24]
  assign permutation_io_round = _T_136[3:0]; // @[ascon.scala 99:24]
  assign permutation_io_clk = io_clk; // @[ascon.scala 62:22]
  assign permutation_io_rst = io_rst; // @[ascon.scala 63:22]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  initReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  stateReg = _RAND_1[2:0];
  _RAND_2 = {4{`RANDOM}};
  kReg = _RAND_2[127:0];
  _RAND_3 = {1{`RANDOM}};
  modeReg = _RAND_3[2:0];
  _RAND_4 = {4{`RANDOM}};
  tagReg = _RAND_4[127:0];
  _RAND_5 = {4{`RANDOM}};
  tagoutReg = _RAND_5[127:0];
  _RAND_6 = {10{`RANDOM}};
  permut_outReg = _RAND_6[319:0];
  _RAND_7 = {1{`RANDOM}};
  endReg = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  doneReg = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  warningReg = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      initReg <= 1'h0;
    end else if (_T_167) begin
      initReg <= _GEN_3;
    end else if (_T_168) begin
      if (!(_T_171)) begin
        if (_T_174) begin
          initReg <= _T_175;
        end else if (_T_177) begin
          initReg <= 1'h0;
        end
      end
    end else if (!(_T_178)) begin
      if (_T_184) begin
        if (_T_185) begin
          initReg <= 1'h0;
        end else if (_T_187) begin
          initReg <= 1'h0;
        end
      end
    end
    if (reset) begin
      stateReg <= 3'h0;
    end else if (_T_167) begin
      if (io_start) begin
        stateReg <= 3'h1;
      end
    end else if (_T_168) begin
      if (_T_171) begin
        stateReg <= 3'h4;
      end else if (_T_174) begin
        stateReg <= 3'h3;
      end else if (_T_177) begin
        stateReg <= 3'h2;
      end
    end else if (_T_178) begin
      if (_T_180) begin
        stateReg <= 3'h4;
      end else if (_T_183) begin
        stateReg <= 3'h3;
      end
    end else if (_T_184) begin
      if (_T_185) begin
        stateReg <= 3'h5;
      end else if (_T_187) begin
        stateReg <= 3'h4;
      end
    end else if (_T_188) begin
      if (_T_191) begin
        stateReg <= 3'h0;
      end else if (_T_195) begin
        stateReg <= 3'h5;
      end
    end else if (_T_196) begin
      if (endReg) begin
        stateReg <= 3'h0;
      end
    end
    if (reset) begin
      kReg <= 128'h0;
    end else if (_T_167) begin
      if (io_start) begin
        kReg <= io_key;
      end
    end
    if (reset) begin
      modeReg <= 3'h0;
    end else if (_T_167) begin
      if (io_start) begin
        modeReg <= io_mode;
      end
    end
    if (reset) begin
      tagReg <= 128'h0;
    end else if (_T_167) begin
      if (io_start) begin
        tagReg <= io_tagin;
      end
    end
    if (reset) begin
      tagoutReg <= 128'h0;
    end else if (end_) begin
      tagoutReg <= _T_163;
    end else begin
      tagoutReg <= 128'h0;
    end
    if (reset) begin
      permut_outReg <= 320'h0;
    end else begin
      permut_outReg <= permutation_io_s_out;
    end
    if (reset) begin
      endReg <= 1'h0;
    end else if (modeReg[2]) begin
      endReg <= _T_158;
    end else begin
      endReg <= _T_160;
    end
    if (reset) begin
      doneReg <= 1'h0;
    end else begin
      doneReg <= permutation_io_done;
    end
    if (reset) begin
      warningReg <= 1'h0;
    end else begin
      warningReg <= _T_26;
    end
  end
endmodule
