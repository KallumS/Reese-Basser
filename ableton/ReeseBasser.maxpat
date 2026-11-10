{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 9,
   "minor": 0,
   "revision": 0,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   100.0,
   100.0,
   960.0,
   560.0
  ],
  "openinpresentation": 1,
  "default_fontsize": 10.0,
  "default_fontface": 0,
  "default_fontname": "Arial",
  "gridonopen": 1,
  "gridsize": [
   8.0,
   8.0
  ],
  "gridsnaponopen": 1,
  "objectsnaponopen": 1,
  "statusbarvisible": 2,
  "toolbarvisible": 1,
  "boxes": [
   {
    "box": {
     "id": "obj-1",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      20.0,
      20.0,
      50.0,
      22.0
     ],
     "outlettype": [
      "int"
     ],
     "text": "midiin"
    }
   },
   {
    "box": {
     "id": "obj-2",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      120.0,
      20.0,
      90.0,
      22.0
     ],
     "outlettype": [
      "bang",
      "int",
      "int"
     ],
     "text": "live.thisdevice"
    }
   },
   {
    "box": {
     "id": "obj-3",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 4,
     "patching_rect": [
      20.0,
      200.0,
      140.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      "",
      ""
     ],
     "text": "p window",
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 9,
       "minor": 0,
       "revision": 0,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "box",
      "rect": [
       80.0,
       80.0,
       960.0,
       684.0
      ],
      "openinpresentation": 1,
      "toolbarvisible": 0,
      "statusbarvisible": 0,
      "enablehscroll": 0,
      "enablevscroll": 0,
      "title": "Reese Basser",
      "boxes": [
       {
        "box": {
         "id": "obj-1",
         "maxclass": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          20.0,
          30.0,
          30.0
         ],
         "outlettype": [
          ""
         ],
         "text": "inlet",
         "comment": "window"
        }
       },
       {
        "box": {
         "id": "obj-2",
         "maxclass": "inlet",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          120.0,
          20.0,
          30.0,
          30.0
         ],
         "outlettype": [
          ""
         ],
         "text": "inlet",
         "comment": "MIDI, bang, restore, actions"
        }
       },
       {
        "box": {
         "id": "obj-3",
         "maxclass": "v8ui",
         "numinlets": 1,
         "numoutlets": 4,
         "patching_rect": [
          120.0,
          80.0,
          960.0,
          684.0
         ],
         "outlettype": [
          "",
          "",
          "",
          ""
         ],
         "filename": "ReeseBasser.js",
         "parameter_enable": 0,
         "border": 0,
         "presentation": 1,
         "presentation_rect": [
          0.0,
          0.0,
          960.0,
          684.0
         ]
        }
       },
       {
        "box": {
         "id": "obj-4",
         "maxclass": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          120.0,
          804.0,
          30.0,
          30.0
         ],
         "text": "outlet"
        }
       },
       {
        "box": {
         "id": "obj-5",
         "maxclass": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          240.0,
          804.0,
          30.0,
          30.0
         ],
         "text": "outlet"
        }
       },
       {
        "box": {
         "id": "obj-6",
         "maxclass": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          360.0,
          804.0,
          30.0,
          30.0
         ],
         "text": "outlet"
        }
       },
       {
        "box": {
         "id": "obj-7",
         "maxclass": "outlet",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          480.0,
          804.0,
          30.0,
          30.0
         ],
         "text": "outlet"
        }
       },
       {
        "box": {
         "id": "obj-8",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 4,
         "patching_rect": [
          320.0,
          20.0,
          40.0,
          22.0
         ],
         "outlettype": [
          "int",
          "int",
          "int",
          "int"
         ],
         "text": "key"
        }
       },
       {
        "box": {
         "id": "obj-9",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 1,
         "patching_rect": [
          320.0,
          50.0,
          75.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "text": "prepend key"
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "source": [
          "obj-8",
          0
         ],
         "destination": [
          "obj-9",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-9",
          0
         ],
         "destination": [
          "obj-3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          0
         ],
         "destination": [
          "obj-3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-3",
          0
         ],
         "destination": [
          "obj-4",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-3",
          1
         ],
         "destination": [
          "obj-5",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-3",
          2
         ],
         "destination": [
          "obj-6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-3",
          3
         ],
         "destination": [
          "obj-7",
          0
         ]
        }
       }
      ]
     }
    }
   },
   {
    "box": {
     "id": "obj-4",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      420.0,
      55.0,
      22.0
     ],
     "text": "midiout"
    }
   },
   {
    "box": {
     "id": "obj-5",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      200.0,
      420.0,
      80.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "pattr state",
     "parameter_enable": 1,
     "varname": "state",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "state",
       "parameter_shortname": "state",
       "parameter_type": 3,
       "parameter_invisible": 1,
       "parameter_initial_enable": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-6",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      200.0,
      460.0,
      95.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend restore"
    }
   },
   {
    "box": {
     "id": "obj-7",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      420.0,
      420.0,
      244.0,
      40.0
     ],
     "text": "Show Window opens Reese Basser's own window.",
     "presentation": 1,
     "presentation_rect": [
      8.0,
      8.0,
      244.0,
      40.0
     ],
     "linecount": 2,
     "textcolor": [
      0.867,
      0.882,
      0.906,
      1.0
     ],
     "fontsize": 11.0
    }
   },
   {
    "box": {
     "id": "obj-8",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      420.0,
      20.0,
      120.0,
      20.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "Show Window",
     "texton": "Show Window",
     "mode": 0,
     "parameter_enable": 0,
     "presentation": 1,
     "presentation_rect": [
      8.0,
      56.0,
      118.0,
      22.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-9",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      420.0,
      60.0,
      80.0,
      22.0
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "route bang 1"
    }
   },
   {
    "box": {
     "id": "obj-10",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      420.0,
      100.0,
      30.0,
      22.0
     ],
     "outlettype": [
      "bang"
     ],
     "text": "t b"
    }
   },
   {
    "box": {
     "id": "obj-11",
     "maxclass": "message",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      420.0,
      140.0,
      40.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "open"
    }
   },
   {
    "box": {
     "id": "obj-12",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      420.0,
      180.0,
      60.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "pcontrol"
    }
   },
   {
    "box": {
     "id": "obj-13",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      20.0,
      300.0,
      160.0,
      22.0
     ],
     "outlettype": [
      "signal",
      "signal"
     ],
     "text": "gen~",
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 9,
       "minor": 0,
       "revision": 0,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "dsp.gen",
      "rect": [
       100.0,
       100.0,
       700.0,
       600.0
      ],
      "boxes": [
       {
        "box": {
         "id": "obj-1",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "patching_rect": [
          20.0,
          20.0,
          40.0,
          22.0
         ],
         "outlettype": [
          ""
         ],
         "text": "in 1"
        }
       },
       {
        "box": {
         "id": "obj-2",
         "maxclass": "codebox",
         "numinlets": 1,
         "numoutlets": 2,
         "patching_rect": [
          20.0,
          80.0,
          600.0,
          400.0
         ],
         "outlettype": [
          "",
          ""
         ],
         "code": "// Reese Basser \u2014 Reese Bass Synthesizer - translated by ableton/kit/jsfx2gen.js. Do not edit; rebuild.\nData V(897);\nData M(262144);\nBuffer mq;\nParam slider1(0, min=0, max=7);\nParam slider2(30, min=0, max=150);\nParam slider3(0, min=0, max=2);\nParam slider4(2, min=0.05, max=20);\nParam slider5(9, min=0, max=14);\nParam slider6(0, min=0, max=100);\nParam slider7(45, min=0, max=100);\nParam slider8(50, min=0, max=100);\nParam slider9(1, min=1, max=8);\nParam slider10(25, min=0, max=100);\nParam slider11(35, min=0, max=100);\nParam slider12(15, min=0, max=100);\nParam slider13(0, min=0, max=2);\nParam slider14(0, min=(-24), max=12);\nParam slider15(0, min=0, max=100);\nParam slider16(0, min=0, max=3);\nParam slider17(1, min=0, max=2);\nParam slider18(0, min=0, max=100);\nParam slider19(50, min=0, max=100);\nParam slider20(0, min=0, max=500);\nParam slider21(0, min=0, max=5);\nParam slider22(650, min=20, max=20000);\nParam slider23(14, min=0, max=100);\nParam slider24(0, min=0, max=100);\nParam slider25(40, min=0, max=100);\nParam slider26(0, min=(-100), max=100);\nParam slider27(4, min=0.5, max=5000);\nParam slider28(300, min=1, max=10000);\nParam slider29(100, min=0, max=100);\nParam slider30(120, min=1, max=10000);\nParam slider31(1, min=0.5, max=5000);\nParam slider32(400, min=1, max=10000);\nParam slider33(0, min=0, max=100);\nParam slider34(200, min=1, max=10000);\nParam slider35(1, min=0, max=6);\nParam slider36(1, min=0, max=1);\nParam slider37(1, min=0.01, max=40);\nParam slider38(9, min=0, max=14);\nParam slider39(0, min=0, max=1);\nParam slider40(0, min=0, max=5000);\nParam slider41(0, min=0, max=6);\nParam slider42(0, min=0, max=1);\nParam slider43(0.3, min=0.01, max=40);\nParam slider44(6, min=0, max=14);\nParam slider45(0, min=0, max=1);\nParam slider46(0, min=0, max=5000);\nParam slider47(0, min=0, max=5);\nParam slider48(0, min=0, max=100);\nParam slider49(100, min=0, max=100);\nParam slider50(100, min=0, max=100);\nParam slider51(0, min=0, max=1);\nParam slider52(0, min=0, max=3);\nParam slider53(600, min=20, max=10000);\nParam slider54(50, min=0, max=100);\nParam slider55(6, min=0, max=14);\nParam slider56(40, min=0, max=100);\nParam slider57(25, min=0, max=100);\nParam slider58(100, min=0, max=100);\nParam slider59(0, min=0, max=100);\nParam slider60(0, min=0, max=100);\nParam slider61(0, min=(-1000), max=1000);\nParam slider62(0, min=0, max=100);\nParam slider63(1, min=0.25, max=8);\nParam slider64(0, min=0, max=100);\nParam slider65(16, min=1, max=16);\nParam slider66(1, min=1, max=50);\nParam slider67(100, min=0, max=100);\nParam slider68(0, min=0, max=100);\nParam slider69(0, min=0, max=100);\nParam slider70(0.4, min=0.05, max=5);\nParam slider71(50, min=0, max=100);\nParam slider72(100, min=0, max=200);\nParam slider73(120, min=0, max=400);\nParam slider74(0, min=0, max=1);\nParam slider75(80, min=0, max=2000);\nParam slider76(0, min=0, max=1);\nParam slider77(2, min=0, max=24);\nParam slider78(40, min=0, max=100);\nParam slider79(0, min=(-3), max=2);\nParam slider80(1, min=0, max=2);\nParam slider81((-6), min=(-48), max=12);\nParam slider82(1, min=0, max=1);\nParam slider83(1, min=0, max=10);\nParam slider84(0, min=0, max=24);\nParam slider85(0, min=(-100), max=100);\nParam slider86(3, min=0, max=10);\nParam slider87(0, min=0, max=24);\nParam slider88(0, min=(-100), max=100);\nParam slider89(6, min=0, max=10);\nParam slider90(0, min=0, max=24);\nParam slider91(0, min=(-100), max=100);\nParam slider92(2, min=0, max=10);\nParam slider93(0, min=0, max=24);\nParam slider94(0, min=(-100), max=100);\nParam slider95(5, min=0, max=10);\nParam slider96(0, min=0, max=24);\nParam slider97(0, min=(-100), max=100);\nParam slider98(10, min=0, max=10);\nParam slider99(0, min=0, max=24);\nParam slider100(0, min=(-100), max=100);\nParam slider101(0, min=0, max=4);\nParam slider102(0, min=0, max=1);\nParam tempo(120, min=1, max=999);\nParam play_state(0, min=0, max=8);\nParam beat_position(0);\nParam ts_num(4, min=1, max=64);\nParam ts_denom(4, min=1, max=64);\n\neel_mod(a, b) { ib = trunc(abs(b)); return ib >= 1 ? trunc(abs(a)) - ib * floor(trunc(abs(a)) / ib) : 0; }\neel_bor(a, b) { return bitor(trunc(a), trunc(b)); }\neel_band(a, b) { return bitand(trunc(a), trunc(b)); }\neel_bxor(a, b) { return bitxor(trunc(a), trunc(b)); }\neel_shl(a, b) { return trunc(a) * pow(2, trunc(b)); }\neel_shr(a, b) { return floor(trunc(a) / pow(2, trunc(b))); }\n\nf_set6(V, M, mq, p0, p1, p2, p3, p4, p5, p6) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0; t12 = 0;\n  r = 0;\n  t1 = trunc(p0 + 0.00001);\n  t2 = p1;\n  poke(M, t2, t1);\n  t3 = trunc(p0 + 1 + 0.00001);\n  t4 = p2;\n  poke(M, t4, t3);\n  t5 = trunc(p0 + 2 + 0.00001);\n  t6 = p3;\n  poke(M, t6, t5);\n  t7 = trunc(p0 + 3 + 0.00001);\n  t8 = p4;\n  poke(M, t8, t7);\n  t9 = trunc(p0 + 4 + 0.00001);\n  t10 = p5;\n  poke(M, t10, t9);\n  t11 = trunc(p0 + 5 + 0.00001);\n  t12 = p6;\n  poke(M, t12, t11);\n  r = t12;\n  return r;\n}\n\nf_db2g(V, M, mq, p0) {\n  r = 0;\n  r = exp((p0 * 0.11512925464970228));\n  return r;\n}\n\nf_pm(V, M, mq, p0, p1, p2, p3, p4, p5, p6) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0; t12 = 0; t13 = 0; t14 = 0; t15 = 0;\n  r = 0;\n  t1 = trunc(peek(V, 243) + p0 + 0.00001);\n  t2 = p1;\n  poke(M, t2, t1);\n  t3 = trunc(peek(V, 244) + p0 + 0.00001);\n  t4 = p2;\n  poke(M, t4, t3);\n  t5 = trunc(peek(V, 245) + p0 + 0.00001);\n  t6 = p3;\n  poke(M, t6, t5);\n  t7 = trunc(peek(V, 246) + p0 + 0.00001);\n  t8 = p4;\n  poke(M, t8, t7);\n  t9 = trunc(peek(V, 299) + p0 + 0.00001);\n  t10 = p5;\n  poke(M, t10, t9);\n  t11 = trunc(peek(V, 300) + p0 + 0.00001);\n  t12 = p6;\n  poke(M, t12, t11);\n  t13 = trunc(peek(V, 301) + p0 + 0.00001);\n  poke(M, 0, t13);\n  t14 = trunc(peek(V, 302) + p0 + 0.00001);\n  t15 = ((abs((((abs((((abs((abs(p5 - 10) < 0.00001 ? 1 : 0)) >= 0.00001) || (abs((abs(p5 - 6) < 0.00001 ? 1 : 0)) >= 0.00001)) ? 1 : 0)) >= 0.00001) || (abs((abs(p5 - 11) < 0.00001 ? 1 : 0)) >= 0.00001)) ? 1 : 0)) >= 0.00001) ? 1 : 0);\n  poke(M, t15, t14);\n  r = t15;\n  return r;\n}\n\nf_pe(V, M, mq, p0, p1, p2, p3) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0;\n  r = 0;\n  t1 = f_pm(V, M, mq, p0, 0, 100, p1, 0, 10, p3);\n  t2 = trunc(peek(V, 301) + p0 + 0.00001);\n  t3 = p2;\n  poke(M, t3, t2);\n  t4 = trunc(peek(V, 302) + p0 + 0.00001);\n  poke(M, 1, t4);\n  r = 1;\n  return r;\n}\n\nf_enum_count(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0;\n  r = 0;\n  poke(V, 1, 309);\n  poke(V, 0, 310);\n  t1 = 0;\n  while (t1 < 1048576) {\n    poke(V, 0, 311);\n    if (!(abs((abs(0 - 0) < 0.00001 ? 0 : 1)) >= 0.00001)) {\n      break;\n    }\n    if ((abs((abs(peek(V, 311) - 124) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      t2 = (peek(V, 309) + 1);\n      poke(V, t2, 309);\n    }\n    t3 = (peek(V, 310) + 1);\n    poke(V, t3, 310);\n    t1 += 1;\n  }\n  r = peek(V, 309);\n  return r;\n}\n\nf_el(V, M, mq, p0, p1, p2, p3) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0;\n  r = 0;\n  t1 = trunc(peek(V, 313) + (p0 * 3) + 0.00001);\n  t2 = p1;\n  poke(M, t2, t1);\n  t3 = trunc(peek(V, 313) + ((p0 * 3) + 1) + 0.00001);\n  t4 = p2;\n  poke(M, t4, t3);\n  t5 = trunc(peek(V, 313) + ((p0 * 3) + 2) + 0.00001);\n  t6 = p3;\n  poke(M, t6, t5);\n  r = t6;\n  return r;\n}\n\nf_ed(V, M, mq, p0, p1, p2, p3) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0;\n  r = 0;\n  t1 = trunc(peek(V, 315) + (p0 * 3) + 0.00001);\n  t2 = p1;\n  poke(M, t2, t1);\n  t3 = trunc(peek(V, 315) + ((p0 * 3) + 1) + 0.00001);\n  t4 = p2;\n  poke(M, t4, t3);\n  t5 = trunc(peek(V, 315) + ((p0 * 3) + 2) + 0.00001);\n  t6 = p3;\n  poke(M, t6, t5);\n  r = t6;\n  return r;\n}\n\nf_lin(V, M, mq, p0) {\n  r = 0;\n  if ((abs((p0 <= 0.04045 ? 1 : 0)) >= 0.00001)) {\n    r = (p0 / 12.92);\n  }\n  else {\n    r = pow(((p0 + 0.055) / 1.055), 2.4);\n  }\n  return r;\n}\n\nf_lum(V, M, mq, p0, p1, p2) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0;\n  r = 0;\n  t1 = f_lin(V, M, mq, p0);\n  t2 = (0.2126 * t1);\n  t3 = f_lin(V, M, mq, p1);\n  t4 = (t2 + (0.7152 * t3));\n  t5 = f_lin(V, M, mq, p2);\n  r = (t4 + (0.0722 * t5));\n  return r;\n}\n\nf_dec_reset__decl(V, M, mq) {\n  r = 0;\n  poke(V, 0, 334);\n  poke(V, 0, 335);\n  poke(V, 0, 336);\n  poke(V, 0, 337);\n  poke(V, 0, 338);\n  poke(V, 0, 339);\n  poke(V, 0, 340);\n  poke(V, 0, 341);\n  poke(V, 0, 342);\n  poke(V, 0, 343);\n  poke(V, 0, 344);\n  poke(V, 0, 345);\n  r = 0;\n  return r;\n}\n\nf_dec_reset__decr(V, M, mq) {\n  r = 0;\n  poke(V, 0, 346);\n  poke(V, 0, 347);\n  poke(V, 0, 348);\n  poke(V, 0, 349);\n  poke(V, 0, 350);\n  poke(V, 0, 351);\n  poke(V, 0, 352);\n  poke(V, 0, 353);\n  poke(V, 0, 354);\n  poke(V, 0, 355);\n  poke(V, 0, 356);\n  poke(V, 0, 357);\n  r = 0;\n  return r;\n}\n\nf_setup_voices(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0; t12 = 0; t13 = 0; t14 = 0; t15 = 0; t16 = 0; t17 = 0; t18 = 0; t19 = 0; t20 = 0; t21 = 0; t22 = 0; t23 = 0; t24 = 0; t25 = 0; t26 = 0; t27 = 0; t28 = 0;\n  r = 0;\n  if ((abs((abs(peek(V, 0) - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n    t1 = (3 + floor(((peek(V, 5) * 0.13) + 0.5)));\n    poke(V, t1, 359);\n    poke(V, 1, 360);\n  }\n  else {\n    if ((abs((abs(peek(V, 0) - 6) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      poke(V, 1, 359);\n      t2 = peek(V, 8);\n      poke(V, t2, 360);\n    }\n    else {\n      poke(V, 2, 359);\n      t3 = peek(V, 8);\n      poke(V, t3, 360);\n    }\n  }\n  t4 = peek(V, 359);\n  poke(V, t4, 361);\n  t5 = peek(V, 360);\n  poke(V, t5, 362);\n  t6 = (peek(V, 359) * peek(V, 360));\n  poke(V, t6, 363);\n  poke(V, 0, 364);\n  poke(V, 0, 365);\n  t7 = min(1048576, trunc(peek(V, 359)));\n  for (t8 = 0; t8 < t7; t8 += 1) {\n    poke(V, 0, 366);\n    t9 = min(1048576, trunc(peek(V, 360)));\n    for (t10 = 0; t10 < t9; t10 += 1) {\n      t11 = ((abs((abs(peek(V, 359) - 1) < 0.00001 ? 1 : 0)) >= 0.00001) ? 0 : ((-1) + ((2 * peek(V, 365)) / (peek(V, 359) - 1))));\n      poke(V, t11, 367);\n      t12 = trunc(peek(V, 224) + peek(V, 364) + 0.00001);\n      t13 = peek(V, 367);\n      poke(M, t13, t12);\n      t14 = trunc(peek(V, 225) + peek(V, 364) + 0.00001);\n      t15 = ((abs((abs(peek(V, 360) - 1) < 0.00001 ? 1 : 0)) >= 0.00001) ? 0 : ((-1) + ((2 * peek(V, 366)) / (peek(V, 360) - 1))));\n      poke(M, t15, t14);\n      t16 = trunc(peek(V, 226) + peek(V, 364) + 0.00001);\n      t17 = peek(V, 365);\n      poke(M, t17, t16);\n      if ((abs((abs(peek(V, 0) - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n        t18 = (abs(peek(V, 367)) * ((abs(eel_band(peek(V, 365), 1)) >= 0.00001) ? 1 : (-1)));\n        poke(V, t18, 368);\n      }\n      else {\n        if ((abs((abs(peek(V, 359) - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n          t19 = peek(M, trunc(peek(V, 225) + peek(V, 364) + 0.00001));\n          poke(V, t19, 368);\n        }\n        else {\n          t20 = ((peek(V, 367) * 0.7) + (peek(M, trunc(peek(V, 225) + peek(V, 364) + 0.00001)) * 0.3));\n          poke(V, t20, 368);\n        }\n      }\n      t21 = trunc(peek(V, 227) + peek(V, 364) + 0.00001);\n      t22 = peek(V, 368);\n      poke(M, t22, t21);\n      t23 = trunc(peek(V, 222) + peek(V, 364) + 0.00001);\n      poke(M, 0, t23);\n      t24 = trunc(peek(V, 223) + peek(V, 364) + 0.00001);\n      poke(V, peek(V, 205) * 16807 - 2147483647 * floor(peek(V, 205) * 16807 / 2147483647), 205);\n      t25 = ((peek(V, 205) / 2147483647 * 2) - 1);\n      poke(M, t25, t24);\n      t26 = (peek(V, 364) + 1);\n      poke(V, t26, 364);\n      t27 = (peek(V, 366) + 1);\n      poke(V, t27, 366);\n    }\n    t28 = (peek(V, 365) + 1);\n    poke(V, t28, 365);\n  }\n  poke(V, (-1), 369);\n  r = (-1);\n  return r;\n}\n\nf_env_coef(V, M, mq, p0, p1) {\n  r = 0;\n  r = (1 - exp(((-p1) / ((max(p0, 0.05) * 0.001) * peek(V, 206)))));\n  return r;\n}\n\nf_sat(V, M, mq, p0) {\n  r = 0;\n  if ((abs((p0 > 3 ? 1 : 0)) >= 0.00001)) {\n    r = 1;\n  }\n  else {\n    if ((abs((p0 < (-3) ? 1 : 0)) >= 0.00001)) {\n      r = (-1);\n    }\n    else {\n      r = ((p0 * (27 + (p0 * p0))) / (27 + ((9 * p0) * p0)));\n    }\n  }\n  return r;\n}\n\nf_clamp(V, M, mq, p0, p1, p2) {\n  r = 0;\n  if ((abs((p0 < p1 ? 1 : 0)) >= 0.00001)) {\n    r = p1;\n  }\n  else {\n    if ((abs((p0 > p2 ? 1 : 0)) >= 0.00001)) {\n      r = p2;\n    }\n    else {\n      r = p0;\n    }\n  }\n  return r;\n}\n\nf_svf_set__lc1(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0;\n  r = 0;\n  t1 = f_clamp(V, M, mq, p0, 5, (peek(V, 206) * 0.45));\n  t2 = tan(((3.141592653589793 * t1) * peek(V, 325)));\n  poke(V, t2, 388);\n  t3 = p1;\n  poke(V, t3, 389);\n  t4 = (1 / (1 + (peek(V, 388) * (peek(V, 388) + p1))));\n  poke(V, t4, 390);\n  t5 = (peek(V, 388) * peek(V, 390));\n  poke(V, t5, 391);\n  t6 = (peek(V, 388) * peek(V, 391));\n  poke(V, t6, 392);\n  t7 = peek(V, 390);\n  poke(V, t7, 393);\n  t8 = peek(V, 391);\n  poke(V, t8, 394);\n  t9 = peek(V, 392);\n  poke(V, t9, 395);\n  t10 = p1;\n  poke(V, t10, 396);\n  r = t10;\n  return r;\n}\n\nf_svf_same__lc2(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0;\n  r = 0;\n  t1 = peek(V, 393);\n  poke(V, t1, 397);\n  t2 = peek(V, 394);\n  poke(V, t2, 398);\n  t3 = peek(V, 395);\n  poke(V, t3, 399);\n  t4 = peek(V, 396);\n  poke(V, t4, 400);\n  r = t4;\n  return r;\n}\n\nf_svf_same__lc3(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0;\n  r = 0;\n  t1 = peek(V, 393);\n  poke(V, t1, 401);\n  t2 = peek(V, 394);\n  poke(V, t2, 402);\n  t3 = peek(V, 395);\n  poke(V, t3, 403);\n  t4 = peek(V, 396);\n  poke(V, t4, 404);\n  r = t4;\n  return r;\n}\n\nf_svf_same__lc4(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0;\n  r = 0;\n  t1 = peek(V, 393);\n  poke(V, t1, 405);\n  t2 = peek(V, 394);\n  poke(V, t2, 406);\n  t3 = peek(V, 395);\n  poke(V, t3, 407);\n  t4 = peek(V, 396);\n  poke(V, t4, 408);\n  r = t4;\n  return r;\n}\n\nf_svf_set__mb1(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0;\n  r = 0;\n  t1 = f_clamp(V, M, mq, p0, 5, (peek(V, 206) * 0.45));\n  t2 = tan(((3.141592653589793 * t1) * peek(V, 325)));\n  poke(V, t2, 388);\n  t3 = p1;\n  poke(V, t3, 409);\n  t4 = (1 / (1 + (peek(V, 388) * (peek(V, 388) + p1))));\n  poke(V, t4, 410);\n  t5 = (peek(V, 388) * peek(V, 410));\n  poke(V, t5, 411);\n  t6 = (peek(V, 388) * peek(V, 411));\n  poke(V, t6, 412);\n  t7 = peek(V, 410);\n  poke(V, t7, 393);\n  t8 = peek(V, 411);\n  poke(V, t8, 394);\n  t9 = peek(V, 412);\n  poke(V, t9, 395);\n  t10 = p1;\n  poke(V, t10, 396);\n  r = t10;\n  return r;\n}\n\nf_svf_same__mb2(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0;\n  r = 0;\n  t1 = peek(V, 393);\n  poke(V, t1, 413);\n  t2 = peek(V, 394);\n  poke(V, t2, 414);\n  t3 = peek(V, 395);\n  poke(V, t3, 415);\n  t4 = peek(V, 396);\n  poke(V, t4, 416);\n  r = t4;\n  return r;\n}\n\nf_svf_same__mb3(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0;\n  r = 0;\n  t1 = peek(V, 393);\n  poke(V, t1, 417);\n  t2 = peek(V, 394);\n  poke(V, t2, 418);\n  t3 = peek(V, 395);\n  poke(V, t3, 419);\n  t4 = peek(V, 396);\n  poke(V, t4, 420);\n  r = t4;\n  return r;\n}\n\nf_svf_same__mb4(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0;\n  r = 0;\n  t1 = peek(V, 393);\n  poke(V, t1, 421);\n  t2 = peek(V, 394);\n  poke(V, t2, 422);\n  t3 = peek(V, 395);\n  poke(V, t3, 423);\n  t4 = peek(V, 396);\n  poke(V, t4, 424);\n  r = t4;\n  return r;\n}\n\nf_svf_set__sq_l1(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0;\n  r = 0;\n  t1 = f_clamp(V, M, mq, p0, 5, (peek(V, 206) * 0.45));\n  t2 = tan(((3.141592653589793 * t1) * peek(V, 325)));\n  poke(V, t2, 388);\n  t3 = p1;\n  poke(V, t3, 425);\n  t4 = (1 / (1 + (peek(V, 388) * (peek(V, 388) + p1))));\n  poke(V, t4, 426);\n  t5 = (peek(V, 388) * peek(V, 426));\n  poke(V, t5, 427);\n  t6 = (peek(V, 388) * peek(V, 427));\n  poke(V, t6, 428);\n  t7 = peek(V, 426);\n  poke(V, t7, 393);\n  t8 = peek(V, 427);\n  poke(V, t8, 394);\n  t9 = peek(V, 428);\n  poke(V, t9, 395);\n  t10 = p1;\n  poke(V, t10, 396);\n  r = t10;\n  return r;\n}\n\nf_svf_same__sq_l2(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0;\n  r = 0;\n  t1 = peek(V, 393);\n  poke(V, t1, 429);\n  t2 = peek(V, 394);\n  poke(V, t2, 430);\n  t3 = peek(V, 395);\n  poke(V, t3, 431);\n  t4 = peek(V, 396);\n  poke(V, t4, 432);\n  r = t4;\n  return r;\n}\n\nf_svf_same__sq_r1(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0;\n  r = 0;\n  t1 = peek(V, 393);\n  poke(V, t1, 433);\n  t2 = peek(V, 394);\n  poke(V, t2, 434);\n  t3 = peek(V, 395);\n  poke(V, t3, 435);\n  t4 = peek(V, 396);\n  poke(V, t4, 436);\n  r = t4;\n  return r;\n}\n\nf_svf_same__sq_r2(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0;\n  r = 0;\n  t1 = peek(V, 393);\n  poke(V, t1, 437);\n  t2 = peek(V, 394);\n  poke(V, t2, 438);\n  t3 = peek(V, 395);\n  poke(V, t3, 439);\n  t4 = peek(V, 396);\n  poke(V, t4, 440);\n  r = t4;\n  return r;\n}\n\nf_svf_set__sq_m1(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0;\n  r = 0;\n  t1 = f_clamp(V, M, mq, p0, 5, (peek(V, 206) * 0.45));\n  t2 = tan(((3.141592653589793 * t1) * peek(V, 325)));\n  poke(V, t2, 388);\n  t3 = p1;\n  poke(V, t3, 441);\n  t4 = (1 / (1 + (peek(V, 388) * (peek(V, 388) + p1))));\n  poke(V, t4, 442);\n  t5 = (peek(V, 388) * peek(V, 442));\n  poke(V, t5, 443);\n  t6 = (peek(V, 388) * peek(V, 443));\n  poke(V, t6, 444);\n  t7 = peek(V, 442);\n  poke(V, t7, 393);\n  t8 = peek(V, 443);\n  poke(V, t8, 394);\n  t9 = peek(V, 444);\n  poke(V, t9, 395);\n  t10 = p1;\n  poke(V, t10, 396);\n  r = t10;\n  return r;\n}\n\nf_svf_same__sq_m2(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0;\n  r = 0;\n  t1 = peek(V, 393);\n  poke(V, t1, 445);\n  t2 = peek(V, 394);\n  poke(V, t2, 446);\n  t3 = peek(V, 395);\n  poke(V, t3, 447);\n  t4 = peek(V, 396);\n  poke(V, t4, 448);\n  r = t4;\n  return r;\n}\n\nf_svf_same__sq_m3(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0;\n  r = 0;\n  t1 = peek(V, 393);\n  poke(V, t1, 449);\n  t2 = peek(V, 394);\n  poke(V, t2, 450);\n  t3 = peek(V, 395);\n  poke(V, t3, 451);\n  t4 = peek(V, 396);\n  poke(V, t4, 452);\n  r = t4;\n  return r;\n}\n\nf_svf_same__sq_m4(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0;\n  r = 0;\n  t1 = peek(V, 393);\n  poke(V, t1, 453);\n  t2 = peek(V, 394);\n  poke(V, t2, 454);\n  t3 = peek(V, 395);\n  poke(V, t3, 455);\n  t4 = peek(V, 396);\n  poke(V, t4, 456);\n  r = t4;\n  return r;\n}\n\nf_update_params(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0; t12 = 0; t13 = 0; t14 = 0; t15 = 0; t16 = 0; t17 = 0; t18 = 0; t19 = 0; t20 = 0; t21 = 0; t22 = 0; t23 = 0; t24 = 0; t25 = 0; t26 = 0; t27 = 0; t28 = 0; t29 = 0; t30 = 0; t31 = 0; t32 = 0; t33 = 0; t34 = 0; t35 = 0; t36 = 0; t37 = 0; t38 = 0; t39 = 0; t40 = 0; t41 = 0; t42 = 0; t43 = 0; t44 = 0; t45 = 0; t46 = 0; t47 = 0; t48 = 0; t49 = 0; t50 = 0; t51 = 0; t52 = 0; t53 = 0; t54 = 0; t55 = 0; t56 = 0; t57 = 0; t58 = 0; t59 = 0; t60 = 0; t61 = 0; t62 = 0; t63 = 0; t64 = 0; t65 = 0; t66 = 0; t67 = 0; t68 = 0; t69 = 0; t70 = 0;\n  r = 0;\n  t1 = (1 / peek(V, 206));\n  poke(V, t1, 325);\n  t2 = peek(V, 206);\n  poke(V, t2, 326);\n  t3 = (1 - exp(((-1) / (0.0015 * peek(V, 206)))));\n  poke(V, t3, 327);\n  t4 = (1 - exp(((-1) / (0.012 * peek(V, 206)))));\n  poke(V, t4, 328);\n  t5 = (1 - exp(((-1) / (0.004 * peek(V, 206)))));\n  poke(V, t5, 329);\n  t6 = (1 - (((2 * 3.141592653589793) * 8) / peek(V, 206)));\n  poke(V, t6, 330);\n  t7 = ((abs((abs(peek(V, 79) - 0) < 0.00001 ? 1 : 0)) >= 0.00001) ? 1 : ((abs((abs(peek(V, 79) - 1) < 0.00001 ? 1 : 0)) >= 0.00001) ? 2 : 4));\n  poke(V, t7, 331);\n  t8 = (peek(V, 206) * peek(V, 331));\n  poke(V, t8, 332);\n  t9 = (1 / peek(V, 332));\n  poke(V, t9, 333);\n  if ((abs((abs(peek(V, 331) - peek(V, 297)) < 0.00001 ? 0 : 1)) >= 0.00001)) {\n    t10 = f_dec_reset__decl(V, M, mq);\n    t11 = f_dec_reset__decr(V, M, mq);\n    t12 = peek(V, 331);\n    poke(V, t12, 297);\n  }\n  t13 = ((abs((abs(peek(V, 0) - 1) < 0.00001 ? 1 : 0)) >= 0.00001) ? floor(((peek(V, 5) * 0.13) + 0.5)) : 0);\n  poke(V, t13, 358);\n  if ((abs((((abs((((abs((abs(peek(V, 0) - peek(V, 294)) < 0.00001 ? 0 : 1)) >= 0.00001) || (abs((abs(peek(V, 8) - peek(V, 295)) < 0.00001 ? 0 : 1)) >= 0.00001)) ? 1 : 0)) >= 0.00001) || (abs((abs(peek(V, 358) - peek(V, 296)) < 0.00001 ? 0 : 1)) >= 0.00001)) ? 1 : 0)) >= 0.00001)) {\n    t14 = f_setup_voices(V, M, mq);\n    t15 = peek(V, 0);\n    poke(V, t15, 294);\n    t16 = peek(V, 8);\n    poke(V, t16, 295);\n    t17 = peek(V, 358);\n    poke(V, t17, 296);\n  }\n  t18 = f_env_coef(V, M, mq, peek(V, 26), 1.6094);\n  poke(V, t18, 370);\n  t19 = f_env_coef(V, M, mq, peek(V, 27), 4.6);\n  poke(V, t19, 371);\n  t20 = f_env_coef(V, M, mq, peek(V, 29), 4.6);\n  poke(V, t20, 372);\n  t21 = f_env_coef(V, M, mq, peek(V, 30), 1.6094);\n  poke(V, t21, 373);\n  t22 = f_env_coef(V, M, mq, peek(V, 31), 4.6);\n  poke(V, t22, 374);\n  t23 = f_env_coef(V, M, mq, peek(V, 33), 4.6);\n  poke(V, t23, 375);\n  t24 = (peek(V, 28) / 100);\n  poke(V, t24, 376);\n  t25 = (peek(V, 32) / 100);\n  poke(V, t25, 377);\n  t26 = ((abs((peek(V, 74) > 0 ? 1 : 0)) >= 0.00001) ? (1 - exp(((-3) / ((peek(V, 74) * 0.001) * peek(V, 206))))) : 1);\n  poke(V, t26, 378);\n  t27 = f_db2g(V, M, mq, peek(V, 13));\n  poke(V, t27, 379);\n  t28 = f_sat(V, M, mq, 0.5);\n  poke(V, t28, 380);\n  t29 = (1 - exp(((((-2) * 3.141592653589793) * 720) * peek(V, 333))));\n  poke(V, t29, 381);\n  t30 = (peek(V, 48) < 99.5 ? 1 : 0);\n  poke(V, t30, 382);\n  t31 = (1 - exp(((((-2) * 3.141592653589793) * (400 * pow(2, (peek(V, 48) * 0.0564)))) * peek(V, 333))));\n  poke(V, t31, 383);\n  t32 = (peek(V, 49) / 100);\n  poke(V, t32, 384);\n  if ((abs((peek(V, 18) < 50 ? 1 : 0)) >= 0.00001)) {\n    poke(V, 1, 385);\n    t33 = (1 - exp(((((-2) * 3.141592653589793) * (150 * pow(2, ((peek(V, 18) / 50) * 7)))) * peek(V, 333))));\n    poke(V, t33, 386);\n  }\n  else {\n    poke(V, 0, 385);\n    t34 = (1 - exp(((((-2) * 3.141592653589793) * (20 * pow(2, (((peek(V, 18) - 50) / 50) * 9)))) * peek(V, 333))));\n    poke(V, t34, 386);\n  }\n  t35 = f_db2g(V, M, mq, peek(V, 80));\n  poke(V, t35, 387);\n  if ((abs((peek(V, 19) > 0 ? 1 : 0)) >= 0.00001)) {\n    t36 = f_svf_set__lc1(V, M, mq, peek(V, 19), 1.41421356);\n    t37 = f_svf_same__lc2(V, M, mq);\n    t38 = f_svf_same__lc3(V, M, mq);\n    t39 = f_svf_same__lc4(V, M, mq);\n  }\n  if ((abs((peek(V, 72) > 0 ? 1 : 0)) >= 0.00001)) {\n    t40 = f_svf_set__mb1(V, M, mq, peek(V, 72), 1.41421356);\n    t41 = f_svf_same__mb2(V, M, mq);\n    t42 = f_svf_same__mb3(V, M, mq);\n    t43 = f_svf_same__mb4(V, M, mq);\n  }\n  t44 = f_svf_set__sq_l1(V, M, mq, 150, 1.41421356);\n  t45 = f_svf_same__sq_l2(V, M, mq);\n  t46 = f_svf_same__sq_r1(V, M, mq);\n  t47 = f_svf_same__sq_r2(V, M, mq);\n  t48 = f_svf_set__sq_m1(V, M, mq, 2500, 1.41421356);\n  t49 = f_svf_same__sq_m2(V, M, mq);\n  t50 = f_svf_same__sq_m3(V, M, mq);\n  t51 = f_svf_same__sq_m4(V, M, mq);\n  t52 = (1 - exp(((-1) / (0.002 * peek(V, 206)))));\n  poke(V, t52, 457);\n  t53 = (1 - exp(((-1) / (0.08 * peek(V, 206)))));\n  poke(V, t53, 458);\n  poke(V, 0, 459);\n  poke(V, 0, 308);\n  t54 = min(1048576, trunc(6));\n  for (t55 = 0; t55 < t54; t55 += 1) {\n    if ((abs((((abs((((abs((peek(V, clamp(trunc((83 + (peek(V, 308) * 3))) - 1, 0, 101)) > 0 ? 1 : 0)) >= 0.00001) && (abs((peek(V, clamp(trunc((84 + (peek(V, 308) * 3))) - 1, 0, 101)) > 0 ? 1 : 0)) >= 0.00001)) ? 1 : 0)) >= 0.00001) && (abs((abs(peek(V, clamp(trunc((85 + (peek(V, 308) * 3))) - 1, 0, 101)) - 0) < 0.00001 ? 0 : 1)) >= 0.00001)) ? 1 : 0)) >= 0.00001)) {\n      t56 = trunc(peek(V, 230) + peek(V, 459) + 0.00001);\n      t57 = peek(V, clamp(trunc((83 + (peek(V, 308) * 3))) - 1, 0, 101));\n      poke(M, t57, t56);\n      t58 = trunc(peek(V, 231) + peek(V, 459) + 0.00001);\n      t59 = peek(V, clamp(trunc((84 + (peek(V, 308) * 3))) - 1, 0, 101));\n      poke(M, t59, t58);\n      t60 = trunc(peek(V, 232) + peek(V, 459) + 0.00001);\n      t61 = (peek(V, clamp(trunc((85 + (peek(V, 308) * 3))) - 1, 0, 101)) * 0.01);\n      poke(M, t61, t60);\n      t62 = (peek(V, 459) + 1);\n      poke(V, t62, 459);\n    }\n    t63 = (peek(V, 308) + 1);\n    poke(V, t63, 308);\n  }\n  t64 = peek(V, 229);\n  t65 = min(trunc(26), 8388608);\n  for (t66 = 0; t66 < t65; t66 += 1) {\n    poke(M, 0, trunc(t64 + t66 + 0.00001));\n  }\n  t67 = (log(peek(V, 21)) * 1.4426950408889634);\n  poke(V, t67, 460);\n  t68 = (log(peek(V, 52)) * 1.4426950408889634);\n  poke(V, t68, 461);\n  t69 = (((abs((((abs((peek(V, 64) < 15.95 ? 1 : 0)) >= 0.00001) || (abs((peek(V, 65) > 1.01 ? 1 : 0)) >= 0.00001)) ? 1 : 0)) >= 0.00001) && (abs((peek(V, 66) > 0 ? 1 : 0)) >= 0.00001)) ? 1 : 0);\n  poke(V, t69, 462);\n  t70 = (1 - exp(((-1) / (0.3 * peek(V, 206)))));\n  poke(V, t70, 463);\n  r = t70;\n  return r;\n}\n\nf_frac(V, M, mq, p0) {\n  r = 0;\n  r = (p0 - floor(p0));\n  return r;\n}\n\nf_stack_remove(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0;\n  r = 0;\n  poke(V, 0, 486);\n  poke(V, 0, 487);\n  t1 = min(1048576, trunc(peek(V, 268)));\n  for (t2 = 0; t2 < t1; t2 += 1) {\n    if ((abs((abs(peek(M, trunc(peek(V, 214) + peek(V, 486) + 0.00001)) - p0) < 0.00001 ? 0 : 1)) >= 0.00001)) {\n      t3 = trunc(peek(V, 214) + peek(V, 487) + 0.00001);\n      t4 = peek(M, trunc(peek(V, 214) + peek(V, 486) + 0.00001));\n      poke(M, t4, t3);\n      t5 = (peek(V, 487) + 1);\n      poke(V, t5, 487);\n    }\n    t6 = (peek(V, 486) + 1);\n    poke(V, t6, 486);\n  }\n  t7 = peek(V, 487);\n  poke(V, t7, 268);\n  r = t7;\n  return r;\n}\n\nf_env_trigger__aenv_o(V, M, mq) {\n  r = 0;\n  poke(V, 1, 489);\n  r = 1;\n  return r;\n}\n\nf_env_trigger__menv_o(V, M, mq) {\n  r = 0;\n  poke(V, 1, 490);\n  r = 1;\n  return r;\n}\n\nf_reset_phases(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0;\n  r = 0;\n  poke(V, 0, 495);\n  t1 = min(1048576, trunc(peek(V, 363)));\n  r = 0;\n  for (t2 = 0; t2 < t1; t2 += 1) {\n    if ((abs((abs(p0 - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      t3 = trunc(peek(V, 215) + peek(V, 495) + 0.00001);\n      poke(M, 0, t3);\n      t4 = trunc(peek(V, 216) + peek(V, 495) + 0.00001);\n      poke(M, 0, t4);\n    }\n    else {\n      t5 = trunc(peek(V, 215) + peek(V, 495) + 0.00001);\n      poke(V, peek(V, 205) * 16807 - 2147483647 * floor(peek(V, 205) * 16807 / 2147483647), 205);\n      t6 = (peek(V, 205) / 2147483647 * 1);\n      poke(M, t6, t5);\n      t7 = trunc(peek(V, 216) + peek(V, 495) + 0.00001);\n      poke(V, peek(V, 205) * 16807 - 2147483647 * floor(peek(V, 205) * 16807 / 2147483647), 205);\n      t8 = (peek(V, 205) / 2147483647 * 1);\n      poke(M, t8, t7);\n    }\n    t9 = trunc(peek(V, 217) + peek(V, 495) + 0.00001);\n    poke(M, 0, t9);\n    t10 = (peek(V, 495) + 1);\n    poke(V, t10, 495);\n    r = t10;\n  }\n  return r;\n}\n\nf_lock_beat_phase(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0;\n  r = 0;\n  t1 = f_frac(V, M, mq, (peek(V, 298) / peek(M, trunc(peek(V, 233) + peek(V, 4) + 0.00001))));\n  poke(V, t1, 498);\n  poke(V, 0, 499);\n  t2 = min(1048576, trunc(peek(V, 363)));\n  for (t3 = 0; t3 < t2; t3 += 1) {\n    if ((abs((abs(peek(M, trunc(peek(V, 226) + peek(V, 499) + 0.00001)) - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      t4 = trunc(peek(V, 215) + peek(V, 499) + 0.00001);\n      t5 = f_frac(V, M, mq, (peek(M, trunc(peek(V, 215) + (peek(V, 499) - peek(V, 362)) + 0.00001)) + peek(V, 498)));\n      poke(M, t5, t4);\n    }\n    t6 = (peek(V, 499) + 1);\n    poke(V, t6, 499);\n  }\n  t7 = peek(V, 498);\n  poke(V, t7, 500);\n  r = t7;\n  return r;\n}\n\nf_start_note(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0;\n  r = 0;\n  t1 = p0;\n  poke(V, t1, 271);\n  if ((abs(p1) >= 0.00001)) {\n    t2 = f_env_trigger__aenv_o(V, M, mq);\n    t3 = f_env_trigger__menv_o(V, M, mq);\n    poke(V, peek(V, 205) * 16807 - 2147483647 * floor(peek(V, 205) * 16807 / 2147483647), 205);\n    t4 = ((peek(V, 205) / 2147483647 * 2) - 1);\n    poke(V, t4, 491);\n    poke(V, 0, 492);\n    if ((abs(peek(V, 38)) >= 0.00001)) {\n      poke(V, 0, 479);\n      poke(V, 0, 493);\n    }\n    if ((abs(peek(V, 44)) >= 0.00001)) {\n      poke(V, 0, 480);\n      poke(V, 0, 494);\n    }\n    if ((abs((peek(V, 12) > 0 ? 1 : 0)) >= 0.00001)) {\n      t5 = f_reset_phases(V, M, mq, peek(V, 12));\n    }\n    if ((abs((peek(V, 496) < 0.001 ? 1 : 0)) >= 0.00001)) {\n      poke(V, 0, 497);\n    }\n    if ((abs((abs(peek(V, 2) - 2) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      t6 = f_lock_beat_phase(V, M, mq);\n      r = t6;\n    }\n    else {\n      r = 0;\n    }\n  }\n  else {\n    r = 0;\n  }\n  return r;\n}\n\nf_note_on(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0;\n  r = 0;\n  t1 = (((abs((peek(V, 268) > 0 ? 1 : 0)) >= 0.00001) || (abs((((abs(peek(V, 277)) >= 0.00001) && (abs(peek(V, 269)) >= 0.00001)) ? 1 : 0)) >= 0.00001)) ? 1 : 0);\n  poke(V, t1, 485);\n  t2 = f_stack_remove(V, M, mq, p0);\n  if ((abs((peek(V, 268) < 64 ? 1 : 0)) >= 0.00001)) {\n    t3 = trunc(peek(V, 214) + peek(V, 268) + 0.00001);\n    t4 = p0;\n    poke(M, t4, t3);\n    t5 = (peek(V, 268) + 1);\n    poke(V, t5, 268);\n  }\n  t6 = (p1 / 127);\n  poke(V, t6, 270);\n  t7 = (((abs((peek(V, 74) > 0 ? 1 : 0)) >= 0.00001) && (abs(((abs((abs(peek(V, 75) - 1) < 0.00001 ? 1 : 0)) >= 0.00001) ? peek(V, 273) : peek(V, 485))) >= 0.00001)) ? 1 : 0);\n  poke(V, t7, 488);\n  if ((abs(((abs(peek(V, 488)) >= 0.00001) ? 0 : 1)) >= 0.00001)) {\n    t8 = p0;\n    poke(V, t8, 272);\n  }\n  t9 = f_start_note(V, M, mq, p0, ((abs((((abs(peek(V, 485)) >= 0.00001) && (abs((abs(peek(V, 73) - 0) < 0.00001 ? 1 : 0)) >= 0.00001)) ? 1 : 0)) >= 0.00001) ? 0 : 1));\n  poke(V, 1, 269);\n  poke(V, 1, 273);\n  r = 1;\n  return r;\n}\n\nf_env_release__aenv_o(V, M, mq) {\n  r = 0;\n  if ((abs((peek(V, 489) > 0 ? 1 : 0)) >= 0.00001)) {\n    poke(V, 4, 489);\n    r = 4;\n  }\n  else {\n    r = 0;\n  }\n  return r;\n}\n\nf_env_release__menv_o(V, M, mq) {\n  r = 0;\n  if ((abs((peek(V, 490) > 0 ? 1 : 0)) >= 0.00001)) {\n    poke(V, 4, 490);\n    r = 4;\n  }\n  else {\n    r = 0;\n  }\n  return r;\n}\n\nf_release_all(V, M, mq) {\n  t1 = 0; t2 = 0;\n  r = 0;\n  poke(V, 0, 269);\n  t1 = f_env_release__aenv_o(V, M, mq);\n  t2 = f_env_release__menv_o(V, M, mq);\n  r = t2;\n  return r;\n}\n\nf_note_off(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0;\n  r = 0;\n  t1 = f_stack_remove(V, M, mq, p0);\n  if ((abs((peek(V, 268) > 0 ? 1 : 0)) >= 0.00001)) {\n    if ((abs((abs(peek(M, trunc(peek(V, 214) + (peek(V, 268) - 1) + 0.00001)) - peek(V, 271)) < 0.00001 ? 0 : 1)) >= 0.00001)) {\n      t2 = (peek(V, 74) > 0 ? 1 : 0);\n      poke(V, t2, 488);\n      if ((abs(((abs(peek(V, 488)) >= 0.00001) ? 0 : 1)) >= 0.00001)) {\n        t3 = peek(M, trunc(peek(V, 214) + (peek(V, 268) - 1) + 0.00001));\n        poke(V, t3, 272);\n      }\n      t4 = f_start_note(V, M, mq, peek(M, trunc(peek(V, 214) + (peek(V, 268) - 1) + 0.00001)), (abs(peek(V, 73) - 1) < 0.00001 ? 1 : 0));\n      r = t4;\n    }\n    else {\n      r = 0;\n    }\n  }\n  else {\n    if ((abs(((abs(peek(V, 277)) >= 0.00001) ? 0 : 1)) >= 0.00001)) {\n      t5 = f_release_all(V, M, mq);\n      r = t5;\n    }\n    else {\n      r = 0;\n    }\n  }\n  return r;\n}\n\nf_all_notes_off(V, M, mq) {\n  t1 = 0;\n  r = 0;\n  poke(V, 0, 268);\n  t1 = f_release_all(V, M, mq);\n  r = t1;\n  return r;\n}\n\nf_handle_midi(V, M, mq, p0, p1, p2) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0;\n  r = 0;\n  t1 = eel_band(p0, 240);\n  poke(V, t1, 484);\n  if ((abs((((abs((abs(peek(V, 484) - 144) < 0.00001 ? 1 : 0)) >= 0.00001) && (abs((p2 > 0 ? 1 : 0)) >= 0.00001)) ? 1 : 0)) >= 0.00001)) {\n    t2 = f_note_on(V, M, mq, p1, p2);\n    r = t2;\n  }\n  else {\n    if ((abs((((abs((abs(peek(V, 484) - 128) < 0.00001 ? 1 : 0)) >= 0.00001) || (abs((abs(peek(V, 484) - 144) < 0.00001 ? 1 : 0)) >= 0.00001)) ? 1 : 0)) >= 0.00001)) {\n      t3 = f_note_off(V, M, mq, p1);\n      r = t3;\n    }\n    else {\n      if ((abs((abs(peek(V, 484) - 224) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n        t4 = ((((p2 * 128) + p1) - 8192) / 8192);\n        poke(V, t4, 276);\n        r = t4;\n      }\n      else {\n        if ((abs((abs(peek(V, 484) - 176) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n          if ((abs((abs(p1 - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n            t5 = (p2 / 127);\n            poke(V, t5, 274);\n            r = t5;\n          }\n          else {\n            if ((abs((abs(p1 - 64) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n              t6 = (p2 >= 64 ? 1 : 0);\n              poke(V, t6, 277);\n              if ((abs((((abs((((abs(((abs(peek(V, 277)) >= 0.00001) ? 0 : 1)) >= 0.00001) && (abs((abs(peek(V, 268) - 0) < 0.00001 ? 1 : 0)) >= 0.00001)) ? 1 : 0)) >= 0.00001) && (abs(peek(V, 269)) >= 0.00001)) ? 1 : 0)) >= 0.00001)) {\n                t7 = f_release_all(V, M, mq);\n                r = t7;\n              }\n              else {\n                r = 0;\n              }\n            }\n            else {\n              if ((abs((((abs((abs(p1 - 123) < 0.00001 ? 1 : 0)) >= 0.00001) || (abs((abs(p1 - 120) < 0.00001 ? 1 : 0)) >= 0.00001)) ? 1 : 0)) >= 0.00001)) {\n                t8 = f_all_notes_off(V, M, mq);\n                r = t8;\n              }\n              else {\n                r = 0;\n              }\n            }\n          }\n        }\n        else {\n          if ((abs((abs(peek(V, 484) - 208) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n            t9 = (p1 / 127);\n            poke(V, t9, 275);\n            r = t9;\n          }\n          else {\n            if ((abs((abs(peek(V, 484) - 160) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n              t10 = (p2 / 127);\n              poke(V, t10, 275);\n              r = t10;\n            }\n            else {\n              r = 0;\n            }\n          }\n        }\n      }\n    }\n  }\n  return r;\n}\n\nf_env_tick__aenv_o(V, M, mq, p0, p1, p2, p3) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  if ((abs((abs(peek(V, 489) - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n    t1 = ((1.25 - peek(V, 496)) * p0);\n    t2 = (peek(V, 496) + t1);\n    poke(V, t2, 496);\n    if ((abs((peek(V, 496) >= 1 ? 1 : 0)) >= 0.00001)) {\n      poke(V, 1, 496);\n      poke(V, 2, 489);\n    }\n  }\n  else {\n    if ((abs((abs(peek(V, 489) - 2) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      t3 = ((p2 - peek(V, 496)) * p1);\n      t4 = (peek(V, 496) + t3);\n      poke(V, t4, 496);\n      if ((abs((abs((peek(V, 496) - p2)) < 0.0005 ? 1 : 0)) >= 0.00001)) {\n        poke(V, 3, 489);\n      }\n    }\n    else {\n      if ((abs((abs(peek(V, 489) - 3) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n        t5 = ((p2 - peek(V, 496)) * 0.002);\n        t6 = (peek(V, 496) + t5);\n        poke(V, t6, 496);\n      }\n      else {\n        if ((abs((abs(peek(V, 489) - 4) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n          t7 = (peek(V, 496) * p3);\n          t8 = (peek(V, 496) - t7);\n          poke(V, t8, 496);\n          if ((abs((peek(V, 496) < 0.00002 ? 1 : 0)) >= 0.00001)) {\n            poke(V, 0, 496);\n            poke(V, 0, 489);\n          }\n        }\n      }\n    }\n  }\n  r = peek(V, 496);\n  return r;\n}\n\nf_env_tick__menv_o(V, M, mq, p0, p1, p2, p3) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  if ((abs((abs(peek(V, 490) - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n    t1 = ((1.25 - peek(V, 502)) * p0);\n    t2 = (peek(V, 502) + t1);\n    poke(V, t2, 502);\n    if ((abs((peek(V, 502) >= 1 ? 1 : 0)) >= 0.00001)) {\n      poke(V, 1, 502);\n      poke(V, 2, 490);\n    }\n  }\n  else {\n    if ((abs((abs(peek(V, 490) - 2) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      t3 = ((p2 - peek(V, 502)) * p1);\n      t4 = (peek(V, 502) + t3);\n      poke(V, t4, 502);\n      if ((abs((abs((peek(V, 502) - p2)) < 0.0005 ? 1 : 0)) >= 0.00001)) {\n        poke(V, 3, 490);\n      }\n    }\n    else {\n      if ((abs((abs(peek(V, 490) - 3) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n        t5 = ((p2 - peek(V, 502)) * 0.002);\n        t6 = (peek(V, 502) + t5);\n        poke(V, t6, 502);\n      }\n      else {\n        if ((abs((abs(peek(V, 490) - 4) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n          t7 = (peek(V, 502) * p3);\n          t8 = (peek(V, 502) - t7);\n          poke(V, t8, 502);\n          if ((abs((peek(V, 502) < 0.00002 ? 1 : 0)) >= 0.00001)) {\n            poke(V, 0, 502);\n            poke(V, 0, 490);\n          }\n        }\n      }\n    }\n  }\n  r = peek(V, 502);\n  return r;\n}\n\nf_lfo_tick__lfo1(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0; t12 = 0; t13 = 0; t14 = 0; t15 = 0;\n  r = 0;\n  t1 = (p1 * peek(V, 325));\n  t2 = (peek(V, 479) + t1);\n  poke(V, t2, 479);\n  if ((abs((peek(V, 479) >= 1 ? 1 : 0)) >= 0.00001)) {\n    t3 = floor(peek(V, 479));\n    t4 = (peek(V, 479) - t3);\n    poke(V, t4, 479);\n    t5 = peek(V, 506);\n    poke(V, t5, 507);\n    poke(V, peek(V, 205) * 16807 - 2147483647 * floor(peek(V, 205) * 16807 / 2147483647), 205);\n    t6 = ((peek(V, 205) / 2147483647 * 2) - 1);\n    poke(V, t6, 506);\n  }\n  if ((abs((abs(p0 - 0) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n    t7 = sin(((2 * 3.141592653589793) * peek(V, 479)));\n    poke(V, t7, 508);\n  }\n  else {\n    if ((abs((abs(p0 - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      t8 = (1 - (4 * abs((peek(V, 479) - 0.5))));\n      poke(V, t8, 508);\n    }\n    else {\n      if ((abs((abs(p0 - 2) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n        t9 = ((peek(V, 479) + peek(V, 479)) - 1);\n        poke(V, t9, 508);\n      }\n      else {\n        if ((abs((abs(p0 - 3) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n          t10 = ((1 - peek(V, 479)) - peek(V, 479));\n          poke(V, t10, 508);\n        }\n        else {\n          if ((abs((abs(p0 - 4) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n            t11 = ((abs((peek(V, 479) < 0.5 ? 1 : 0)) >= 0.00001) ? 1 : (-1));\n            poke(V, t11, 508);\n          }\n          else {\n            if ((abs((abs(p0 - 5) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n              t12 = peek(V, 506);\n              poke(V, t12, 508);\n            }\n            else {\n              t13 = (peek(V, 507) + ((peek(V, 506) - peek(V, 507)) * (0.5 - (0.5 * cos((3.141592653589793 * peek(V, 479)))))));\n              poke(V, t13, 508);\n            }\n          }\n        }\n      }\n    }\n  }\n  t14 = ((peek(V, 508) - peek(V, 493)) * peek(V, 327));\n  t15 = (peek(V, 493) + t14);\n  poke(V, t15, 493);\n  r = peek(V, 493);\n  return r;\n}\n\nf_lfo_tick__lfo2(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0; t12 = 0; t13 = 0; t14 = 0; t15 = 0;\n  r = 0;\n  t1 = (p1 * peek(V, 325));\n  t2 = (peek(V, 480) + t1);\n  poke(V, t2, 480);\n  if ((abs((peek(V, 480) >= 1 ? 1 : 0)) >= 0.00001)) {\n    t3 = floor(peek(V, 480));\n    t4 = (peek(V, 480) - t3);\n    poke(V, t4, 480);\n    t5 = peek(V, 510);\n    poke(V, t5, 511);\n    poke(V, peek(V, 205) * 16807 - 2147483647 * floor(peek(V, 205) * 16807 / 2147483647), 205);\n    t6 = ((peek(V, 205) / 2147483647 * 2) - 1);\n    poke(V, t6, 510);\n  }\n  if ((abs((abs(p0 - 0) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n    t7 = sin(((2 * 3.141592653589793) * peek(V, 480)));\n    poke(V, t7, 512);\n  }\n  else {\n    if ((abs((abs(p0 - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      t8 = (1 - (4 * abs((peek(V, 480) - 0.5))));\n      poke(V, t8, 512);\n    }\n    else {\n      if ((abs((abs(p0 - 2) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n        t9 = ((peek(V, 480) + peek(V, 480)) - 1);\n        poke(V, t9, 512);\n      }\n      else {\n        if ((abs((abs(p0 - 3) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n          t10 = ((1 - peek(V, 480)) - peek(V, 480));\n          poke(V, t10, 512);\n        }\n        else {\n          if ((abs((abs(p0 - 4) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n            t11 = ((abs((peek(V, 480) < 0.5 ? 1 : 0)) >= 0.00001) ? 1 : (-1));\n            poke(V, t11, 512);\n          }\n          else {\n            if ((abs((abs(p0 - 5) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n              t12 = peek(V, 510);\n              poke(V, t12, 512);\n            }\n            else {\n              t13 = (peek(V, 511) + ((peek(V, 510) - peek(V, 511)) * (0.5 - (0.5 * cos((3.141592653589793 * peek(V, 480)))))));\n              poke(V, t13, 512);\n            }\n          }\n        }\n      }\n    }\n  }\n  t14 = ((peek(V, 512) - peek(V, 494)) * peek(V, 327));\n  t15 = (peek(V, 494) + t14);\n  poke(V, t15, 494);\n  r = peek(V, 494);\n  return r;\n}\n\nf_update_pans(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0;\n  r = 0;\n  poke(V, 0, 524);\n  t1 = min(1048576, trunc(peek(V, 363)));\n  r = 0;\n  for (t2 = 0; t2 < t1; t2 += 1) {\n    t3 = f_clamp(V, M, mq, (peek(M, trunc(peek(V, 227) + peek(V, 524) + 0.00001)) * p0), (-1), 1);\n    t4 = (((t3 + 1) * 0.25) * 3.141592653589793);\n    poke(V, t4, 525);\n    t5 = trunc(peek(V, 220) + peek(V, 524) + 0.00001);\n    t6 = (cos(peek(V, 525)) * 1.41421356);\n    poke(M, t6, t5);\n    t7 = trunc(peek(V, 221) + peek(V, 524) + 0.00001);\n    t8 = (sin(peek(V, 525)) * 1.41421356);\n    poke(M, t8, t7);\n    t9 = (peek(V, 524) + 1);\n    poke(V, t9, 524);\n    r = t9;\n  }\n  return r;\n}\n\nf_tri(V, M, mq, p0) {\n  r = 0;\n  r = ((4 * abs((p0 - 0.5))) - 1);\n  return r;\n}\n\nf_calc_filter(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0; t12 = 0; t13 = 0; t14 = 0;\n  r = 0;\n  t1 = f_clamp(V, M, mq, p0, 10, min(20000, (peek(V, 332) * 0.45)));\n  p0 = t1;\n  t2 = tan(((3.141592653589793 * p0) * peek(V, 333)));\n  poke(V, t2, 562);\n  t3 = (peek(V, 562) / (1 + peek(V, 562)));\n  poke(V, t3, 563);\n  t4 = (1 - peek(V, 563));\n  poke(V, t4, 564);\n  t5 = (((peek(V, 563) * peek(V, 563)) * peek(V, 563)) * peek(V, 563));\n  poke(V, t5, 565);\n  t6 = (peek(V, 563) * peek(V, 564));\n  poke(V, t6, 566);\n  t7 = (peek(V, 563) * peek(V, 566));\n  poke(V, t7, 567);\n  t8 = (peek(V, 563) * peek(V, 567));\n  poke(V, t8, 568);\n  t9 = (2 - (1.96 * p1));\n  poke(V, t9, 569);\n  t10 = (1 / (1 + (peek(V, 562) * (peek(V, 562) + peek(V, 569)))));\n  poke(V, t10, 570);\n  t11 = (peek(V, 562) * peek(V, 570));\n  poke(V, t11, 571);\n  t12 = (peek(V, 562) * peek(V, 571));\n  poke(V, t12, 572);\n  t13 = (p1 * 3.9);\n  poke(V, t13, 573);\n  t14 = (1 + (peek(V, 573) * 0.55));\n  poke(V, t14, 574);\n  r = t14;\n  return r;\n}\n\nf_filt_reset__fl(V, M, mq) {\n  r = 0;\n  poke(V, 0, 586);\n  poke(V, 0, 587);\n  poke(V, 0, 588);\n  poke(V, 0, 589);\n  poke(V, 0, 590);\n  poke(V, 0, 591);\n  r = 0;\n  return r;\n}\n\nf_filt_reset__fr(V, M, mq) {\n  r = 0;\n  poke(V, 0, 592);\n  poke(V, 0, 593);\n  poke(V, 0, 594);\n  poke(V, 0, 595);\n  poke(V, 0, 596);\n  poke(V, 0, 597);\n  r = 0;\n  return r;\n}\n\nf_dist_reset__dsl(V, M, mq) {\n  r = 0;\n  poke(V, 0, 598);\n  poke(V, 0, 599);\n  r = 0;\n  return r;\n}\n\nf_dist_reset__dsr(V, M, mq) {\n  r = 0;\n  poke(V, 0, 600);\n  poke(V, 0, 601);\n  r = 0;\n  return r;\n}\n\nf_voice_reset(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0;\n  r = 0;\n  t1 = f_filt_reset__fl(V, M, mq);\n  t2 = f_filt_reset__fr(V, M, mq);\n  t3 = f_dist_reset__dsl(V, M, mq);\n  t4 = f_dist_reset__dsr(V, M, mq);\n  t5 = f_dec_reset__decl(V, M, mq);\n  t6 = f_dec_reset__decr(V, M, mq);\n  t7 = peek(V, 236);\n  t8 = min(trunc(40), 8388608);\n  for (t9 = 0; t9 < t8; t9 += 1) {\n    poke(M, 0, trunc(t7 + t9 + 0.00001));\n  }\n  poke(V, 0, 602);\n  poke(V, 0, 603);\n  poke(V, 0, 604);\n  poke(V, 0, 605);\n  r = 0;\n  return r;\n}\n\nf_blep(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0;\n  r = 0;\n  if ((abs((p0 < p1 ? 1 : 0)) >= 0.00001)) {\n    t1 = p1;\n    t2 = (p0 / t1);\n    p0 = t2;\n    r = (((p0 + p0) - (p0 * p0)) - 1);\n  }\n  else {\n    if ((abs((p0 > (1 - p1) ? 1 : 0)) >= 0.00001)) {\n      t3 = ((p0 - 1) / p1);\n      p0 = t3;\n      r = ((((p0 * p0) + p0) + p0) + 1);\n    }\n    else {\n      r = 0;\n    }\n  }\n  return r;\n}\n\nf_saw(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0;\n  r = 0;\n  t1 = ((p0 + p0) - 1);\n  t2 = f_blep(V, M, mq, p0, p1);\n  r = (t1 - t2);\n  return r;\n}\n\nf_pulse(V, M, mq, p0, p1, p2) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0;\n  r = 0;\n  t1 = (p0 - p2);\n  poke(V, t1, 612);\n  if ((abs((peek(V, 612) < 0 ? 1 : 0)) >= 0.00001)) {\n    t2 = (peek(V, 612) + 1);\n    poke(V, t2, 612);\n  }\n  t3 = ((abs((p0 < p2 ? 1 : 0)) >= 0.00001) ? 1 : (-1));\n  t4 = f_blep(V, M, mq, p0, p1);\n  t5 = (t3 + t4);\n  t6 = f_blep(V, M, mq, peek(V, 612), p1);\n  r = (t5 - t6);\n  return r;\n}\n\nf_wave_morph(V, M, mq, p0, p1, p2) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0;\n  r = 0;\n  if ((abs((p2 < 0.3333 ? 1 : 0)) >= 0.00001)) {\n    t1 = (p2 * 3);\n    poke(V, t1, 610);\n    t2 = f_saw(V, M, mq, p0, p1);\n    poke(V, t2, 611);\n    t3 = f_pulse(V, M, mq, p0, p1, 0.5);\n    poke(V, t3, 613);\n    r = (peek(V, 611) + ((peek(V, 613) - peek(V, 611)) * peek(V, 610)));\n  }\n  else {\n    if ((abs((p2 < 0.6667 ? 1 : 0)) >= 0.00001)) {\n      t4 = ((p2 - 0.3333) * 3);\n      poke(V, t4, 610);\n      t5 = f_pulse(V, M, mq, p0, p1, 0.5);\n      poke(V, t5, 613);\n      t6 = f_tri(V, M, mq, p0);\n      poke(V, t6, 611);\n      r = (peek(V, 613) + ((peek(V, 611) - peek(V, 613)) * peek(V, 610)));\n    }\n    else {\n      t7 = ((p2 - 0.6667) * 3.0003);\n      poke(V, t7, 610);\n      t8 = f_tri(V, M, mq, p0);\n      poke(V, t8, 611);\n      t9 = (-cos(((2 * 3.141592653589793) * p0)));\n      poke(V, t9, 613);\n      r = (peek(V, 611) + ((peek(V, 613) - peek(V, 611)) * peek(V, 610)));\n    }\n  }\n  return r;\n}\n\nf_cz_wave(V, M, mq, p0, p1, p2, p3) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0;\n  r = 0;\n  if ((abs((p3 < 0.5 ? 1 : 0)) >= 0.00001)) {\n    t1 = (0.5 - (0.5 * p2));\n    poke(V, t1, 615);\n    if ((abs((peek(V, 615) < (2 * p1) ? 1 : 0)) >= 0.00001)) {\n      t2 = (2 * p1);\n      poke(V, t2, 615);\n    }\n    t3 = ((abs((p0 < peek(V, 615) ? 1 : 0)) >= 0.00001) ? ((0.5 * p0) / peek(V, 615)) : (0.5 + ((0.5 * (p0 - peek(V, 615))) / (1 - peek(V, 615)))));\n    poke(V, t3, 616);\n    r = (-cos(((2 * 3.141592653589793) * peek(V, 616))));\n  }\n  else {\n    if ((abs((p3 < 1.5 ? 1 : 0)) >= 0.00001)) {\n      t4 = (0.25 - (0.25 * p2));\n      poke(V, t4, 615);\n      if ((abs((peek(V, 615) < (2 * p1) ? 1 : 0)) >= 0.00001)) {\n        t5 = (2 * p1);\n        poke(V, t5, 615);\n      }\n      t6 = ((abs((p0 < peek(V, 615) ? 1 : 0)) >= 0.00001) ? ((0.5 * p0) / peek(V, 615)) : ((abs((p0 < 0.5 ? 1 : 0)) >= 0.00001) ? 0.5 : ((abs((p0 < (0.5 + peek(V, 615)) ? 1 : 0)) >= 0.00001) ? (0.5 + ((0.5 * (p0 - 0.5)) / peek(V, 615))) : 1)));\n      poke(V, t6, 616);\n      r = (-cos(((2 * 3.141592653589793) * peek(V, 616))));\n    }\n    else {\n      if ((abs((p3 < 2.5 ? 1 : 0)) >= 0.00001)) {\n        t7 = (1 - (0.9 * p2));\n        poke(V, t7, 615);\n        if ((abs((peek(V, 615) < (2 * p1) ? 1 : 0)) >= 0.00001)) {\n          t8 = (2 * p1);\n          poke(V, t8, 615);\n        }\n        t9 = ((abs((p0 < peek(V, 615) ? 1 : 0)) >= 0.00001) ? (p0 / peek(V, 615)) : 1);\n        poke(V, t9, 616);\n        r = (-cos(((2 * 3.141592653589793) * peek(V, 616))));\n      }\n      else {\n        t10 = (1 + (p2 * 14));\n        poke(V, t10, 617);\n        t11 = ((abs((p3 < 3.5 ? 1 : 0)) >= 0.00001) ? (1 - p0) : ((abs((p3 < 4.5 ? 1 : 0)) >= 0.00001) ? ((abs((p0 < 0.5 ? 1 : 0)) >= 0.00001) ? (p0 + p0) : ((2 - p0) - p0)) : ((abs((p0 < 0.5 ? 1 : 0)) >= 0.00001) ? 1 : ((2 - p0) - p0))));\n        poke(V, t11, 618);\n        r = ((peek(V, 618) * (1 - cos((((2 * 3.141592653589793) * p0) * peek(V, 617))))) - 1);\n      }\n    }\n  }\n  return r;\n}\n\nf_eng_phaser(V, M, mq, p0, p1, p2) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0;\n  r = 0;\n  t1 = (p0 + (peek(M, trunc(p1 + 0.00001)) * peek(V, 542)));\n  poke(V, t1, 622);\n  poke(V, 1, 623);\n  t2 = min(1048576, trunc(peek(V, 543)));\n  for (t3 = 0; t3 < t2; t3 += 1) {\n    t4 = ((p2 * peek(V, 622)) + peek(M, trunc(p1 + peek(V, 623) + 0.00001)));\n    poke(V, t4, 624);\n    t5 = trunc(p1 + peek(V, 623) + 0.00001);\n    t6 = (peek(V, 622) - (p2 * peek(V, 624)));\n    poke(M, t6, t5);\n    t7 = peek(V, 624);\n    poke(V, t7, 622);\n    t8 = (peek(V, 623) + 1);\n    poke(V, t8, 623);\n  }\n  t9 = trunc(p1 + 0.00001);\n  t10 = peek(V, 622);\n  poke(M, t10, t9);\n  r = (0.5 * (p0 + peek(V, 622)));\n  return r;\n}\n\nf_dist__dsl(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0; t12 = 0; t13 = 0; t14 = 0; t15 = 0; t16 = 0; t17 = 0; t18 = 0;\n  r = 0;\n  t1 = (p0 * peek(V, 581));\n  poke(V, t1, 628);\n  if ((abs((abs(peek(V, 46) - 0) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n    t2 = f_sat(V, M, mq, peek(V, 628));\n    poke(V, t2, 629);\n  }\n  else {\n    if ((abs((abs(peek(V, 46) - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      t3 = f_sat(V, M, mq, ((peek(V, 628) * 0.8) + 0.5));\n      t4 = ((t3 - peek(V, 380)) * 1.2);\n      poke(V, t4, 629);\n    }\n    else {\n      if ((abs((abs(peek(V, 46) - 2) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n        t5 = f_clamp(V, M, mq, peek(V, 628), (-1), 1);\n        poke(V, t5, 629);\n      }\n      else {\n        if ((abs((abs(peek(V, 46) - 3) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n          t6 = sin((peek(V, 628) * 1.5707963));\n          poke(V, t6, 629);\n        }\n        else {\n          if ((abs((abs(peek(V, 46) - 4) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n            t7 = f_sat(V, M, mq, peek(V, 628));\n            t8 = ((abs(t7) * 2) - 1);\n            poke(V, t8, 629);\n          }\n          else {\n            t9 = ((peek(V, 628) - peek(V, 599)) * peek(V, 381));\n            t10 = (peek(V, 599) + t9);\n            poke(V, t10, 599);\n            t11 = ((peek(V, 628) - peek(V, 599)) * 2);\n            t12 = (peek(V, 628) + t11);\n            poke(V, t12, 628);\n            if ((abs((peek(V, 628) > 0 ? 1 : 0)) >= 0.00001)) {\n              t14 = f_sat(V, M, mq, (peek(V, 628) * 1.4));\n              t13 = t14;\n            }\n            else {\n              t15 = f_sat(V, M, mq, peek(V, 628));\n              t13 = (t15 * 0.8);\n            }\n            poke(V, t13, 629);\n          }\n        }\n      }\n    }\n  }\n  if ((abs(peek(V, 382)) >= 0.00001)) {\n    t16 = ((peek(V, 629) - peek(V, 598)) * peek(V, 383));\n    t17 = (peek(V, 598) + t16);\n    poke(V, t17, 598);\n    t18 = peek(V, 598);\n    poke(V, t18, 629);\n  }\n  r = (p0 + ((peek(V, 629) - p0) * peek(V, 384)));\n  return r;\n}\n\nf_dist__dsr(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0; t12 = 0; t13 = 0; t14 = 0; t15 = 0; t16 = 0; t17 = 0; t18 = 0;\n  r = 0;\n  t1 = (p0 * peek(V, 581));\n  poke(V, t1, 628);\n  if ((abs((abs(peek(V, 46) - 0) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n    t2 = f_sat(V, M, mq, peek(V, 628));\n    poke(V, t2, 629);\n  }\n  else {\n    if ((abs((abs(peek(V, 46) - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      t3 = f_sat(V, M, mq, ((peek(V, 628) * 0.8) + 0.5));\n      t4 = ((t3 - peek(V, 380)) * 1.2);\n      poke(V, t4, 629);\n    }\n    else {\n      if ((abs((abs(peek(V, 46) - 2) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n        t5 = f_clamp(V, M, mq, peek(V, 628), (-1), 1);\n        poke(V, t5, 629);\n      }\n      else {\n        if ((abs((abs(peek(V, 46) - 3) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n          t6 = sin((peek(V, 628) * 1.5707963));\n          poke(V, t6, 629);\n        }\n        else {\n          if ((abs((abs(peek(V, 46) - 4) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n            t7 = f_sat(V, M, mq, peek(V, 628));\n            t8 = ((abs(t7) * 2) - 1);\n            poke(V, t8, 629);\n          }\n          else {\n            t9 = ((peek(V, 628) - peek(V, 601)) * peek(V, 381));\n            t10 = (peek(V, 601) + t9);\n            poke(V, t10, 601);\n            t11 = ((peek(V, 628) - peek(V, 601)) * 2);\n            t12 = (peek(V, 628) + t11);\n            poke(V, t12, 628);\n            if ((abs((peek(V, 628) > 0 ? 1 : 0)) >= 0.00001)) {\n              t14 = f_sat(V, M, mq, (peek(V, 628) * 1.4));\n              t13 = t14;\n            }\n            else {\n              t15 = f_sat(V, M, mq, peek(V, 628));\n              t13 = (t15 * 0.8);\n            }\n            poke(V, t13, 629);\n          }\n        }\n      }\n    }\n  }\n  if ((abs(peek(V, 382)) >= 0.00001)) {\n    t16 = ((peek(V, 629) - peek(V, 600)) * peek(V, 383));\n    t17 = (peek(V, 600) + t16);\n    poke(V, t17, 600);\n    t18 = peek(V, 600);\n    poke(V, t18, 629);\n  }\n  r = (p0 + ((peek(V, 629) - p0) * peek(V, 384)));\n  return r;\n}\n\nf_filt__fl(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0; t12 = 0; t13 = 0; t14 = 0; t15 = 0; t16 = 0; t17 = 0; t18 = 0; t19 = 0; t20 = 0; t21 = 0;\n  r = 0;\n  if ((abs(peek(V, 576)) >= 0.00001)) {\n    t1 = f_sat(V, M, mq, (p0 * peek(V, 577)));\n    t2 = (t1 * peek(V, 578));\n    p0 = t2;\n  }\n  if ((abs((abs(peek(V, 20) - 0) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n    t3 = (((p0 * peek(V, 574)) - (peek(V, 573) * ((((peek(V, 568) * peek(V, 591)) + (peek(V, 567) * peek(V, 590))) + (peek(V, 566) * peek(V, 589))) + (peek(V, 564) * peek(V, 588))))) / (1 + (peek(V, 573) * peek(V, 565))));\n    poke(V, t3, 630);\n    t4 = f_sat(V, M, mq, peek(V, 630));\n    poke(V, t4, 630);\n    t5 = ((peek(V, 630) - peek(V, 591)) * peek(V, 563));\n    poke(V, t5, 631);\n    t6 = (peek(V, 631) + peek(V, 591));\n    poke(V, t6, 632);\n    t7 = (peek(V, 632) + peek(V, 631));\n    poke(V, t7, 591);\n    t8 = ((peek(V, 632) - peek(V, 590)) * peek(V, 563));\n    poke(V, t8, 631);\n    t9 = (peek(V, 631) + peek(V, 590));\n    poke(V, t9, 633);\n    t10 = (peek(V, 633) + peek(V, 631));\n    poke(V, t10, 590);\n    t11 = ((peek(V, 633) - peek(V, 589)) * peek(V, 563));\n    poke(V, t11, 631);\n    t12 = (peek(V, 631) + peek(V, 589));\n    poke(V, t12, 634);\n    t13 = (peek(V, 634) + peek(V, 631));\n    poke(V, t13, 589);\n    t14 = ((peek(V, 634) - peek(V, 588)) * peek(V, 563));\n    poke(V, t14, 631);\n    t15 = (peek(V, 631) + peek(V, 588));\n    poke(V, t15, 635);\n    t16 = (peek(V, 635) + peek(V, 631));\n    poke(V, t16, 588);\n    r = peek(V, 635);\n  }\n  else {\n    t17 = (p0 - peek(V, 586));\n    poke(V, t17, 636);\n    t18 = ((peek(V, 570) * peek(V, 587)) + (peek(V, 571) * peek(V, 636)));\n    poke(V, t18, 637);\n    t19 = ((peek(V, 586) + (peek(V, 571) * peek(V, 587))) + (peek(V, 572) * peek(V, 636)));\n    poke(V, t19, 638);\n    t20 = ((peek(V, 637) + peek(V, 637)) - peek(V, 587));\n    poke(V, t20, 587);\n    t21 = ((peek(V, 638) + peek(V, 638)) - peek(V, 586));\n    poke(V, t21, 586);\n    if ((abs((abs(peek(V, 20) - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      r = peek(V, 638);\n    }\n    else {\n      if ((abs((abs(peek(V, 20) - 2) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n        r = (peek(V, 637) * peek(V, 569));\n      }\n      else {\n        if ((abs((abs(peek(V, 20) - 3) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n          r = ((p0 - (peek(V, 569) * peek(V, 637))) - peek(V, 638));\n        }\n        else {\n          r = (p0 - (peek(V, 569) * peek(V, 637)));\n        }\n      }\n    }\n  }\n  return r;\n}\n\nf_filt__fr(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0; t12 = 0; t13 = 0; t14 = 0; t15 = 0; t16 = 0; t17 = 0; t18 = 0; t19 = 0; t20 = 0; t21 = 0;\n  r = 0;\n  if ((abs(peek(V, 576)) >= 0.00001)) {\n    t1 = f_sat(V, M, mq, (p0 * peek(V, 577)));\n    t2 = (t1 * peek(V, 578));\n    p0 = t2;\n  }\n  if ((abs((abs(peek(V, 20) - 0) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n    t3 = (((p0 * peek(V, 574)) - (peek(V, 573) * ((((peek(V, 568) * peek(V, 597)) + (peek(V, 567) * peek(V, 596))) + (peek(V, 566) * peek(V, 595))) + (peek(V, 564) * peek(V, 594))))) / (1 + (peek(V, 573) * peek(V, 565))));\n    poke(V, t3, 630);\n    t4 = f_sat(V, M, mq, peek(V, 630));\n    poke(V, t4, 630);\n    t5 = ((peek(V, 630) - peek(V, 597)) * peek(V, 563));\n    poke(V, t5, 631);\n    t6 = (peek(V, 631) + peek(V, 597));\n    poke(V, t6, 632);\n    t7 = (peek(V, 632) + peek(V, 631));\n    poke(V, t7, 597);\n    t8 = ((peek(V, 632) - peek(V, 596)) * peek(V, 563));\n    poke(V, t8, 631);\n    t9 = (peek(V, 631) + peek(V, 596));\n    poke(V, t9, 633);\n    t10 = (peek(V, 633) + peek(V, 631));\n    poke(V, t10, 596);\n    t11 = ((peek(V, 633) - peek(V, 595)) * peek(V, 563));\n    poke(V, t11, 631);\n    t12 = (peek(V, 631) + peek(V, 595));\n    poke(V, t12, 634);\n    t13 = (peek(V, 634) + peek(V, 631));\n    poke(V, t13, 595);\n    t14 = ((peek(V, 634) - peek(V, 594)) * peek(V, 563));\n    poke(V, t14, 631);\n    t15 = (peek(V, 631) + peek(V, 594));\n    poke(V, t15, 635);\n    t16 = (peek(V, 635) + peek(V, 631));\n    poke(V, t16, 594);\n    r = peek(V, 635);\n  }\n  else {\n    t17 = (p0 - peek(V, 592));\n    poke(V, t17, 636);\n    t18 = ((peek(V, 570) * peek(V, 593)) + (peek(V, 571) * peek(V, 636)));\n    poke(V, t18, 637);\n    t19 = ((peek(V, 592) + (peek(V, 571) * peek(V, 593))) + (peek(V, 572) * peek(V, 636)));\n    poke(V, t19, 638);\n    t20 = ((peek(V, 637) + peek(V, 637)) - peek(V, 593));\n    poke(V, t20, 593);\n    t21 = ((peek(V, 638) + peek(V, 638)) - peek(V, 592));\n    poke(V, t21, 592);\n    if ((abs((abs(peek(V, 20) - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      r = peek(V, 638);\n    }\n    else {\n      if ((abs((abs(peek(V, 20) - 2) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n        r = (peek(V, 637) * peek(V, 569));\n      }\n      else {\n        if ((abs((abs(peek(V, 20) - 3) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n          r = ((p0 - (peek(V, 569) * peek(V, 637))) - peek(V, 638));\n        }\n        else {\n          r = (p0 - (peek(V, 569) * peek(V, 637)));\n        }\n      }\n    }\n  }\n  return r;\n}\n\nf_dec2__decl(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0; t12 = 0; t13 = 0; t14 = 0; t15 = 0; t16 = 0; t17 = 0; t18 = 0; t19 = 0;\n  r = 0;\n  t1 = ((0.00359934096805 * p0) + peek(V, 345));\n  poke(V, t1, 639);\n  t2 = (((0.00670805334677 * p0) + (1.06037998983 * peek(V, 639))) + peek(V, 344));\n  poke(V, t2, 345);\n  t3 = ((0.00359934096805 * p0) - (0.330198964653 * peek(V, 639)));\n  poke(V, t3, 344);\n  t4 = peek(V, 639);\n  p0 = t4;\n  t5 = (p0 + peek(V, 343));\n  poke(V, t5, 639);\n  t6 = (((1.15209572367 * p0) + (0.815582447302 * peek(V, 639))) + peek(V, 342));\n  poke(V, t6, 343);\n  t7 = (p0 - (0.505804226959 * peek(V, 639)));\n  poke(V, t7, 342);\n  t8 = peek(V, 639);\n  p0 = t8;\n  t9 = (p0 + peek(V, 341));\n  poke(V, t9, 639);\n  t10 = (((0.561428581129 * p0) + (0.54157047243 * peek(V, 639))) + peek(V, 340));\n  poke(V, t10, 341);\n  t11 = (p0 - (0.707942656721 * peek(V, 639)));\n  poke(V, t11, 340);\n  t12 = peek(V, 639);\n  p0 = t12;\n  t13 = (p0 + peek(V, 339));\n  poke(V, t13, 639);\n  t14 = (((0.251560853945 * p0) + (0.36094563724 * peek(V, 639))) + peek(V, 338));\n  poke(V, t14, 339);\n  t15 = (p0 - (0.856182168854 * peek(V, 639)));\n  poke(V, t15, 338);\n  t16 = peek(V, 639);\n  p0 = t16;\n  t17 = (p0 + peek(V, 337));\n  poke(V, t17, 639);\n  t18 = (((0.127038420503 * p0) + (0.282178673178 * peek(V, 639))) + peek(V, 336));\n  poke(V, t18, 337);\n  t19 = (p0 - (0.956958266697 * peek(V, 639)));\n  poke(V, t19, 336);\n  r = peek(V, 639);\n  return r;\n}\n\nf_dec2__decr(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0; t12 = 0; t13 = 0; t14 = 0; t15 = 0; t16 = 0; t17 = 0; t18 = 0; t19 = 0;\n  r = 0;\n  t1 = ((0.00359934096805 * p0) + peek(V, 357));\n  poke(V, t1, 639);\n  t2 = (((0.00670805334677 * p0) + (1.06037998983 * peek(V, 639))) + peek(V, 356));\n  poke(V, t2, 357);\n  t3 = ((0.00359934096805 * p0) - (0.330198964653 * peek(V, 639)));\n  poke(V, t3, 356);\n  t4 = peek(V, 639);\n  p0 = t4;\n  t5 = (p0 + peek(V, 355));\n  poke(V, t5, 639);\n  t6 = (((1.15209572367 * p0) + (0.815582447302 * peek(V, 639))) + peek(V, 354));\n  poke(V, t6, 355);\n  t7 = (p0 - (0.505804226959 * peek(V, 639)));\n  poke(V, t7, 354);\n  t8 = peek(V, 639);\n  p0 = t8;\n  t9 = (p0 + peek(V, 353));\n  poke(V, t9, 639);\n  t10 = (((0.561428581129 * p0) + (0.54157047243 * peek(V, 639))) + peek(V, 352));\n  poke(V, t10, 353);\n  t11 = (p0 - (0.707942656721 * peek(V, 639)));\n  poke(V, t11, 352);\n  t12 = peek(V, 639);\n  p0 = t12;\n  t13 = (p0 + peek(V, 351));\n  poke(V, t13, 639);\n  t14 = (((0.251560853945 * p0) + (0.36094563724 * peek(V, 639))) + peek(V, 350));\n  poke(V, t14, 351);\n  t15 = (p0 - (0.856182168854 * peek(V, 639)));\n  poke(V, t15, 350);\n  t16 = peek(V, 639);\n  p0 = t16;\n  t17 = (p0 + peek(V, 349));\n  poke(V, t17, 639);\n  t18 = (((0.127038420503 * p0) + (0.282178673178 * peek(V, 639))) + peek(V, 348));\n  poke(V, t18, 349);\n  t19 = (p0 - (0.956958266697 * peek(V, 639)));\n  poke(V, t19, 348);\n  r = peek(V, 639);\n  return r;\n}\n\nf_dec4__decl(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0; t12 = 0; t13 = 0; t14 = 0; t15 = 0; t16 = 0; t17 = 0; t18 = 0; t19 = 0; t20 = 0; t21 = 0; t22 = 0; t23 = 0;\n  r = 0;\n  t1 = ((0.000235376991335 * p0) + peek(V, 345));\n  poke(V, t1, 640);\n  t2 = (((0.000064248965911 * p0) + (0.783153903404 * peek(V, 640))) + peek(V, 344));\n  poke(V, t2, 345);\n  t3 = (0.000235376991335 * p0);\n  poke(V, t3, 344);\n  t4 = peek(V, 640);\n  p0 = t4;\n  t5 = (p0 + peek(V, 343));\n  poke(V, t5, 640);\n  t6 = ((p0 + (1.55323904484 * peek(V, 640))) + peek(V, 342));\n  poke(V, t6, 343);\n  t7 = ((-0.660503537709) * peek(V, 640));\n  poke(V, t7, 342);\n  t8 = peek(V, 640);\n  p0 = t8;\n  t9 = (p0 + peek(V, 341));\n  poke(V, t9, 640);\n  t10 = ((((-0.828481734043) * p0) + (1.52543698655 * peek(V, 640))) + peek(V, 340));\n  poke(V, t10, 341);\n  t11 = (p0 - (0.763768102268 * peek(V, 640)));\n  poke(V, t11, 340);\n  t12 = peek(V, 640);\n  p0 = t12;\n  t13 = (p0 + peek(V, 339));\n  poke(V, t13, 640);\n  t14 = ((((-1.19305052953) * p0) + (1.50161623449 * peek(V, 640))) + peek(V, 338));\n  poke(V, t14, 339);\n  t15 = (p0 - (0.86247415468 * peek(V, 640)));\n  poke(V, t15, 338);\n  t16 = peek(V, 640);\n  p0 = t16;\n  t17 = (p0 + peek(V, 337));\n  poke(V, t17, 640);\n  t18 = ((((-1.32755047952) * p0) + (1.49134289416 * peek(V, 640))) + peek(V, 336));\n  poke(V, t18, 337);\n  t19 = (p0 - (0.932542516606 * peek(V, 640)));\n  poke(V, t19, 336);\n  t20 = peek(V, 640);\n  p0 = t20;\n  t21 = (p0 + peek(V, 335));\n  poke(V, t21, 640);\n  t22 = ((((-1.37496302208) * p0) + (1.4982799417 * peek(V, 640))) + peek(V, 334));\n  poke(V, t22, 335);\n  t23 = (p0 - (0.979991718034 * peek(V, 640)));\n  poke(V, t23, 334);\n  r = peek(V, 640);\n  return r;\n}\n\nf_dec4__decr(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0; t12 = 0; t13 = 0; t14 = 0; t15 = 0; t16 = 0; t17 = 0; t18 = 0; t19 = 0; t20 = 0; t21 = 0; t22 = 0; t23 = 0;\n  r = 0;\n  t1 = ((0.000235376991335 * p0) + peek(V, 357));\n  poke(V, t1, 640);\n  t2 = (((0.000064248965911 * p0) + (0.783153903404 * peek(V, 640))) + peek(V, 356));\n  poke(V, t2, 357);\n  t3 = (0.000235376991335 * p0);\n  poke(V, t3, 356);\n  t4 = peek(V, 640);\n  p0 = t4;\n  t5 = (p0 + peek(V, 355));\n  poke(V, t5, 640);\n  t6 = ((p0 + (1.55323904484 * peek(V, 640))) + peek(V, 354));\n  poke(V, t6, 355);\n  t7 = ((-0.660503537709) * peek(V, 640));\n  poke(V, t7, 354);\n  t8 = peek(V, 640);\n  p0 = t8;\n  t9 = (p0 + peek(V, 353));\n  poke(V, t9, 640);\n  t10 = ((((-0.828481734043) * p0) + (1.52543698655 * peek(V, 640))) + peek(V, 352));\n  poke(V, t10, 353);\n  t11 = (p0 - (0.763768102268 * peek(V, 640)));\n  poke(V, t11, 352);\n  t12 = peek(V, 640);\n  p0 = t12;\n  t13 = (p0 + peek(V, 351));\n  poke(V, t13, 640);\n  t14 = ((((-1.19305052953) * p0) + (1.50161623449 * peek(V, 640))) + peek(V, 350));\n  poke(V, t14, 351);\n  t15 = (p0 - (0.86247415468 * peek(V, 640)));\n  poke(V, t15, 350);\n  t16 = peek(V, 640);\n  p0 = t16;\n  t17 = (p0 + peek(V, 349));\n  poke(V, t17, 640);\n  t18 = ((((-1.32755047952) * p0) + (1.49134289416 * peek(V, 640))) + peek(V, 348));\n  poke(V, t18, 349);\n  t19 = (p0 - (0.932542516606 * peek(V, 640)));\n  poke(V, t19, 348);\n  t20 = peek(V, 640);\n  p0 = t20;\n  t21 = (p0 + peek(V, 347));\n  poke(V, t21, 640);\n  t22 = ((((-1.37496302208) * p0) + (1.4982799417 * peek(V, 640))) + peek(V, 346));\n  poke(V, t22, 347);\n  t23 = (p0 - (0.979991718034 * peek(V, 640)));\n  poke(V, t23, 346);\n  r = peek(V, 640);\n  return r;\n}\n\nf_svf_set__fo1l(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0;\n  r = 0;\n  t1 = f_clamp(V, M, mq, p0, 5, (peek(V, 206) * 0.45));\n  t2 = tan(((3.141592653589793 * t1) * peek(V, 325)));\n  poke(V, t2, 388);\n  t3 = p1;\n  poke(V, t3, 654);\n  t4 = (1 / (1 + (peek(V, 388) * (peek(V, 388) + p1))));\n  poke(V, t4, 655);\n  t5 = (peek(V, 388) * peek(V, 655));\n  poke(V, t5, 656);\n  t6 = (peek(V, 388) * peek(V, 656));\n  poke(V, t6, 657);\n  t7 = peek(V, 655);\n  poke(V, t7, 393);\n  t8 = peek(V, 656);\n  poke(V, t8, 394);\n  t9 = peek(V, 657);\n  poke(V, t9, 395);\n  t10 = p1;\n  poke(V, t10, 396);\n  r = t10;\n  return r;\n}\n\nf_svf_same__fo1r(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0;\n  r = 0;\n  t1 = peek(V, 393);\n  poke(V, t1, 658);\n  t2 = peek(V, 394);\n  poke(V, t2, 659);\n  t3 = peek(V, 395);\n  poke(V, t3, 660);\n  t4 = peek(V, 396);\n  poke(V, t4, 661);\n  r = t4;\n  return r;\n}\n\nf_svf_set__fo2l(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0;\n  r = 0;\n  t1 = f_clamp(V, M, mq, p0, 5, (peek(V, 206) * 0.45));\n  t2 = tan(((3.141592653589793 * t1) * peek(V, 325)));\n  poke(V, t2, 388);\n  t3 = p1;\n  poke(V, t3, 662);\n  t4 = (1 / (1 + (peek(V, 388) * (peek(V, 388) + p1))));\n  poke(V, t4, 663);\n  t5 = (peek(V, 388) * peek(V, 663));\n  poke(V, t5, 664);\n  t6 = (peek(V, 388) * peek(V, 664));\n  poke(V, t6, 665);\n  t7 = peek(V, 663);\n  poke(V, t7, 393);\n  t8 = peek(V, 664);\n  poke(V, t8, 394);\n  t9 = peek(V, 665);\n  poke(V, t9, 395);\n  t10 = p1;\n  poke(V, t10, 396);\n  r = t10;\n  return r;\n}\n\nf_svf_same__fo2r(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0;\n  r = 0;\n  t1 = peek(V, 393);\n  poke(V, t1, 666);\n  t2 = peek(V, 394);\n  poke(V, t2, 667);\n  t3 = peek(V, 395);\n  poke(V, t3, 668);\n  t4 = peek(V, 396);\n  poke(V, t4, 669);\n  r = t4;\n  return r;\n}\n\nf_svf_set__fo3l(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0;\n  r = 0;\n  t1 = f_clamp(V, M, mq, p0, 5, (peek(V, 206) * 0.45));\n  t2 = tan(((3.141592653589793 * t1) * peek(V, 325)));\n  poke(V, t2, 388);\n  t3 = p1;\n  poke(V, t3, 670);\n  t4 = (1 / (1 + (peek(V, 388) * (peek(V, 388) + p1))));\n  poke(V, t4, 671);\n  t5 = (peek(V, 388) * peek(V, 671));\n  poke(V, t5, 672);\n  t6 = (peek(V, 388) * peek(V, 672));\n  poke(V, t6, 673);\n  t7 = peek(V, 671);\n  poke(V, t7, 393);\n  t8 = peek(V, 672);\n  poke(V, t8, 394);\n  t9 = peek(V, 673);\n  poke(V, t9, 395);\n  t10 = p1;\n  poke(V, t10, 396);\n  r = t10;\n  return r;\n}\n\nf_svf_same__fo3r(V, M, mq) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0;\n  r = 0;\n  t1 = peek(V, 393);\n  poke(V, t1, 674);\n  t2 = peek(V, 394);\n  poke(V, t2, 675);\n  t3 = peek(V, 395);\n  poke(V, t3, 676);\n  t4 = peek(V, 396);\n  poke(V, t4, 677);\n  r = t4;\n  return r;\n}\n\nf_svf__fo1l(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 678));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 655) * peek(V, 680)) + (peek(V, 656) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 678) + (peek(V, 656) * peek(V, 680))) + (peek(V, 657) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 680));\n  poke(V, t4, 680);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 678));\n  poke(V, t5, 678);\n  t6 = peek(V, 682);\n  poke(V, t6, 683);\n  t7 = peek(V, 681);\n  poke(V, t7, 684);\n  t8 = ((p0 - (peek(V, 654) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 685);\n  r = peek(V, 683);\n  return r;\n}\n\nf_svf__fo2l(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 686));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 663) * peek(V, 687)) + (peek(V, 664) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 686) + (peek(V, 664) * peek(V, 687))) + (peek(V, 665) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 687));\n  poke(V, t4, 687);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 686));\n  poke(V, t5, 686);\n  t6 = peek(V, 682);\n  poke(V, t6, 688);\n  t7 = peek(V, 681);\n  poke(V, t7, 689);\n  t8 = ((p0 - (peek(V, 662) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 690);\n  r = peek(V, 688);\n  return r;\n}\n\nf_svf__fo3l(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 691));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 671) * peek(V, 692)) + (peek(V, 672) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 691) + (peek(V, 672) * peek(V, 692))) + (peek(V, 673) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 692));\n  poke(V, t4, 692);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 691));\n  poke(V, t5, 691);\n  t6 = peek(V, 682);\n  poke(V, t6, 693);\n  t7 = peek(V, 681);\n  poke(V, t7, 694);\n  t8 = ((p0 - (peek(V, 670) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 695);\n  r = peek(V, 693);\n  return r;\n}\n\nf_svf__fo1r(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 696));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 658) * peek(V, 697)) + (peek(V, 659) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 696) + (peek(V, 659) * peek(V, 697))) + (peek(V, 660) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 697));\n  poke(V, t4, 697);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 696));\n  poke(V, t5, 696);\n  t6 = peek(V, 682);\n  poke(V, t6, 698);\n  t7 = peek(V, 681);\n  poke(V, t7, 699);\n  t8 = ((p0 - (peek(V, 661) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 700);\n  r = peek(V, 698);\n  return r;\n}\n\nf_svf__fo2r(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 701));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 666) * peek(V, 702)) + (peek(V, 667) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 701) + (peek(V, 667) * peek(V, 702))) + (peek(V, 668) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 702));\n  poke(V, t4, 702);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 701));\n  poke(V, t5, 701);\n  t6 = peek(V, 682);\n  poke(V, t6, 703);\n  t7 = peek(V, 681);\n  poke(V, t7, 704);\n  t8 = ((p0 - (peek(V, 669) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 705);\n  r = peek(V, 703);\n  return r;\n}\n\nf_svf__fo3r(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 706));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 674) * peek(V, 707)) + (peek(V, 675) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 706) + (peek(V, 675) * peek(V, 707))) + (peek(V, 676) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 707));\n  poke(V, t4, 707);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 706));\n  poke(V, t5, 706);\n  t6 = peek(V, 682);\n  poke(V, t6, 708);\n  t7 = peek(V, 681);\n  poke(V, t7, 709);\n  t8 = ((p0 - (peek(V, 677) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 710);\n  r = peek(V, 708);\n  return r;\n}\n\nf_ap2(V, M, mq, p0, p1, p2) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0;\n  r = 0;\n  t1 = ((p1 * (p0 + peek(M, trunc(p2 + 3 + 0.00001)))) - peek(M, trunc(p2 + 1 + 0.00001)));\n  poke(V, t1, 718);\n  t2 = trunc(p2 + 1 + 0.00001);\n  t3 = peek(M, trunc(p2 + 0.00001));\n  poke(M, t3, t2);\n  t4 = trunc(p2 + 0.00001);\n  t5 = p0;\n  poke(M, t5, t4);\n  t6 = trunc(p2 + 3 + 0.00001);\n  t7 = peek(M, trunc(p2 + 2 + 0.00001));\n  poke(M, t7, t6);\n  t8 = trunc(p2 + 2 + 0.00001);\n  t9 = peek(V, 718);\n  poke(M, t9, t8);\n  r = peek(V, 718);\n  return r;\n}\n\nf_hilbert(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0; t12 = 0;\n  r = 0;\n  t1 = f_ap2(V, M, mq, p0, peek(V, 260), p1);\n  t2 = f_ap2(V, M, mq, t1, peek(V, 261), (p1 + 4));\n  t3 = f_ap2(V, M, mq, t2, peek(V, 262), (p1 + 8));\n  t4 = f_ap2(V, M, mq, t3, peek(V, 263), (p1 + 12));\n  poke(V, t4, 719);\n  t5 = f_ap2(V, M, mq, p0, peek(V, 264), (p1 + 16));\n  t6 = f_ap2(V, M, mq, t5, peek(V, 265), (p1 + 20));\n  t7 = f_ap2(V, M, mq, t6, peek(V, 266), (p1 + 24));\n  t8 = f_ap2(V, M, mq, t7, peek(V, 267), (p1 + 28));\n  poke(V, t8, 720);\n  t9 = peek(V, 720);\n  poke(V, t9, 721);\n  t10 = peek(M, trunc(p1 + 32 + 0.00001));\n  poke(V, t10, 720);\n  t11 = trunc(p1 + 32 + 0.00001);\n  t12 = peek(V, 719);\n  poke(M, t12, t11);\n  r = peek(V, 720);\n  return r;\n}\n\nf_svf_set__mn1l(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0;\n  r = 0;\n  t1 = f_clamp(V, M, mq, p0, 5, (peek(V, 206) * 0.45));\n  t2 = tan(((3.141592653589793 * t1) * peek(V, 325)));\n  poke(V, t2, 388);\n  t3 = p1;\n  poke(V, t3, 734);\n  t4 = (1 / (1 + (peek(V, 388) * (peek(V, 388) + p1))));\n  poke(V, t4, 735);\n  t5 = (peek(V, 388) * peek(V, 735));\n  poke(V, t5, 736);\n  t6 = (peek(V, 388) * peek(V, 736));\n  poke(V, t6, 737);\n  t7 = peek(V, 735);\n  poke(V, t7, 393);\n  t8 = peek(V, 736);\n  poke(V, t8, 394);\n  t9 = peek(V, 737);\n  poke(V, t9, 395);\n  t10 = p1;\n  poke(V, t10, 396);\n  r = t10;\n  return r;\n}\n\nf_svf_set__mn2l(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0;\n  r = 0;\n  t1 = f_clamp(V, M, mq, p0, 5, (peek(V, 206) * 0.45));\n  t2 = tan(((3.141592653589793 * t1) * peek(V, 325)));\n  poke(V, t2, 388);\n  t3 = p1;\n  poke(V, t3, 738);\n  t4 = (1 / (1 + (peek(V, 388) * (peek(V, 388) + p1))));\n  poke(V, t4, 739);\n  t5 = (peek(V, 388) * peek(V, 739));\n  poke(V, t5, 740);\n  t6 = (peek(V, 388) * peek(V, 740));\n  poke(V, t6, 741);\n  t7 = peek(V, 739);\n  poke(V, t7, 393);\n  t8 = peek(V, 740);\n  poke(V, t8, 394);\n  t9 = peek(V, 741);\n  poke(V, t9, 395);\n  t10 = p1;\n  poke(V, t10, 396);\n  r = t10;\n  return r;\n}\n\nf_svf_set__mn1r(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0;\n  r = 0;\n  t1 = f_clamp(V, M, mq, p0, 5, (peek(V, 206) * 0.45));\n  t2 = tan(((3.141592653589793 * t1) * peek(V, 325)));\n  poke(V, t2, 388);\n  t3 = p1;\n  poke(V, t3, 742);\n  t4 = (1 / (1 + (peek(V, 388) * (peek(V, 388) + p1))));\n  poke(V, t4, 743);\n  t5 = (peek(V, 388) * peek(V, 743));\n  poke(V, t5, 744);\n  t6 = (peek(V, 388) * peek(V, 744));\n  poke(V, t6, 745);\n  t7 = peek(V, 743);\n  poke(V, t7, 393);\n  t8 = peek(V, 744);\n  poke(V, t8, 394);\n  t9 = peek(V, 745);\n  poke(V, t9, 395);\n  t10 = p1;\n  poke(V, t10, 396);\n  r = t10;\n  return r;\n}\n\nf_svf_set__mn2r(V, M, mq, p0, p1) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0;\n  r = 0;\n  t1 = f_clamp(V, M, mq, p0, 5, (peek(V, 206) * 0.45));\n  t2 = tan(((3.141592653589793 * t1) * peek(V, 325)));\n  poke(V, t2, 388);\n  t3 = p1;\n  poke(V, t3, 746);\n  t4 = (1 / (1 + (peek(V, 388) * (peek(V, 388) + p1))));\n  poke(V, t4, 747);\n  t5 = (peek(V, 388) * peek(V, 747));\n  poke(V, t5, 748);\n  t6 = (peek(V, 388) * peek(V, 748));\n  poke(V, t6, 749);\n  t7 = peek(V, 747);\n  poke(V, t7, 393);\n  t8 = peek(V, 748);\n  poke(V, t8, 394);\n  t9 = peek(V, 749);\n  poke(V, t9, 395);\n  t10 = p1;\n  poke(V, t10, 396);\n  r = t10;\n  return r;\n}\n\nf_svf__mn1l(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 750));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 735) * peek(V, 751)) + (peek(V, 736) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 750) + (peek(V, 736) * peek(V, 751))) + (peek(V, 737) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 751));\n  poke(V, t4, 751);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 750));\n  poke(V, t5, 750);\n  t6 = peek(V, 682);\n  poke(V, t6, 752);\n  t7 = peek(V, 681);\n  poke(V, t7, 753);\n  t8 = ((p0 - (peek(V, 734) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 754);\n  r = peek(V, 752);\n  return r;\n}\n\nf_svf__mn2l(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 755));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 739) * peek(V, 756)) + (peek(V, 740) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 755) + (peek(V, 740) * peek(V, 756))) + (peek(V, 741) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 756));\n  poke(V, t4, 756);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 755));\n  poke(V, t5, 755);\n  t6 = peek(V, 682);\n  poke(V, t6, 757);\n  t7 = peek(V, 681);\n  poke(V, t7, 758);\n  t8 = ((p0 - (peek(V, 738) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 759);\n  r = peek(V, 757);\n  return r;\n}\n\nf_svf__mn1r(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 760));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 743) * peek(V, 761)) + (peek(V, 744) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 760) + (peek(V, 744) * peek(V, 761))) + (peek(V, 745) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 761));\n  poke(V, t4, 761);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 760));\n  poke(V, t5, 760);\n  t6 = peek(V, 682);\n  poke(V, t6, 762);\n  t7 = peek(V, 681);\n  poke(V, t7, 763);\n  t8 = ((p0 - (peek(V, 742) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 764);\n  r = peek(V, 762);\n  return r;\n}\n\nf_svf__mn2r(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 765));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 747) * peek(V, 766)) + (peek(V, 748) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 765) + (peek(V, 748) * peek(V, 766))) + (peek(V, 749) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 766));\n  poke(V, t4, 766);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 765));\n  poke(V, t5, 765);\n  t6 = peek(V, 682);\n  poke(V, t6, 767);\n  t7 = peek(V, 681);\n  poke(V, t7, 768);\n  t8 = ((p0 - (peek(V, 746) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 769);\n  r = peek(V, 767);\n  return r;\n}\n\nf_dread(V, M, mq, p0, p1, p2, p3) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0;\n  r = 0;\n  t1 = (p2 - p3);\n  poke(V, t1, 779);\n  if ((abs((peek(V, 779) < 0 ? 1 : 0)) >= 0.00001)) {\n    t2 = p1;\n    t3 = (peek(V, 779) + t2);\n    poke(V, t3, 779);\n  }\n  t4 = floor(peek(V, 779));\n  poke(V, t4, 780);\n  t5 = (peek(V, 779) - peek(V, 780));\n  poke(V, t5, 781);\n  r = (peek(M, trunc(p0 + peek(V, 780) + 0.00001)) + ((peek(M, trunc(p0 + ((abs(((peek(V, 780) + 1) < p1 ? 1 : 0)) >= 0.00001) ? (peek(V, 780) + 1) : 0) + 0.00001)) - peek(M, trunc(p0 + peek(V, 780) + 0.00001))) * peek(V, 781)));\n  return r;\n}\n\nf_svf__sq_l1(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 783));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 426) * peek(V, 784)) + (peek(V, 427) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 783) + (peek(V, 427) * peek(V, 784))) + (peek(V, 428) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 784));\n  poke(V, t4, 784);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 783));\n  poke(V, t5, 783);\n  t6 = peek(V, 682);\n  poke(V, t6, 785);\n  t7 = peek(V, 681);\n  poke(V, t7, 786);\n  t8 = ((p0 - (peek(V, 425) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 787);\n  r = peek(V, 785);\n  return r;\n}\n\nf_svf__sq_l2(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 788));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 429) * peek(V, 789)) + (peek(V, 430) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 788) + (peek(V, 430) * peek(V, 789))) + (peek(V, 431) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 789));\n  poke(V, t4, 789);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 788));\n  poke(V, t5, 788);\n  t6 = peek(V, 682);\n  poke(V, t6, 790);\n  t7 = peek(V, 681);\n  poke(V, t7, 791);\n  t8 = ((p0 - (peek(V, 432) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 792);\n  r = peek(V, 790);\n  return r;\n}\n\nf_svf__sq_r1(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 795));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 433) * peek(V, 796)) + (peek(V, 434) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 795) + (peek(V, 434) * peek(V, 796))) + (peek(V, 435) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 796));\n  poke(V, t4, 796);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 795));\n  poke(V, t5, 795);\n  t6 = peek(V, 682);\n  poke(V, t6, 797);\n  t7 = peek(V, 681);\n  poke(V, t7, 798);\n  t8 = ((p0 - (peek(V, 436) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 799);\n  r = peek(V, 797);\n  return r;\n}\n\nf_svf__sq_r2(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 800));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 437) * peek(V, 801)) + (peek(V, 438) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 800) + (peek(V, 438) * peek(V, 801))) + (peek(V, 439) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 801));\n  poke(V, t4, 801);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 800));\n  poke(V, t5, 800);\n  t6 = peek(V, 682);\n  poke(V, t6, 802);\n  t7 = peek(V, 681);\n  poke(V, t7, 803);\n  t8 = ((p0 - (peek(V, 440) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 804);\n  r = peek(V, 802);\n  return r;\n}\n\nf_svf__sq_m1(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 807));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 442) * peek(V, 808)) + (peek(V, 443) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 807) + (peek(V, 443) * peek(V, 808))) + (peek(V, 444) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 808));\n  poke(V, t4, 808);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 807));\n  poke(V, t5, 807);\n  t6 = peek(V, 682);\n  poke(V, t6, 809);\n  t7 = peek(V, 681);\n  poke(V, t7, 810);\n  t8 = ((p0 - (peek(V, 441) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 811);\n  r = peek(V, 809);\n  return r;\n}\n\nf_svf__sq_m2(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 812));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 445) * peek(V, 813)) + (peek(V, 446) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 812) + (peek(V, 446) * peek(V, 813))) + (peek(V, 447) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 813));\n  poke(V, t4, 813);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 812));\n  poke(V, t5, 812);\n  t6 = peek(V, 682);\n  poke(V, t6, 814);\n  t7 = peek(V, 681);\n  poke(V, t7, 815);\n  t8 = ((p0 - (peek(V, 448) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 816);\n  r = peek(V, 814);\n  return r;\n}\n\nf_svf__sq_m3(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 819));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 449) * peek(V, 820)) + (peek(V, 450) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 819) + (peek(V, 450) * peek(V, 820))) + (peek(V, 451) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 820));\n  poke(V, t4, 820);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 819));\n  poke(V, t5, 819);\n  t6 = peek(V, 682);\n  poke(V, t6, 821);\n  t7 = peek(V, 681);\n  poke(V, t7, 822);\n  t8 = ((p0 - (peek(V, 452) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 823);\n  r = peek(V, 821);\n  return r;\n}\n\nf_svf__sq_m4(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 824));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 453) * peek(V, 825)) + (peek(V, 454) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 824) + (peek(V, 454) * peek(V, 825))) + (peek(V, 455) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 825));\n  poke(V, t4, 825);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 824));\n  poke(V, t5, 824);\n  t6 = peek(V, 682);\n  poke(V, t6, 826);\n  t7 = peek(V, 681);\n  poke(V, t7, 827);\n  t8 = ((p0 - (peek(V, 456) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 828);\n  r = peek(V, 826);\n  return r;\n}\n\nf_svf__lc1(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 839));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 390) * peek(V, 840)) + (peek(V, 391) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 839) + (peek(V, 391) * peek(V, 840))) + (peek(V, 392) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 840));\n  poke(V, t4, 840);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 839));\n  poke(V, t5, 839);\n  t6 = peek(V, 682);\n  poke(V, t6, 841);\n  t7 = peek(V, 681);\n  poke(V, t7, 842);\n  t8 = ((p0 - (peek(V, 389) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 843);\n  r = peek(V, 841);\n  return r;\n}\n\nf_svf__lc2(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 844));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 397) * peek(V, 845)) + (peek(V, 398) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 844) + (peek(V, 398) * peek(V, 845))) + (peek(V, 399) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 845));\n  poke(V, t4, 845);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 844));\n  poke(V, t5, 844);\n  t6 = peek(V, 682);\n  poke(V, t6, 846);\n  t7 = peek(V, 681);\n  poke(V, t7, 847);\n  t8 = ((p0 - (peek(V, 400) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 848);\n  r = peek(V, 846);\n  return r;\n}\n\nf_svf__lc3(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 849));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 401) * peek(V, 850)) + (peek(V, 402) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 849) + (peek(V, 402) * peek(V, 850))) + (peek(V, 403) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 850));\n  poke(V, t4, 850);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 849));\n  poke(V, t5, 849);\n  t6 = peek(V, 682);\n  poke(V, t6, 851);\n  t7 = peek(V, 681);\n  poke(V, t7, 852);\n  t8 = ((p0 - (peek(V, 404) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 853);\n  r = peek(V, 851);\n  return r;\n}\n\nf_svf__lc4(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 854));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 405) * peek(V, 855)) + (peek(V, 406) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 854) + (peek(V, 406) * peek(V, 855))) + (peek(V, 407) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 855));\n  poke(V, t4, 855);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 854));\n  poke(V, t5, 854);\n  t6 = peek(V, 682);\n  poke(V, t6, 856);\n  t7 = peek(V, 681);\n  poke(V, t7, 857);\n  t8 = ((p0 - (peek(V, 408) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 858);\n  r = peek(V, 856);\n  return r;\n}\n\nf_svf__mb1(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 867));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 410) * peek(V, 868)) + (peek(V, 411) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 867) + (peek(V, 411) * peek(V, 868))) + (peek(V, 412) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 868));\n  poke(V, t4, 868);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 867));\n  poke(V, t5, 867);\n  t6 = peek(V, 682);\n  poke(V, t6, 869);\n  t7 = peek(V, 681);\n  poke(V, t7, 870);\n  t8 = ((p0 - (peek(V, 409) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 871);\n  r = peek(V, 869);\n  return r;\n}\n\nf_svf__mb2(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 872));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 413) * peek(V, 873)) + (peek(V, 414) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 872) + (peek(V, 414) * peek(V, 873))) + (peek(V, 415) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 873));\n  poke(V, t4, 873);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 872));\n  poke(V, t5, 872);\n  t6 = peek(V, 682);\n  poke(V, t6, 874);\n  t7 = peek(V, 681);\n  poke(V, t7, 875);\n  t8 = ((p0 - (peek(V, 416) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 876);\n  r = peek(V, 874);\n  return r;\n}\n\nf_svf__mb3(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 878));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 417) * peek(V, 879)) + (peek(V, 418) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 878) + (peek(V, 418) * peek(V, 879))) + (peek(V, 419) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 879));\n  poke(V, t4, 879);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 878));\n  poke(V, t5, 878);\n  t6 = peek(V, 682);\n  poke(V, t6, 880);\n  t7 = peek(V, 681);\n  poke(V, t7, 881);\n  t8 = ((p0 - (peek(V, 420) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 882);\n  r = peek(V, 880);\n  return r;\n}\n\nf_svf__mb4(V, M, mq, p0) {\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0;\n  r = 0;\n  t1 = (p0 - peek(V, 883));\n  poke(V, t1, 679);\n  t2 = ((peek(V, 421) * peek(V, 884)) + (peek(V, 422) * peek(V, 679)));\n  poke(V, t2, 681);\n  t3 = ((peek(V, 883) + (peek(V, 422) * peek(V, 884))) + (peek(V, 423) * peek(V, 679)));\n  poke(V, t3, 682);\n  t4 = ((peek(V, 681) + peek(V, 681)) - peek(V, 884));\n  poke(V, t4, 884);\n  t5 = ((peek(V, 682) + peek(V, 682)) - peek(V, 883));\n  poke(V, t5, 883);\n  t6 = peek(V, 682);\n  poke(V, t6, 885);\n  t7 = peek(V, 681);\n  poke(V, t7, 886);\n  t8 = ((p0 - (peek(V, 424) * peek(V, 681))) - peek(V, 682));\n  poke(V, t8, 887);\n  r = peek(V, 885);\n  return r;\n}\n\n// every sample\n  t1 = 0; t2 = 0; t3 = 0; t4 = 0; t5 = 0; t6 = 0; t7 = 0; t8 = 0; t9 = 0; t10 = 0; t11 = 0; t12 = 0; t13 = 0; t14 = 0; t15 = 0; t16 = 0;\n  t17 = 0; t18 = 0; t19 = 0; t20 = 0; t21 = 0; t22 = 0; t23 = 0; t24 = 0; t25 = 0; t26 = 0; t27 = 0; t28 = 0; t29 = 0; t30 = 0; t31 = 0; t32 = 0;\n  t33 = 0; t34 = 0; t35 = 0; t36 = 0; t37 = 0; t38 = 0; t39 = 0; t40 = 0; t41 = 0; t42 = 0; t43 = 0; t44 = 0; t45 = 0; t46 = 0; t47 = 0; t48 = 0;\n  t49 = 0; t50 = 0; t51 = 0; t52 = 0; t53 = 0; t54 = 0; t55 = 0; t56 = 0; t57 = 0; t58 = 0; t59 = 0; t60 = 0; t61 = 0; t62 = 0; t63 = 0; t64 = 0;\n  t65 = 0; t66 = 0; t67 = 0; t68 = 0; t69 = 0; t70 = 0; t71 = 0; t72 = 0; t73 = 0; t74 = 0; t75 = 0; t76 = 0; t77 = 0; t78 = 0; t79 = 0; t80 = 0;\n  t81 = 0; t82 = 0; t83 = 0; t84 = 0; t85 = 0; t86 = 0; t87 = 0; t88 = 0; t89 = 0; t90 = 0; t91 = 0; t92 = 0; t93 = 0; t94 = 0; t95 = 0; t96 = 0;\n  t97 = 0; t98 = 0; t99 = 0; t100 = 0; t101 = 0; t102 = 0; t103 = 0; t104 = 0; t105 = 0; t106 = 0; t107 = 0; t108 = 0; t109 = 0; t110 = 0; t111 = 0; t112 = 0;\n  t113 = 0; t114 = 0; t115 = 0; t116 = 0; t117 = 0; t118 = 0; t119 = 0; t120 = 0; t121 = 0; t122 = 0; t123 = 0; t124 = 0; t125 = 0; t126 = 0; t127 = 0; t128 = 0;\n  t129 = 0; t130 = 0; t131 = 0; t132 = 0; t133 = 0; t134 = 0; t135 = 0; t136 = 0; t137 = 0; t138 = 0; t139 = 0; t140 = 0; t141 = 0; t142 = 0; t143 = 0; t144 = 0;\n  t145 = 0; t146 = 0; t147 = 0; t148 = 0; t149 = 0; t150 = 0; t151 = 0; t152 = 0; t153 = 0; t154 = 0; t155 = 0; t156 = 0; t157 = 0; t158 = 0; t159 = 0; t160 = 0;\n  t161 = 0; t162 = 0; t163 = 0; t164 = 0; t165 = 0; t166 = 0; t167 = 0; t168 = 0; t169 = 0; t170 = 0; t171 = 0; t172 = 0; t173 = 0; t174 = 0; t175 = 0; t176 = 0;\n  t177 = 0; t178 = 0; t179 = 0; t180 = 0; t181 = 0; t182 = 0; t183 = 0; t184 = 0; t185 = 0; t186 = 0; t187 = 0; t188 = 0; t189 = 0; t190 = 0; t191 = 0; t192 = 0;\n  t193 = 0; t194 = 0; t195 = 0; t196 = 0; t197 = 0; t198 = 0; t199 = 0; t200 = 0; t201 = 0; t202 = 0; t203 = 0; t204 = 0; t205 = 0; t206 = 0; t207 = 0; t208 = 0;\n  t209 = 0; t210 = 0; t211 = 0; t212 = 0; t213 = 0; t214 = 0; t215 = 0; t216 = 0; t217 = 0; t218 = 0; t219 = 0; t220 = 0; t221 = 0; t222 = 0; t223 = 0; t224 = 0;\n  t225 = 0; t226 = 0; t227 = 0; t228 = 0; t229 = 0; t230 = 0; t231 = 0; t232 = 0; t233 = 0; t234 = 0; t235 = 0; t236 = 0; t237 = 0; t238 = 0; t239 = 0; t240 = 0;\n  t241 = 0; t242 = 0; t243 = 0; t244 = 0; t245 = 0; t246 = 0; t247 = 0; t248 = 0; t249 = 0; t250 = 0; t251 = 0; t252 = 0; t253 = 0; t254 = 0; t255 = 0; t256 = 0;\n  t257 = 0; t258 = 0; t259 = 0; t260 = 0; t261 = 0; t262 = 0; t263 = 0; t264 = 0; t265 = 0; t266 = 0; t267 = 0; t268 = 0; t269 = 0; t270 = 0; t271 = 0; t272 = 0;\n  t273 = 0; t274 = 0; t275 = 0; t276 = 0; t277 = 0; t278 = 0; t279 = 0; t280 = 0; t281 = 0; t282 = 0; t283 = 0; t284 = 0; t285 = 0; t286 = 0; t287 = 0; t288 = 0;\n  t289 = 0; t290 = 0; t291 = 0; t292 = 0; t293 = 0; t294 = 0; t295 = 0; t296 = 0; t297 = 0; t298 = 0; t299 = 0; t300 = 0; t301 = 0; t302 = 0; t303 = 0; t304 = 0;\n  t305 = 0; t306 = 0; t307 = 0; t308 = 0; t309 = 0; t310 = 0; t311 = 0; t312 = 0; t313 = 0; t314 = 0; t315 = 0; t316 = 0; t317 = 0; t318 = 0; t319 = 0; t320 = 0;\n  t321 = 0; t322 = 0; t323 = 0; t324 = 0; t325 = 0; t326 = 0; t327 = 0; t328 = 0; t329 = 0; t330 = 0; t331 = 0; t332 = 0; t333 = 0; t334 = 0; t335 = 0; t336 = 0;\n  t337 = 0; t338 = 0; t339 = 0; t340 = 0; t341 = 0; t342 = 0; t343 = 0; t344 = 0; t345 = 0; t346 = 0; t347 = 0; t348 = 0; t349 = 0; t350 = 0; t351 = 0; t352 = 0;\n  t353 = 0; t354 = 0; t355 = 0; t356 = 0; t357 = 0; t358 = 0; t359 = 0; t360 = 0; t361 = 0; t362 = 0; t363 = 0; t364 = 0; t365 = 0; t366 = 0; t367 = 0; t368 = 0;\n  t369 = 0; t370 = 0; t371 = 0; t372 = 0; t373 = 0; t374 = 0; t375 = 0; t376 = 0; t377 = 0; t378 = 0; t379 = 0; t380 = 0; t381 = 0; t382 = 0; t383 = 0; t384 = 0;\n  t385 = 0; t386 = 0; t387 = 0; t388 = 0; t389 = 0; t390 = 0; t391 = 0; t392 = 0; t393 = 0; t394 = 0; t395 = 0; t396 = 0; t397 = 0; t398 = 0; t399 = 0; t400 = 0;\n  t401 = 0; t402 = 0; t403 = 0; t404 = 0; t405 = 0; t406 = 0; t407 = 0; t408 = 0; t409 = 0; t410 = 0; t411 = 0; t412 = 0; t413 = 0; t414 = 0; t415 = 0; t416 = 0;\n  t417 = 0; t418 = 0; t419 = 0; t420 = 0; t421 = 0; t422 = 0; t423 = 0; t424 = 0; t425 = 0; t426 = 0; t427 = 0; t428 = 0; t429 = 0; t430 = 0; t431 = 0; t432 = 0;\n  t433 = 0; t434 = 0; t435 = 0; t436 = 0; t437 = 0; t438 = 0; t439 = 0; t440 = 0; t441 = 0; t442 = 0; t443 = 0; t444 = 0; t445 = 0; t446 = 0; t447 = 0; t448 = 0;\n  t449 = 0; t450 = 0; t451 = 0; t452 = 0; t453 = 0; t454 = 0; t455 = 0; t456 = 0; t457 = 0; t458 = 0; t459 = 0; t460 = 0; t461 = 0; t462 = 0; t463 = 0; t464 = 0;\n  t465 = 0; t466 = 0; t467 = 0; t468 = 0; t469 = 0; t470 = 0; t471 = 0; t472 = 0; t473 = 0; t474 = 0; t475 = 0; t476 = 0; t477 = 0; t478 = 0; t479 = 0; t480 = 0;\n  t481 = 0; t482 = 0; t483 = 0; t484 = 0; t485 = 0; t486 = 0; t487 = 0; t488 = 0; t489 = 0; t490 = 0; t491 = 0; t492 = 0; t493 = 0; t494 = 0; t495 = 0; t496 = 0;\n  t497 = 0; t498 = 0; t499 = 0; t500 = 0; t501 = 0; t502 = 0; t503 = 0; t504 = 0; t505 = 0; t506 = 0; t507 = 0; t508 = 0; t509 = 0; t510 = 0; t511 = 0; t512 = 0;\n  t513 = 0; t514 = 0; t515 = 0; t516 = 0; t517 = 0; t518 = 0; t519 = 0; t520 = 0; t521 = 0; t522 = 0; t523 = 0; t524 = 0; t525 = 0; t526 = 0; t527 = 0; t528 = 0;\n  t529 = 0; t530 = 0; t531 = 0; t532 = 0; t533 = 0; t534 = 0; t535 = 0; t536 = 0; t537 = 0; t538 = 0; t539 = 0; t540 = 0; t541 = 0; t542 = 0; t543 = 0; t544 = 0;\n  t545 = 0; t546 = 0; t547 = 0; t548 = 0; t549 = 0; t550 = 0; t551 = 0; t552 = 0; t553 = 0; t554 = 0; t555 = 0; t556 = 0; t557 = 0; t558 = 0; t559 = 0; t560 = 0;\n  t561 = 0; t562 = 0; t563 = 0; t564 = 0; t565 = 0; t566 = 0; t567 = 0; t568 = 0; t569 = 0; t570 = 0; t571 = 0; t572 = 0; t573 = 0; t574 = 0; t575 = 0; t576 = 0;\n  t577 = 0; t578 = 0; t579 = 0; t580 = 0; t581 = 0; t582 = 0; t583 = 0; t584 = 0; t585 = 0; t586 = 0; t587 = 0; t588 = 0; t589 = 0; t590 = 0; t591 = 0; t592 = 0;\n  t593 = 0; t594 = 0; t595 = 0; t596 = 0; t597 = 0; t598 = 0; t599 = 0; t600 = 0; t601 = 0; t602 = 0; t603 = 0; t604 = 0; t605 = 0; t606 = 0; t607 = 0; t608 = 0;\n  t609 = 0; t610 = 0; t611 = 0; t612 = 0; t613 = 0; t614 = 0; t615 = 0; t616 = 0; t617 = 0; t618 = 0; t619 = 0; t620 = 0; t621 = 0; t622 = 0; t623 = 0; t624 = 0;\n  t625 = 0; t626 = 0; t627 = 0; t628 = 0; t629 = 0; t630 = 0; t631 = 0; t632 = 0; t633 = 0; t634 = 0; t635 = 0; t636 = 0; t637 = 0; t638 = 0; t639 = 0; t640 = 0;\n  t641 = 0; t642 = 0; t643 = 0; t644 = 0; t645 = 0; t646 = 0; t647 = 0; t648 = 0; t649 = 0; t650 = 0; t651 = 0; t652 = 0; t653 = 0; t654 = 0; t655 = 0; t656 = 0;\n  t657 = 0; t658 = 0; t659 = 0; t660 = 0; t661 = 0; t662 = 0; t663 = 0; t664 = 0; t665 = 0; t666 = 0; t667 = 0; t668 = 0; t669 = 0; t670 = 0; t671 = 0; t672 = 0;\n  t673 = 0; t674 = 0; t675 = 0; t676 = 0; t677 = 0; t678 = 0; t679 = 0; t680 = 0; t681 = 0; t682 = 0; t683 = 0; t684 = 0; t685 = 0; t686 = 0; t687 = 0; t688 = 0;\n  t689 = 0; t690 = 0; t691 = 0; t692 = 0; t693 = 0; t694 = 0; t695 = 0; t696 = 0; t697 = 0; t698 = 0; t699 = 0; t700 = 0; t701 = 0; t702 = 0; t703 = 0; t704 = 0;\n  t705 = 0; t706 = 0; t707 = 0; t708 = 0; t709 = 0; t710 = 0; t711 = 0; t712 = 0; t713 = 0; t714 = 0; t715 = 0; t716 = 0; t717 = 0; t718 = 0; t719 = 0; t720 = 0;\n  t721 = 0; t722 = 0; t723 = 0; t724 = 0; t725 = 0; t726 = 0; t727 = 0; t728 = 0; t729 = 0; t730 = 0; t731 = 0; t732 = 0; t733 = 0; t734 = 0; t735 = 0; t736 = 0;\n  t737 = 0; t738 = 0; t739 = 0; t740 = 0; t741 = 0; t742 = 0; t743 = 0; t744 = 0; t745 = 0; t746 = 0; t747 = 0; t748 = 0; t749 = 0; t750 = 0; t751 = 0; t752 = 0;\n  t753 = 0; t754 = 0; t755 = 0; t756 = 0; t757 = 0; t758 = 0; t759 = 0; t760 = 0; t761 = 0; t762 = 0; t763 = 0; t764 = 0; t765 = 0; t766 = 0; t767 = 0; t768 = 0;\n  t769 = 0; t770 = 0; t771 = 0; t772 = 0; t773 = 0; t774 = 0; t775 = 0; t776 = 0; t777 = 0; t778 = 0; t779 = 0; t780 = 0; t781 = 0; t782 = 0; t783 = 0; t784 = 0;\n  t785 = 0; t786 = 0; t787 = 0; t788 = 0; t789 = 0; t790 = 0; t791 = 0; t792 = 0; t793 = 0; t794 = 0; t795 = 0; t796 = 0; t797 = 0; t798 = 0; t799 = 0; t800 = 0;\n  t801 = 0; t802 = 0; t803 = 0; t804 = 0; t805 = 0; t806 = 0; t807 = 0; t808 = 0; t809 = 0; t810 = 0; t811 = 0; t812 = 0; t813 = 0; t814 = 0; t815 = 0; t816 = 0;\n  t817 = 0; t818 = 0; t819 = 0;\n  moved = 0;\n  // @init and @slider, once\n  if (peek(V, 102) == 0) {\n    poke(V, slider1, 0);\n    poke(V, slider1, 103);\n    poke(V, slider2, 1);\n    poke(V, slider2, 104);\n    poke(V, slider3, 2);\n    poke(V, slider3, 105);\n    poke(V, slider4, 3);\n    poke(V, slider4, 106);\n    poke(V, slider5, 4);\n    poke(V, slider5, 107);\n    poke(V, slider6, 5);\n    poke(V, slider6, 108);\n    poke(V, slider7, 6);\n    poke(V, slider7, 109);\n    poke(V, slider8, 7);\n    poke(V, slider8, 110);\n    poke(V, slider9, 8);\n    poke(V, slider9, 111);\n    poke(V, slider10, 9);\n    poke(V, slider10, 112);\n    poke(V, slider11, 10);\n    poke(V, slider11, 113);\n    poke(V, slider12, 11);\n    poke(V, slider12, 114);\n    poke(V, slider13, 12);\n    poke(V, slider13, 115);\n    poke(V, slider14, 13);\n    poke(V, slider14, 116);\n    poke(V, slider15, 14);\n    poke(V, slider15, 117);\n    poke(V, slider16, 15);\n    poke(V, slider16, 118);\n    poke(V, slider17, 16);\n    poke(V, slider17, 119);\n    poke(V, slider18, 17);\n    poke(V, slider18, 120);\n    poke(V, slider19, 18);\n    poke(V, slider19, 121);\n    poke(V, slider20, 19);\n    poke(V, slider20, 122);\n    poke(V, slider21, 20);\n    poke(V, slider21, 123);\n    poke(V, slider22, 21);\n    poke(V, slider22, 124);\n    poke(V, slider23, 22);\n    poke(V, slider23, 125);\n    poke(V, slider24, 23);\n    poke(V, slider24, 126);\n    poke(V, slider25, 24);\n    poke(V, slider25, 127);\n    poke(V, slider26, 25);\n    poke(V, slider26, 128);\n    poke(V, slider27, 26);\n    poke(V, slider27, 129);\n    poke(V, slider28, 27);\n    poke(V, slider28, 130);\n    poke(V, slider29, 28);\n    poke(V, slider29, 131);\n    poke(V, slider30, 29);\n    poke(V, slider30, 132);\n    poke(V, slider31, 30);\n    poke(V, slider31, 133);\n    poke(V, slider32, 31);\n    poke(V, slider32, 134);\n    poke(V, slider33, 32);\n    poke(V, slider33, 135);\n    poke(V, slider34, 33);\n    poke(V, slider34, 136);\n    poke(V, slider35, 34);\n    poke(V, slider35, 137);\n    poke(V, slider36, 35);\n    poke(V, slider36, 138);\n    poke(V, slider37, 36);\n    poke(V, slider37, 139);\n    poke(V, slider38, 37);\n    poke(V, slider38, 140);\n    poke(V, slider39, 38);\n    poke(V, slider39, 141);\n    poke(V, slider40, 39);\n    poke(V, slider40, 142);\n    poke(V, slider41, 40);\n    poke(V, slider41, 143);\n    poke(V, slider42, 41);\n    poke(V, slider42, 144);\n    poke(V, slider43, 42);\n    poke(V, slider43, 145);\n    poke(V, slider44, 43);\n    poke(V, slider44, 146);\n    poke(V, slider45, 44);\n    poke(V, slider45, 147);\n    poke(V, slider46, 45);\n    poke(V, slider46, 148);\n    poke(V, slider47, 46);\n    poke(V, slider47, 149);\n    poke(V, slider48, 47);\n    poke(V, slider48, 150);\n    poke(V, slider49, 48);\n    poke(V, slider49, 151);\n    poke(V, slider50, 49);\n    poke(V, slider50, 152);\n    poke(V, slider51, 50);\n    poke(V, slider51, 153);\n    poke(V, slider52, 51);\n    poke(V, slider52, 154);\n    poke(V, slider53, 52);\n    poke(V, slider53, 155);\n    poke(V, slider54, 53);\n    poke(V, slider54, 156);\n    poke(V, slider55, 54);\n    poke(V, slider55, 157);\n    poke(V, slider56, 55);\n    poke(V, slider56, 158);\n    poke(V, slider57, 56);\n    poke(V, slider57, 159);\n    poke(V, slider58, 57);\n    poke(V, slider58, 160);\n    poke(V, slider59, 58);\n    poke(V, slider59, 161);\n    poke(V, slider60, 59);\n    poke(V, slider60, 162);\n    poke(V, slider61, 60);\n    poke(V, slider61, 163);\n    poke(V, slider62, 61);\n    poke(V, slider62, 164);\n    poke(V, slider63, 62);\n    poke(V, slider63, 165);\n    poke(V, slider64, 63);\n    poke(V, slider64, 166);\n    poke(V, slider65, 64);\n    poke(V, slider65, 167);\n    poke(V, slider66, 65);\n    poke(V, slider66, 168);\n    poke(V, slider67, 66);\n    poke(V, slider67, 169);\n    poke(V, slider68, 67);\n    poke(V, slider68, 170);\n    poke(V, slider69, 68);\n    poke(V, slider69, 171);\n    poke(V, slider70, 69);\n    poke(V, slider70, 172);\n    poke(V, slider71, 70);\n    poke(V, slider71, 173);\n    poke(V, slider72, 71);\n    poke(V, slider72, 174);\n    poke(V, slider73, 72);\n    poke(V, slider73, 175);\n    poke(V, slider74, 73);\n    poke(V, slider74, 176);\n    poke(V, slider75, 74);\n    poke(V, slider75, 177);\n    poke(V, slider76, 75);\n    poke(V, slider76, 178);\n    poke(V, slider77, 76);\n    poke(V, slider77, 179);\n    poke(V, slider78, 77);\n    poke(V, slider78, 180);\n    poke(V, slider79, 78);\n    poke(V, slider79, 181);\n    poke(V, slider80, 79);\n    poke(V, slider80, 182);\n    poke(V, slider81, 80);\n    poke(V, slider81, 183);\n    poke(V, slider82, 81);\n    poke(V, slider82, 184);\n    poke(V, slider83, 82);\n    poke(V, slider83, 185);\n    poke(V, slider84, 83);\n    poke(V, slider84, 186);\n    poke(V, slider85, 84);\n    poke(V, slider85, 187);\n    poke(V, slider86, 85);\n    poke(V, slider86, 188);\n    poke(V, slider87, 86);\n    poke(V, slider87, 189);\n    poke(V, slider88, 87);\n    poke(V, slider88, 190);\n    poke(V, slider89, 88);\n    poke(V, slider89, 191);\n    poke(V, slider90, 89);\n    poke(V, slider90, 192);\n    poke(V, slider91, 90);\n    poke(V, slider91, 193);\n    poke(V, slider92, 91);\n    poke(V, slider92, 194);\n    poke(V, slider93, 92);\n    poke(V, slider93, 195);\n    poke(V, slider94, 93);\n    poke(V, slider94, 196);\n    poke(V, slider95, 94);\n    poke(V, slider95, 197);\n    poke(V, slider96, 95);\n    poke(V, slider96, 198);\n    poke(V, slider97, 96);\n    poke(V, slider97, 199);\n    poke(V, slider98, 97);\n    poke(V, slider98, 200);\n    poke(V, slider99, 98);\n    poke(V, slider99, 201);\n    poke(V, slider100, 99);\n    poke(V, slider100, 202);\n    poke(V, slider101, 100);\n    poke(V, slider101, 203);\n    poke(V, slider102, 101);\n    poke(V, slider102, 204);\n    poke(V, 22222, 205);\n    poke(V, samplerate, 206);\n    poke(V, 2, 207);\n    poke(V, 32, 208);\n    poke(V, tempo, 209);\n    poke(V, ts_num, 210);\n    poke(V, ts_denom, 211);\n    poke(V, 1, 212);\n    poke(V, 0, 213);\n    poke(V, 8200, 214);\n    poke(V, 9000, 215);\n    poke(V, 9064, 216);\n    poke(V, 9128, 217);\n    poke(V, 9192, 218);\n    poke(V, 9256, 219);\n    poke(V, 9320, 220);\n    poke(V, 9384, 221);\n    poke(V, 9448, 222);\n    poke(V, 9512, 223);\n    poke(V, 9576, 224);\n    poke(V, 9640, 225);\n    poke(V, 9704, 226);\n    poke(V, 9768, 227);\n    poke(V, 10000, 228);\n    poke(V, 10032, 229);\n    poke(V, 10060, 230);\n    poke(V, 10066, 231);\n    poke(V, 10072, 232);\n    poke(V, 10080, 233);\n    poke(V, 10100, 234);\n    poke(V, 10110, 235);\n    poke(V, 10400, 236);\n    poke(V, 10420, 237);\n    poke(V, 10440, 238);\n    poke(V, 10450, 239);\n    poke(V, 10500, 240);\n    poke(V, 10564, 241);\n    poke(V, 10700, 242);\n    poke(V, 11000, 243);\n    poke(V, 11300, 244);\n    poke(V, 11600, 245);\n    poke(V, 11900, 246);\n    poke(V, 20000, 247);\n    poke(V, 28192, 248);\n    poke(V, 8192, 249);\n    poke(V, 40000, 250);\n    poke(V, 56384, 251);\n    poke(V, 16384, 252);\n    poke(V, 80000, 253);\n    poke(V, 4096, 254);\n    poke(V, 90000, 255);\n    poke(V, 256, 256);\n    poke(V, 100000, 257);\n    poke(V, 120000, 258);\n    poke(V, 130000, 259);\n    t1 = trunc(peek(V, 233) + 0.00001);\n    poke(M, 16, t1);\n    t2 = trunc(peek(V, 233) + 1 + 0.00001);\n    poke(M, 8, t2);\n    t3 = trunc(peek(V, 233) + 2 + 0.00001);\n    poke(M, 4, t3);\n    t4 = trunc(peek(V, 233) + 3 + 0.00001);\n    poke(M, 2, t4);\n    t5 = trunc(peek(V, 233) + 4 + 0.00001);\n    t6 = (4 / 3);\n    poke(M, t6, t5);\n    t7 = trunc(peek(V, 233) + 5 + 0.00001);\n    poke(M, 1.5, t7);\n    t8 = trunc(peek(V, 233) + 6 + 0.00001);\n    poke(M, 1, t8);\n    t9 = trunc(peek(V, 233) + 7 + 0.00001);\n    t10 = (2 / 3);\n    poke(M, t10, t9);\n    t11 = trunc(peek(V, 233) + 8 + 0.00001);\n    poke(M, 0.75, t11);\n    t12 = trunc(peek(V, 233) + 9 + 0.00001);\n    poke(M, 0.5, t12);\n    t13 = trunc(peek(V, 233) + 10 + 0.00001);\n    t14 = (1 / 3);\n    poke(M, t14, t13);\n    t15 = trunc(peek(V, 233) + 11 + 0.00001);\n    poke(M, 0.375, t15);\n    t16 = trunc(peek(V, 233) + 12 + 0.00001);\n    poke(M, 0.25, t16);\n    t17 = trunc(peek(V, 233) + 13 + 0.00001);\n    t18 = (1 / 6);\n    poke(M, t18, t17);\n    t19 = trunc(peek(V, 233) + 14 + 0.00001);\n    poke(M, 0.125, t19);\n    t20 = trunc(peek(V, 234) + 0.00001);\n    poke(M, (-24), t20);\n    t21 = trunc(peek(V, 234) + 1 + 0.00001);\n    poke(M, (-12), t21);\n    t22 = trunc(peek(V, 234) + 2 + 0.00001);\n    poke(M, (-5), t22);\n    t23 = trunc(peek(V, 234) + 3 + 0.00001);\n    poke(M, 0, t23);\n    t24 = trunc(peek(V, 234) + 4 + 0.00001);\n    poke(M, 7, t24);\n    t25 = trunc(peek(V, 234) + 5 + 0.00001);\n    poke(M, 12, t25);\n    t26 = trunc(peek(V, 234) + 6 + 0.00001);\n    poke(M, 19, t26);\n    t27 = trunc(peek(V, 234) + 7 + 0.00001);\n    poke(M, 24, t27);\n    t28 = trunc(peek(V, 235) + 0.00001);\n    poke(M, 0.5, t28);\n    t29 = trunc(peek(V, 235) + 1 + 0.00001);\n    poke(M, 1, t29);\n    t30 = trunc(peek(V, 235) + 2 + 0.00001);\n    poke(M, 1.5, t30);\n    t31 = trunc(peek(V, 235) + 3 + 0.00001);\n    poke(M, 2, t31);\n    t32 = trunc(peek(V, 235) + 4 + 0.00001);\n    poke(M, 3, t32);\n    t33 = trunc(peek(V, 235) + 5 + 0.00001);\n    poke(M, 4, t33);\n    t34 = f_set6(V, M, mq, peek(V, 242), 800, 1150, 2900, 1, 0.63, 0.12);\n    t35 = f_set6(V, M, mq, (peek(V, 242) + 6), 400, 1600, 2700, 1, 0.35, 0.25);\n    t36 = f_set6(V, M, mq, (peek(V, 242) + 12), 270, 2140, 2950, 1, 0.25, 0.2);\n    t37 = f_set6(V, M, mq, (peek(V, 242) + 18), 450, 800, 2830, 1, 0.45, 0.1);\n    t38 = f_set6(V, M, mq, (peek(V, 242) + 24), 325, 700, 2530, 1, 0.3, 0.08);\n    t39 = pow(0.6923878, 2);\n    poke(V, t39, 260);\n    t40 = pow(0.9360654322959, 2);\n    poke(V, t40, 261);\n    t41 = pow(0.988229522686, 2);\n    poke(V, t41, 262);\n    t42 = pow(0.9987488452737, 2);\n    poke(V, t42, 263);\n    t43 = pow(0.4021921162426, 2);\n    poke(V, t43, 264);\n    t44 = pow(0.856171088242, 2);\n    poke(V, t44, 265);\n    t45 = pow(0.9722909545651, 2);\n    poke(V, t45, 266);\n    t46 = pow(0.9952884791278, 2);\n    poke(V, t46, 267);\n    poke(V, 0, 268);\n    poke(V, 0, 269);\n    poke(V, 0.8, 270);\n    poke(V, 36, 271);\n    poke(V, 36, 272);\n    poke(V, 0, 273);\n    poke(V, 0, 274);\n    poke(V, 0, 275);\n    poke(V, 0, 276);\n    poke(V, 0, 277);\n    poke(V, 1, 278);\n    t47 = (log(peek(V, 21)) / log(2));\n    poke(V, t47, 279);\n    t48 = peek(V, 1);\n    poke(V, t48, 280);\n    t49 = peek(V, 5);\n    poke(V, t49, 281);\n    t50 = peek(V, 6);\n    poke(V, t50, 282);\n    t51 = peek(V, 7);\n    poke(V, t51, 283);\n    t52 = f_db2g(V, M, mq, peek(V, 80));\n    poke(V, t52, 284);\n    t53 = (log(peek(V, 52)) / log(2));\n    poke(V, t53, 285);\n    t54 = peek(V, 58);\n    poke(V, t54, 286);\n    t55 = peek(V, 60);\n    poke(V, t55, 287);\n    t56 = peek(V, 3);\n    poke(V, t56, 288);\n    poke(V, 0, 289);\n    poke(V, 0, 290);\n    poke(V, 0, 291);\n    poke(V, 0, 292);\n    poke(V, 0, 293);\n    poke(V, (-1), 294);\n    poke(V, (-1), 295);\n    poke(V, (-1), 296);\n    poke(V, (-1), 297);\n    poke(V, 0, 298);\n    poke(V, 12200, 299);\n    poke(V, 12500, 300);\n    poke(V, 12800, 301);\n    poke(V, 13100, 302);\n    poke(V, 0, 303);\n    poke(V, 0, 304);\n    poke(V, 0, 305);\n    poke(V, 0, 306);\n    poke(V, 0, 307);\n    t57 = f_pe(V, M, mq, 1, 0, peek(V, 307), 0);\n    t58 = f_pm(V, M, mq, 2, 0, 150, 30, 2, 4, 0);\n    t59 = f_pe(V, M, mq, 3, 0, 0, 0);\n    t60 = f_pm(V, M, mq, 4, 0.05, 20, 2, 1, 1, 0);\n    t61 = f_pe(V, M, mq, 5, 9, peek(V, 303), 0);\n    t62 = f_pm(V, M, mq, 6, 0, 100, 0, 0, 3, 0);\n    t63 = f_pm(V, M, mq, 7, 0, 100, 45, 0, 3, 0);\n    t64 = f_pm(V, M, mq, 8, 0, 100, 50, 0, 3, 0);\n    t65 = f_pm(V, M, mq, 9, 1, 8, 1, 0, 6, 0);\n    t66 = f_pm(V, M, mq, 10, 0, 100, 25, 0, 3, 0);\n    t67 = f_pm(V, M, mq, 11, 0, 100, 35, 0, 3, 0);\n    t68 = f_pm(V, M, mq, 12, 0, 100, 15, 0, 3, 0);\n    t69 = f_pe(V, M, mq, 13, 0, 0, 0);\n    t70 = f_pm(V, M, mq, 14, (-24), 12, 0, 0, 5, 0);\n    t71 = f_pm(V, M, mq, 15, 0, 100, 0, 0, 3, 0);\n    t72 = f_pe(V, M, mq, 16, 0, 0, 0);\n    t73 = f_pe(V, M, mq, 17, 1, 0, 0);\n    t74 = f_pm(V, M, mq, 18, 0, 100, 0, 0, 3, 0);\n    t75 = f_pm(V, M, mq, 19, 0, 100, 50, 0, 3, 0);\n    t76 = f_pm(V, M, mq, 20, 0, 500, 0, 2, 1, 0);\n    t77 = f_pe(V, M, mq, 21, 0, 0, 0);\n    t78 = f_pm(V, M, mq, 22, 20, 20000, 650, 1, 1, 0);\n    t79 = f_pm(V, M, mq, 23, 0, 100, 14, 0, 3, 0);\n    t80 = f_pm(V, M, mq, 24, 0, 100, 0, 0, 3, 0);\n    t81 = f_pm(V, M, mq, 25, 0, 100, 40, 0, 3, 0);\n    t82 = f_pm(V, M, mq, 26, (-100), 100, 0, 0, 9, 0);\n    t83 = f_pm(V, M, mq, 27, 0.5, 5000, 4, 1, 2, 0);\n    t84 = f_pm(V, M, mq, 28, 1, 10000, 300, 1, 2, 0);\n    t85 = f_pm(V, M, mq, 29, 0, 100, 100, 0, 3, 0);\n    t86 = f_pm(V, M, mq, 30, 1, 10000, 120, 1, 2, 0);\n    t87 = f_pm(V, M, mq, 31, 0.5, 5000, 1, 1, 2, 0);\n    t88 = f_pm(V, M, mq, 32, 1, 10000, 400, 1, 2, 0);\n    t89 = f_pm(V, M, mq, 33, 0, 100, 0, 0, 3, 0);\n    t90 = f_pm(V, M, mq, 34, 1, 10000, 200, 1, 2, 0);\n    t91 = f_pe(V, M, mq, 35, 1, peek(V, 306), 0);\n    t92 = f_pe(V, M, mq, 36, 1, 0, 0);\n    t93 = f_pm(V, M, mq, 37, 0.01, 40, 1, 1, 1, 0);\n    t94 = f_pe(V, M, mq, 38, 9, peek(V, 303), 0);\n    t95 = f_pe(V, M, mq, 39, 0, 0, 0);\n    t96 = f_pm(V, M, mq, 40, 0, 5000, 0, 2, 2, 0);\n    t97 = f_pe(V, M, mq, 41, 0, peek(V, 306), 0);\n    t98 = f_pe(V, M, mq, 42, 0, 0, 0);\n    t99 = f_pm(V, M, mq, 43, 0.01, 40, 0.3, 1, 1, 0);\n    t100 = f_pe(V, M, mq, 44, 6, peek(V, 303), 0);\n    t101 = f_pe(V, M, mq, 45, 0, 0, 0);\n    t102 = f_pm(V, M, mq, 46, 0, 5000, 0, 2, 2, 0);\n    t103 = f_pe(V, M, mq, 47, 0, 0, 0);\n    t104 = f_pm(V, M, mq, 48, 0, 100, 0, 0, 3, 0);\n    t105 = f_pm(V, M, mq, 49, 0, 100, 100, 0, 3, 0);\n    t106 = f_pm(V, M, mq, 50, 0, 100, 100, 0, 3, 0);\n    t107 = f_pe(V, M, mq, 51, 0, 0, 0);\n    t108 = f_pe(V, M, mq, 52, 0, 0, 0);\n    t109 = f_pm(V, M, mq, 53, 20, 10000, 600, 1, 1, 0);\n    t110 = f_pm(V, M, mq, 54, 0, 100, 50, 0, 3, 0);\n    t111 = f_pe(V, M, mq, 55, 6, peek(V, 303), 0);\n    t112 = f_pm(V, M, mq, 56, 0, 100, 40, 0, 3, 0);\n    t113 = f_pm(V, M, mq, 57, 0, 100, 25, 0, 3, 0);\n    t114 = f_pm(V, M, mq, 58, 0, 100, 100, 0, 3, 0);\n    t115 = f_pm(V, M, mq, 59, 0, 100, 0, 0, 3, 0);\n    t116 = f_pm(V, M, mq, 60, 0, 100, 0, 0, 3, 0);\n    t117 = f_pm(V, M, mq, 61, (-1000), 1000, 0, 3, 1, 0);\n    t118 = f_pm(V, M, mq, 62, 0, 100, 0, 0, 3, 0);\n    t119 = f_pm(V, M, mq, 63, 0.25, 8, 1, 1, 7, 0);\n    t120 = f_pm(V, M, mq, 64, 0, 100, 0, 0, 3, 0);\n    t121 = f_pm(V, M, mq, 65, 1, 16, 16, 0, 0, 0);\n    t122 = f_pm(V, M, mq, 66, 1, 50, 1, 1, 7, 0);\n    t123 = f_pm(V, M, mq, 67, 0, 100, 100, 0, 3, 0);\n    t124 = f_pm(V, M, mq, 68, 0, 100, 0, 0, 3, 0);\n    t125 = f_pm(V, M, mq, 69, 0, 100, 0, 0, 3, 0);\n    t126 = f_pm(V, M, mq, 70, 0.05, 5, 0.4, 1, 1, 0);\n    t127 = f_pm(V, M, mq, 71, 0, 100, 50, 0, 3, 0);\n    t128 = f_pm(V, M, mq, 72, 0, 200, 100, 0, 3, 0);\n    t129 = f_pm(V, M, mq, 73, 0, 400, 120, 0, 1, 0);\n    t130 = f_pe(V, M, mq, 74, 0, 0, 0);\n    t131 = f_pm(V, M, mq, 75, 0, 2000, 80, 2, 2, 0);\n    t132 = f_pe(V, M, mq, 76, 0, 0, 0);\n    t133 = f_pm(V, M, mq, 77, 0, 24, 2, 0, 8, 0);\n    t134 = f_pm(V, M, mq, 78, 0, 100, 40, 0, 3, 0);\n    t135 = f_pm(V, M, mq, 79, (-3), 2, 0, 0, 11, 0);\n    t136 = f_pe(V, M, mq, 80, 1, 0, 0);\n    t137 = f_pm(V, M, mq, 81, (-48), 12, (-6), 0, 5, 0);\n    t138 = f_pe(V, M, mq, 82, 1, 0, 0);\n    poke(V, 0, 308);\n    t139 = min(1048576, trunc(6));\n    for (t140 = 0; t140 < t139; t140 += 1) {\n      t141 = f_pe(V, M, mq, (83 + (peek(V, 308) * 3)), 0, peek(V, 304), 0);\n      t142 = f_pe(V, M, mq, (84 + (peek(V, 308) * 3)), 0, peek(V, 305), 0);\n      t143 = f_pm(V, M, mq, (85 + (peek(V, 308) * 3)), (-100), 100, 0, 0, 9, 0);\n      t144 = (peek(V, 308) + 1);\n      poke(V, t144, 308);\n    }\n    t145 = trunc(peek(V, 245) + 83 + 0.00001);\n    poke(M, 1, t145);\n    t146 = trunc(peek(V, 245) + 86 + 0.00001);\n    poke(M, 3, t146);\n    t147 = trunc(peek(V, 245) + 89 + 0.00001);\n    poke(M, 6, t147);\n    t148 = trunc(peek(V, 245) + 92 + 0.00001);\n    poke(M, 2, t148);\n    t149 = trunc(peek(V, 245) + 95 + 0.00001);\n    poke(M, 5, t149);\n    t150 = trunc(peek(V, 245) + 98 + 0.00001);\n    poke(M, 10, t150);\n    poke(V, 1, 308);\n    t151 = min(1048576, trunc(100));\n    for (t152 = 0; t152 < t151; t152 += 1) {\n      if ((abs(peek(M, trunc(peek(V, 301) + peek(V, 308) + 0.00001))) >= 0.00001)) {\n        t153 = trunc(peek(V, 244) + peek(V, 308) + 0.00001);\n        t154 = f_enum_count(V, M, mq, peek(M, trunc(peek(V, 301) + peek(V, 308) + 0.00001)));\n        t155 = (t154 - 1);\n        poke(M, t155, t153);\n      }\n      t156 = (peek(V, 308) + 1);\n      poke(V, t156, 308);\n    }\n    poke(V, 12400, 312);\n    poke(V, 12420, 313);\n    t157 = trunc(peek(V, 312) + 0.00001);\n    poke(M, 0, t157);\n    t158 = trunc(peek(V, 312) + 1 + 0.00001);\n    poke(M, 0, t158);\n    t159 = trunc(peek(V, 312) + 2 + 0.00001);\n    poke(M, 0, t159);\n    t160 = trunc(peek(V, 312) + 3 + 0.00001);\n    poke(M, 0, t160);\n    t161 = trunc(peek(V, 312) + 4 + 0.00001);\n    poke(M, 0, t161);\n    t162 = trunc(peek(V, 312) + 5 + 0.00001);\n    poke(M, 0, t162);\n    t163 = trunc(peek(V, 312) + 6 + 0.00001);\n    poke(M, 0, t163);\n    t164 = trunc(peek(V, 312) + 7 + 0.00001);\n    poke(M, 0, t164);\n    t165 = f_el(V, M, mq, 0, 0, 0, 0);\n    t166 = f_el(V, M, mq, 1, 0, 0, 0);\n    t167 = f_el(V, M, mq, 2, 0, 0, 0);\n    t168 = f_el(V, M, mq, 3, 0, 0, 0);\n    t169 = f_el(V, M, mq, 4, 0, 0, 0);\n    t170 = f_el(V, M, mq, 5, 0, 0, 0);\n    t171 = f_el(V, M, mq, 6, 0, 0, 0);\n    t172 = f_el(V, M, mq, 7, 0, 0, 0);\n    poke(V, 0, 314);\n    poke(V, 12460, 315);\n    t173 = f_ed(V, M, mq, 0, 0, 45, 50);\n    t174 = f_ed(V, M, mq, 1, 30, 30, 70);\n    t175 = f_ed(V, M, mq, 2, 60, 20, 70);\n    t176 = f_ed(V, M, mq, 3, 55, 0, 100);\n    t177 = f_ed(V, M, mq, 4, 40, 20, 25);\n    t178 = f_ed(V, M, mq, 5, 35, 0, 25);\n    t179 = f_ed(V, M, mq, 6, 60, 50, 60);\n    t180 = f_ed(V, M, mq, 7, 40, 50, 50);\n    t181 = f_lum(V, M, mq, 0.105, 0.115, 0.14);\n    poke(V, t181, 316);\n    poke(V, 0, 317);\n    t182 = f_enum_count(V, M, mq, peek(V, 317));\n    poke(V, t182, 318);\n    poke(V, 1, 319);\n    poke(V, 0, 320);\n    poke(V, 0, 321);\n    poke(V, 0, 322);\n    poke(V, 0, 323);\n    poke(V, 0, 324);\n    t183 = f_update_params(V, M, mq);\n    poke(V, 1, 102);\n  }\n  // a moved slider runs @slider\n  moved = 0;\n  if (slider1 != peek(V, 103)) {\n    poke(V, slider1, 103);\n    poke(V, slider1, 0);\n    moved = 1;\n  }\n  if (slider2 != peek(V, 104)) {\n    poke(V, slider2, 104);\n    poke(V, slider2, 1);\n    moved = 1;\n  }\n  if (slider3 != peek(V, 105)) {\n    poke(V, slider3, 105);\n    poke(V, slider3, 2);\n    moved = 1;\n  }\n  if (slider4 != peek(V, 106)) {\n    poke(V, slider4, 106);\n    poke(V, slider4, 3);\n    moved = 1;\n  }\n  if (slider5 != peek(V, 107)) {\n    poke(V, slider5, 107);\n    poke(V, slider5, 4);\n    moved = 1;\n  }\n  if (slider6 != peek(V, 108)) {\n    poke(V, slider6, 108);\n    poke(V, slider6, 5);\n    moved = 1;\n  }\n  if (slider7 != peek(V, 109)) {\n    poke(V, slider7, 109);\n    poke(V, slider7, 6);\n    moved = 1;\n  }\n  if (slider8 != peek(V, 110)) {\n    poke(V, slider8, 110);\n    poke(V, slider8, 7);\n    moved = 1;\n  }\n  if (slider9 != peek(V, 111)) {\n    poke(V, slider9, 111);\n    poke(V, slider9, 8);\n    moved = 1;\n  }\n  if (slider10 != peek(V, 112)) {\n    poke(V, slider10, 112);\n    poke(V, slider10, 9);\n    moved = 1;\n  }\n  if (slider11 != peek(V, 113)) {\n    poke(V, slider11, 113);\n    poke(V, slider11, 10);\n    moved = 1;\n  }\n  if (slider12 != peek(V, 114)) {\n    poke(V, slider12, 114);\n    poke(V, slider12, 11);\n    moved = 1;\n  }\n  if (slider13 != peek(V, 115)) {\n    poke(V, slider13, 115);\n    poke(V, slider13, 12);\n    moved = 1;\n  }\n  if (slider14 != peek(V, 116)) {\n    poke(V, slider14, 116);\n    poke(V, slider14, 13);\n    moved = 1;\n  }\n  if (slider15 != peek(V, 117)) {\n    poke(V, slider15, 117);\n    poke(V, slider15, 14);\n    moved = 1;\n  }\n  if (slider16 != peek(V, 118)) {\n    poke(V, slider16, 118);\n    poke(V, slider16, 15);\n    moved = 1;\n  }\n  if (slider17 != peek(V, 119)) {\n    poke(V, slider17, 119);\n    poke(V, slider17, 16);\n    moved = 1;\n  }\n  if (slider18 != peek(V, 120)) {\n    poke(V, slider18, 120);\n    poke(V, slider18, 17);\n    moved = 1;\n  }\n  if (slider19 != peek(V, 121)) {\n    poke(V, slider19, 121);\n    poke(V, slider19, 18);\n    moved = 1;\n  }\n  if (slider20 != peek(V, 122)) {\n    poke(V, slider20, 122);\n    poke(V, slider20, 19);\n    moved = 1;\n  }\n  if (slider21 != peek(V, 123)) {\n    poke(V, slider21, 123);\n    poke(V, slider21, 20);\n    moved = 1;\n  }\n  if (slider22 != peek(V, 124)) {\n    poke(V, slider22, 124);\n    poke(V, slider22, 21);\n    moved = 1;\n  }\n  if (slider23 != peek(V, 125)) {\n    poke(V, slider23, 125);\n    poke(V, slider23, 22);\n    moved = 1;\n  }\n  if (slider24 != peek(V, 126)) {\n    poke(V, slider24, 126);\n    poke(V, slider24, 23);\n    moved = 1;\n  }\n  if (slider25 != peek(V, 127)) {\n    poke(V, slider25, 127);\n    poke(V, slider25, 24);\n    moved = 1;\n  }\n  if (slider26 != peek(V, 128)) {\n    poke(V, slider26, 128);\n    poke(V, slider26, 25);\n    moved = 1;\n  }\n  if (slider27 != peek(V, 129)) {\n    poke(V, slider27, 129);\n    poke(V, slider27, 26);\n    moved = 1;\n  }\n  if (slider28 != peek(V, 130)) {\n    poke(V, slider28, 130);\n    poke(V, slider28, 27);\n    moved = 1;\n  }\n  if (slider29 != peek(V, 131)) {\n    poke(V, slider29, 131);\n    poke(V, slider29, 28);\n    moved = 1;\n  }\n  if (slider30 != peek(V, 132)) {\n    poke(V, slider30, 132);\n    poke(V, slider30, 29);\n    moved = 1;\n  }\n  if (slider31 != peek(V, 133)) {\n    poke(V, slider31, 133);\n    poke(V, slider31, 30);\n    moved = 1;\n  }\n  if (slider32 != peek(V, 134)) {\n    poke(V, slider32, 134);\n    poke(V, slider32, 31);\n    moved = 1;\n  }\n  if (slider33 != peek(V, 135)) {\n    poke(V, slider33, 135);\n    poke(V, slider33, 32);\n    moved = 1;\n  }\n  if (slider34 != peek(V, 136)) {\n    poke(V, slider34, 136);\n    poke(V, slider34, 33);\n    moved = 1;\n  }\n  if (slider35 != peek(V, 137)) {\n    poke(V, slider35, 137);\n    poke(V, slider35, 34);\n    moved = 1;\n  }\n  if (slider36 != peek(V, 138)) {\n    poke(V, slider36, 138);\n    poke(V, slider36, 35);\n    moved = 1;\n  }\n  if (slider37 != peek(V, 139)) {\n    poke(V, slider37, 139);\n    poke(V, slider37, 36);\n    moved = 1;\n  }\n  if (slider38 != peek(V, 140)) {\n    poke(V, slider38, 140);\n    poke(V, slider38, 37);\n    moved = 1;\n  }\n  if (slider39 != peek(V, 141)) {\n    poke(V, slider39, 141);\n    poke(V, slider39, 38);\n    moved = 1;\n  }\n  if (slider40 != peek(V, 142)) {\n    poke(V, slider40, 142);\n    poke(V, slider40, 39);\n    moved = 1;\n  }\n  if (slider41 != peek(V, 143)) {\n    poke(V, slider41, 143);\n    poke(V, slider41, 40);\n    moved = 1;\n  }\n  if (slider42 != peek(V, 144)) {\n    poke(V, slider42, 144);\n    poke(V, slider42, 41);\n    moved = 1;\n  }\n  if (slider43 != peek(V, 145)) {\n    poke(V, slider43, 145);\n    poke(V, slider43, 42);\n    moved = 1;\n  }\n  if (slider44 != peek(V, 146)) {\n    poke(V, slider44, 146);\n    poke(V, slider44, 43);\n    moved = 1;\n  }\n  if (slider45 != peek(V, 147)) {\n    poke(V, slider45, 147);\n    poke(V, slider45, 44);\n    moved = 1;\n  }\n  if (slider46 != peek(V, 148)) {\n    poke(V, slider46, 148);\n    poke(V, slider46, 45);\n    moved = 1;\n  }\n  if (slider47 != peek(V, 149)) {\n    poke(V, slider47, 149);\n    poke(V, slider47, 46);\n    moved = 1;\n  }\n  if (slider48 != peek(V, 150)) {\n    poke(V, slider48, 150);\n    poke(V, slider48, 47);\n    moved = 1;\n  }\n  if (slider49 != peek(V, 151)) {\n    poke(V, slider49, 151);\n    poke(V, slider49, 48);\n    moved = 1;\n  }\n  if (slider50 != peek(V, 152)) {\n    poke(V, slider50, 152);\n    poke(V, slider50, 49);\n    moved = 1;\n  }\n  if (slider51 != peek(V, 153)) {\n    poke(V, slider51, 153);\n    poke(V, slider51, 50);\n    moved = 1;\n  }\n  if (slider52 != peek(V, 154)) {\n    poke(V, slider52, 154);\n    poke(V, slider52, 51);\n    moved = 1;\n  }\n  if (slider53 != peek(V, 155)) {\n    poke(V, slider53, 155);\n    poke(V, slider53, 52);\n    moved = 1;\n  }\n  if (slider54 != peek(V, 156)) {\n    poke(V, slider54, 156);\n    poke(V, slider54, 53);\n    moved = 1;\n  }\n  if (slider55 != peek(V, 157)) {\n    poke(V, slider55, 157);\n    poke(V, slider55, 54);\n    moved = 1;\n  }\n  if (slider56 != peek(V, 158)) {\n    poke(V, slider56, 158);\n    poke(V, slider56, 55);\n    moved = 1;\n  }\n  if (slider57 != peek(V, 159)) {\n    poke(V, slider57, 159);\n    poke(V, slider57, 56);\n    moved = 1;\n  }\n  if (slider58 != peek(V, 160)) {\n    poke(V, slider58, 160);\n    poke(V, slider58, 57);\n    moved = 1;\n  }\n  if (slider59 != peek(V, 161)) {\n    poke(V, slider59, 161);\n    poke(V, slider59, 58);\n    moved = 1;\n  }\n  if (slider60 != peek(V, 162)) {\n    poke(V, slider60, 162);\n    poke(V, slider60, 59);\n    moved = 1;\n  }\n  if (slider61 != peek(V, 163)) {\n    poke(V, slider61, 163);\n    poke(V, slider61, 60);\n    moved = 1;\n  }\n  if (slider62 != peek(V, 164)) {\n    poke(V, slider62, 164);\n    poke(V, slider62, 61);\n    moved = 1;\n  }\n  if (slider63 != peek(V, 165)) {\n    poke(V, slider63, 165);\n    poke(V, slider63, 62);\n    moved = 1;\n  }\n  if (slider64 != peek(V, 166)) {\n    poke(V, slider64, 166);\n    poke(V, slider64, 63);\n    moved = 1;\n  }\n  if (slider65 != peek(V, 167)) {\n    poke(V, slider65, 167);\n    poke(V, slider65, 64);\n    moved = 1;\n  }\n  if (slider66 != peek(V, 168)) {\n    poke(V, slider66, 168);\n    poke(V, slider66, 65);\n    moved = 1;\n  }\n  if (slider67 != peek(V, 169)) {\n    poke(V, slider67, 169);\n    poke(V, slider67, 66);\n    moved = 1;\n  }\n  if (slider68 != peek(V, 170)) {\n    poke(V, slider68, 170);\n    poke(V, slider68, 67);\n    moved = 1;\n  }\n  if (slider69 != peek(V, 171)) {\n    poke(V, slider69, 171);\n    poke(V, slider69, 68);\n    moved = 1;\n  }\n  if (slider70 != peek(V, 172)) {\n    poke(V, slider70, 172);\n    poke(V, slider70, 69);\n    moved = 1;\n  }\n  if (slider71 != peek(V, 173)) {\n    poke(V, slider71, 173);\n    poke(V, slider71, 70);\n    moved = 1;\n  }\n  if (slider72 != peek(V, 174)) {\n    poke(V, slider72, 174);\n    poke(V, slider72, 71);\n    moved = 1;\n  }\n  if (slider73 != peek(V, 175)) {\n    poke(V, slider73, 175);\n    poke(V, slider73, 72);\n    moved = 1;\n  }\n  if (slider74 != peek(V, 176)) {\n    poke(V, slider74, 176);\n    poke(V, slider74, 73);\n    moved = 1;\n  }\n  if (slider75 != peek(V, 177)) {\n    poke(V, slider75, 177);\n    poke(V, slider75, 74);\n    moved = 1;\n  }\n  if (slider76 != peek(V, 178)) {\n    poke(V, slider76, 178);\n    poke(V, slider76, 75);\n    moved = 1;\n  }\n  if (slider77 != peek(V, 179)) {\n    poke(V, slider77, 179);\n    poke(V, slider77, 76);\n    moved = 1;\n  }\n  if (slider78 != peek(V, 180)) {\n    poke(V, slider78, 180);\n    poke(V, slider78, 77);\n    moved = 1;\n  }\n  if (slider79 != peek(V, 181)) {\n    poke(V, slider79, 181);\n    poke(V, slider79, 78);\n    moved = 1;\n  }\n  if (slider80 != peek(V, 182)) {\n    poke(V, slider80, 182);\n    poke(V, slider80, 79);\n    moved = 1;\n  }\n  if (slider81 != peek(V, 183)) {\n    poke(V, slider81, 183);\n    poke(V, slider81, 80);\n    moved = 1;\n  }\n  if (slider82 != peek(V, 184)) {\n    poke(V, slider82, 184);\n    poke(V, slider82, 81);\n    moved = 1;\n  }\n  if (slider83 != peek(V, 185)) {\n    poke(V, slider83, 185);\n    poke(V, slider83, 82);\n    moved = 1;\n  }\n  if (slider84 != peek(V, 186)) {\n    poke(V, slider84, 186);\n    poke(V, slider84, 83);\n    moved = 1;\n  }\n  if (slider85 != peek(V, 187)) {\n    poke(V, slider85, 187);\n    poke(V, slider85, 84);\n    moved = 1;\n  }\n  if (slider86 != peek(V, 188)) {\n    poke(V, slider86, 188);\n    poke(V, slider86, 85);\n    moved = 1;\n  }\n  if (slider87 != peek(V, 189)) {\n    poke(V, slider87, 189);\n    poke(V, slider87, 86);\n    moved = 1;\n  }\n  if (slider88 != peek(V, 190)) {\n    poke(V, slider88, 190);\n    poke(V, slider88, 87);\n    moved = 1;\n  }\n  if (slider89 != peek(V, 191)) {\n    poke(V, slider89, 191);\n    poke(V, slider89, 88);\n    moved = 1;\n  }\n  if (slider90 != peek(V, 192)) {\n    poke(V, slider90, 192);\n    poke(V, slider90, 89);\n    moved = 1;\n  }\n  if (slider91 != peek(V, 193)) {\n    poke(V, slider91, 193);\n    poke(V, slider91, 90);\n    moved = 1;\n  }\n  if (slider92 != peek(V, 194)) {\n    poke(V, slider92, 194);\n    poke(V, slider92, 91);\n    moved = 1;\n  }\n  if (slider93 != peek(V, 195)) {\n    poke(V, slider93, 195);\n    poke(V, slider93, 92);\n    moved = 1;\n  }\n  if (slider94 != peek(V, 196)) {\n    poke(V, slider94, 196);\n    poke(V, slider94, 93);\n    moved = 1;\n  }\n  if (slider95 != peek(V, 197)) {\n    poke(V, slider95, 197);\n    poke(V, slider95, 94);\n    moved = 1;\n  }\n  if (slider96 != peek(V, 198)) {\n    poke(V, slider96, 198);\n    poke(V, slider96, 95);\n    moved = 1;\n  }\n  if (slider97 != peek(V, 199)) {\n    poke(V, slider97, 199);\n    poke(V, slider97, 96);\n    moved = 1;\n  }\n  if (slider98 != peek(V, 200)) {\n    poke(V, slider98, 200);\n    poke(V, slider98, 97);\n    moved = 1;\n  }\n  if (slider99 != peek(V, 201)) {\n    poke(V, slider99, 201);\n    poke(V, slider99, 98);\n    moved = 1;\n  }\n  if (slider100 != peek(V, 202)) {\n    poke(V, slider100, 202);\n    poke(V, slider100, 99);\n    moved = 1;\n  }\n  if (slider101 != peek(V, 203)) {\n    poke(V, slider101, 203);\n    poke(V, slider101, 100);\n    moved = 1;\n  }\n  if (slider102 != peek(V, 204)) {\n    poke(V, slider102, 204);\n    poke(V, slider102, 101);\n    moved = 1;\n  }\n  if (moved != 0) {\n    t184 = f_update_params(V, M, mq);\n  }\n  // @block, every 32 samples\n  if (peek(V, 464) <= 0) {\n    poke(V, 32, 464);\n    poke(V, tempo, 209);\n    poke(V, play_state, 465);\n    poke(V, beat_position, 466);\n    poke(V, beat_position * 60 / max(1, tempo), 467);\n    poke(V, ts_num, 210);\n    poke(V, ts_denom, 211);\n    if ((abs((((abs(peek(V, 468)) >= 0.00001) || (abs((abs(peek(V, 206) - peek(V, 326)) < 0.00001 ? 0 : 1)) >= 0.00001)) ? 1 : 0)) >= 0.00001)) {\n      poke(V, 0, 468);\n      t185 = f_update_params(V, M, mq);\n    }\n    poke(V, 0, 469);\n    poke(V, 0, 470);\n    poke(V, 0, 471);\n    t186 = 0;\n    while (t186 < 1048576) {\n      t187 = 0;\n      if (peek(V, 472) < peek(mq, 0)) {\n        t188 = 1 + 3 * eel_mod(peek(V, 472), 256);\n        t189 = peek(mq, t188);\n        t190 = peek(mq, t188 + 1);\n        t191 = peek(mq, t188 + 2);\n        poke(V, peek(V, 472) + 1, 472);\n        poke(V, 0, 473);\n        poke(V, t189, 474);\n        poke(V, t190, 475);\n        poke(V, t191, 476);\n        t187 = t189;\n      }\n      if (!(abs(t187) >= 0.00001)) {\n        break;\n      }\n      if ((abs((peek(V, 469) < 2000 ? 1 : 0)) >= 0.00001)) {\n        t192 = trunc(peek(V, 213) + (peek(V, 469) * 4) + 0.00001);\n        t193 = peek(V, 473);\n        poke(M, t193, t192);\n        t194 = trunc(peek(V, 213) + ((peek(V, 469) * 4) + 1) + 0.00001);\n        t195 = peek(V, 474);\n        poke(M, t195, t194);\n        t196 = trunc(peek(V, 213) + ((peek(V, 469) * 4) + 2) + 0.00001);\n        t197 = peek(V, 475);\n        poke(M, t197, t196);\n        t198 = trunc(peek(V, 213) + ((peek(V, 469) * 4) + 3) + 0.00001);\n        t199 = peek(V, 476);\n        poke(M, t199, t198);\n        t200 = (peek(V, 469) + 1);\n        poke(V, t200, 469);\n      }\n      t186 += 1;\n    }\n    t201 = (peek(V, 209) / 60);\n    poke(V, t201, 477);\n    t202 = peek(V, 466);\n    poke(V, t202, 298);\n    t203 = eel_band(peek(V, 465), 1);\n    poke(V, t203, 478);\n    if ((abs(peek(V, 478)) >= 0.00001)) {\n      if ((abs((((abs(peek(V, 35)) >= 0.00001) && (abs(((abs(peek(V, 38)) >= 0.00001) ? 0 : 1)) >= 0.00001)) ? 1 : 0)) >= 0.00001)) {\n        t204 = f_frac(V, M, mq, (peek(V, 466) / peek(M, trunc(peek(V, 233) + peek(V, 37) + 0.00001))));\n        poke(V, t204, 479);\n      }\n      if ((abs((((abs(peek(V, 41)) >= 0.00001) && (abs(((abs(peek(V, 44)) >= 0.00001) ? 0 : 1)) >= 0.00001)) ? 1 : 0)) >= 0.00001)) {\n        t205 = f_frac(V, M, mq, (peek(V, 466) / peek(M, trunc(peek(V, 233) + peek(V, 43) + 0.00001))));\n        poke(V, t205, 480);\n      }\n      t206 = f_frac(V, M, mq, (peek(V, 466) / peek(M, trunc(peek(V, 233) + peek(V, 54) + 0.00001))));\n      poke(V, t206, 481);\n    }\n  }\n  poke(V, peek(V, 464) - 1, 464);\n  // @sample\n  poke(V, 0, 482);\n  poke(V, 0, 483);\n  t207 = 0;\n  while (t207 < 1048576) {\n    if (!(abs((((abs((peek(V, 470) < peek(V, 469) ? 1 : 0)) >= 0.00001) && (abs((peek(M, trunc(peek(V, 213) + (peek(V, 470) * 4) + 0.00001)) <= peek(V, 471) ? 1 : 0)) >= 0.00001)) ? 1 : 0)) >= 0.00001)) {\n      break;\n    }\n    t208 = f_handle_midi(V, M, mq, peek(M, trunc(peek(V, 213) + ((peek(V, 470) * 4) + 1) + 0.00001)), peek(M, trunc(peek(V, 213) + ((peek(V, 470) * 4) + 2) + 0.00001)), peek(M, trunc(peek(V, 213) + ((peek(V, 470) * 4) + 3) + 0.00001)));\n    t209 = (peek(V, 470) + 1);\n    poke(V, t209, 470);\n    t207 += 1;\n  }\n  t210 = (peek(V, 471) + 1);\n  poke(V, t210, 471);\n  t211 = (peek(V, 477) * peek(V, 325));\n  t212 = (peek(V, 298) + t211);\n  poke(V, t212, 298);\n  t213 = f_env_tick__aenv_o(V, M, mq, peek(V, 370), peek(V, 371), peek(V, 376), peek(V, 372));\n  poke(V, t213, 501);\n  t214 = f_env_tick__menv_o(V, M, mq, peek(V, 373), peek(V, 374), peek(V, 377), peek(V, 375));\n  poke(V, t214, 503);\n  t215 = peek(V, 325);\n  t216 = (peek(V, 492) + t215);\n  poke(V, t216, 492);\n  t217 = (((abs(peek(V, 35)) >= 0.00001) ? (peek(V, 477) / peek(M, trunc(peek(V, 233) + peek(V, 37) + 0.00001))) : peek(V, 36)) * pow(2, (peek(M, trunc(peek(V, 229) + 23 + 0.00001)) * 3)));\n  poke(V, t217, 504);\n  t218 = (((abs(peek(V, 41)) >= 0.00001) ? (peek(V, 477) / peek(M, trunc(peek(V, 233) + peek(V, 43) + 0.00001))) : peek(V, 42)) * pow(2, (peek(M, trunc(peek(V, 229) + 24 + 0.00001)) * 3)));\n  poke(V, t218, 505);\n  t219 = f_lfo_tick__lfo1(V, M, mq, peek(V, 34), peek(V, 504));\n  poke(V, t219, 509);\n  t220 = f_lfo_tick__lfo2(V, M, mq, peek(V, 40), peek(V, 505));\n  poke(V, t220, 513);\n  if ((abs((peek(V, 39) > 0 ? 1 : 0)) >= 0.00001)) {\n    t221 = min(1, ((peek(V, 492) * 1000) / peek(V, 39)));\n    t222 = (peek(V, 509) * t221);\n    poke(V, t222, 509);\n  }\n  if ((abs((peek(V, 45) > 0 ? 1 : 0)) >= 0.00001)) {\n    t223 = min(1, ((peek(V, 492) * 1000) / peek(V, 45)));\n    t224 = (peek(V, 513) * t223);\n    poke(V, t224, 513);\n  }\n  t225 = trunc(peek(V, 228) + 1 + 0.00001);\n  t226 = peek(V, 509);\n  poke(M, t226, t225);\n  t227 = trunc(peek(V, 228) + 2 + 0.00001);\n  t228 = peek(V, 513);\n  poke(M, t228, t227);\n  t229 = trunc(peek(V, 228) + 3 + 0.00001);\n  t230 = peek(V, 503);\n  poke(M, t230, t229);\n  t231 = trunc(peek(V, 228) + 4 + 0.00001);\n  t232 = peek(V, 501);\n  poke(M, t232, t231);\n  t233 = trunc(peek(V, 228) + 5 + 0.00001);\n  t234 = peek(V, 270);\n  poke(M, t234, t233);\n  t235 = trunc(peek(V, 228) + 6 + 0.00001);\n  t236 = peek(V, 274);\n  poke(M, t236, t235);\n  t237 = trunc(peek(V, 228) + 7 + 0.00001);\n  t238 = peek(V, 275);\n  poke(M, t238, t237);\n  t239 = trunc(peek(V, 228) + 8 + 0.00001);\n  t240 = f_clamp(V, M, mq, ((peek(V, 272) - 48) / 24), (-1), 1);\n  poke(M, t240, t239);\n  t241 = trunc(peek(V, 228) + 9 + 0.00001);\n  t242 = peek(V, 491);\n  poke(M, t242, t241);\n  t243 = trunc(peek(V, 228) + 10 + 0.00001);\n  t244 = cos(((2 * 3.141592653589793) * peek(V, 500)));\n  poke(M, t244, t243);\n  poke(V, 0, 308);\n  t245 = min(1048576, trunc(peek(V, 459)));\n  for (t246 = 0; t246 < t245; t246 += 1) {\n    t247 = trunc(peek(V, 229) + peek(M, trunc(peek(V, 231) + peek(V, 308) + 0.00001)) + 0.00001);\n    poke(M, 0, t247);\n    t248 = (peek(V, 308) + 1);\n    poke(V, t248, 308);\n  }\n  poke(V, 0, 308);\n  t249 = min(1048576, trunc(peek(V, 459)));\n  for (t250 = 0; t250 < t249; t250 += 1) {\n    t251 = trunc(peek(V, 229) + peek(M, trunc(peek(V, 231) + peek(V, 308) + 0.00001)) + 0.00001);\n    t252 = (peek(M, trunc(peek(V, 228) + peek(M, trunc(peek(V, 230) + peek(V, 308) + 0.00001)) + 0.00001)) * peek(M, trunc(peek(V, 232) + peek(V, 308) + 0.00001)));\n    t253 = (peek(M, t251) + t252);\n    poke(M, t253, t251);\n    t254 = (peek(V, 308) + 1);\n    poke(V, t254, 308);\n  }\n  t255 = ((peek(V, 460) - peek(V, 279)) * peek(V, 328));\n  t256 = (peek(V, 279) + t255);\n  poke(V, t256, 279);\n  t257 = ((peek(V, 1) - peek(V, 280)) * peek(V, 328));\n  t258 = (peek(V, 280) + t257);\n  poke(V, t258, 280);\n  t259 = ((peek(V, 3) - peek(V, 288)) * peek(V, 328));\n  t260 = (peek(V, 288) + t259);\n  poke(V, t260, 288);\n  t261 = ((peek(V, 5) - peek(V, 281)) * peek(V, 328));\n  t262 = (peek(V, 281) + t261);\n  poke(V, t262, 281);\n  t263 = ((peek(V, 6) - peek(V, 282)) * peek(V, 328));\n  t264 = (peek(V, 282) + t263);\n  poke(V, t264, 282);\n  t265 = ((peek(V, 7) - peek(V, 283)) * peek(V, 328));\n  t266 = (peek(V, 283) + t265);\n  poke(V, t266, 283);\n  t267 = ((peek(V, 387) - peek(V, 284)) * peek(V, 328));\n  t268 = (peek(V, 284) + t267);\n  poke(V, t268, 284);\n  t269 = ((peek(V, 271) - peek(V, 272)) * peek(V, 378));\n  t270 = (peek(V, 272) + t269);\n  poke(V, t270, 272);\n  t271 = (((peek(V, 272) + (peek(V, 78) * 12)) + (peek(V, 276) * peek(V, 76))) + (peek(M, trunc(peek(V, 229) + 4 + 0.00001)) * 24));\n  poke(V, t271, 514);\n  t272 = (440 * pow(2, ((peek(V, 514) - 69) / 12)));\n  poke(V, t272, 515);\n  if ((abs((abs(peek(V, 2) - 0) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n    t273 = (peek(V, 280) + (peek(M, trunc(peek(V, 229) + 3 + 0.00001)) * 100));\n    poke(V, t273, 516);\n    t274 = (peek(V, 515) * (pow(2, (peek(V, 516) / 1200)) - 1));\n    poke(V, t274, 517);\n  }\n  else {\n    t275 = (((abs((abs(peek(V, 2) - 1) < 0.00001 ? 1 : 0)) >= 0.00001) ? peek(V, 288) : (peek(V, 477) / peek(M, trunc(peek(V, 233) + peek(V, 4) + 0.00001)))) + (peek(M, trunc(peek(V, 229) + 3 + 0.00001)) * 10));\n    poke(V, t275, 518);\n    t276 = peek(V, 518);\n    poke(V, t276, 517);\n  }\n  t277 = (peek(V, 517) * peek(V, 325));\n  t278 = (peek(V, 500) + t277);\n  poke(V, t278, 500);\n  t279 = floor(peek(V, 500));\n  t280 = (peek(V, 500) - t279);\n  poke(V, t280, 500);\n  t281 = f_clamp(V, M, mq, (peek(V, 281) + (peek(M, trunc(peek(V, 229) + 5 + 0.00001)) * 100)), 0, 100);\n  t282 = (t281 * 0.01);\n  poke(V, t282, 519);\n  t283 = f_clamp(V, M, mq, (peek(V, 282) + (peek(M, trunc(peek(V, 229) + 6 + 0.00001)) * 100)), 0, 100);\n  t284 = (t283 * 0.01);\n  poke(V, t284, 520);\n  t285 = f_clamp(V, M, mq, (peek(V, 283) + (peek(M, trunc(peek(V, 229) + 7 + 0.00001)) * 100)), 0, 100);\n  t286 = (t285 * 0.01);\n  poke(V, t286, 521);\n  t287 = f_clamp(V, M, mq, (peek(V, 9) + (peek(M, trunc(peek(V, 229) + 16 + 0.00001)) * 100)), 0, 100);\n  t288 = (t287 * 0.6);\n  poke(V, t288, 522);\n  t289 = f_clamp(V, M, mq, (peek(V, 10) + (peek(M, trunc(peek(V, 229) + 17 + 0.00001)) * 100)), 0, 100);\n  t290 = (t289 * 0.01);\n  poke(V, t290, 523);\n  if ((abs((abs((peek(V, 523) - peek(V, 369))) > 0.0005 ? 1 : 0)) >= 0.00001)) {\n    t291 = f_update_pans(V, M, mq, peek(V, 523));\n    t292 = peek(V, 523);\n    poke(V, t292, 369);\n  }\n  poke(V, 1, 526);\n  poke(V, 1, 527);\n  poke(V, 1, 528);\n  if ((abs((abs(peek(V, 0) - 0) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n    t293 = peek(V, 519);\n    poke(V, t293, 529);\n    t294 = peek(M, trunc(peek(V, 234) + floor((peek(V, 520) * 7.999)) + 0.00001));\n    poke(V, t294, 530);\n    t295 = min(1, ((2 - peek(V, 521)) - peek(V, 521)));\n    poke(V, t295, 526);\n    t296 = min(1, (peek(V, 521) + peek(V, 521)));\n    poke(V, t296, 527);\n  }\n  else {\n    if ((abs((abs(peek(V, 0) - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      t297 = (1 + (peek(V, 520) * 2));\n      poke(V, t297, 531);\n    }\n    else {\n      if ((abs((abs(peek(V, 0) - 2) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n        poke(V, 0, 528);\n        t298 = peek(V, 521);\n        poke(V, t298, 527);\n        t299 = (0.5 - (peek(V, 520) * 0.45));\n        t300 = (peek(V, 519) * 0.45);\n        t301 = f_tri(V, M, mq, peek(V, 500));\n        t302 = f_clamp(V, M, mq, (t299 + (t300 * t301)), 0.03, 0.97);\n        poke(V, t302, 532);\n        t303 = (0.5 - (peek(V, 520) * 0.45));\n        t304 = (peek(V, 519) * 0.45);\n        t305 = f_frac(V, M, mq, (peek(V, 500) + 0.25));\n        t306 = f_tri(V, M, mq, t305);\n        t307 = f_clamp(V, M, mq, (t303 + (t304 * t306)), 0.03, 0.97);\n        poke(V, t307, 533);\n      }\n      else {\n        if ((abs((abs(peek(V, 0) - 3) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n          t308 = (peek(V, 519) * 0.98);\n          poke(V, t308, 534);\n          t309 = floor((peek(V, 520) * 5.999));\n          poke(V, t309, 535);\n          t310 = peek(V, 521);\n          poke(V, t310, 527);\n        }\n        else {\n          if ((abs((abs(peek(V, 0) - 4) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n            t311 = (peek(V, 519) * 8);\n            poke(V, t311, 536);\n            t312 = peek(M, trunc(peek(V, 235) + floor((peek(V, 520) * 5.999)) + 0.00001));\n            poke(V, t312, 537);\n            t313 = (peek(V, 521) * 1.4);\n            poke(V, t313, 538);\n          }\n          else {\n            if ((abs((abs(peek(V, 0) - 5) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n              t314 = (1 + (peek(V, 519) * 7));\n              poke(V, t314, 539);\n              t315 = peek(V, 520);\n              poke(V, t315, 540);\n              t316 = peek(V, 521);\n              poke(V, t316, 541);\n            }\n            else {\n              if ((abs((abs(peek(V, 0) - 6) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n                poke(V, 0, 528);\n                t317 = (peek(V, 520) * 0.85);\n                poke(V, t317, 542);\n                t318 = (2 * (1 + floor((peek(V, 521) * 5.999))));\n                poke(V, t318, 543);\n                t319 = f_tri(V, M, mq, peek(V, 500));\n                poke(V, t319, 544);\n                t320 = f_frac(V, M, mq, (peek(V, 500) + (peek(V, 523) * 0.25)));\n                t321 = f_tri(V, M, mq, t320);\n                poke(V, t321, 545);\n                t322 = (peek(V, 515) * pow(2, (1 + (((peek(V, 544) + 1) * peek(V, 519)) * 2.5))));\n                poke(V, t322, 546);\n                t323 = (peek(V, 515) * pow(2, (1 + (((peek(V, 545) + 1) * peek(V, 519)) * 2.5))));\n                poke(V, t323, 547);\n                t324 = f_clamp(V, M, mq, peek(V, 546), 20, (peek(V, 332) * 0.45));\n                t325 = tan(((3.141592653589793 * t324) * peek(V, 333)));\n                poke(V, t325, 544);\n                t326 = ((peek(V, 544) - 1) / (peek(V, 544) + 1));\n                poke(V, t326, 548);\n                t327 = f_clamp(V, M, mq, peek(V, 547), 20, (peek(V, 332) * 0.45));\n                t328 = tan(((3.141592653589793 * t327) * peek(V, 333)));\n                poke(V, t328, 545);\n                t329 = ((peek(V, 545) - 1) / (peek(V, 545) + 1));\n                poke(V, t329, 549);\n              }\n              else {\n                t330 = (1 + (peek(V, 519) * 7));\n                poke(V, t330, 550);\n                t331 = peek(V, 520);\n                poke(V, t331, 551);\n                t332 = (peek(V, 521) - 0.5);\n                poke(V, t332, 552);\n              }\n            }\n          }\n        }\n      }\n    }\n  }\n  t333 = (peek(V, 289) - 1);\n  poke(V, t333, 289);\n  if ((abs((peek(V, 289) <= 0 ? 1 : 0)) >= 0.00001)) {\n    t334 = floor((peek(V, 206) * 0.35));\n    poke(V, t334, 289);\n    poke(V, 0, 553);\n    t335 = min(1048576, trunc(peek(V, 363)));\n    for (t336 = 0; t336 < t335; t336 += 1) {\n      t337 = trunc(peek(V, 223) + peek(V, 553) + 0.00001);\n      poke(V, peek(V, 205) * 16807 - 2147483647 * floor(peek(V, 205) * 16807 / 2147483647), 205);\n      t338 = ((peek(V, 205) / 2147483647 * 2) - 1);\n      poke(M, t338, t337);\n      t339 = (peek(V, 553) + 1);\n      poke(V, t339, 553);\n    }\n  }\n  t340 = (peek(V, 11) * 0.12);\n  poke(V, t340, 554);\n  poke(V, 0, 555);\n  poke(V, 0, 553);\n  t341 = min(1048576, trunc(peek(V, 363)));\n  for (t342 = 0; t342 < t341; t342 += 1) {\n    t343 = trunc(peek(V, 222) + peek(V, 553) + 0.00001);\n    t344 = ((peek(M, trunc(peek(V, 223) + peek(V, 553) + 0.00001)) - peek(M, trunc(peek(V, 222) + peek(V, 553) + 0.00001))) * peek(V, 463));\n    t345 = (peek(M, t343) + t344);\n    poke(M, t345, t343);\n    t346 = peek(M, trunc(peek(V, 224) + peek(V, 553) + 0.00001));\n    poke(V, t346, 556);\n    if ((abs((abs(peek(V, 0) - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      t347 = (((abs((peek(V, 556) < 0 ? 1 : 0)) >= 0.00001) ? (-1) : 1) * pow(abs(peek(V, 556)), peek(V, 531)));\n      poke(V, t347, 556);\n    }\n    t348 = peek(V, 528);\n    t349 = (peek(V, 556) * t348);\n    poke(V, t349, 556);\n    t350 = ((((peek(M, trunc(peek(V, 225) + peek(V, 553) + 0.00001)) * peek(V, 522)) * 0.5) + (peek(M, trunc(peek(V, 222) + peek(V, 553) + 0.00001)) * peek(V, 554))) + ((abs((((abs((abs(peek(V, 0) - 0) < 0.00001 ? 1 : 0)) >= 0.00001) && (abs((abs(peek(M, trunc(peek(V, 226) + peek(V, 553) + 0.00001)) - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) ? 1 : 0)) >= 0.00001) ? (peek(V, 530) * 100) : 0));\n    poke(V, t350, 557);\n    if ((abs((abs(peek(V, 2) - 0) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      t351 = (peek(V, 515) * exp(((((peek(V, 556) * peek(V, 516)) * 0.5) + peek(V, 557)) * 0.0005776226504666211)));\n      poke(V, t351, 558);\n    }\n    else {\n      t352 = (max((peek(V, 515) + ((peek(V, 556) * peek(V, 518)) * 0.5)), 1) * exp((peek(V, 557) * 0.0005776226504666211)));\n      poke(V, t352, 558);\n    }\n    t353 = trunc(peek(V, 218) + peek(V, 553) + 0.00001);\n    t354 = min((peek(V, 558) * peek(V, 333)), 0.45);\n    poke(M, t354, t353);\n    if ((abs((abs(peek(V, 0) - 4) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      t355 = trunc(peek(V, 219) + peek(V, 553) + 0.00001);\n      t356 = min((((peek(V, 515) * peek(V, 537)) * exp((peek(V, 557) * 0.0005776226504666211))) * peek(V, 333)), 0.45);\n      poke(M, t356, t355);\n    }\n    else {\n      if ((abs((abs(peek(V, 0) - 5) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n        t357 = trunc(peek(V, 219) + peek(V, 553) + 0.00001);\n        t358 = min((peek(M, trunc(peek(V, 218) + peek(V, 553) + 0.00001)) * peek(V, 539)), 0.45);\n        poke(M, t358, t357);\n      }\n      else {\n        if ((abs((abs(peek(V, 0) - 7) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n          if ((abs((abs(peek(V, 2) - 0) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n            t359 = (peek(V, 515) * exp((((((-peek(V, 556)) * peek(V, 516)) * 0.5) + peek(V, 557)) * 0.0005776226504666211)));\n            poke(V, t359, 558);\n          }\n          else {\n            t360 = (max((peek(V, 515) - ((peek(V, 556) * peek(V, 518)) * 0.5)), 1) * exp((peek(V, 557) * 0.0005776226504666211)));\n            poke(V, t360, 558);\n          }\n          t361 = trunc(peek(V, 219) + peek(V, 553) + 0.00001);\n          t362 = min((peek(V, 558) * peek(V, 333)), 0.45);\n          poke(M, t362, t361);\n        }\n      }\n    }\n    t363 = ((abs((abs(peek(V, 0) - 1) < 0.00001 ? 1 : 0)) >= 0.00001) ? (1 + ((peek(V, 521) - 1) * abs(peek(M, trunc(peek(V, 224) + peek(V, 553) + 0.00001))))) : ((abs((abs(peek(M, trunc(peek(V, 226) + peek(V, 553) + 0.00001)) - 0) < 0.00001 ? 1 : 0)) >= 0.00001) ? peek(V, 526) : peek(V, 527)));\n    poke(V, t363, 559);\n    t364 = trunc(peek(V, 217) + (peek(V, 553) + 32) + 0.00001);\n    t365 = peek(V, 559);\n    poke(M, t365, t364);\n    t366 = (peek(V, 559) * peek(V, 559));\n    t367 = (peek(V, 555) + t366);\n    poke(V, t367, 555);\n    t368 = (peek(V, 553) + 1);\n    poke(V, t368, 553);\n  }\n  t369 = ((peek(V, 379) * 0.9) / sqrt(abs(max(peek(V, 555), 0.25))));\n  poke(V, t369, 560);\n  t370 = pow(2, (((peek(V, 279) + (((peek(V, 24) * 0.01) * (peek(V, 514) - 48)) / 12)) + ((peek(V, 25) * 0.06) * peek(V, 503))) + (peek(M, trunc(peek(V, 229) + 1 + 0.00001)) * 6)));\n  poke(V, t370, 561);\n  t371 = peek(V, 561);\n  t372 = f_clamp(V, M, mq, (peek(V, 22) + (peek(M, trunc(peek(V, 229) + 2 + 0.00001)) * 100)), 0, 100);\n  t373 = f_calc_filter(V, M, mq, t371, (t372 * 0.01));\n  t374 = f_clamp(V, M, mq, (peek(V, 23) + (peek(M, trunc(peek(V, 229) + 8 + 0.00001)) * 100)), 0, 100);\n  poke(V, t374, 575);\n  t375 = (peek(V, 575) > 0.05 ? 1 : 0);\n  poke(V, t375, 576);\n  t376 = (1 + (peek(V, 575) * 0.07));\n  poke(V, t376, 577);\n  t377 = pow(peek(V, 577), (-0.25));\n  poke(V, t377, 578);\n  t378 = f_clamp(V, M, mq, (peek(V, 47) + (peek(M, trunc(peek(V, 229) + 9 + 0.00001)) * 100)), 0, 100);\n  poke(V, t378, 579);\n  t379 = (peek(V, 579) > 0.05 ? 1 : 0);\n  poke(V, t379, 580);\n  t380 = f_db2g(V, M, mq, (peek(V, 579) * 0.36));\n  poke(V, t380, 581);\n  t381 = (((abs((peek(V, 17) > 0 ? 1 : 0)) >= 0.00001) || (abs((abs(peek(M, trunc(peek(V, 229) + 22 + 0.00001)) - 0) < 0.00001 ? 0 : 1)) >= 0.00001)) ? 1 : 0);\n  poke(V, t381, 582);\n  t382 = f_clamp(V, M, mq, (peek(V, 17) + (peek(M, trunc(peek(V, 229) + 22 + 0.00001)) * 100)), 0, 100);\n  t383 = (t382 * 0.006);\n  poke(V, t383, 583);\n  t384 = (peek(V, 489) > 0 ? 1 : 0);\n  poke(V, t384, 584);\n  if ((abs((((abs(((abs(peek(V, 584)) >= 0.00001) ? 0 : 1)) >= 0.00001) && (abs(peek(V, 585)) >= 0.00001)) ? 1 : 0)) >= 0.00001)) {\n    t385 = f_voice_reset(V, M, mq);\n  }\n  t386 = peek(V, 584);\n  poke(V, t386, 585);\n  if ((abs(peek(V, 584)) >= 0.00001)) {\n    t387 = min(1048576, trunc(peek(V, 331)));\n    for (t388 = 0; t388 < t387; t388 += 1) {\n      poke(V, 0, 606);\n      poke(V, 0, 607);\n      poke(V, 0, 553);\n      if ((abs((abs(peek(V, 0) - 0) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n        t389 = min(1048576, trunc(peek(V, 363)));\n        for (t390 = 0; t390 < t389; t390 += 1) {\n          t391 = peek(M, trunc(peek(V, 218) + peek(V, 553) + 0.00001));\n          poke(V, t391, 608);\n          t392 = (peek(M, trunc(peek(V, 215) + peek(V, 553) + 0.00001)) + peek(V, 608));\n          poke(V, t392, 609);\n          if ((abs((peek(V, 609) >= 1 ? 1 : 0)) >= 0.00001)) {\n            t393 = (peek(V, 609) - 1);\n            poke(V, t393, 609);\n          }\n          t394 = trunc(peek(V, 215) + peek(V, 553) + 0.00001);\n          t395 = peek(V, 609);\n          poke(M, t395, t394);\n          if ((abs((peek(M, trunc(peek(V, 226) + peek(V, 553) + 0.00001)) < 0.5 ? 1 : 0)) >= 0.00001)) {\n            t397 = ((peek(V, 609) + peek(V, 609)) - 1);\n            t398 = f_blep(V, M, mq, peek(V, 609), peek(V, 608));\n            t396 = (t397 - t398);\n          }\n          else {\n            t399 = f_wave_morph(V, M, mq, peek(V, 609), peek(V, 608), peek(V, 529));\n            t396 = t399;\n          }\n          t400 = (t396 * peek(M, trunc(peek(V, 217) + (peek(V, 553) + 32) + 0.00001)));\n          poke(V, t400, 614);\n          t401 = (peek(V, 614) * peek(M, trunc(peek(V, 220) + peek(V, 553) + 0.00001)));\n          t402 = (peek(V, 606) + t401);\n          poke(V, t402, 606);\n          t403 = (peek(V, 614) * peek(M, trunc(peek(V, 221) + peek(V, 553) + 0.00001)));\n          t404 = (peek(V, 607) + t403);\n          poke(V, t404, 607);\n          t405 = (peek(V, 553) + 1);\n          poke(V, t405, 553);\n        }\n      }\n      else {\n        if ((abs((abs(peek(V, 0) - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n          t406 = min(1048576, trunc(peek(V, 363)));\n          for (t407 = 0; t407 < t406; t407 += 1) {\n            t408 = peek(M, trunc(peek(V, 218) + peek(V, 553) + 0.00001));\n            poke(V, t408, 608);\n            t409 = (peek(M, trunc(peek(V, 215) + peek(V, 553) + 0.00001)) + peek(V, 608));\n            poke(V, t409, 609);\n            if ((abs((peek(V, 609) >= 1 ? 1 : 0)) >= 0.00001)) {\n              t410 = (peek(V, 609) - 1);\n              poke(V, t410, 609);\n            }\n            t411 = trunc(peek(V, 215) + peek(V, 553) + 0.00001);\n            t412 = peek(V, 609);\n            poke(M, t412, t411);\n            t413 = ((peek(V, 609) + peek(V, 609)) - 1);\n            t414 = f_blep(V, M, mq, peek(V, 609), peek(V, 608));\n            t415 = ((t413 - t414) * peek(M, trunc(peek(V, 217) + (peek(V, 553) + 32) + 0.00001)));\n            poke(V, t415, 614);\n            t416 = (peek(V, 614) * peek(M, trunc(peek(V, 220) + peek(V, 553) + 0.00001)));\n            t417 = (peek(V, 606) + t416);\n            poke(V, t417, 606);\n            t418 = (peek(V, 614) * peek(M, trunc(peek(V, 221) + peek(V, 553) + 0.00001)));\n            t419 = (peek(V, 607) + t418);\n            poke(V, t419, 607);\n            t420 = (peek(V, 553) + 1);\n            poke(V, t420, 553);\n          }\n        }\n        else {\n          if ((abs((abs(peek(V, 0) - 2) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n            t421 = min(1048576, trunc(peek(V, 363)));\n            for (t422 = 0; t422 < t421; t422 += 1) {\n              t423 = peek(M, trunc(peek(V, 218) + peek(V, 553) + 0.00001));\n              poke(V, t423, 608);\n              t424 = (peek(M, trunc(peek(V, 215) + peek(V, 553) + 0.00001)) + peek(V, 608));\n              poke(V, t424, 609);\n              if ((abs((peek(V, 609) >= 1 ? 1 : 0)) >= 0.00001)) {\n                t425 = (peek(V, 609) - 1);\n                poke(V, t425, 609);\n              }\n              t426 = trunc(peek(V, 215) + peek(V, 553) + 0.00001);\n              t427 = peek(V, 609);\n              poke(M, t427, t426);\n              t428 = f_pulse(V, M, mq, peek(V, 609), peek(V, 608), ((abs((peek(M, trunc(peek(V, 226) + peek(V, 553) + 0.00001)) < 0.5 ? 1 : 0)) >= 0.00001) ? peek(V, 532) : peek(V, 533)));\n              t429 = (t428 * peek(M, trunc(peek(V, 217) + (peek(V, 553) + 32) + 0.00001)));\n              poke(V, t429, 614);\n              t430 = (peek(V, 614) * peek(M, trunc(peek(V, 220) + peek(V, 553) + 0.00001)));\n              t431 = (peek(V, 606) + t430);\n              poke(V, t431, 606);\n              t432 = (peek(V, 614) * peek(M, trunc(peek(V, 221) + peek(V, 553) + 0.00001)));\n              t433 = (peek(V, 607) + t432);\n              poke(V, t433, 607);\n              t434 = (peek(V, 553) + 1);\n              poke(V, t434, 553);\n            }\n          }\n          else {\n            if ((abs((abs(peek(V, 0) - 3) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n              t435 = min(1048576, trunc(peek(V, 363)));\n              for (t436 = 0; t436 < t435; t436 += 1) {\n                t437 = peek(M, trunc(peek(V, 218) + peek(V, 553) + 0.00001));\n                poke(V, t437, 608);\n                t438 = (peek(M, trunc(peek(V, 215) + peek(V, 553) + 0.00001)) + peek(V, 608));\n                poke(V, t438, 609);\n                if ((abs((peek(V, 609) >= 1 ? 1 : 0)) >= 0.00001)) {\n                  t439 = (peek(V, 609) - 1);\n                  poke(V, t439, 609);\n                }\n                t440 = trunc(peek(V, 215) + peek(V, 553) + 0.00001);\n                t441 = peek(V, 609);\n                poke(M, t441, t440);\n                t442 = f_cz_wave(V, M, mq, peek(V, 609), peek(V, 608), peek(V, 534), peek(V, 535));\n                t443 = (t442 * peek(M, trunc(peek(V, 217) + (peek(V, 553) + 32) + 0.00001)));\n                poke(V, t443, 614);\n                t444 = (peek(V, 614) * peek(M, trunc(peek(V, 220) + peek(V, 553) + 0.00001)));\n                t445 = (peek(V, 606) + t444);\n                poke(V, t445, 606);\n                t446 = (peek(V, 614) * peek(M, trunc(peek(V, 221) + peek(V, 553) + 0.00001)));\n                t447 = (peek(V, 607) + t446);\n                poke(V, t447, 607);\n                t448 = (peek(V, 553) + 1);\n                poke(V, t448, 553);\n              }\n            }\n            else {\n              if ((abs((abs(peek(V, 0) - 4) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n                t449 = min(1048576, trunc(peek(V, 363)));\n                for (t450 = 0; t450 < t449; t450 += 1) {\n                  t451 = (peek(M, trunc(peek(V, 215) + peek(V, 553) + 0.00001)) + peek(M, trunc(peek(V, 218) + peek(V, 553) + 0.00001)));\n                  poke(V, t451, 609);\n                  if ((abs((peek(V, 609) >= 1 ? 1 : 0)) >= 0.00001)) {\n                    t452 = (peek(V, 609) - 1);\n                    poke(V, t452, 609);\n                  }\n                  t453 = trunc(peek(V, 215) + peek(V, 553) + 0.00001);\n                  t454 = peek(V, 609);\n                  poke(M, t454, t453);\n                  t455 = (peek(M, trunc(peek(V, 216) + peek(V, 553) + 0.00001)) + peek(M, trunc(peek(V, 219) + peek(V, 553) + 0.00001)));\n                  poke(V, t455, 619);\n                  if ((abs((peek(V, 619) >= 1 ? 1 : 0)) >= 0.00001)) {\n                    t456 = (peek(V, 619) - 1);\n                    poke(V, t456, 619);\n                  }\n                  t457 = trunc(peek(V, 216) + peek(V, 553) + 0.00001);\n                  t458 = peek(V, 619);\n                  poke(M, t458, t457);\n                  t459 = sin((((2 * 3.141592653589793) * peek(V, 619)) + (peek(V, 538) * peek(M, trunc(peek(V, 217) + peek(V, 553) + 0.00001)))));\n                  poke(V, t459, 620);\n                  t460 = trunc(peek(V, 217) + peek(V, 553) + 0.00001);\n                  t461 = peek(V, 620);\n                  poke(M, t461, t460);\n                  t462 = (sin((((2 * 3.141592653589793) * peek(V, 609)) + (peek(V, 536) * peek(V, 620)))) * peek(M, trunc(peek(V, 217) + (peek(V, 553) + 32) + 0.00001)));\n                  poke(V, t462, 614);\n                  t463 = (peek(V, 614) * peek(M, trunc(peek(V, 220) + peek(V, 553) + 0.00001)));\n                  t464 = (peek(V, 606) + t463);\n                  poke(V, t464, 606);\n                  t465 = (peek(V, 614) * peek(M, trunc(peek(V, 221) + peek(V, 553) + 0.00001)));\n                  t466 = (peek(V, 607) + t465);\n                  poke(V, t466, 607);\n                  t467 = (peek(V, 553) + 1);\n                  poke(V, t467, 553);\n                }\n              }\n              else {\n                if ((abs((abs(peek(V, 0) - 5) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n                  t468 = min(1048576, trunc(peek(V, 363)));\n                  for (t469 = 0; t469 < t468; t469 += 1) {\n                    t470 = peek(M, trunc(peek(V, 218) + peek(V, 553) + 0.00001));\n                    poke(V, t470, 608);\n                    t471 = (peek(M, trunc(peek(V, 215) + peek(V, 553) + 0.00001)) + peek(V, 608));\n                    poke(V, t471, 609);\n                    t472 = peek(M, trunc(peek(V, 219) + peek(V, 553) + 0.00001));\n                    poke(V, t472, 621);\n                    t473 = (peek(M, trunc(peek(V, 216) + peek(V, 553) + 0.00001)) + peek(V, 621));\n                    poke(V, t473, 619);\n                    if ((abs((peek(V, 609) >= 1 ? 1 : 0)) >= 0.00001)) {\n                      t474 = (peek(V, 609) - 1);\n                      poke(V, t474, 609);\n                      t475 = (peek(V, 609) * (peek(V, 621) / peek(V, 608)));\n                      poke(V, t475, 619);\n                    }\n                    else {\n                      if ((abs((peek(V, 619) >= 1 ? 1 : 0)) >= 0.00001)) {\n                        t476 = floor(peek(V, 619));\n                        t477 = (peek(V, 619) - t476);\n                        poke(V, t477, 619);\n                      }\n                    }\n                    t478 = trunc(peek(V, 215) + peek(V, 553) + 0.00001);\n                    t479 = peek(V, 609);\n                    poke(M, t479, t478);\n                    t480 = trunc(peek(V, 216) + peek(V, 553) + 0.00001);\n                    t481 = peek(V, 619);\n                    poke(M, t481, t480);\n                    t482 = ((peek(V, 619) + peek(V, 619)) - 1);\n                    poke(V, t482, 614);\n                    if ((abs((peek(V, 540) > 0 ? 1 : 0)) >= 0.00001)) {\n                      t483 = ((((abs((peek(V, 619) < 0.5 ? 1 : 0)) >= 0.00001) ? 1 : (-1)) - peek(V, 614)) * peek(V, 540));\n                      t484 = (peek(V, 614) + t483);\n                      poke(V, t484, 614);\n                    }\n                    t485 = peek(V, 541);\n                    t486 = ((peek(V, 609) + peek(V, 609)) - 1);\n                    t487 = f_blep(V, M, mq, peek(V, 609), peek(V, 608));\n                    t488 = (t485 * (t486 - t487));\n                    t489 = (peek(V, 614) + t488);\n                    poke(V, t489, 614);\n                    t490 = (peek(M, trunc(peek(V, 217) + (peek(V, 553) + 32) + 0.00001)) * 0.8);\n                    t491 = (peek(V, 614) * t490);\n                    poke(V, t491, 614);\n                    t492 = (peek(V, 614) * peek(M, trunc(peek(V, 220) + peek(V, 553) + 0.00001)));\n                    t493 = (peek(V, 606) + t492);\n                    poke(V, t493, 606);\n                    t494 = (peek(V, 614) * peek(M, trunc(peek(V, 221) + peek(V, 553) + 0.00001)));\n                    t495 = (peek(V, 607) + t494);\n                    poke(V, t495, 607);\n                    t496 = (peek(V, 553) + 1);\n                    poke(V, t496, 553);\n                  }\n                }\n                else {\n                  if ((abs((abs(peek(V, 0) - 6) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n                    t497 = min(1048576, trunc(peek(V, 363)));\n                    for (t498 = 0; t498 < t497; t498 += 1) {\n                      t499 = peek(M, trunc(peek(V, 218) + peek(V, 553) + 0.00001));\n                      poke(V, t499, 608);\n                      t500 = (peek(M, trunc(peek(V, 215) + peek(V, 553) + 0.00001)) + peek(V, 608));\n                      poke(V, t500, 609);\n                      if ((abs((peek(V, 609) >= 1 ? 1 : 0)) >= 0.00001)) {\n                        t501 = (peek(V, 609) - 1);\n                        poke(V, t501, 609);\n                      }\n                      t502 = trunc(peek(V, 215) + peek(V, 553) + 0.00001);\n                      t503 = peek(V, 609);\n                      poke(M, t503, t502);\n                      t504 = ((peek(V, 609) + peek(V, 609)) - 1);\n                      t505 = f_blep(V, M, mq, peek(V, 609), peek(V, 608));\n                      t506 = ((t504 - t505) * peek(M, trunc(peek(V, 217) + (peek(V, 553) + 32) + 0.00001)));\n                      poke(V, t506, 614);\n                      t507 = (peek(V, 614) * peek(M, trunc(peek(V, 220) + peek(V, 553) + 0.00001)));\n                      t508 = (peek(V, 606) + t507);\n                      poke(V, t508, 606);\n                      t509 = (peek(V, 614) * peek(M, trunc(peek(V, 221) + peek(V, 553) + 0.00001)));\n                      t510 = (peek(V, 607) + t509);\n                      poke(V, t510, 607);\n                      t511 = (peek(V, 553) + 1);\n                      poke(V, t511, 553);\n                    }\n                  }\n                  else {\n                    t512 = min(1048576, trunc(peek(V, 363)));\n                    for (t513 = 0; t513 < t512; t513 += 1) {\n                      t514 = (peek(M, trunc(peek(V, 215) + peek(V, 553) + 0.00001)) + peek(M, trunc(peek(V, 218) + peek(V, 553) + 0.00001)));\n                      poke(V, t514, 609);\n                      if ((abs((peek(V, 609) >= 1 ? 1 : 0)) >= 0.00001)) {\n                        t515 = (peek(V, 609) - 1);\n                        poke(V, t515, 609);\n                      }\n                      t516 = trunc(peek(V, 215) + peek(V, 553) + 0.00001);\n                      t517 = peek(V, 609);\n                      poke(M, t517, t516);\n                      t518 = (peek(M, trunc(peek(V, 216) + peek(V, 553) + 0.00001)) + peek(M, trunc(peek(V, 219) + peek(V, 553) + 0.00001)));\n                      poke(V, t518, 619);\n                      if ((abs((peek(V, 619) >= 1 ? 1 : 0)) >= 0.00001)) {\n                        t519 = (peek(V, 619) - 1);\n                        poke(V, t519, 619);\n                      }\n                      t520 = trunc(peek(V, 216) + peek(V, 553) + 0.00001);\n                      t521 = peek(V, 619);\n                      poke(M, t521, t520);\n                      t522 = ((sin(((2 * 3.141592653589793) * peek(V, 609))) * peek(V, 550)) * (1 + (peek(V, 551) * sin(((2 * 3.141592653589793) * peek(V, 619))))));\n                      poke(V, t522, 614);\n                      t523 = (sin(((peek(V, 614) + peek(V, 552)) * 1.5707963)) * peek(M, trunc(peek(V, 217) + (peek(V, 553) + 32) + 0.00001)));\n                      poke(V, t523, 614);\n                      t524 = (peek(V, 614) * peek(M, trunc(peek(V, 220) + peek(V, 553) + 0.00001)));\n                      t525 = (peek(V, 606) + t524);\n                      poke(V, t525, 606);\n                      t526 = (peek(V, 614) * peek(M, trunc(peek(V, 221) + peek(V, 553) + 0.00001)));\n                      t527 = (peek(V, 607) + t526);\n                      poke(V, t527, 607);\n                      t528 = (peek(V, 553) + 1);\n                      poke(V, t528, 553);\n                    }\n                  }\n                }\n              }\n            }\n          }\n        }\n      }\n      t529 = peek(V, 560);\n      t530 = (peek(V, 606) * t529);\n      poke(V, t530, 606);\n      t531 = peek(V, 560);\n      t532 = (peek(V, 607) * t531);\n      poke(V, t532, 607);\n      if ((abs((abs(peek(V, 0) - 6) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n        t533 = f_eng_phaser(V, M, mq, peek(V, 606), peek(V, 236), peek(V, 548));\n        poke(V, t533, 606);\n        t534 = f_eng_phaser(V, M, mq, peek(V, 607), peek(V, 237), peek(V, 549));\n        poke(V, t534, 607);\n      }\n      if ((abs(peek(V, 582)) >= 0.00001)) {\n        poke(V, peek(V, 205) * 16807 - 2147483647 * floor(peek(V, 205) * 16807 / 2147483647), 205);\n        t535 = ((peek(V, 205) / 2147483647 * 2) - 1);\n        poke(V, t535, 625);\n        t536 = ((peek(V, 625) - peek(V, 626)) * peek(V, 386));\n        t537 = (peek(V, 626) + t536);\n        poke(V, t537, 626);\n        t538 = (((abs(peek(V, 385)) >= 0.00001) ? peek(V, 626) : (peek(V, 625) - peek(V, 626))) * peek(V, 583));\n        t539 = (peek(V, 606) + t538);\n        poke(V, t539, 606);\n        poke(V, peek(V, 205) * 16807 - 2147483647 * floor(peek(V, 205) * 16807 / 2147483647), 205);\n        t540 = ((peek(V, 205) / 2147483647 * 2) - 1);\n        poke(V, t540, 625);\n        t541 = ((peek(V, 625) - peek(V, 627)) * peek(V, 386));\n        t542 = (peek(V, 627) + t541);\n        poke(V, t542, 627);\n        t543 = (((abs(peek(V, 385)) >= 0.00001) ? peek(V, 627) : (peek(V, 625) - peek(V, 627))) * peek(V, 583));\n        t544 = (peek(V, 607) + t543);\n        poke(V, t544, 607);\n      }\n      if ((abs((((abs(peek(V, 580)) >= 0.00001) && (abs((abs(peek(V, 50) - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) ? 1 : 0)) >= 0.00001)) {\n        t545 = f_dist__dsl(V, M, mq, peek(V, 606));\n        poke(V, t545, 606);\n        t546 = f_dist__dsr(V, M, mq, peek(V, 607));\n        poke(V, t546, 607);\n      }\n      if ((abs((peek(V, 20) < 5 ? 1 : 0)) >= 0.00001)) {\n        t547 = f_filt__fl(V, M, mq, peek(V, 606));\n        poke(V, t547, 606);\n        t548 = f_filt__fr(V, M, mq, peek(V, 607));\n        poke(V, t548, 607);\n      }\n      if ((abs((((abs(peek(V, 580)) >= 0.00001) && (abs((abs(peek(V, 50) - 0) < 0.00001 ? 1 : 0)) >= 0.00001)) ? 1 : 0)) >= 0.00001)) {\n        t549 = f_dist__dsl(V, M, mq, peek(V, 606));\n        poke(V, t549, 606);\n        t550 = f_dist__dsr(V, M, mq, peek(V, 607));\n        poke(V, t550, 607);\n      }\n      if ((abs((abs(peek(V, 331) - 2) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n        t551 = f_dec2__decl(V, M, mq, peek(V, 606));\n        poke(V, t551, 606);\n        t552 = f_dec2__decr(V, M, mq, peek(V, 607));\n        poke(V, t552, 607);\n      }\n      else {\n        if ((abs((abs(peek(V, 331) - 4) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n          t553 = f_dec4__decl(V, M, mq, peek(V, 606));\n          poke(V, t553, 606);\n          t554 = f_dec4__decr(V, M, mq, peek(V, 607));\n          poke(V, t554, 607);\n        }\n      }\n    }\n  }\n  else {\n    poke(V, 0, 607);\n    poke(V, 0, 606);\n  }\n  t555 = ((peek(V, 606) - peek(V, 605)) + (peek(V, 330) * peek(V, 604)));\n  poke(V, t555, 604);\n  t556 = peek(V, 606);\n  poke(V, t556, 605);\n  t557 = ((peek(V, 607) - peek(V, 603)) + (peek(V, 330) * peek(V, 602)));\n  poke(V, t557, 602);\n  t558 = peek(V, 607);\n  poke(V, t558, 603);\n  t559 = (((1 - ((peek(V, 77) * 0.01) * (1 - peek(V, 270)))) - peek(V, 278)) * peek(V, 329));\n  t560 = (peek(V, 278) + t559);\n  poke(V, t560, 278);\n  t561 = (peek(V, 501) * peek(V, 278));\n  t562 = f_clamp(V, M, mq, (1 + peek(M, trunc(peek(V, 229) + 19 + 0.00001))), 0, 2);\n  t563 = (t561 * t562);\n  poke(V, t563, 641);\n  t564 = (peek(V, 604) * peek(V, 641));\n  poke(V, t564, 642);\n  t565 = (peek(V, 602) * peek(V, 641));\n  poke(V, t565, 643);\n  t566 = (peek(V, 59) * 0.01);\n  poke(V, t566, 644);\n  if ((abs((peek(V, 644) > 0 ? 1 : 0)) >= 0.00001)) {\n    t567 = f_clamp(V, M, mq, (peek(V, 58) + (peek(M, trunc(peek(V, 229) + 12 + 0.00001)) * 100)), 0, 100);\n    t568 = ((t567 - peek(V, 286)) * peek(V, 328));\n    t569 = (peek(V, 286) + t568);\n    poke(V, t569, 286);\n    t570 = (peek(V, 286) * 0.03999);\n    poke(V, t570, 645);\n    t571 = floor(peek(V, 645));\n    poke(V, t571, 646);\n    t572 = (peek(V, 645) - peek(V, 646));\n    poke(V, t572, 647);\n    t573 = (peek(V, 242) + (peek(V, 646) * 6));\n    poke(V, t573, 646);\n    t574 = (peek(M, trunc(peek(V, 646) + 0.00001)) + ((peek(M, trunc(peek(V, 646) + 6 + 0.00001)) - peek(M, trunc(peek(V, 646) + 0.00001))) * peek(V, 647)));\n    poke(V, t574, 648);\n    t575 = (peek(M, trunc(peek(V, 646) + 1 + 0.00001)) + ((peek(M, trunc(peek(V, 646) + 7 + 0.00001)) - peek(M, trunc(peek(V, 646) + 1 + 0.00001))) * peek(V, 647)));\n    poke(V, t575, 649);\n    t576 = (peek(M, trunc(peek(V, 646) + 2 + 0.00001)) + ((peek(M, trunc(peek(V, 646) + 8 + 0.00001)) - peek(M, trunc(peek(V, 646) + 2 + 0.00001))) * peek(V, 647)));\n    poke(V, t576, 650);\n    t577 = (peek(M, trunc(peek(V, 646) + 3 + 0.00001)) + ((peek(M, trunc(peek(V, 646) + 9 + 0.00001)) - peek(M, trunc(peek(V, 646) + 3 + 0.00001))) * peek(V, 647)));\n    poke(V, t577, 651);\n    t578 = (peek(M, trunc(peek(V, 646) + 4 + 0.00001)) + ((peek(M, trunc(peek(V, 646) + 10 + 0.00001)) - peek(M, trunc(peek(V, 646) + 4 + 0.00001))) * peek(V, 647)));\n    poke(V, t578, 652);\n    t579 = (peek(M, trunc(peek(V, 646) + 5 + 0.00001)) + ((peek(M, trunc(peek(V, 646) + 11 + 0.00001)) - peek(M, trunc(peek(V, 646) + 5 + 0.00001))) * peek(V, 647)));\n    poke(V, t579, 653);\n    t580 = f_svf_set__fo1l(V, M, mq, peek(V, 648), 0.12);\n    t581 = f_svf_same__fo1r(V, M, mq);\n    t582 = f_svf_set__fo2l(V, M, mq, peek(V, 649), 0.1);\n    t583 = f_svf_same__fo2r(V, M, mq);\n    t584 = f_svf_set__fo3l(V, M, mq, peek(V, 650), 0.08);\n    t585 = f_svf_same__fo3r(V, M, mq);\n    t586 = f_svf__fo1l(V, M, mq, peek(V, 642));\n    t587 = f_svf__fo2l(V, M, mq, peek(V, 642));\n    t588 = f_svf__fo3l(V, M, mq, peek(V, 642));\n    t589 = f_svf__fo1r(V, M, mq, peek(V, 643));\n    t590 = f_svf__fo2r(V, M, mq, peek(V, 643));\n    t591 = f_svf__fo3r(V, M, mq, peek(V, 643));\n    t592 = (((((peek(V, 684) * 0.12) * peek(V, 651)) + ((peek(V, 689) * 0.1) * peek(V, 652))) + ((peek(V, 694) * 0.08) * peek(V, 653))) * 3.5);\n    poke(V, t592, 711);\n    t593 = (((((peek(V, 699) * 0.12) * peek(V, 651)) + ((peek(V, 704) * 0.1) * peek(V, 652))) + ((peek(V, 709) * 0.08) * peek(V, 653))) * 3.5);\n    poke(V, t593, 712);\n    t594 = ((peek(V, 711) - peek(V, 642)) * peek(V, 644));\n    t595 = (peek(V, 642) + t594);\n    poke(V, t595, 642);\n    t596 = ((peek(V, 712) - peek(V, 643)) * peek(V, 644));\n    t597 = (peek(V, 643) + t596);\n    poke(V, t597, 643);\n  }\n  if ((abs((peek(V, 63) > 0 ? 1 : 0)) >= 0.00001)) {\n    t598 = peek(V, 515);\n    t599 = f_clamp(V, M, mq, (peek(V, 62) * pow(2, (peek(M, trunc(peek(V, 229) + 14 + 0.00001)) * 3))), 0.05, 32);\n    t600 = ((t598 * t599) * peek(V, 325));\n    t601 = (peek(V, 713) + t600);\n    poke(V, t601, 713);\n    t602 = floor(peek(V, 713));\n    t603 = (peek(V, 713) - t602);\n    poke(V, t603, 713);\n    t604 = sin(((2 * 3.141592653589793) * peek(V, 713)));\n    poke(V, t604, 714);\n    t605 = ((((peek(V, 642) * peek(V, 714)) - peek(V, 642)) * peek(V, 63)) * 0.01);\n    t606 = (peek(V, 642) + t605);\n    poke(V, t606, 642);\n    t607 = ((((peek(V, 643) * peek(V, 714)) - peek(V, 643)) * peek(V, 63)) * 0.01);\n    t608 = (peek(V, 643) + t607);\n    poke(V, t608, 643);\n  }\n  if ((abs((peek(V, 61) > 0 ? 1 : 0)) >= 0.00001)) {\n    t609 = f_clamp(V, M, mq, (peek(V, 60) + (peek(M, trunc(peek(V, 229) + 13 + 0.00001)) * 1000)), (-2000), 2000);\n    t610 = ((t609 - peek(V, 287)) * peek(V, 328));\n    t611 = (peek(V, 287) + t610);\n    poke(V, t611, 287);\n    t612 = (peek(V, 287) * peek(V, 325));\n    t613 = (peek(V, 715) + t612);\n    poke(V, t613, 715);\n    t614 = floor(peek(V, 715));\n    t615 = (peek(V, 715) - t614);\n    poke(V, t615, 715);\n    t616 = cos(((2 * 3.141592653589793) * peek(V, 715)));\n    poke(V, t616, 716);\n    t617 = sin(((2 * 3.141592653589793) * peek(V, 715)));\n    poke(V, t617, 717);\n    t618 = f_hilbert(V, M, mq, peek(V, 642), peek(V, 240));\n    poke(V, t618, 722);\n    t619 = ((peek(V, 722) * peek(V, 716)) - (peek(V, 721) * peek(V, 717)));\n    poke(V, t619, 711);\n    t620 = f_hilbert(V, M, mq, peek(V, 643), peek(V, 241));\n    poke(V, t620, 722);\n    t621 = ((peek(V, 722) * peek(V, 716)) - (peek(V, 721) * peek(V, 717)));\n    poke(V, t621, 712);\n    t622 = (((peek(V, 711) - peek(V, 642)) * peek(V, 61)) * 0.01);\n    t623 = (peek(V, 642) + t622);\n    poke(V, t623, 642);\n    t624 = (((peek(V, 712) - peek(V, 643)) * peek(V, 61)) * 0.01);\n    t625 = (peek(V, 643) + t624);\n    poke(V, t625, 643);\n  }\n  if ((abs((((abs((((abs(peek(V, 462)) >= 0.00001) || (abs((abs(peek(M, trunc(peek(V, 229) + 15 + 0.00001)) - 0) < 0.00001 ? 0 : 1)) >= 0.00001)) ? 1 : 0)) >= 0.00001) && (abs((peek(V, 66) > 0 ? 1 : 0)) >= 0.00001)) ? 1 : 0)) >= 0.00001)) {\n    t626 = f_clamp(V, M, mq, (peek(V, 64) - (peek(M, trunc(peek(V, 229) + 15 + 0.00001)) * 14)), 1, 16);\n    poke(V, t626, 723);\n    t627 = pow(2, (peek(V, 723) - 1));\n    poke(V, t627, 724);\n    t628 = (peek(V, 725) + 1);\n    poke(V, t628, 725);\n    if ((abs((peek(V, 725) >= peek(V, 65) ? 1 : 0)) >= 0.00001)) {\n      t629 = peek(V, 65);\n      t630 = (peek(V, 725) - t629);\n      poke(V, t630, 725);\n      t631 = (floor(((peek(V, 642) * peek(V, 724)) + 0.5)) / peek(V, 724));\n      poke(V, t631, 726);\n      t632 = (floor(((peek(V, 643) * peek(V, 724)) + 0.5)) / peek(V, 724));\n      poke(V, t632, 727);\n    }\n    t633 = (((peek(V, 726) - peek(V, 642)) * peek(V, 66)) * 0.01);\n    t634 = (peek(V, 642) + t633);\n    poke(V, t634, 642);\n    t635 = (((peek(V, 727) - peek(V, 643)) * peek(V, 66)) * 0.01);\n    t636 = (peek(V, 643) + t635);\n    poke(V, t636, 643);\n  }\n  t637 = ((peek(V, 477) / peek(M, trunc(peek(V, 233) + peek(V, 54) + 0.00001))) * peek(V, 325));\n  t638 = (peek(V, 481) + t637);\n  poke(V, t638, 481);\n  t639 = floor(peek(V, 481));\n  t640 = (peek(V, 481) - t639);\n  poke(V, t640, 481);\n  if ((abs((peek(V, 51) > 0 ? 1 : 0)) >= 0.00001)) {\n    t641 = ((peek(V, 461) - peek(V, 285)) * peek(V, 328));\n    t642 = (peek(V, 285) + t641);\n    poke(V, t642, 285);\n    t643 = f_clamp(V, M, mq, (peek(V, 57) + (peek(M, trunc(peek(V, 229) + 11 + 0.00001)) * 100)), 0, 100);\n    t644 = (t643 * 0.01);\n    poke(V, t644, 728);\n    t645 = f_tri(V, M, mq, peek(V, 481));\n    poke(V, t645, 729);\n    t646 = f_frac(V, M, mq, (peek(V, 481) + (peek(V, 56) * 0.005)));\n    t647 = f_tri(V, M, mq, t646);\n    poke(V, t647, 730);\n    t648 = pow(2, ((peek(V, 285) + ((peek(V, 729) * peek(V, 53)) * 0.02)) + (peek(M, trunc(peek(V, 229) + 10 + 0.00001)) * 5)));\n    poke(V, t648, 731);\n    t649 = pow(2, ((peek(V, 285) + ((peek(V, 730) * peek(V, 53)) * 0.02)) + (peek(M, trunc(peek(V, 229) + 10 + 0.00001)) * 5)));\n    poke(V, t649, 732);\n    if ((abs((abs(peek(V, 51) - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      t650 = (2 - (peek(V, 55) * 0.019));\n      poke(V, t650, 733);\n      t651 = f_svf_set__mn1l(V, M, mq, peek(V, 731), peek(V, 733));\n      t652 = f_svf_set__mn2l(V, M, mq, (peek(V, 731) * 2), peek(V, 733));\n      t653 = f_svf_set__mn1r(V, M, mq, peek(V, 732), peek(V, 733));\n      t654 = f_svf_set__mn2r(V, M, mq, (peek(V, 732) * 2), peek(V, 733));\n      t655 = f_svf__mn1l(V, M, mq, peek(V, 642));\n      t656 = (peek(V, 752) + peek(V, 754));\n      poke(V, t656, 711);\n      t657 = f_svf__mn2l(V, M, mq, peek(V, 711));\n      t658 = (peek(V, 757) + peek(V, 759));\n      poke(V, t658, 711);\n      t659 = f_svf__mn1r(V, M, mq, peek(V, 643));\n      t660 = (peek(V, 762) + peek(V, 764));\n      poke(V, t660, 712);\n      t661 = f_svf__mn2r(V, M, mq, peek(V, 712));\n      t662 = (peek(V, 767) + peek(V, 769));\n      poke(V, t662, 712);\n    }\n    else {\n      if ((abs((abs(peek(V, 51) - 2) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n        t663 = f_clamp(V, M, mq, peek(V, 731), 20, (peek(V, 206) * 0.45));\n        t664 = tan(((3.141592653589793 * t663) * peek(V, 325)));\n        poke(V, t664, 544);\n        t665 = ((peek(V, 544) - 1) / (peek(V, 544) + 1));\n        poke(V, t665, 770);\n        t666 = f_clamp(V, M, mq, peek(V, 732), 20, (peek(V, 206) * 0.45));\n        t667 = tan(((3.141592653589793 * t666) * peek(V, 325)));\n        poke(V, t667, 545);\n        t668 = ((peek(V, 545) - 1) / (peek(V, 545) + 1));\n        poke(V, t668, 771);\n        t669 = (peek(V, 55) * 0.0085);\n        poke(V, t669, 772);\n        t670 = (peek(V, 642) + (peek(V, 773) * peek(V, 772)));\n        poke(V, t670, 711);\n        t671 = (peek(V, 643) + (peek(V, 774) * peek(V, 772)));\n        poke(V, t671, 712);\n        poke(V, 0, 775);\n        t672 = min(1048576, trunc(6));\n        for (t673 = 0; t673 < t672; t673 += 1) {\n          t674 = ((peek(V, 770) * peek(V, 711)) + peek(M, trunc(peek(V, 238) + peek(V, 775) + 0.00001)));\n          poke(V, t674, 776);\n          t675 = trunc(peek(V, 238) + peek(V, 775) + 0.00001);\n          t676 = (peek(V, 711) - (peek(V, 770) * peek(V, 776)));\n          poke(M, t676, t675);\n          t677 = peek(V, 776);\n          poke(V, t677, 711);\n          t678 = ((peek(V, 771) * peek(V, 712)) + peek(M, trunc(peek(V, 239) + peek(V, 775) + 0.00001)));\n          poke(V, t678, 776);\n          t679 = trunc(peek(V, 239) + peek(V, 775) + 0.00001);\n          t680 = (peek(V, 712) - (peek(V, 771) * peek(V, 776)));\n          poke(M, t680, t679);\n          t681 = peek(V, 776);\n          poke(V, t681, 712);\n          t682 = (peek(V, 775) + 1);\n          poke(V, t682, 775);\n        }\n        t683 = peek(V, 711);\n        poke(V, t683, 773);\n        t684 = peek(V, 712);\n        poke(V, t684, 774);\n        t685 = (0.5 * (peek(V, 642) + peek(V, 711)));\n        poke(V, t685, 711);\n        t686 = (0.5 * (peek(V, 643) + peek(V, 712)));\n        poke(V, t686, 712);\n      }\n      else {\n        t687 = (peek(V, 55) * 0.0092);\n        poke(V, t687, 772);\n        t688 = f_clamp(V, M, mq, (peek(V, 206) / peek(V, 731)), 2, (peek(V, 252) - 4));\n        poke(V, t688, 777);\n        t689 = f_clamp(V, M, mq, (peek(V, 206) / peek(V, 732)), 2, (peek(V, 252) - 4));\n        poke(V, t689, 778);\n        t690 = f_dread(V, M, mq, peek(V, 250), peek(V, 252), peek(V, 782), peek(V, 777));\n        poke(V, t690, 544);\n        t691 = f_dread(V, M, mq, peek(V, 251), peek(V, 252), peek(V, 782), peek(V, 778));\n        poke(V, t691, 545);\n        t692 = trunc(peek(V, 250) + peek(V, 782) + 0.00001);\n        t693 = (peek(V, 642) + (peek(V, 544) * peek(V, 772)));\n        poke(M, t693, t692);\n        t694 = trunc(peek(V, 251) + peek(V, 782) + 0.00001);\n        t695 = (peek(V, 643) + (peek(V, 545) * peek(V, 772)));\n        poke(M, t695, t694);\n        t696 = (peek(V, 782) + 1);\n        poke(V, t696, 782);\n        if ((abs((peek(V, 782) >= peek(V, 252) ? 1 : 0)) >= 0.00001)) {\n          poke(V, 0, 782);\n        }\n        t697 = (0.5 * (peek(V, 642) + peek(V, 544)));\n        poke(V, t697, 711);\n        t698 = (0.5 * (peek(V, 643) + peek(V, 545)));\n        poke(V, t698, 712);\n      }\n    }\n    t699 = ((peek(V, 711) - peek(V, 642)) * peek(V, 728));\n    t700 = (peek(V, 642) + t699);\n    poke(V, t700, 642);\n    t701 = ((peek(V, 712) - peek(V, 643)) * peek(V, 728));\n    t702 = (peek(V, 643) + t701);\n    poke(V, t702, 643);\n  }\n  if ((abs((peek(V, 67) > 0 ? 1 : 0)) >= 0.00001)) {\n    t703 = f_svf__sq_l1(V, M, mq, peek(V, 642));\n    t704 = f_svf__sq_l2(V, M, mq, peek(V, 785));\n    t705 = peek(V, 790);\n    poke(V, t705, 793);\n    t706 = (peek(V, 642) - peek(V, 793));\n    poke(V, t706, 794);\n    t707 = f_svf__sq_r1(V, M, mq, peek(V, 643));\n    t708 = f_svf__sq_r2(V, M, mq, peek(V, 797));\n    t709 = peek(V, 802);\n    poke(V, t709, 805);\n    t710 = (peek(V, 643) - peek(V, 805));\n    poke(V, t710, 806);\n    t711 = f_svf__sq_m1(V, M, mq, peek(V, 794));\n    t712 = f_svf__sq_m2(V, M, mq, peek(V, 809));\n    t713 = peek(V, 814);\n    poke(V, t713, 817);\n    t714 = (peek(V, 794) - peek(V, 817));\n    poke(V, t714, 818);\n    t715 = f_svf__sq_m3(V, M, mq, peek(V, 806));\n    t716 = f_svf__sq_m4(V, M, mq, peek(V, 821));\n    t717 = peek(V, 826);\n    poke(V, t717, 829);\n    t718 = (peek(V, 806) - peek(V, 829));\n    poke(V, t718, 830);\n    t719 = max(abs(peek(V, 793)), abs(peek(V, 805)));\n    poke(V, t719, 831);\n    t720 = ((peek(V, 831) - peek(V, 832)) * ((abs((peek(V, 831) > peek(V, 832) ? 1 : 0)) >= 0.00001) ? peek(V, 457) : peek(V, 458)));\n    t721 = (peek(V, 832) + t720);\n    poke(V, t721, 832);\n    t722 = max(abs(peek(V, 817)), abs(peek(V, 829)));\n    poke(V, t722, 831);\n    t723 = ((peek(V, 831) - peek(V, 833)) * ((abs((peek(V, 831) > peek(V, 833) ? 1 : 0)) >= 0.00001) ? peek(V, 457) : peek(V, 458)));\n    t724 = (peek(V, 833) + t723);\n    poke(V, t724, 833);\n    t725 = max(abs(peek(V, 818)), abs(peek(V, 830)));\n    poke(V, t725, 831);\n    t726 = ((peek(V, 831) - peek(V, 834)) * ((abs((peek(V, 831) > peek(V, 834) ? 1 : 0)) >= 0.00001) ? peek(V, 457) : peek(V, 458)));\n    t727 = (peek(V, 834) + t726);\n    poke(V, t727, 834);\n    t728 = (peek(V, 67) * 0.007);\n    poke(V, t728, 835);\n    t729 = f_clamp(V, M, mq, pow((0.3 / (peek(V, 832) + 0.0001)), peek(V, 835)), 0.2, 6);\n    poke(V, t729, 836);\n    t730 = f_clamp(V, M, mq, pow((0.2 / (peek(V, 833) + 0.0001)), peek(V, 835)), 0.2, 8);\n    poke(V, t730, 837);\n    t731 = f_clamp(V, M, mq, pow((0.12 / (peek(V, 834) + 0.0001)), peek(V, 835)), 0.2, 10);\n    poke(V, t731, 838);\n    t732 = (((peek(V, 793) * peek(V, 836)) + (peek(V, 817) * peek(V, 837))) + (peek(V, 818) * peek(V, 838)));\n    poke(V, t732, 642);\n    t733 = (((peek(V, 805) * peek(V, 836)) + (peek(V, 829) * peek(V, 837))) + (peek(V, 830) * peek(V, 838)));\n    poke(V, t733, 643);\n  }\n  if ((abs((peek(V, 19) > 0 ? 1 : 0)) >= 0.00001)) {\n    t734 = f_svf__lc1(V, M, mq, peek(V, 642));\n    t735 = f_svf__lc2(V, M, mq, peek(V, 843));\n    t736 = peek(V, 848);\n    poke(V, t736, 642);\n    t737 = f_svf__lc3(V, M, mq, peek(V, 643));\n    t738 = f_svf__lc4(V, M, mq, peek(V, 853));\n    t739 = peek(V, 858);\n    poke(V, t739, 643);\n  }\n  if ((abs((peek(V, 68) > 0 ? 1 : 0)) >= 0.00001)) {\n    t740 = (peek(V, 69) * peek(V, 325));\n    t741 = (peek(V, 859) + t740);\n    poke(V, t741, 859);\n    t742 = floor(peek(V, 859));\n    t743 = (peek(V, 859) - t742);\n    poke(V, t743, 859);\n    t744 = trunc(peek(V, 247) + peek(V, 860) + 0.00001);\n    t745 = peek(V, 642);\n    poke(M, t745, t744);\n    t746 = trunc(peek(V, 248) + peek(V, 860) + 0.00001);\n    t747 = peek(V, 643);\n    poke(M, t747, t746);\n    t748 = (((8 + ((peek(V, 70) * 0.04) * (1 + sin(((2 * 3.141592653589793) * peek(V, 859)))))) * 0.001) * peek(V, 206));\n    poke(V, t748, 861);\n    t749 = (((8 + ((peek(V, 70) * 0.04) * (1 + cos(((2 * 3.141592653589793) * peek(V, 859)))))) * 0.001) * peek(V, 206));\n    poke(V, t749, 862);\n    t750 = f_dread(V, M, mq, peek(V, 247), peek(V, 249), peek(V, 860), peek(V, 861));\n    poke(V, t750, 711);\n    t751 = f_dread(V, M, mq, peek(V, 248), peek(V, 249), peek(V, 860), peek(V, 862));\n    poke(V, t751, 712);\n    t752 = (peek(V, 860) + 1);\n    poke(V, t752, 860);\n    if ((abs((peek(V, 860) >= peek(V, 249) ? 1 : 0)) >= 0.00001)) {\n      poke(V, 0, 860);\n    }\n    t753 = (peek(V, 68) * 0.01);\n    poke(V, t753, 863);\n    t754 = ((peek(V, 642) * (1 - (peek(V, 863) * 0.35))) + ((peek(V, 712) * peek(V, 863)) * 0.75));\n    poke(V, t754, 642);\n    t755 = ((peek(V, 643) * (1 - (peek(V, 863) * 0.35))) + ((peek(V, 711) * peek(V, 863)) * 0.75));\n    poke(V, t755, 643);\n  }\n  t756 = f_clamp(V, M, mq, (peek(V, 71) + (peek(M, trunc(peek(V, 229) + 18 + 0.00001)) * 200)), 0, 200);\n  t757 = (t756 * 0.01);\n  poke(V, t757, 864);\n  if ((abs((abs(peek(V, 864) - 1) < 0.00001 ? 0 : 1)) >= 0.00001)) {\n    t758 = ((peek(V, 642) + peek(V, 643)) * 0.5);\n    poke(V, t758, 865);\n    t759 = (((peek(V, 642) - peek(V, 643)) * 0.5) * peek(V, 864));\n    poke(V, t759, 866);\n    t760 = (peek(V, 865) + peek(V, 866));\n    poke(V, t760, 642);\n    t761 = (peek(V, 865) - peek(V, 866));\n    poke(V, t761, 643);\n  }\n  if ((abs((peek(V, 72) > 0 ? 1 : 0)) >= 0.00001)) {\n    t762 = f_svf__mb1(V, M, mq, peek(V, 642));\n    t763 = f_svf__mb2(V, M, mq, peek(V, 869));\n    t764 = peek(V, 874);\n    poke(V, t764, 877);\n    t765 = f_svf__mb3(V, M, mq, peek(V, 643));\n    t766 = f_svf__mb4(V, M, mq, peek(V, 880));\n    t767 = peek(V, 885);\n    poke(V, t767, 888);\n    t768 = ((peek(V, 877) + peek(V, 888)) * 0.5);\n    poke(V, t768, 889);\n    t769 = (peek(V, 889) - peek(V, 877));\n    t770 = (peek(V, 642) + t769);\n    poke(V, t770, 642);\n    t771 = (peek(V, 889) - peek(V, 888));\n    t772 = (peek(V, 643) + t771);\n    poke(V, t772, 643);\n  }\n  t773 = f_clamp(V, M, mq, (peek(V, 14) + (peek(M, trunc(peek(V, 229) + 21 + 0.00001)) * 100)), 0, 100);\n  poke(V, t773, 890);\n  if ((abs((((abs((peek(V, 890) > 0 ? 1 : 0)) >= 0.00001) && (abs(peek(V, 584)) >= 0.00001)) ? 1 : 0)) >= 0.00001)) {\n    t774 = ((peek(V, 515) * pow(2, (-peek(V, 16)))) * peek(V, 325));\n    poke(V, t774, 891);\n    t775 = peek(V, 891);\n    t776 = (peek(V, 497) + t775);\n    poke(V, t776, 497);\n    if ((abs((peek(V, 497) >= 1 ? 1 : 0)) >= 0.00001)) {\n      t777 = (peek(V, 497) - 1);\n      poke(V, t777, 497);\n    }\n    if ((abs((abs(peek(V, 15) - 0) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n      t778 = sin(((2 * 3.141592653589793) * peek(V, 497)));\n      poke(V, t778, 892);\n    }\n    else {\n      if ((abs((abs(peek(V, 15) - 1) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n        t779 = f_tri(V, M, mq, peek(V, 497));\n        poke(V, t779, 892);\n      }\n      else {\n        if ((abs((abs(peek(V, 15) - 2) < 0.00001 ? 1 : 0)) >= 0.00001)) {\n          t780 = f_pulse(V, M, mq, peek(V, 497), peek(V, 891), 0.5);\n          t781 = (t780 * 0.6);\n          poke(V, t781, 892);\n        }\n        else {\n          t782 = f_saw(V, M, mq, peek(V, 497), peek(V, 891));\n          t783 = (t782 * 0.6);\n          poke(V, t783, 892);\n        }\n      }\n    }\n    t784 = (((peek(V, 890) * 0.009) * peek(V, 501)) * peek(V, 278));\n    t785 = f_clamp(V, M, mq, (1 + peek(M, trunc(peek(V, 229) + 19 + 0.00001))), 0, 2);\n    t786 = (t784 * t785);\n    t787 = (peek(V, 892) * t786);\n    poke(V, t787, 892);\n    t788 = peek(V, 892);\n    t789 = (peek(V, 642) + t788);\n    poke(V, t789, 642);\n    t790 = peek(V, 892);\n    t791 = (peek(V, 643) + t790);\n    poke(V, t791, 643);\n  }\n  t792 = f_clamp(V, M, mq, peek(M, trunc(peek(V, 229) + 20 + 0.00001)), (-1), 1);\n  poke(V, t792, 893);\n  if ((abs((abs(peek(V, 893) - 0) < 0.00001 ? 0 : 1)) >= 0.00001)) {\n    t793 = min(1, (1 - peek(V, 893)));\n    t794 = (peek(V, 642) * t793);\n    poke(V, t794, 642);\n    t795 = min(1, (1 + peek(V, 893)));\n    t796 = (peek(V, 643) * t795);\n    poke(V, t796, 643);\n  }\n  t797 = peek(V, 284);\n  t798 = (peek(V, 642) * t797);\n  poke(V, t798, 642);\n  t799 = peek(V, 284);\n  t800 = (peek(V, 643) * t799);\n  poke(V, t800, 643);\n  if ((abs(peek(V, 81)) >= 0.00001)) {\n    if ((abs((abs(peek(V, 642)) < 0.85 ? 1 : 0)) >= 0.00001)) {\n      t801 = peek(V, 642);\n    }\n    else {\n      t802 = ((abs((peek(V, 642) > 0 ? 1 : 0)) >= 0.00001) ? 1 : (-1));\n      t803 = f_sat(V, M, mq, ((abs(peek(V, 642)) - 0.85) / 0.15));\n      t801 = (t802 * (0.85 + (0.15 * t803)));\n    }\n    poke(V, t801, 642);\n    if ((abs((abs(peek(V, 643)) < 0.85 ? 1 : 0)) >= 0.00001)) {\n      t804 = peek(V, 643);\n    }\n    else {\n      t805 = ((abs((peek(V, 643) > 0 ? 1 : 0)) >= 0.00001) ? 1 : (-1));\n      t806 = f_sat(V, M, mq, ((abs(peek(V, 643)) - 0.85) / 0.15));\n      t804 = (t805 * (0.85 + (0.15 * t806)));\n    }\n    poke(V, t804, 643);\n  }\n  t807 = peek(V, 642);\n  poke(V, t807, 482);\n  t808 = peek(V, 643);\n  poke(V, t808, 483);\n  t809 = trunc(peek(V, 253) + peek(V, 290) + 0.00001);\n  t810 = ((peek(V, 642) + peek(V, 643)) * 0.5);\n  poke(M, t810, t809);\n  t811 = (peek(V, 290) + 1);\n  poke(V, t811, 290);\n  if ((abs((peek(V, 290) >= peek(V, 254) ? 1 : 0)) >= 0.00001)) {\n    poke(V, 0, 290);\n  }\n  t812 = max(peek(V, 292), (abs(peek(V, 642)) + abs(peek(V, 643))));\n  poke(V, t812, 292);\n  t813 = (peek(V, 293) + 1);\n  poke(V, t813, 293);\n  if ((abs((peek(V, 293) >= 512 ? 1 : 0)) >= 0.00001)) {\n    t814 = trunc(peek(V, 255) + peek(V, 291) + 0.00001);\n    t815 = (peek(V, 292) * 0.5);\n    poke(M, t815, t814);\n    t816 = (peek(V, 291) + 1);\n    poke(V, t816, 291);\n    if ((abs((peek(V, 291) >= peek(V, 256) ? 1 : 0)) >= 0.00001)) {\n      poke(V, 0, 291);\n    }\n    poke(V, 0, 292);\n    poke(V, 0, 293);\n  }\n  t817 = peek(V, 515);\n  poke(V, t817, 894);\n  t818 = peek(V, 517);\n  poke(V, t818, 895);\n  t819 = peek(V, 561);\n  poke(V, t819, 896);\n  keep = in1 * 0;   // gen~ keeps its left inlet for messages\nout1 = peek(V, 482);\nout2 = peek(V, 483);\n",
         "fontface": 0,
         "fontname": "<Monospaced>",
         "fontsize": 12.0
        }
       },
       {
        "box": {
         "id": "obj-3",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20.0,
          520.0,
          40.0,
          22.0
         ],
         "text": "out 1"
        }
       },
       {
        "box": {
         "id": "obj-4",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          140.0,
          520.0,
          40.0,
          22.0
         ],
         "text": "out 2"
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "source": [
          "obj-1",
          0
         ],
         "destination": [
          "obj-2",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          0
         ],
         "destination": [
          "obj-3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "obj-2",
          1
         ],
         "destination": [
          "obj-4",
          0
         ]
        }
       }
      ]
     }
    }
   },
   {
    "box": {
     "id": "obj-14",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      360.0,
      70.0,
      22.0
     ],
     "text": "plugout~"
    }
   },
   {
    "box": {
     "id": "obj-15",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      420.0,
      300.0,
      160.0,
      22.0
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "buffer~ ---mq @samps 1024"
    }
   },
   {
    "box": {
     "id": "obj-16",
     "maxclass": "message",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      420.0,
      260.0,
      200.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "mqname ---mq"
    }
   },
   {
    "box": {
     "id": "obj-17",
     "maxclass": "message",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      220.0,
      220.0,
      100.0,
      22.0
     ],
     "outlettype": [
      ""
     ],
     "text": "mq ---mq"
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "obj-1",
      0
     ],
     "destination": [
      "obj-3",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      0
     ],
     "destination": [
      "obj-3",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-3",
      0
     ],
     "destination": [
      "obj-4",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-3",
      1
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-5",
      0
     ],
     "destination": [
      "obj-6",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-6",
      0
     ],
     "destination": [
      "obj-3",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-3",
      2
     ],
     "destination": [
      "obj-7",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-8",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      0
     ],
     "destination": [
      "obj-10",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      1
     ],
     "destination": [
      "obj-10",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-10",
      0
     ],
     "destination": [
      "obj-11",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-11",
      0
     ],
     "destination": [
      "obj-12",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-12",
      0
     ],
     "destination": [
      "obj-3",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-13",
      0
     ],
     "destination": [
      "obj-14",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-13",
      1
     ],
     "destination": [
      "obj-14",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-3",
      3
     ],
     "destination": [
      "obj-13",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      0
     ],
     "destination": [
      "obj-16",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-16",
      0
     ],
     "destination": [
      "obj-3",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      0
     ],
     "destination": [
      "obj-17",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-17",
      0
     ],
     "destination": [
      "obj-13",
      0
     ]
    }
   }
  ],
  "parameters": {
   "obj-5": [
    "state",
    "state",
    0
   ],
   "inherited_shortname": 1
  },
  "dependency_cache": [
   {
    "name": "ReeseBasser.js",
    "bootpath": ".",
    "type": "TEXT",
    "implicit": 1
   }
  ],
  "autosave": 0,
  "devicewidth": 260.0,
  "description": "",
  "digest": "",
  "tags": "",
  "style": "",
  "latency": 0,
  "is_mpe": 0
 }
}
