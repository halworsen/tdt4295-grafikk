;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Main : 
  module Main : 
    input clock : Clock
    input reset : UInt<1>
    output io : {led : UInt<1>[4], flip btn : UInt<1>[2]}
    
    reg counter : UInt, clock @[Main.scala 10:20]
    node _T = eq(io.btn[0], UInt<1>("h01")) @[Main.scala 12:18]
    when _T : @[Main.scala 12:30]
      node _counter_T = add(counter, UInt<1>("h01")) @[Main.scala 13:24]
      node _counter_T_1 = tail(_counter_T, 1) @[Main.scala 13:24]
      counter <= _counter_T_1 @[Main.scala 13:13]
      skip @[Main.scala 12:30]
    io.led[0] <= UInt<1>("h00") @[Main.scala 15:13]
    io.led[1] <= UInt<1>("h00") @[Main.scala 16:13]
    io.led[2] <= UInt<1>("h00") @[Main.scala 17:13]
    io.led[3] <= UInt<1>("h00") @[Main.scala 18:13]
    node _T_1 = eq(counter, UInt<1>("h01")) @[Main.scala 20:16]
    when _T_1 : @[Main.scala 20:25]
      io.led[0] <= UInt<1>("h01") @[Main.scala 21:15]
      skip @[Main.scala 20:25]
    node _T_2 = eq(counter, UInt<2>("h02")) @[Main.scala 23:16]
    when _T_2 : @[Main.scala 23:25]
      io.led[2] <= UInt<1>("h01") @[Main.scala 24:15]
      skip @[Main.scala 23:25]
    node _T_3 = eq(counter, UInt<2>("h03")) @[Main.scala 26:16]
    when _T_3 : @[Main.scala 26:25]
      io.led[3] <= UInt<1>("h01") @[Main.scala 27:15]
      skip @[Main.scala 26:25]
    node _T_4 = eq(counter, UInt<3>("h04")) @[Main.scala 30:16]
    when _T_4 : @[Main.scala 30:25]
      counter <= UInt<1>("h00") @[Main.scala 31:13]
      io.led[0] <= UInt<1>("h01") @[Main.scala 32:15]
      skip @[Main.scala 30:25]
    
