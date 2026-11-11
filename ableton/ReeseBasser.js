/* Reese Basser - built by ableton/kit/build.py from ableton/device.json. Do not edit; edit the sources and rebuild. */
var DEVICE = {"audio": true, "main": "ReeseBasser.jsfx", "title": "Reese Basser"};
DEVICE.files = {"ReeseBasser.jsfx": "desc:Reese Basser \u00e2\u0080\u0094 Reese Bass Synthesizer\ntags:instrument synthesizer bass reese\n//author: Reese Basser\n//version: 1.3\n//\n// A monophonic synthesizer that only makes Reese basses, but makes them well.\n// Eight generation methods (engines), tempo-lockable beating, a Reese-focused\n// filter/drive section and a \"mangle\" rack for creative destruction.\n// Needs REAPER 6.74 or newer (more than 64 parameters + slider shapes).\n//\n// All sliders are hidden (\"-\" prefix) so REAPER shows the custom @gfx UI instead of a\n// 100-row slider list; they remain normal automatable parameters.\n\nin_pin:none\nout_pin:Left\nout_pin:Right\n\n// ---------------------------------------------------------------- ENGINE\nslider1:eng=0<0,7,1{Dual Saw (Classic),Supersaw Unison,PWM,Phase Distortion (CZ),FM Cross-Mod,Hard Sync,Phaser (Filter Reese),Cross-Fold}>-Engine\nslider2:det=30<0,150,0.1>-Detune (cents)\nslider3:detmode=0<0,2,1{Cents (Tracks Pitch),Hz (Constant Beat),Tempo Sync}>-Detune Mode\nslider4:beathz=2<0.05,20,0.01:log>-Beat Rate (Hz)\nslider5:beatdiv=9<0,14,1{4 Bars,2 Bars,1/1,1/2,1/2T,1/4D,1/4,1/4T,1/8D,1/8,1/8T,1/16D,1/16,1/16T,1/32}>-Beat Sync\nslider6:enga=0<0,100,0.1>-Engine A\nslider7:engb=45<0,100,0.1>-Engine B\nslider8:engc=50<0,100,0.1>-Engine C\nslider9:unison=1<1,8,1>-Unison Voices\nslider10:uspread=25<0,100,0.1>-Unison Spread\nslider11:spread=35<0,100,0.1>-Stereo Spread\nslider12:drift=15<0,100,0.1>-Analog Drift\nslider13:phasemode=0<0,2,1{Free Running,Reset,Random}>-Osc Phase\nslider14:osclvl=0<-24,12,0.1>-Osc Level (dB)\n// ---------------------------------------------------------------- SUB / NOISE\nslider15:sublvl=0<0,100,0.1>-Sub Level\nslider16:subwave=0<0,3,1{Sine,Triangle,Square,Saw}>-Sub Wave\nslider17:suboct=1<0,2,1{0,-1,-2}>-Sub Octave\nslider18:noiselvl=0<0,100,0.1>-Noise Level\nslider19:ncolor=50<0,100,0.1>-Noise Color\nslider20:lowcut=0<0,500,1:sqr>-Reese Low Cut (Hz)\n// ---------------------------------------------------------------- FILTER\nslider21:ftype=0<0,5,1{LP 24 Ladder,LP 12,Band Pass,High Pass,Notch,Off}>-Filter Type\nslider22:cutoff=650<20,20000,1:log>-Cutoff (Hz)\nslider23:reso=14<0,100,0.1>-Resonance\nslider24:fdrive=0<0,100,0.1>-Filter Drive\nslider25:fkey=40<0,100,0.1>-Key Track\nslider26:fenv=0<-100,100,0.1>-Filter Env Amount\n// ---------------------------------------------------------------- ENVELOPES\nslider27:aatt=4<0.5,5000,0.1:log>-Amp Attack (ms)\nslider28:adec=300<1,10000,0.1:log>-Amp Decay (ms)\nslider29:asus=100<0,100,0.1>-Amp Sustain\nslider30:arel=120<1,10000,0.1:log>-Amp Release (ms)\nslider31:matt=1<0.5,5000,0.1:log>-Mod Attack (ms)\nslider32:mdec=400<1,10000,0.1:log>-Mod Decay (ms)\nslider33:msus=0<0,100,0.1>-Mod Sustain\nslider34:mrel=200<1,10000,0.1:log>-Mod Release (ms)\n// ---------------------------------------------------------------- LFOs\nslider35:l1shape=1<0,6,1{Sine,Triangle,Saw Up,Saw Down,Square,Sample & Hold,Smooth Random}>-LFO1 Shape\nslider36:l1sync=1<0,1,1{Hz,Tempo}>-LFO1 Sync\nslider37:l1rate=1<0.01,40,0.01:log>-LFO1 Rate (Hz)\nslider38:l1div=9<0,14,1{4 Bars,2 Bars,1/1,1/2,1/2T,1/4D,1/4,1/4T,1/8D,1/8,1/8T,1/16D,1/16,1/16T,1/32}>-LFO1 Division\nslider39:l1trig=0<0,1,1{Free,Retrigger}>-LFO1 Trigger\nslider40:l1fade=0<0,5000,1:sqr>-LFO1 Fade In (ms)\nslider41:l2shape=0<0,6,1{Sine,Triangle,Saw Up,Saw Down,Square,Sample & Hold,Smooth Random}>-LFO2 Shape\nslider42:l2sync=0<0,1,1{Hz,Tempo}>-LFO2 Sync\nslider43:l2rate=0.3<0.01,40,0.01:log>-LFO2 Rate (Hz)\nslider44:l2div=6<0,14,1{4 Bars,2 Bars,1/1,1/2,1/2T,1/4D,1/4,1/4T,1/8D,1/8,1/8T,1/16D,1/16,1/16T,1/32}>-LFO2 Division\nslider45:l2trig=0<0,1,1{Free,Retrigger}>-LFO2 Trigger\nslider46:l2fade=0<0,5000,1:sqr>-LFO2 Fade In (ms)\n// ---------------------------------------------------------------- DISTORTION\nslider47:dtype=0<0,5,1{Tape,Tube,Hard Clip,Wavefold,Rectify,Pedal OD}>-Distortion Type\nslider48:ddrive=0<0,100,0.1>-Distortion Drive\nslider49:dtone=100<0,100,0.1>-Distortion Tone\nslider50:dmix=100<0,100,0.1>-Distortion Mix\nslider51:dpos=0<0,1,1{Post Filter,Pre Filter}>-Distortion Position\n// ---------------------------------------------------------------- MOVEMENT\nslider52:mvtype=0<0,3,1{Off,Notch Sweep,Phaser,Flanger}>-Movement Type\nslider53:mvfreq=600<20,10000,1:log>-Movement Freq (Hz)\nslider54:mvdepth=50<0,100,0.1>-Movement Depth\nslider55:mvrate=6<0,14,1{4 Bars,2 Bars,1/1,1/2,1/2T,1/4D,1/4,1/4T,1/8D,1/8,1/8T,1/16D,1/16,1/16T,1/32}>-Movement Rate\nslider56:mvreso=40<0,100,0.1>-Movement Resonance\nslider57:mvstereo=25<0,100,0.1>-Movement Stereo\nslider58:mvmix=100<0,100,0.1>-Movement Mix\n// ---------------------------------------------------------------- MANGLE\nslider59:vowel=0<0,100,0.1>-Formant Vowel\nslider60:fmix=0<0,100,0.1>-Formant Mix\nslider61:fshift=0<-1000,1000,0.1>-Freq Shift (Hz)\nslider62:shmix=0<0,100,0.1>-Freq Shift Mix\nslider63:ring=1<0.25,8,0.001:log>-Ring Mod Ratio\nslider64:ringmix=0<0,100,0.1>-Ring Mod Mix\nslider65:bits=16<1,16,0.1>-Crush Bits\nslider66:downs=1<1,50,0.01:log>-Downsample\nslider67:cmix=100<0,100,0.1>-Crush Mix\nslider68:squash=0<0,100,0.1>-Squash (Multiband)\n// ---------------------------------------------------------------- STEREO\nslider69:chmix=0<0,100,0.1>-Chorus Mix\nslider70:chrate=0.4<0.05,5,0.01:log>-Chorus Rate (Hz)\nslider71:chdepth=50<0,100,0.1>-Chorus Depth\nslider72:width=100<0,200,0.1>-Width\nslider73:monobass=120<0,400,1>-Mono Bass Below (Hz)\n// ---------------------------------------------------------------- GLOBAL\nslider74:vmode=0<0,1,1{Legato,Retrigger}>-Note Mode\nslider75:glide=80<0,2000,0.1:sqr>-Glide (ms)\nslider76:glidemode=0<0,1,1{Legato Only,Always}>-Glide Mode\nslider77:bendr=2<0,24,1>-Pitch Bend Range\nslider78:velsens=40<0,100,0.1>-Velocity Sensitivity\nslider79:octave=0<-3,2,1>-Octave\nslider80:quality=1<0,2,1{1x (Eco),2x,4x (Best)}>-Oversampling\nslider81:volume=-6<-48,12,0.1>-Output (dB)\nslider82:limiter=1<0,1,1{Off,Soft Clip}>-Output Clipper\n// ---------------------------------------------------------------- MOD MATRIX\nslider83:m1src=1<0,10,1{Off,LFO 1,LFO 2,Mod Env,Amp Env,Velocity,Mod Wheel,Aftertouch,Key Track,Note Random,Beat Phase}>-Mod 1 Source\nslider84:m1dst=0<0,24,1{Off,Cutoff,Resonance,Detune,Pitch,Engine A,Engine B,Engine C,Filter Drive,Dist Drive,Move Freq,Move Mix,Vowel,Freq Shift,Ring Ratio,Crush,Unison Spread,Stereo Spread,Width,Volume,Pan,Sub Level,Noise Level,LFO1 Rate,LFO2 Rate}>-Mod 1 Destination\nslider85:m1amt=0<-100,100,0.1>-Mod 1 Amount\nslider86:m2src=3<0,10,1{Off,LFO 1,LFO 2,Mod Env,Amp Env,Velocity,Mod Wheel,Aftertouch,Key Track,Note Random,Beat Phase}>-Mod 2 Source\nslider87:m2dst=0<0,24,1{Off,Cutoff,Resonance,Detune,Pitch,Engine A,Engine B,Engine C,Filter Drive,Dist Drive,Move Freq,Move Mix,Vowel,Freq Shift,Ring Ratio,Crush,Unison Spread,Stereo Spread,Width,Volume,Pan,Sub Level,Noise Level,LFO1 Rate,LFO2 Rate}>-Mod 2 Destination\nslider88:m2amt=0<-100,100,0.1>-Mod 2 Amount\nslider89:m3src=6<0,10,1{Off,LFO 1,LFO 2,Mod Env,Amp Env,Velocity,Mod Wheel,Aftertouch,Key Track,Note Random,Beat Phase}>-Mod 3 Source\nslider90:m3dst=0<0,24,1{Off,Cutoff,Resonance,Detune,Pitch,Engine A,Engine B,Engine C,Filter Drive,Dist Drive,Move Freq,Move Mix,Vowel,Freq Shift,Ring Ratio,Crush,Unison Spread,Stereo Spread,Width,Volume,Pan,Sub Level,Noise Level,LFO1 Rate,LFO2 Rate}>-Mod 3 Destination\nslider91:m3amt=0<-100,100,0.1>-Mod 3 Amount\nslider92:m4src=2<0,10,1{Off,LFO 1,LFO 2,Mod Env,Amp Env,Velocity,Mod Wheel,Aftertouch,Key Track,Note Random,Beat Phase}>-Mod 4 Source\nslider93:m4dst=0<0,24,1{Off,Cutoff,Resonance,Detune,Pitch,Engine A,Engine B,Engine C,Filter Drive,Dist Drive,Move Freq,Move Mix,Vowel,Freq Shift,Ring Ratio,Crush,Unison Spread,Stereo Spread,Width,Volume,Pan,Sub Level,Noise Level,LFO1 Rate,LFO2 Rate}>-Mod 4 Destination\nslider94:m4amt=0<-100,100,0.1>-Mod 4 Amount\nslider95:m5src=5<0,10,1{Off,LFO 1,LFO 2,Mod Env,Amp Env,Velocity,Mod Wheel,Aftertouch,Key Track,Note Random,Beat Phase}>-Mod 5 Source\nslider96:m5dst=0<0,24,1{Off,Cutoff,Resonance,Detune,Pitch,Engine A,Engine B,Engine C,Filter Drive,Dist Drive,Move Freq,Move Mix,Vowel,Freq Shift,Ring Ratio,Crush,Unison Spread,Stereo Spread,Width,Volume,Pan,Sub Level,Noise Level,LFO1 Rate,LFO2 Rate}>-Mod 5 Destination\nslider97:m5amt=0<-100,100,0.1>-Mod 5 Amount\nslider98:m6src=10<0,10,1{Off,LFO 1,LFO 2,Mod Env,Amp Env,Velocity,Mod Wheel,Aftertouch,Key Track,Note Random,Beat Phase}>-Mod 6 Source\nslider99:m6dst=0<0,24,1{Off,Cutoff,Resonance,Detune,Pitch,Engine A,Engine B,Engine C,Filter Drive,Dist Drive,Move Freq,Move Mix,Vowel,Freq Shift,Ring Ratio,Crush,Unison Spread,Stereo Spread,Width,Volume,Pan,Sub Level,Noise Level,LFO1 Rate,LFO2 Rate}>-Mod 6 Destination\nslider100:m6amt=0<-100,100,0.1>-Mod 6 Amount\n// ---------------------------------------------------------------- VIEW (window preferences, not sound)\n// Saved with the project like any parameter. Not touched by the built-in presets or Mutate.\nslider101:iface_size=0<0,4,1{100%,125%,150%,200%,Fit to Window}>-Interface Size\nslider102:reduce_motion=0<0,1,1{Off,On}>-Reduce Motion\n\n@init\next_noinit = 1;\n\n// ================================================================ memory map\nMQ = 0;            // MIDI queue: 4 values per event\nNOTESTK = 8200;       // held-note stack\nO_PH = 9000; O_PH2 = 9064; O_FB = 9128; O_DT = 9192; O_DT2 = 9256; O_GL = 9320; O_GR = 9384;\nO_DRIFT = 9448; O_DTGT = 9512; O_POSR = 9576; O_UNI = 9640; O_SLOT = 9704; O_PAN = 9768;\nSRC = 10000; MODV = 10032; MSRC = 10060; MDST = 10066; MAMT = 10072; BEATS = 10080; INTV = 10100; FMR = 10110;\nPHS_L = 10400; PHS_R = 10420; MPH_L = 10440; MPH_R = 10450;\nHIL_L = 10500; HIL_R = 10564;\nFORMT = 10700;\nPMIN = 11000; PMAX = 11300; PDEF = 11600; PSHAPE = 11900;\nCHB_L = 20000; CHB_R = 28192; CHB_SIZE = 8192;\nFLB_L = 40000; FLB_R = 56384; FLB_SIZE = 16384;\nSCOPE = 80000; SCOPE_SIZE = 4096;\nTHROB = 90000; THROB_SIZE = 256;\nPSTORE = 100000;   // preset store (UI)\nUIMEM = 120000;    // UI scratch\nFOCUSL = 130000;   // keyboard focus list, 8 slots per control (id, kind, x, y, w, h), 128 controls; @gfx only\nfreembuf(200000);\n\n// ================================================================ tables\n// tempo divisions in beats (quarter notes)\nBEATS[0] = 16; BEATS[1] = 8; BEATS[2] = 4; BEATS[3] = 2; BEATS[4] = 4/3; BEATS[5] = 1.5;\nBEATS[6] = 1; BEATS[7] = 2/3; BEATS[8] = 0.75; BEATS[9] = 0.5; BEATS[10] = 1/3;\nBEATS[11] = 0.375; BEATS[12] = 0.25; BEATS[13] = 1/6; BEATS[14] = 0.125;\n// Dual Saw: osc 2 interval (semitones)\nINTV[0] = -24; INTV[1] = -12; INTV[2] = -5; INTV[3] = 0; INTV[4] = 7; INTV[5] = 12; INTV[6] = 19; INTV[7] = 24;\n// FM ratios\nFMR[0] = 0.5; FMR[1] = 1; FMR[2] = 1.5; FMR[3] = 2; FMR[4] = 3; FMR[5] = 4;\n// Formants (bass voice): f1 f2 f3 g1 g2 g3 for A E I O U\nfunction set6(p, a, b, c, d, e, f) ( p[0] = a; p[1] = b; p[2] = c; p[3] = d; p[4] = e; p[5] = f; );\nset6(FORMT,    800, 1150, 2900, 1, 0.63, 0.12);\nset6(FORMT+6,  400, 1600, 2700, 1, 0.35, 0.25);\nset6(FORMT+12, 270, 2140, 2950, 1, 0.25, 0.2);\nset6(FORMT+18, 450,  800, 2830, 1, 0.45, 0.1);\nset6(FORMT+24, 325,  700, 2530, 1, 0.3, 0.08);\n// Hilbert transformer (Olli Niemitalo) - squared allpass coefficients\nHA1 = 0.6923878^2; HA2 = 0.9360654322959^2; HA3 = 0.9882295226860^2; HA4 = 0.9987488452737^2;\nHB1 = 0.4021921162426^2; HB2 = 0.8561710882420^2; HB3 = 0.9722909545651^2; HB4 = 0.9952884791278^2;\n\n// ================================================================ helpers\nfunction clamp(x, lo, hi) ( x < lo ? lo : x > hi ? hi : x; );\nfunction frac(x) ( x - floor(x); );\nfunction sat(x) ( x > 3 ? 1 : x < -3 ? -1 : x*(27 + x*x)/(27 + 9*x*x); );\nfunction db2g(d) ( exp(d*0.11512925464970228); );\n// polyBLEP residual\nfunction blep(t, dt) (\n  t < dt ? ( t /= dt; t + t - t*t - 1; ) :\n  t > 1 - dt ? ( t = (t - 1)/dt; t*t + t + t + 1; ) : 0;\n);\nfunction saw(ph, dt) ( ph + ph - 1 - blep(ph, dt); );\nfunction pulse(ph, dt, w) local(p2) (\n  p2 = ph - w; p2 < 0 ? p2 += 1;\n  (ph < w ? 1 : -1) + blep(ph, dt) - blep(p2, dt);\n);\nfunction tri(ph) ( 4*abs(ph - 0.5) - 1; );\n// saw -> square -> triangle -> sine\nfunction wave_morph(ph, dt, m) local(a, s, q) (\n  m < 0.3333 ? ( a = m*3; s = saw(ph, dt); q = pulse(ph, dt, 0.5); s + (q - s)*a; ) :\n  m < 0.6667 ? ( a = (m - 0.3333)*3; q = pulse(ph, dt, 0.5); s = tri(ph); q + (s - q)*a; ) :\n  ( a = (m - 0.6667)*3.0003; s = tri(ph); q = -cos(2*$pi*ph); s + (q - s)*a; );\n);\n// Casio CZ style phase distortion. d = DCW 0..1\nfunction cz_wave(ph, dt, d, wt) local(dd, w, r, win) (\n  wt < 0.5 ? (                                   // saw\n    dd = 0.5 - 0.5*d; dd < 2*dt ? dd = 2*dt;\n    w = ph < dd ? 0.5*ph/dd : 0.5 + 0.5*(ph - dd)/(1 - dd);\n    -cos(2*$pi*w);\n  ) : wt < 1.5 ? (                               // square\n    dd = 0.25 - 0.25*d; dd < 2*dt ? dd = 2*dt;\n    w = ph < dd ? 0.5*ph/dd : ph < 0.5 ? 0.5 : ph < 0.5 + dd ? 0.5 + 0.5*(ph - 0.5)/dd : 1;\n    -cos(2*$pi*w);\n  ) : wt < 2.5 ? (                               // pulse\n    dd = 1 - 0.9*d; dd < 2*dt ? dd = 2*dt;\n    w = ph < dd ? ph/dd : 1;\n    -cos(2*$pi*w);\n  ) : (                                          // resonant saw / triangle / trapezoid\n    r = 1 + d*14;\n    win = wt < 3.5 ? 1 - ph : wt < 4.5 ? (ph < 0.5 ? ph + ph : 2 - ph - ph) : (ph < 0.5 ? 1 : 2 - ph - ph);\n    win*(1 - cos(2*$pi*ph*r)) - 1;\n  );\n);\n\n// ---------------------------------------------------------------- envelopes\nfunction env_trigger() instance(st) ( st = 1; );\nfunction env_release() instance(st) ( st > 0 ? st = 4; );\nfunction env_tick(ca, cd, s, cr) instance(st, v) (\n  st == 1 ? ( v += (1.25 - v)*ca; v >= 1 ? ( v = 1; st = 2; ); ) :\n  st == 2 ? ( v += (s - v)*cd; abs(v - s) < 0.0005 ? st = 3; ) :\n  st == 3 ? ( v += (s - v)*0.002; ) :\n  st == 4 ? ( v -= v*cr; v < 0.00002 ? ( v = 0; st = 0; ); );\n  v;\n);\nfunction env_coef(ms, div) ( 1 - exp(-div/(max(ms, 0.05)*0.001*srate)); );\n\n// ---------------------------------------------------------------- LFO\nfunction lfo_tick(shape, rate) instance(ph, r0, r1, out, sm) (\n  ph += rate*isr;\n  ph >= 1 ? ( ph -= floor(ph); r0 = r1; r1 = rand(2) - 1; );\n  shape == 0 ? out = sin(2*$pi*ph) :\n  shape == 1 ? out = 1 - 4*abs(ph - 0.5) :\n  shape == 2 ? out = ph + ph - 1 :\n  shape == 3 ? out = 1 - ph - ph :\n  shape == 4 ? out = ph < 0.5 ? 1 : -1 :\n  shape == 5 ? out = r1 :\n  out = r0 + (r1 - r0)*(0.5 - 0.5*cos($pi*ph));\n  sm += (out - sm)*lfo_smooth;\n  sm;\n);\n\n// ---------------------------------------------------------------- filters\n// main filter coefficients (shared by both channels)\nfunction calc_filter(fc, rq) local(g) (\n  fc = clamp(fc, 10, min(20000, fs_os*0.45));\n  g = tan($pi*fc*isr_os);\n  f_G = g/(1 + g); f_b = 1 - f_G; f_G4 = f_G*f_G*f_G*f_G;\n  f_Gb = f_G*f_b; f_G2b = f_G*f_Gb; f_G3b = f_G*f_G2b;\n  f_k = 2 - 1.96*rq;\n  f_a1 = 1/(1 + g*(g + f_k)); f_a2 = g*f_a1; f_a3 = g*f_a2;\n  lad_k = rq*3.9; lad_comp = 1 + lad_k*0.55;\n);\nfunction filt(x) instance(s1, s2, s3, s4, ic1, ic2) local(u, v, y1, y2, y3, y4, v1, v2, v3) (\n  fdrv_on ? x = sat(x*fdg)*fdg_out;\n  ftype == 0 ? (\n    u = (x*lad_comp - lad_k*(f_G3b*s1 + f_G2b*s2 + f_Gb*s3 + f_b*s4))/(1 + lad_k*f_G4);\n    u = sat(u);\n    v = (u - s1)*f_G; y1 = v + s1; s1 = y1 + v;\n    v = (y1 - s2)*f_G; y2 = v + s2; s2 = y2 + v;\n    v = (y2 - s3)*f_G; y3 = v + s3; s3 = y3 + v;\n    v = (y3 - s4)*f_G; y4 = v + s4; s4 = y4 + v;\n    y4;\n  ) : (\n    v3 = x - ic2; v1 = f_a1*ic1 + f_a2*v3; v2 = ic2 + f_a2*ic1 + f_a3*v3;\n    ic1 = v1 + v1 - ic1; ic2 = v2 + v2 - ic2;\n    ftype == 1 ? v2 : ftype == 2 ? v1*f_k : ftype == 3 ? x - f_k*v1 - v2 : x - f_k*v1;\n  );\n);\n// generic TPT state-variable filter with its own coefficients\nfunction svf_set(fc, k) instance(a1, a2, a3, kk) local(g) (\n  g = tan($pi*clamp(fc, 5, srate*0.45)*isr);\n  kk = k; a1 = 1/(1 + g*(g + k)); a2 = g*a1; a3 = g*a2;\n  sv_a1 = a1; sv_a2 = a2; sv_a3 = a3; sv_k = k;\n);\n// copy the coefficients computed by the last svf_set()\nfunction svf_same() instance(a1, a2, a3, kk) ( a1 = sv_a1; a2 = sv_a2; a3 = sv_a3; kk = sv_k; );\nfunction svf(x) instance(a1, a2, a3, kk, ic1, ic2, lp, bp, hp) local(v1, v2, v3) (\n  v3 = x - ic2; v1 = a1*ic1 + a2*v3; v2 = ic2 + a2*ic1 + a3*v3;\n  ic1 = v1 + v1 - ic1; ic2 = v2 + v2 - ic2;\n  lp = v2; bp = v1; hp = x - kk*v1 - v2;\n  lp;\n);\n// Elliptic decimation filters, biquads in transposed direct form II\n// (0.1 dB ripple to 0.45 fs, >55 dB at 0.5 fs, >90 dB at 0.55 fs)\nfunction dec2(x) instance(a1, a2, b1, b2, c1, c2, d1, d2, e1, e2) local(y) (\n  y = 0.00359934096805*x + a1; a1 = 0.00670805334677*x + 1.06037998983*y + a2; a2 = 0.00359934096805*x - 0.330198964653*y; x = y;\n  y = x + b1; b1 = 1.15209572367*x + 0.815582447302*y + b2; b2 = x - 0.505804226959*y; x = y;\n  y = x + c1; c1 = 0.561428581129*x + 0.54157047243*y + c2; c2 = x - 0.707942656721*y; x = y;\n  y = x + d1; d1 = 0.251560853945*x + 0.36094563724*y + d2; d2 = x - 0.856182168854*y; x = y;\n  y = x + e1; e1 = 0.127038420503*x + 0.282178673178*y + e2; e2 = x - 0.956958266697*y;\n  y;\n);\nfunction dec4(x) instance(a1, a2, b1, b2, c1, c2, d1, d2, e1, e2, f1, f2) local(y) (\n  y = 0.000235376991335*x + a1; a1 = 0.000064248965911*x + 0.783153903404*y + a2; a2 = 0.000235376991335*x; x = y;\n  y = x + b1; b1 = x + 1.55323904484*y + b2; b2 = -0.660503537709*y; x = y;\n  y = x + c1; c1 = -0.828481734043*x + 1.52543698655*y + c2; c2 = x - 0.763768102268*y; x = y;\n  y = x + d1; d1 = -1.19305052953*x + 1.50161623449*y + d2; d2 = x - 0.86247415468*y; x = y;\n  y = x + e1; e1 = -1.32755047952*x + 1.49134289416*y + e2; e2 = x - 0.932542516606*y; x = y;\n  y = x + f1; f1 = -1.37496302208*x + 1.4982799417*y + f2; f2 = x - 0.979991718034*y;\n  y;\n);\nfunction dec_reset() instance(a1, a2, b1, b2, c1, c2, d1, d2, e1, e2, f1, f2) (\n  a1 = a2 = b1 = b2 = c1 = c2 = d1 = d2 = e1 = e2 = f1 = f2 = 0;\n);\nfunction filt_reset() instance(s1, s2, s3, s4, ic1, ic2) ( s1 = s2 = s3 = s4 = ic1 = ic2 = 0; );\nfunction dist_reset() instance(hp, lp) ( hp = lp = 0; );\n// clear the voice signal path once the amp envelope has finished, so the next\n// note starts from silence instead of stale filter states\nfunction voice_reset() (\n  fl.filt_reset(); fr.filt_reset(); dsl.dist_reset(); dsr.dist_reset();\n  decl.dec_reset(); decr.dec_reset();\n  memset(PHS_L, 0, 40);\n  dcx_l = dcy_l = dcx_r = dcy_r = 0;\n);\n\n// ---------------------------------------------------------------- distortion\nfunction dist(x) instance(hp, lp) local(y, v) (\n  v = x*d_gain;\n  dtype == 0 ? y = sat(v) :\n  dtype == 1 ? y = (sat(v*0.8 + 0.5) - d_tubeoff)*1.2 :\n  dtype == 2 ? y = clamp(v, -1, 1) :\n  dtype == 3 ? y = sin(v*1.5707963) :\n  dtype == 4 ? y = abs(sat(v))*2 - 1 :\n  (\n    hp += (v - hp)*d_pedal_c;\n    v += (v - hp)*2;\n    y = v > 0 ? sat(v*1.4) : sat(v)*0.8;\n  );\n  d_tone_on ? ( lp += (y - lp)*d_tone_c; y = lp; );\n  x + (y - x)*d_mix;\n);\n\n// ---------------------------------------------------------------- phaser (engine 6)\nfunction eng_phaser(x, st, a) local(y, v, i) (\n  y = x + st[0]*ph_fb;\n  i = 1;\n  loop(ph_stages, v = a*y + st[i]; st[i] = y - a*v; y = v; i += 1; );\n  st[0] = y;\n  0.5*(x + y);\n);\n\n// ---------------------------------------------------------------- Hilbert / freq shifter\nfunction ap2(x, c, st) local(y) (\n  y = c*(x + st[3]) - st[1];\n  st[1] = st[0]; st[0] = x; st[3] = st[2]; st[2] = y;\n  y;\n);\n// returns real part, imaginary part left in hil_im\nfunction hilbert(x, st) local(a, b) (\n  a = ap2(ap2(ap2(ap2(x, HA1, st), HA2, st+4), HA3, st+8), HA4, st+12);\n  b = ap2(ap2(ap2(ap2(x, HB1, st+16), HB2, st+20), HB3, st+24), HB4, st+28);\n  hil_im = b;\n  b = st[32]; st[32] = a;\n  b;\n);\n\n// ---------------------------------------------------------------- delay line read\nfunction dread(buf, size, pos, d) local(rp, i, f) (\n  rp = pos - d; rp < 0 ? rp += size;\n  i = floor(rp); f = rp - i;\n  buf[i] + (buf[i + 1 < size ? i + 1 : 0] - buf[i])*f;\n);\n\n// ================================================================ voice setup\nfunction setup_voices() local(k, s, u, ns, uu, pos, pan) (\n  eng == 1 ? ( ns = 3 + floor(enga*0.13 + 0.5); uu = 1; ) :\n  eng == 6 ? ( ns = 1; uu = unison; ) :\n  ( ns = 2; uu = unison; );\n  nslots = ns; nuni = uu; nosc = ns*uu;\n  k = 0;\n  s = 0;\n  loop(ns,\n    u = 0;\n    loop(uu,\n      pos = ns == 1 ? 0 : -1 + 2*s/(ns - 1);\n      O_POSR[k] = pos;\n      O_UNI[k] = uu == 1 ? 0 : -1 + 2*u/(uu - 1);\n      O_SLOT[k] = s;\n      eng == 1 ? pan = abs(pos)*((s & 1) ? 1 : -1) :\n      ns == 1 ? pan = O_UNI[k] :\n      pan = pos*0.7 + O_UNI[k]*0.3;\n      O_PAN[k] = pan;\n      O_DRIFT[k] = 0; O_DTGT[k] = rand(2) - 1;\n      k += 1; u += 1;\n    );\n    s += 1;\n  );\n  last_spread = -1;\n);\nfunction update_pans(sp) local(k, a) (\n  k = 0;\n  loop(nosc,\n    a = (clamp(O_PAN[k]*sp, -1, 1) + 1)*0.25*$pi;\n    O_GL[k] = cos(a)*1.41421356; O_GR[k] = sin(a)*1.41421356;\n    k += 1;\n  );\n);\nfunction reset_phases(mode) local(k) (\n  k = 0;\n  loop(nosc,\n    mode == 1 ? ( O_PH[k] = 0; O_PH2[k] = 0; ) : ( O_PH[k] = rand(1); O_PH2[k] = rand(1); );\n    O_FB[k] = 0;\n    k += 1;\n  );\n);\n// lock the pair's relative phase to the song position (tempo-synced beating)\nfunction lock_beat_phase() local(k, rel) (\n  rel = frac(beat_position_now/BEATS[beatdiv]);\n  k = 0;\n  loop(nosc,\n    O_SLOT[k] == 1 ? O_PH[k] = frac(O_PH[k - nuni] + rel);\n    k += 1;\n  );\n  beat_ph = rel;\n);\n\n// ================================================================ MIDI / notes\nfunction stack_remove(n) local(i, j) (\n  i = 0; j = 0;\n  loop(nstk,\n    NOTESTK[i] != n ? ( NOTESTK[j] = NOTESTK[i]; j += 1; );\n    i += 1;\n  );\n  nstk = j;\n);\nfunction start_note(n, retrig) (\n  tgt_pitch = n;\n  retrig ? (\n    aenv_o.env_trigger(); menv_o.env_trigger();\n    note_rnd = rand(2) - 1;\n    note_time = 0;\n    l1trig ? ( lfo1.ph = 0; lfo1.sm = 0; );\n    l2trig ? ( lfo2.ph = 0; lfo2.sm = 0; );\n    phasemode > 0 ? reset_phases(phasemode);\n    aenv_o.v < 0.001 ? sub_ph = 0;\n    detmode == 2 ? lock_beat_phase();\n  );\n);\nfunction note_on(n, v) local(was_held) (\n  was_held = nstk > 0 || (sustain_ped && gate);\n  stack_remove(n);\n  nstk < 64 ? ( NOTESTK[nstk] = n; nstk += 1; );\n  vel = v/127;\n  do_glide = glide > 0 && (glidemode == 1 ? has_played : was_held);\n  !do_glide ? cur_pitch = n;\n  start_note(n, !(was_held && vmode == 0));\n  gate = 1; has_played = 1;\n);\nfunction release_all() (\n  gate = 0;\n  aenv_o.env_release(); menv_o.env_release();\n);\nfunction note_off(n) (\n  stack_remove(n);\n  nstk > 0 ? (\n    NOTESTK[nstk - 1] != tgt_pitch ? (\n      do_glide = glide > 0;\n      !do_glide ? cur_pitch = NOTESTK[nstk - 1];\n      start_note(NOTESTK[nstk - 1], vmode == 1);\n    );\n  ) : (\n    !sustain_ped ? release_all();\n  );\n);\nfunction all_notes_off() ( nstk = 0; release_all(); );\nfunction handle_midi(s, d1, d2) local(st) (\n  st = s & 0xF0;\n  st == 0x90 && d2 > 0 ? note_on(d1, d2) :\n  st == 0x80 || st == 0x90 ? note_off(d1) :\n  st == 0xE0 ? bend_v = ((d2*128 + d1) - 8192)/8192 :\n  st == 0xB0 ? (\n    d1 == 1 ? modwheel = d2/127 :\n    d1 == 64 ? ( sustain_ped = d2 >= 64; !sustain_ped && nstk == 0 && gate ? release_all(); ) :\n    d1 == 123 || d1 == 120 ? all_notes_off();\n  ) :\n  st == 0xD0 ? aftertouch = d1/127 :\n  st == 0xA0 ? aftertouch = d2/127;\n);\n\n// ================================================================ derived parameters\nfunction update_params() (\n  // srate may not be valid in @init (ext_noinit), so everything rate-dependent lives here\n  isr = 1/srate; last_srate = srate;\n  lfo_smooth = 1 - exp(-1/(0.0015*srate));\n  smc = 1 - exp(-1/(0.012*srate));\n  vel_c = 1 - exp(-1/(0.004*srate));\n  dc_r = 1 - 2*$pi*8/srate;\n  os = quality == 0 ? 1 : quality == 1 ? 2 : 4;\n  fs_os = srate*os; isr_os = 1/fs_os;\n  os != last_os ? ( decl.dec_reset(); decr.dec_reset(); last_os = os; );\n  // voice layout\n  ssv = eng == 1 ? floor(enga*0.13 + 0.5) : 0;\n  (eng != prev_eng || unison != prev_uni || ssv != prev_ssv) ? (\n    setup_voices(); prev_eng = eng; prev_uni = unison; prev_ssv = ssv;\n  );\n  // envelopes\n  a_ca = env_coef(aatt, 1.6094); a_cd = env_coef(adec, 4.6); a_cr = env_coef(arel, 4.6);\n  m_ca = env_coef(matt, 1.6094); m_cd = env_coef(mdec, 4.6); m_cr = env_coef(mrel, 4.6);\n  asus_n = asus/100; msus_n = msus/100;\n  gcoef = glide > 0 ? 1 - exp(-3/(glide*0.001*srate)) : 1;\n  osc_gain = db2g(osclvl);\n  // distortion constants\n  d_tubeoff = sat(0.5);\n  d_pedal_c = 1 - exp(-2*$pi*720*isr_os);\n  d_tone_on = dtone < 99.5;\n  d_tone_c = 1 - exp(-2*$pi*(400*2^(dtone*0.0564))*isr_os);\n  d_mix = dmix/100;\n  // noise color\n  ncolor < 50 ? ( n_lpmode = 1; n_c = 1 - exp(-2*$pi*(150*2^(ncolor/50*7))*isr_os); ) :\n                ( n_lpmode = 0; n_c = 1 - exp(-2*$pi*(20*2^((ncolor - 50)/50*9))*isr_os); );\n  // output / misc\n  vol_target = db2g(volume);\n  lowcut > 0 ? ( lc1.svf_set(lowcut, 1.41421356); lc2.svf_same(); lc3.svf_same(); lc4.svf_same(); );\n  monobass > 0 ? ( mb1.svf_set(monobass, 1.41421356); mb2.svf_same(); mb3.svf_same(); mb4.svf_same(); );\n  // squash crossovers\n  sq_l1.svf_set(150, 1.41421356); sq_l2.svf_same(); sq_r1.svf_same(); sq_r2.svf_same();\n  sq_m1.svf_set(2500, 1.41421356); sq_m2.svf_same(); sq_m3.svf_same(); sq_m4.svf_same();\n  sq_att = 1 - exp(-1/(0.002*srate)); sq_rel = 1 - exp(-1/(0.08*srate));\n  // active modulation slots\n  n_mod = 0; mi = 0;\n  loop(6,\n    slider(83 + mi*3) > 0 && slider(84 + mi*3) > 0 && slider(85 + mi*3) != 0 ? (\n      MSRC[n_mod] = slider(83 + mi*3); MDST[n_mod] = slider(84 + mi*3); MAMT[n_mod] = slider(85 + mi*3)*0.01;\n      n_mod += 1;\n    );\n    mi += 1;\n  );\n  memset(MODV, 0, 26);\n  lcut_target = log(cutoff)*1.4426950408889634;\n  mvf_target = log(mvfreq)*1.4426950408889634;\n  // ring mod / crush\n  crush_on = (bits < 15.95 || downs > 1.01) && cmix > 0;\n  drift_k = 1 - exp(-1/(0.3*srate));\n);\n\n// ================================================================ state\nnstk = 0; gate = 0; vel = 0.8; cur_pitch = tgt_pitch = 36; has_played = 0;\nmodwheel = 0; aftertouch = 0; bend_v = 0; sustain_ped = 0;\nvelg = 1;\nsm_lcut = log(cutoff)/log(2); sm_det = det; sm_a = enga; sm_b = engb; sm_c = engc;\nsm_vol = db2g(volume); sm_mvf = log(mvfreq)/log(2); sm_vowel = vowel; sm_shift = fshift;\nsm_beathz = beathz;\ndrift_ctr = 0;\nscope_pos = 0; throb_pos = 0; throb_acc = 0; throb_n = 0;\nprev_eng = -1; prev_uni = -1; prev_ssv = -1;\nlast_os = -1;\nbeat_position_now = 0;\n\n// ================================================================ UI: parameter table\n// shape: 0 linear, 1 log, 2 square, 3 bipolar cubic\n// unit: 0 plain, 1 Hz, 2 ms, 3 %, 4 cents, 5 dB, 6 integer, 7 ratio, 8 semitones, 9 bipolar %, 10 enum, 11 octave\nPUNIT = 12200; PNAME = 12500; PENUM = 12800; PSTEP = 13100;\nfunction pm(i, mn, mx, def, shape, unit, name) (\n  PMIN[i] = mn; PMAX[i] = mx; PDEF[i] = def; PSHAPE[i] = shape; PUNIT[i] = unit; PNAME[i] = name;\n  PENUM[i] = 0; PSTEP[i] = unit == 10 || unit == 6 || unit == 11 ? 1 : 0;\n);\nfunction pe(i, def, items, name) ( pm(i, 0, 100, def, 0, 10, name); PENUM[i] = items; PSTEP[i] = 1; );\nDIVS = \"4 Bars|2 Bars|1/1|1/2|1/2T|1/4D|1/4|1/4T|1/8D|1/8|1/8T|1/16D|1/16|1/16T|1/32\";\nMODSRC = \"Off|LFO 1|LFO 2|Mod Env|Amp Env|Velocity|Mod Wheel|Aftertouch|Key Track|Note Random|Beat Phase\";\nMODDST = \"Off|Cutoff|Resonance|Detune|Pitch|Engine A|Engine B|Engine C|Filter Drive|Dist Drive|Move Freq|Move Mix|Vowel|Freq Shift|Ring Ratio|Crush|Unison Spread|Stereo Spread|Width|Volume|Pan|Sub Level|Noise Level|LFO1 Rate|LFO2 Rate\";\nLFOSHAPES = \"Sine|Triangle|Saw Up|Saw Down|Square|Sample & Hold|Smooth Random\";\nENGINES = \"Dual Saw (Classic)|Supersaw Unison|PWM|Phase Distortion (CZ)|FM Cross-Mod|Hard Sync|Phaser (Filter Reese)|Cross-Fold\";\npe(1, 0, ENGINES, \"Engine\");\npm(2, 0, 150, 30, 2, 4, \"Detune\");\npe(3, 0, \"Cents|Hz|Sync\", \"Detune Mode\");\npm(4, 0.05, 20, 2, 1, 1, \"Beat Rate\");\npe(5, 9, DIVS, \"Beat Sync\");\npm(6, 0, 100, 0, 0, 3, \"Engine A\"); pm(7, 0, 100, 45, 0, 3, \"Engine B\"); pm(8, 0, 100, 50, 0, 3, \"Engine C\");\npm(9, 1, 8, 1, 0, 6, \"Unison Voices\");\npm(10, 0, 100, 25, 0, 3, \"Unison Spread\");\npm(11, 0, 100, 35, 0, 3, \"Stereo Spread\");\npm(12, 0, 100, 15, 0, 3, \"Analog Drift\");\npe(13, 0, \"Free|Reset|Random\", \"Osc Phase\");\npm(14, -24, 12, 0, 0, 5, \"Osc Level\");\npm(15, 0, 100, 0, 0, 3, \"Sub Level\");\npe(16, 0, \"Sine|Triangle|Square|Saw\", \"Sub Wave\");\npe(17, 1, \"0|-1|-2\", \"Sub Octave\");\npm(18, 0, 100, 0, 0, 3, \"Noise Level\");\npm(19, 0, 100, 50, 0, 3, \"Noise Color\");\npm(20, 0, 500, 0, 2, 1, \"Reese Low Cut\");\npe(21, 0, \"LP 24 Ladder|LP 12|Band Pass|High Pass|Notch|Off\", \"Filter Type\");\npm(22, 20, 20000, 650, 1, 1, \"Cutoff\");\npm(23, 0, 100, 14, 0, 3, \"Resonance\");\npm(24, 0, 100, 0, 0, 3, \"Filter Drive\");\npm(25, 0, 100, 40, 0, 3, \"Key Track\");\npm(26, -100, 100, 0, 0, 9, \"Filter Env Amount\");\npm(27, 0.5, 5000, 4, 1, 2, \"Amp Attack\"); pm(28, 1, 10000, 300, 1, 2, \"Amp Decay\");\npm(29, 0, 100, 100, 0, 3, \"Amp Sustain\"); pm(30, 1, 10000, 120, 1, 2, \"Amp Release\");\npm(31, 0.5, 5000, 1, 1, 2, \"Mod Attack\"); pm(32, 1, 10000, 400, 1, 2, \"Mod Decay\");\npm(33, 0, 100, 0, 0, 3, \"Mod Sustain\"); pm(34, 1, 10000, 200, 1, 2, \"Mod Release\");\npe(35, 1, LFOSHAPES, \"LFO1 Shape\"); pe(36, 1, \"Hz|BPM\", \"LFO1 Sync\");\npm(37, 0.01, 40, 1, 1, 1, \"LFO1 Rate\"); pe(38, 9, DIVS, \"LFO1 Division\");\npe(39, 0, \"Free|Retrig\", \"LFO1 Trigger\"); pm(40, 0, 5000, 0, 2, 2, \"LFO1 Fade In\");\npe(41, 0, LFOSHAPES, \"LFO2 Shape\"); pe(42, 0, \"Hz|BPM\", \"LFO2 Sync\");\npm(43, 0.01, 40, 0.3, 1, 1, \"LFO2 Rate\"); pe(44, 6, DIVS, \"LFO2 Division\");\npe(45, 0, \"Free|Retrig\", \"LFO2 Trigger\"); pm(46, 0, 5000, 0, 2, 2, \"LFO2 Fade In\");\npe(47, 0, \"Tape|Tube|Hard Clip|Wavefold|Rectify|Pedal OD\", \"Distortion Type\");\npm(48, 0, 100, 0, 0, 3, \"Distortion Drive\"); pm(49, 0, 100, 100, 0, 3, \"Distortion Tone\");\npm(50, 0, 100, 100, 0, 3, \"Distortion Mix\"); pe(51, 0, \"Post|Pre\", \"Distortion Position\");\npe(52, 0, \"Off|Notch Sweep|Phaser|Flanger\", \"Movement Type\");\npm(53, 20, 10000, 600, 1, 1, \"Movement Freq\"); pm(54, 0, 100, 50, 0, 3, \"Movement Depth\");\npe(55, 6, DIVS, \"Movement Rate\"); pm(56, 0, 100, 40, 0, 3, \"Movement Resonance\");\npm(57, 0, 100, 25, 0, 3, \"Movement Stereo\"); pm(58, 0, 100, 100, 0, 3, \"Movement Mix\");\npm(59, 0, 100, 0, 0, 3, \"Formant Vowel\"); pm(60, 0, 100, 0, 0, 3, \"Formant Mix\");\npm(61, -1000, 1000, 0, 3, 1, \"Freq Shift\"); pm(62, 0, 100, 0, 0, 3, \"Freq Shift Mix\");\npm(63, 0.25, 8, 1, 1, 7, \"Ring Mod Ratio\"); pm(64, 0, 100, 0, 0, 3, \"Ring Mod Mix\");\npm(65, 1, 16, 16, 0, 0, \"Crush Bits\"); pm(66, 1, 50, 1, 1, 7, \"Downsample\");\npm(67, 0, 100, 100, 0, 3, \"Crush Mix\"); pm(68, 0, 100, 0, 0, 3, \"Squash\");\npm(69, 0, 100, 0, 0, 3, \"Chorus Mix\"); pm(70, 0.05, 5, 0.4, 1, 1, \"Chorus Rate\");\npm(71, 0, 100, 50, 0, 3, \"Chorus Depth\"); pm(72, 0, 200, 100, 0, 3, \"Width\");\npm(73, 0, 400, 120, 0, 1, \"Mono Bass Below\");\npe(74, 0, \"Legato|Retrig\", \"Note Mode\"); pm(75, 0, 2000, 80, 2, 2, \"Glide\");\npe(76, 0, \"Legato|Always\", \"Glide Mode\"); pm(77, 0, 24, 2, 0, 8, \"Pitch Bend Range\");\npm(78, 0, 100, 40, 0, 3, \"Velocity Sensitivity\"); pm(79, -3, 2, 0, 0, 11, \"Octave\");\npe(80, 1, \"1x|2x|4x\", \"Oversampling\"); pm(81, -48, 12, -6, 0, 5, \"Output\");\npe(82, 1, \"Off|On\", \"Output Clipper\");\nmi = 0;\nloop(6,\n  pe(83 + mi*3, 0, MODSRC, \"Mod Source\"); pe(84 + mi*3, 0, MODDST, \"Mod Destination\");\n  pm(85 + mi*3, -100, 100, 0, 0, 9, \"Mod Amount\");\n  mi += 1;\n);\nPDEF[83] = 1; PDEF[86] = 3; PDEF[89] = 6; PDEF[92] = 2; PDEF[95] = 5; PDEF[98] = 10;\n// enum sliders: real range is 0..count-1\nfunction enum_count(list) local(i, n, c) (\n  n = 1; i = 0;\n  while ((c = str_getchar(list, i)) != 0) ( c == 124 ? n += 1; i += 1; );\n  n;\n);\nmi = 1;\nloop(100,\n  PENUM[mi] ? PMAX[mi] = enum_count(PENUM[mi]) - 1;\n  mi += 1;\n);\n\n// engine specific texts\nENGDESC = 12400; ENGLBL = 12420;\nENGDESC[0] = \"Two detuned oscillators \u00e2\u0080\u0094 the classic Reese (Saunderson, jungle, DnB)\";\nENGDESC[1] = \"Stacked unison saws with a JP-style spread \u00e2\u0080\u0094 the modern wide Reese\";\nENGDESC[2] = \"Pulse width swept at the beat rate \u00e2\u0080\u0094 PWM Reese, two phased pulses\";\nENGDESC[3] = \"Casio CZ phase distortion, lines 1 + 1' detuned \u00e2\u0080\u0094 the original \u00e2\u0080\u009988 tone\";\nENGDESC[4] = \"Detuned carriers phase-modulated by a sine \u00e2\u0080\u0094 evolving FM Reese\";\nENGDESC[5] = \"Detuned hard-synced pairs \u00e2\u0080\u0094 aggressive, vocal neuro growl\";\nENGDESC[6] = \"One saw through a key-tracked phaser swept at the beat rate\";\nENGDESC[7] = \"Sine wavefolder audio-rate modulated by its detuned twin (Noise Eng. style)\";\nfunction el(e, a, b, c) ( ENGLBL[e*3] = a; ENGLBL[e*3 + 1] = b; ENGLBL[e*3 + 2] = c; );\nel(0, \"WAVE 2\", \"PITCH 2\", \"BALANCE\");\nel(1, \"VOICES\", \"CURVE\", \"SIDES\");\nel(2, \"PWM\", \"WIDTH\", \"OSC 2\");\nel(3, \"DCW\", \"WAVE\", \"LINE 1'\");\nel(4, \"INDEX\", \"RATIO\", \"FEEDBACK\");\nel(5, \"SYNC\", \"SLAVE\", \"MASTER\");\nel(6, \"DEPTH\", \"FEEDBACK\", \"STAGES\");\nel(7, \"FOLD\", \"X-MOD\", \"SYMMETRY\");\nCZWAVES = \"Saw|Square|Pulse|Reso Saw|Reso Tri|Reso Trap\";\n// sensible starting points for engine A / B / C when an engine is picked in the UI\nENGDEF = 12460;\nfunction ed(e, a, b, c) ( ENGDEF[e*3] = a; ENGDEF[e*3 + 1] = b; ENGDEF[e*3 + 2] = c; );\ned(0, 0, 45, 50); ed(1, 30, 30, 70); ed(2, 60, 20, 70); ed(3, 55, 0, 100);\ned(4, 40, 20, 25); ed(5, 35, 0, 25); ed(6, 60, 50, 60); ed(7, 40, 50, 50);\n\n// ================================================================ UI: helpers\nfunction norm_of(i, v) local(mn, mx, sh) (\n  mn = PMIN[i]; mx = PMAX[i]; sh = PSHAPE[i];\n  sh == 1 ? log(max(v, mn)/mn)/log(mx/mn) :\n  sh == 2 ? sqrt(max(0, (v - mn)/(mx - mn))) :\n  sh == 3 ? ( v = (v - mn)/(mx - mn)*2 - 1; 0.5 + 0.5*(v < 0 ? -1 : 1)*abs(v)^(1/3); ) :\n  (v - mn)/(mx - mn);\n);\nfunction val_of(i, n) local(mn, mx, sh, v) (\n  mn = PMIN[i]; mx = PMAX[i]; sh = PSHAPE[i];\n  n = clamp(n, 0, 1);\n  v = sh == 1 ? mn*(mx/mn)^n :\n      sh == 2 ? mn + (mx - mn)*n*n :\n      sh == 3 ? ( n = n*2 - 1; mn + (mx - mn)*(0.5 + 0.5*n*n*n); ) :\n      mn + (mx - mn)*n;\n  PSTEP[i] ? v = floor(v + 0.5);\n  v;\n);\n// notify REAPER about a changed parameter by passing the slider variable itself\nfunction notify(i) (\n  i == 1 ? sliderchange(eng) :\n  i == 2 ? sliderchange(det) :\n  i == 3 ? sliderchange(detmode) :\n  i == 4 ? sliderchange(beathz) :\n  i == 5 ? sliderchange(beatdiv) :\n  i == 6 ? sliderchange(enga) :\n  i == 7 ? sliderchange(engb) :\n  i == 8 ? sliderchange(engc) :\n  i == 9 ? sliderchange(unison) :\n  i == 10 ? sliderchange(uspread) :\n  i == 11 ? sliderchange(spread) :\n  i == 12 ? sliderchange(drift) :\n  i == 13 ? sliderchange(phasemode) :\n  i == 14 ? sliderchange(osclvl) :\n  i == 15 ? sliderchange(sublvl) :\n  i == 16 ? sliderchange(subwave) :\n  i == 17 ? sliderchange(suboct) :\n  i == 18 ? sliderchange(noiselvl) :\n  i == 19 ? sliderchange(ncolor) :\n  i == 20 ? sliderchange(lowcut) :\n  i == 21 ? sliderchange(ftype) :\n  i == 22 ? sliderchange(cutoff) :\n  i == 23 ? sliderchange(reso) :\n  i == 24 ? sliderchange(fdrive) :\n  i == 25 ? sliderchange(fkey) :\n  i == 26 ? sliderchange(fenv) :\n  i == 27 ? sliderchange(aatt) :\n  i == 28 ? sliderchange(adec) :\n  i == 29 ? sliderchange(asus) :\n  i == 30 ? sliderchange(arel) :\n  i == 31 ? sliderchange(matt) :\n  i == 32 ? sliderchange(mdec) :\n  i == 33 ? sliderchange(msus) :\n  i == 34 ? sliderchange(mrel) :\n  i == 35 ? sliderchange(l1shape) :\n  i == 36 ? sliderchange(l1sync) :\n  i == 37 ? sliderchange(l1rate) :\n  i == 38 ? sliderchange(l1div) :\n  i == 39 ? sliderchange(l1trig) :\n  i == 40 ? sliderchange(l1fade) :\n  i == 41 ? sliderchange(l2shape) :\n  i == 42 ? sliderchange(l2sync) :\n  i == 43 ? sliderchange(l2rate) :\n  i == 44 ? sliderchange(l2div) :\n  i == 45 ? sliderchange(l2trig) :\n  i == 46 ? sliderchange(l2fade) :\n  i == 47 ? sliderchange(dtype) :\n  i == 48 ? sliderchange(ddrive) :\n  i == 49 ? sliderchange(dtone) :\n  i == 50 ? sliderchange(dmix) :\n  i == 51 ? sliderchange(dpos) :\n  i == 52 ? sliderchange(mvtype) :\n  i == 53 ? sliderchange(mvfreq) :\n  i == 54 ? sliderchange(mvdepth) :\n  i == 55 ? sliderchange(mvrate) :\n  i == 56 ? sliderchange(mvreso) :\n  i == 57 ? sliderchange(mvstereo) :\n  i == 58 ? sliderchange(mvmix) :\n  i == 59 ? sliderchange(vowel) :\n  i == 60 ? sliderchange(fmix) :\n  i == 61 ? sliderchange(fshift) :\n  i == 62 ? sliderchange(shmix) :\n  i == 63 ? sliderchange(ring) :\n  i == 64 ? sliderchange(ringmix) :\n  i == 65 ? sliderchange(bits) :\n  i == 66 ? sliderchange(downs) :\n  i == 67 ? sliderchange(cmix) :\n  i == 68 ? sliderchange(squash) :\n  i == 69 ? sliderchange(chmix) :\n  i == 70 ? sliderchange(chrate) :\n  i == 71 ? sliderchange(chdepth) :\n  i == 72 ? sliderchange(width) :\n  i == 73 ? sliderchange(monobass) :\n  i == 74 ? sliderchange(vmode) :\n  i == 75 ? sliderchange(glide) :\n  i == 76 ? sliderchange(glidemode) :\n  i == 77 ? sliderchange(bendr) :\n  i == 78 ? sliderchange(velsens) :\n  i == 79 ? sliderchange(octave) :\n  i == 80 ? sliderchange(quality) :\n  i == 81 ? sliderchange(volume) :\n  i == 82 ? sliderchange(limiter) :\n  i == 83 ? sliderchange(m1src) :\n  i == 84 ? sliderchange(m1dst) :\n  i == 85 ? sliderchange(m1amt) :\n  i == 86 ? sliderchange(m2src) :\n  i == 87 ? sliderchange(m2dst) :\n  i == 88 ? sliderchange(m2amt) :\n  i == 89 ? sliderchange(m3src) :\n  i == 90 ? sliderchange(m3dst) :\n  i == 91 ? sliderchange(m3amt) :\n  i == 92 ? sliderchange(m4src) :\n  i == 93 ? sliderchange(m4dst) :\n  i == 94 ? sliderchange(m4amt) :\n  i == 95 ? sliderchange(m5src) :\n  i == 96 ? sliderchange(m5dst) :\n  i == 97 ? sliderchange(m5amt) :\n  i == 98 ? sliderchange(m6src) :\n  i == 99 ? sliderchange(m6dst) :\n  i == 100 ? sliderchange(m6amt) :\n  0;\n);\nfunction automate(i, done) (\n  i == 1 ? slider_automate(eng, done) :\n  i == 2 ? slider_automate(det, done) :\n  i == 3 ? slider_automate(detmode, done) :\n  i == 4 ? slider_automate(beathz, done) :\n  i == 5 ? slider_automate(beatdiv, done) :\n  i == 6 ? slider_automate(enga, done) :\n  i == 7 ? slider_automate(engb, done) :\n  i == 8 ? slider_automate(engc, done) :\n  i == 9 ? slider_automate(unison, done) :\n  i == 10 ? slider_automate(uspread, done) :\n  i == 11 ? slider_automate(spread, done) :\n  i == 12 ? slider_automate(drift, done) :\n  i == 13 ? slider_automate(phasemode, done) :\n  i == 14 ? slider_automate(osclvl, done) :\n  i == 15 ? slider_automate(sublvl, done) :\n  i == 16 ? slider_automate(subwave, done) :\n  i == 17 ? slider_automate(suboct, done) :\n  i == 18 ? slider_automate(noiselvl, done) :\n  i == 19 ? slider_automate(ncolor, done) :\n  i == 20 ? slider_automate(lowcut, done) :\n  i == 21 ? slider_automate(ftype, done) :\n  i == 22 ? slider_automate(cutoff, done) :\n  i == 23 ? slider_automate(reso, done) :\n  i == 24 ? slider_automate(fdrive, done) :\n  i == 25 ? slider_automate(fkey, done) :\n  i == 26 ? slider_automate(fenv, done) :\n  i == 27 ? slider_automate(aatt, done) :\n  i == 28 ? slider_automate(adec, done) :\n  i == 29 ? slider_automate(asus, done) :\n  i == 30 ? slider_automate(arel, done) :\n  i == 31 ? slider_automate(matt, done) :\n  i == 32 ? slider_automate(mdec, done) :\n  i == 33 ? slider_automate(msus, done) :\n  i == 34 ? slider_automate(mrel, done) :\n  i == 35 ? slider_automate(l1shape, done) :\n  i == 36 ? slider_automate(l1sync, done) :\n  i == 37 ? slider_automate(l1rate, done) :\n  i == 38 ? slider_automate(l1div, done) :\n  i == 39 ? slider_automate(l1trig, done) :\n  i == 40 ? slider_automate(l1fade, done) :\n  i == 41 ? slider_automate(l2shape, done) :\n  i == 42 ? slider_automate(l2sync, done) :\n  i == 43 ? slider_automate(l2rate, done) :\n  i == 44 ? slider_automate(l2div, done) :\n  i == 45 ? slider_automate(l2trig, done) :\n  i == 46 ? slider_automate(l2fade, done) :\n  i == 47 ? slider_automate(dtype, done) :\n  i == 48 ? slider_automate(ddrive, done) :\n  i == 49 ? slider_automate(dtone, done) :\n  i == 50 ? slider_automate(dmix, done) :\n  i == 51 ? slider_automate(dpos, done) :\n  i == 52 ? slider_automate(mvtype, done) :\n  i == 53 ? slider_automate(mvfreq, done) :\n  i == 54 ? slider_automate(mvdepth, done) :\n  i == 55 ? slider_automate(mvrate, done) :\n  i == 56 ? slider_automate(mvreso, done) :\n  i == 57 ? slider_automate(mvstereo, done) :\n  i == 58 ? slider_automate(mvmix, done) :\n  i == 59 ? slider_automate(vowel, done) :\n  i == 60 ? slider_automate(fmix, done) :\n  i == 61 ? slider_automate(fshift, done) :\n  i == 62 ? slider_automate(shmix, done) :\n  i == 63 ? slider_automate(ring, done) :\n  i == 64 ? slider_automate(ringmix, done) :\n  i == 65 ? slider_automate(bits, done) :\n  i == 66 ? slider_automate(downs, done) :\n  i == 67 ? slider_automate(cmix, done) :\n  i == 68 ? slider_automate(squash, done) :\n  i == 69 ? slider_automate(chmix, done) :\n  i == 70 ? slider_automate(chrate, done) :\n  i == 71 ? slider_automate(chdepth, done) :\n  i == 72 ? slider_automate(width, done) :\n  i == 73 ? slider_automate(monobass, done) :\n  i == 74 ? slider_automate(vmode, done) :\n  i == 75 ? slider_automate(glide, done) :\n  i == 76 ? slider_automate(glidemode, done) :\n  i == 77 ? slider_automate(bendr, done) :\n  i == 78 ? slider_automate(velsens, done) :\n  i == 79 ? slider_automate(octave, done) :\n  i == 80 ? slider_automate(quality, done) :\n  i == 81 ? slider_automate(volume, done) :\n  i == 82 ? slider_automate(limiter, done) :\n  i == 83 ? slider_automate(m1src, done) :\n  i == 84 ? slider_automate(m1dst, done) :\n  i == 85 ? slider_automate(m1amt, done) :\n  i == 86 ? slider_automate(m2src, done) :\n  i == 87 ? slider_automate(m2dst, done) :\n  i == 88 ? slider_automate(m2amt, done) :\n  i == 89 ? slider_automate(m3src, done) :\n  i == 90 ? slider_automate(m3dst, done) :\n  i == 91 ? slider_automate(m3amt, done) :\n  i == 92 ? slider_automate(m4src, done) :\n  i == 93 ? slider_automate(m4dst, done) :\n  i == 94 ? slider_automate(m4amt, done) :\n  i == 95 ? slider_automate(m5src, done) :\n  i == 96 ? slider_automate(m5dst, done) :\n  i == 97 ? slider_automate(m5amt, done) :\n  i == 98 ? slider_automate(m6src, done) :\n  i == 99 ? slider_automate(m6dst, done) :\n  i == 100 ? slider_automate(m6amt, done) :\n  0;\n);\n// set a parameter from the UI (records automation)\nfunction p_set(i, v) (\n  v = clamp(v, PMIN[i], PMAX[i]);\n  PSTEP[i] ? v = floor(v + 0.5);\n  slider(i) != v ? (\n    slider(i) = v;\n    automate(i, 0);\n    ui_dirty = 1; preset_edited = 1;\n  );\n);\n// set a parameter without automation (presets / mutate)\nfunction p_put(i, v) (\n  v = clamp(v, PMIN[i], PMAX[i]);\n  PSTEP[i] ? v = floor(v + 0.5);\n  slider(i) = v;\n  notify(i);\n  ui_dirty = 1;\n);\nfunction engine_defaults() (\n  p_set(6, ENGDEF[eng*3]); p_set(7, ENGDEF[eng*3 + 1]); p_set(8, ENGDEF[eng*3 + 2]);\n  PDEF[6] = ENGDEF[eng*3]; PDEF[7] = ENGDEF[eng*3 + 1]; PDEF[8] = ENGDEF[eng*3 + 2];\n);\n// copy the n-th item of a '|' separated list into dest\nfunction list_item(dest, list, n) local(i, c, start, k) (\n  i = 0; k = 0; start = 0;\n  while ((c = str_getchar(list, i)) != 0 && k <= n) (\n    c == 124 ? ( k == n ? k = n + 1 : ( k += 1; start = i + 1; ); );\n    i += 1;\n  );\n  k > n ? i -= 1;\n  strcpy_substr(dest, list, start, i - start);\n  dest;\n);\n// build a popup menu string with the current item checked\nfunction build_menu(dest, list, cur) local(i, n, j, c) (\n  strcpy(dest, \"\");\n  n = enum_count(list); i = 0;\n  loop(n,\n    i > 0 ? strcat(dest, \"|\");\n    i == cur ? strcat(dest, \"!\");\n    list_item(#mtmp, list, i);\n    // gfx_showmenu reads \"&\" as a mnemonic marker: \"&&\" draws one \"&\"\n    j = 0;\n    while ((c = str_getchar(#mtmp, j)) != 0) (\n      strcpy_substr(#mch, #mtmp, j, 1); strcat(dest, #mch);\n      c == 38 ? strcat(dest, \"&\");\n      j += 1;\n    );\n    i += 1;\n  );\n  dest;\n);\nfunction fmt_hz(dest, v) (\n  abs(v) >= 1000 ? sprintf(dest, \"%.2f kHz\", v/1000) :\n  abs(v) >= 100 ? sprintf(dest, \"%.0f Hz\", v) :\n  abs(v) >= 10 ? sprintf(dest, \"%.1f Hz\", v) : sprintf(dest, \"%.2f Hz\", v);\n);\nfunction fmt_ms(dest, v) (\n  v >= 1000 ? sprintf(dest, \"%.2f s\", v/1000) : v >= 100 ? sprintf(dest, \"%.0f ms\", v) : sprintf(dest, \"%.1f ms\", v);\n);\n// human readable value of parameter i into dest\nfunction fmt_val(dest, i) local(v, u, e, n) (\n  v = slider(i); u = PUNIT[i];\n  (i >= 6 && i <= 8) ? (\n    e = eng; n = v*0.01;\n    e == 0 && i == 6 ? (\n      n < 0.02 ? strcpy(dest, \"Saw\") : abs(n - 0.3333) < 0.02 ? strcpy(dest, \"Square\") :\n      abs(n - 0.6667) < 0.02 ? strcpy(dest, \"Triangle\") : n > 0.98 ? strcpy(dest, \"Sine\") : sprintf(dest, \"%.0f%%\", v);\n    ) :\n    e == 0 && i == 7 ? sprintf(dest, INTV[floor(n*7.999)] > 0 ? \"+%d st\" : \"%d st\", INTV[floor(n*7.999)]) :\n    e == 1 && i == 6 ? sprintf(dest, \"%d voices\", 3 + floor(v*0.13 + 0.5)) :\n    e == 3 && i == 7 ? list_item(dest, CZWAVES, floor(n*5.999)) :\n    e == 4 && i == 7 ? sprintf(dest, \"Ratio %.1f\", FMR[floor(n*5.999)]) :\n    e == 5 && i == 6 ? sprintf(dest, \"x%.2f\", 1 + n*7) :\n    e == 6 && i == 8 ? sprintf(dest, \"%d stages\", 2*(1 + floor(n*5.999))) :\n    sprintf(dest, \"%.0f%%\", v);\n  ) :\n  u == 10 ? list_item(dest, PENUM[i], v) :\n  u == 1 ? ( (i == 20 || i == 73) && v < 0.5 ? strcpy(dest, \"Off\") : fmt_hz(dest, v); ) :\n  u == 2 ? fmt_ms(dest, v) :\n  u == 3 ? sprintf(dest, \"%.0f%%\", v) :\n  u == 4 ? sprintf(dest, \"%.1f ct\", v) :\n  u == 5 ? sprintf(dest, v > 0 ? \"+%.1f dB\" : \"%.1f dB\", v) :\n  u == 6 ? sprintf(dest, \"%d\", v) :\n  u == 7 ? sprintf(dest, \"x%.2f\", v) :\n  u == 8 ? sprintf(dest, \"%d st\", v) :\n  u == 9 ? sprintf(dest, v > 0.5 ? \"+%.0f%%\" : \"%.0f%%\", v) :\n  u == 11 ? sprintf(dest, v > 0 ? \"+%d oct\" : \"%d oct\", v) :\n  i == 65 ? ( v > 15.95 ? strcpy(dest, \"Off\") : sprintf(dest, \"%.1f bit\", v); ) :\n  sprintf(dest, \"%.1f\", v);\n  dest;\n);\n\n// ---------------------------------------------------------------- drawing (logical coords)\nfunction col(r, g, b, a) ( gfx_r = r; gfx_g = g; gfx_b = b; gfx_a = a; );\nfunction RF(x, y, w, h) ( gfx_rect(ui_ox + x*ui_s, ui_oy + y*ui_s, max(1, w*ui_s), max(1, h*ui_s)); );\nfunction RO(x, y, w, h) local(x0, y0, x1, y1) (\n  x0 = floor(ui_ox + x*ui_s); y0 = floor(ui_oy + y*ui_s);\n  x1 = floor(ui_ox + (x + w)*ui_s) - 1; y1 = floor(ui_oy + (y + h)*ui_s) - 1;\n  gfx_rect(x0, y0, x1 - x0 + 1, 1); gfx_rect(x0, y1, x1 - x0 + 1, 1);\n  gfx_rect(x0, y0, 1, y1 - y0 + 1); gfx_rect(x1, y0, 1, y1 - y0 + 1);\n);\nfunction LN(x1, y1, x2, y2) ( gfx_line(ui_ox + x1*ui_s, ui_oy + y1*ui_s, ui_ox + x2*ui_s, ui_oy + y2*ui_s, 1); );\nfunction CI(x, y, r, f) ( gfx_circle(ui_ox + x*ui_s, ui_oy + y*ui_s, r*ui_s, f, 1); );\nfunction ARC(x, y, r, a0, a1) ( gfx_arc(ui_ox + x*ui_s, ui_oy + y*ui_s, r*ui_s, a0, a1, 1); );\n// text in a box; flags: 1 = center h, 2 = right, 4 = center v\nfunction TX(str, x, y, w, h, flags) (\n  // gfx_drawstr clips to (gfx_x, gfx_y, right, bottom): pad the box so glyphs are never cut\n  flags & 4 ? ( y -= 4; h += 8; ) : h += 5;\n  gfx_x = ui_ox + x*ui_s; gfx_y = ui_oy + y*ui_s;\n  gfx_drawstr(str, flags, ui_ox + (x + w)*ui_s, ui_oy + (y + h)*ui_s);\n);\nfunction font(n) ( gfx_setfont(n); );\n// The system's own typeface: San Francisco on macOS, Segoe UI on Windows, else Arial.\n// gfx_getfont names the face actually given back, so a missing font is caught, not guessed.\n// The Mac face is tried first: a system without it hands back a substitute either way.\nfunction pick_font() (\n  gfx_setfont(1, \".AppleSystemUIFont\", 13); gfx_getfont(#ui_got);\n  (matchi(\"*Apple*\", #ui_got) || matchi(\"*System*\", #ui_got) || matchi(\"*SF*\", #ui_got)) ?\n    strcpy(#ui_font, \".AppleSystemUIFont\") : (\n    gfx_setfont(1, \"Segoe UI\", 13); gfx_getfont(#ui_got);\n    matchi(\"Segoe UI*\", #ui_got) ? strcpy(#ui_font, \"Segoe UI\") : strcpy(#ui_font, \"Arial\");\n  );\n  ui_font_ok = 1;\n);\n// Sizes are logical pixels at scale 1 (Apple's macOS default is 13 pt, its minimum 10 pt).\nfunction setup_fonts(s) (\n  gfx_setfont(1, #ui_font, max(8, 12*s));\n  gfx_setfont(2, #ui_font, max(8, 11.5*s));\n  gfx_setfont(3, #ui_font, max(8, 13*s), 98);\n  gfx_setfont(4, #ui_font, max(10, 27*s), 98);\n  gfx_setfont(5, #ui_font, max(8, 13*s));\n  gfx_setfont(6, #ui_font, max(8, 11*s));\n);\nfunction inr(x, y, w, h) ( ui_mx >= x && ui_mx < x + w && ui_my >= y && ui_my < y + h; );\n\n// ---------------------------------------------------------------- text colours\n// Every line of text is at least 7:1 on what it sits on (Apple's target for small text in a\n// dark window); tools/test_render.py measures every string drawn. Disabled text is exempt.\nfunction c_text() ( col(0.92, 0.94, 0.97, 1); );   // body text\nfunction c_sec() ( col(0.69, 0.714, 0.753, 1); );  // secondary text #B0B6C0\nfunction c_dis() ( col(0.35, 0.37, 0.42, 1); );    // disabled labels only\n// Edges of controls and marks that carry meaning: #6D7581, 3.6:1 or more on every fill and\n// ground here (Apple's Accessibility page; WCAG's 3:1 for non-text). Hover lights them.\nfunction c_edge() ( col(0.427, 0.459, 0.506, 1); );\nfunction lin(c) ( c <= 0.04045 ? c/12.92 : ((c + 0.055)/1.055)^2.4; );\nfunction lum(r, g, b) ( 0.2126*lin(r) + 0.7152*lin(g) + 0.0722*lin(b); );\nPANEL_L = lum(0.105, 0.115, 0.14);\n// accent() sets a section's colour and a text tint of it (atr/atg/atb): the accent lightened\n// toward white until it reads 7.2:1 on a panel. Blue, pink and purple need it; teal does not.\nfunction accent(r, g, b) local(t) (\n  acr = r; acg = g; acb = b;\n  t = 0;\n  while ((lum(r + (1 - r)*t, g + (1 - g)*t, b + (1 - b)*t) + 0.05)/(PANEL_L + 0.05) < 7.2 && t < 1) ( t += 0.05; );\n  atr = r + (1 - r)*t; atg = g + (1 - g)*t; atb = b + (1 - b)*t;\n);\nfunction panel(x, y, w, h, title) (\n  col(0.105, 0.115, 0.14, 1); RF(x, y, w, h);\n  col(acr, acg, acb, 0.9); RF(x, y, w, 2);\n  col(0.2, 0.22, 0.26, 1); RO(x, y, w, h);\n  font(3); col(atr, atg, atb, 1); TX(title, x + 10, y + 8, w - 20, 16, 0);\n);\nfunction small_caption(str, x, y, w) (\n  font(6); c_sec(); TX(str, x, y, w, 12, 1);\n  col(0.28, 0.3, 0.35, 1); LN(x + 4, y + 14, x + w - 4, y + 14);\n);\n\n// ---------------------------------------------------------------- keyboard focus\n// Every control registers as it is drawn, so Tab moves through them in reading order. The list\n// keeps each control's place (logical, page offset included) for scrolling it into view and\n// for the tests. ids: parameters use their slider number; buttons 200+, tabs 300+.\nfunction focusable(id, kind, x, y, w, h) local(p) (\n  ui_fn < 128 ? (\n    p = FOCUSL + ui_fn*8;\n    p[0] = id; p[1] = kind; p[2] = x; p[3] = y + ui_ty; p[4] = w; p[5] = h;\n    ui_fn += 1;\n  );\n  ui_focus == id;\n);\n// near-white, never the accent, so it cannot be read as \"on\"\nfunction focus_ring(x, y, w, h) local(k, n, x0, y0, x1, y1) (\n  col(0.949, 0.957, 0.969, 1);\n  x0 = floor(ui_ox + (x - 4)*ui_s); y0 = floor(ui_oy + (y - 4)*ui_s);\n  x1 = floor(ui_ox + (x + w + 4)*ui_s); y1 = floor(ui_oy + (y + h + 4)*ui_s);\n  n = max(2, floor(2*ui_s + 0.5)); k = 0;\n  loop(n, gfx_roundrect(x0 + k, y0 + k, x1 - x0 - 2*k, y1 - y0 - 2*k, 5*ui_s); k += 1; );\n);\nfunction key_is(a, b) ( ui_key == a || ui_key == b; );\n// arrows nudge a value (Shift for finer), Delete or Backspace puts it back to its default\nfunction key_value(i) (\n  ui_focus == i && ui_key != 0 ? (\n    key_is('up', 'rght') || key_is('down', 'left') ? (\n      PSTEP[i] ? p_set(i, slider(i) + (key_is('up', 'rght') ? 1 : -1)) :\n        p_set(i, val_of(i, norm_of(i, slider(i)) + (key_is('up', 'rght') ? 1 : -1)*((mouse_cap & 8) ? 0.001 : 0.01)));\n      automate(i, 1); ui_key = 0;\n    ) : key_is('del', 8) ? (\n      p_set(i, PDEF[i]); automate(i, 1); ui_key = 0;\n    );\n  );\n);\nfunction key_press(id) ( ui_focus == id && key_is(13, 32) ? ( ui_key = 0; 1; ) : 0; );\n\n// a preset (p, 1-based) or a mutation (m, 1-based) is made next frame, with an undo point either side\nfunction ask_change(p, m) ( sliderchange(-1); ui_want_preset = p; ui_want_mutate = m; );\n\n// ---------------------------------------------------------------- mouse bookkeeping\nfunction begin_widget(i, hit) (\n  hit ? ( ui_hov = i; );\n  ui_click && hit && ui_drag == 0 ? (\n    // double click or ctrl/cmd click: reset to default\n    (ui_now - ui_last_click_t < 0.35 && ui_last_click_i == i) || (mouse_cap & 4) ? (\n      p_set(i, PDEF[i]); ui_drag = -1;\n    ) : (\n      ui_drag = i; ui_drag_y = ui_my; ui_drag_x = ui_mx; ui_drag_n = norm_of(i, slider(i));\n    );\n    ui_last_click_t = ui_now; ui_last_click_i = i;\n  );\n);\nfunction wheel_widget(i, hit) (\n  hit && mouse_wheel != 0 && ui_drag == 0 ? (\n    PSTEP[i] ? p_set(i, slider(i) + (mouse_wheel > 0 ? 1 : -1)*(PENUM[i] ? -1 : 1)) :\n               p_set(i, val_of(i, norm_of(i, slider(i)) + mouse_wheel/120*((mouse_cap & 8) ? 0.002 : 0.02)));\n    mouse_wheel = 0;\n  );\n);\n\n// ---------------------------------------------------------------- widgets\n// Buttons, menus, switches and bars are 28 tall with at least 12 between them; a knob is its\n// own shape (a 38 px dial in a 66 x 74 cell, hit area 56 x 72, 16 or more apart).\n// rotary knob, cell 66 x 74\nfunction knob(i, x, y, lbl) local(cx, cy, n, a0, a1, ac, hit, bip, px, py, r, sens, foc) (\n  cx = x + 33; cy = y + 22; r = 19;\n  hit = inr(x + 5, y, 56, 72);\n  foc = focusable(i, 1, x + 5, y, 56, 72);\n  foc ? ui_hov = i;\n  begin_widget(i, hit);\n  wheel_widget(i, hit);\n  key_value(i);\n  ui_drag == i ? (\n    sens = (mouse_cap & 8) ? 0.0006 : 0.005;\n    PSTEP[i] && PMAX[i] - PMIN[i] < 40 ? sens = 1/(PMAX[i] - PMIN[i] + 1)/14;\n    p_set(i, val_of(i, ui_drag_n + (ui_drag_y - ui_my)*sens));\n  );\n  n = clamp(norm_of(i, slider(i)), 0, 1);\n  bip = PMIN[i] < 0 && PMAX[i] > 0 && PUNIT[i] != 5;\n  a0 = -0.75*$pi; a1 = 0.75*$pi;\n  // track\n  col(0.2, 0.22, 0.26, 1);\n  ARC(cx, cy, r, a0, a1); ARC(cx, cy, r - 1, a0, a1); ARC(cx, cy, r - 2, a0, a1);\n  // value arc\n  ac = a0 + (a1 - a0)*n;\n  col(acr, acg, acb, hit || ui_drag == i ? 1 : 0.85);\n  bip ? (\n    ac < 0 ? ( ARC(cx, cy, r, ac, 0); ARC(cx, cy, r - 1, ac, 0); ARC(cx, cy, r - 2, ac, 0); ) :\n             ( ARC(cx, cy, r, 0, ac); ARC(cx, cy, r - 1, 0, ac); ARC(cx, cy, r - 2, 0, ac); );\n  ) : n > 0.002 ? ( ARC(cx, cy, r, a0, ac); ARC(cx, cy, r - 1, a0, ac); ARC(cx, cy, r - 2, a0, ac); );\n  // cap and pointer\n  col(0.15, 0.165, 0.2, 1); CI(cx, cy, r - 5, 1);\n  col(0.3, 0.33, 0.38, 1); CI(cx, cy, r - 5, 0);\n  px = cx + sin(ac)*(r - 6); py = cy - cos(ac)*(r - 6);\n  col(0.92, 0.94, 0.97, 1); LN(cx + sin(ac)*(r - 13), cy - cos(ac)*(r - 13), px, py);\n  // labels\n  font(6); c_sec(); TX(lbl, x - 4, y + 45, 74, 12, 1);\n  font(2);\n  hit || ui_drag == i || foc ? col(1, 1, 1, 1) : col(atr*0.5 + 0.5, atg*0.5 + 0.5, atb*0.5 + 0.5, 1);\n  TX(fmt_val(#kv, i), x - 6, y + 59, 78, 13, 1);\n  foc ? focus_ring(x + 5, y, 56, 72);\n);\n// dropdown box: Return or Space opens it, the arrows step through it\nfunction dropdown(i, x, y, w, h) local(hit, old, foc) (\n  old = slider(i);\n  hit = inr(x, y, w, h);\n  foc = focusable(i, 2, x, y, w, h);\n  hit || foc ? ui_hov = i;\n  foc && ui_key != 0 ? (\n    key_is('down', 'rght') ? ( p_set(i, slider(i) + 1); automate(i, 1); ui_key = 0; ) :\n    key_is('up', 'left') ? ( p_set(i, slider(i) - 1); automate(i, 1); ui_key = 0; ) :\n    key_is(13, 32) ? ( ui_open = i; ui_key = 0; );\n  );\n  col(0.07, 0.075, 0.09, 1); RF(x, y, w, h);\n  hit ? col(acr, acg, acb, 1) : c_edge(); RO(x, y, w, h);\n  font(5); c_text();\n  TX(list_item(#dd, PENUM[i], slider(i)), x + 6, y, w - 20, h, 4);\n  col(acr, acg, acb, 1);\n  gfx_triangle(ui_ox + (x + w - 13)*ui_s, ui_oy + (y + h*0.5 - 2)*ui_s, ui_ox + (x + w - 5)*ui_s, ui_oy + (y + h*0.5 - 2)*ui_s,\n               ui_ox + (x + w - 9)*ui_s, ui_oy + (y + h*0.5 + 3)*ui_s);\n  hit && mouse_wheel != 0 ? ( p_set(i, slider(i) + (mouse_wheel > 0 ? -1 : 1)); mouse_wheel = 0; );\n  (hit && ui_click) || ui_open == i ? (\n    gfx_x = ui_ox + x*ui_s; gfx_y = ui_oy + (y + h)*ui_s;\n    ui_res = gfx_showmenu(build_menu(#menu, PENUM[i], slider(i)));\n    ui_res > 0 ? ( p_set(i, ui_res - 1); automate(i, 1); );\n    ui_click = 0; ui_open = 0;\n  );\n  foc ? focus_ring(x, y, w, h);\n  slider(i) != old;\n);\n// segmented switch for an enum parameter. The chosen segment is filled and carries a bar\n// along its foot, so it is not told apart by colour alone.\nfunction segs(i, x, y, w, h) local(n, j, sw, hit, on, foc, v) (\n  n = PMAX[i] + 1; sw = w/n; j = 0;\n  foc = focusable(i, 3, x, y, w, h);\n  foc ? ui_hov = i;\n  foc && ui_key != 0 ? (\n    v = slider(i);\n    key_is('rght', 'down') ? ( p_set(i, min(v + 1, n - 1)); automate(i, 1); ui_key = 0; ) :\n    key_is('left', 'up') ? ( p_set(i, max(v - 1, 0)); automate(i, 1); ui_key = 0; ) :\n    key_is(13, 32) ? ( p_set(i, v + 1 >= n ? 0 : v + 1); automate(i, 1); ui_key = 0; );\n  );\n  loop(n,\n    hit = inr(x + j*sw, y, sw, h);\n    hit ? ui_hov = i;\n    on = slider(i) == j;\n    on ? col(acr*0.35, acg*0.35, acb*0.35, 1) : col(0.07, 0.075, 0.09, 1);\n    RF(x + j*sw, y, sw, h);\n    on ? ( col(acr, acg, acb, 1); RF(x + j*sw + 1, y + h - 4, sw - 2, 3); );\n    c_edge(); RO(x + j*sw, y, sw, h);\n    font(6); on || hit ? col(1, 1, 1, 1) : c_sec();\n    TX(list_item(#sg, PENUM[i], j), x + j*sw, y, sw, h, 5);\n    hit && ui_click ? ( p_set(i, j); ui_click = 0; );\n    j += 1;\n  );\n  foc ? focus_ring(x, y, w, h);\n);\n// horizontal bipolar bar (mod amounts). The fill is dim so the value reads over it; a bright\n// edge marks where it ends.\nfunction hbar(i, x, y, w, h) local(hit, n, cx, ex, foc) (\n  hit = inr(x, y, w, h);\n  foc = focusable(i, 4, x, y, w, h);\n  foc ? ui_hov = i;\n  begin_widget(i, hit);\n  wheel_widget(i, hit);\n  key_value(i);\n  ui_drag == i ? p_set(i, val_of(i, ui_drag_n + (ui_mx - ui_drag_x)/w*((mouse_cap & 8) ? 0.1 : 1)));\n  n = norm_of(i, slider(i));\n  col(0.07, 0.075, 0.09, 1); RF(x, y, w, h);\n  cx = x + w*0.5; ex = x + n*w;\n  col(acr, acg, acb, 0.4);\n  n >= 0.5 ? RF(cx, y + 2, (n - 0.5)*w, h - 4) : RF(ex, y + 2, (0.5 - n)*w, h - 4);\n  abs(n - 0.5) > 0.004 ? ( col(acr, acg, acb, 1); RF(n >= 0.5 ? ex - 2 : ex, y + 2, 2, h - 4); );\n  c_edge(); LN(cx, y, cx, y + h);\n  hit || ui_drag == i ? col(acr, acg, acb, 1) : c_edge(); RO(x, y, w, h);\n  font(6); c_text(); TX(fmt_val(#hb, i), x, y, w, h, 5);\n  foc ? focus_ring(x, y, w, h);\n);\n// a push button; returns 1 when clicked or pressed with Return or Space\nfunction button(id, str, hint, x, y, w, h) local(hit, foc) (\n  hit = inr(x, y, w, h);\n  foc = focusable(id, 5, x, y, w, h);\n  hit || foc ? ui_hint = hint;\n  col(hit ? 0.2 : 0.13, hit ? 0.22 : 0.145, hit ? 0.26 : 0.17, 1); RF(x, y, w, h);\n  col(acr, acg, acb, hit ? 1 : 0.8); RO(x, y, w, h);\n  font(3); c_text(); TX(str, x, y, w, h, 5);\n  foc ? focus_ring(x, y, w, h);\n  (hit && ui_click) || key_press(id) ? ( ui_click = 0; 1; ) : 0;\n);\n\n// ---------------------------------------------------------------- displays\nfunction draw_filter_curve(x, y, w, h) local(i, f, wv, re, im, a, b, mag, db, px, py, lpx, lpy, k, fcd) (\n  col(0.07, 0.075, 0.09, 1); RF(x, y, w, h);\n  col(0.18, 0.19, 0.23, 1);\n  f = 100; loop(3, px = x + w*log(f/20)/log(1000); LN(px, y, px, y + h); f *= 10; );\n  py = y + h*18/54; LN(x, py, x + w, py);\n  ftype < 5 ? (\n    fcd = max(ui_fc, 10); k = reso*0.01;\n    col(acr, acg, acb, 1);\n    i = 0;\n    loop(w/2 + 1,\n      f = 20*1000^(i*2/w);\n      wv = f/fcd;\n      ftype == 0 ? (\n        a = 1 - wv*wv; b = 2*wv;\n        re = a*a - b*b + k*3.9; im = 2*a*b;\n        mag = (1 + k*3.9*0.55)/sqrt(re*re + im*im);\n      ) : (\n        re = 1 - wv*wv; im = (2 - 1.96*k)*wv;\n        mag = ftype == 1 ? 1 : ftype == 2 ? (2 - 1.96*k)*wv : ftype == 3 ? wv*wv : abs(1 - wv*wv);\n        mag /= sqrt(re*re + im*im);\n      );\n      db = 20*log10(max(mag, 0.000001));\n      px = x + i*2; py = y + h*(18 - clamp(db, -36, 18))/54;\n      i > 0 ? LN(lpx, lpy, px, py);\n      lpx = px; lpy = py;\n      i += 1;\n    );\n  ) : (\n    font(6); c_sec(); TX(\"FILTER OFF\", x, y, w, h, 5);\n  );\n);\nfunction draw_scope(x, y, w, h) local(n, start, i, j, idx, v, px, py, lpx, lpy, per) (\n  col(0.06, 0.065, 0.08, 1); RF(x, y, w, h);\n  col(0.16, 0.17, 0.2, 1); LN(x, y + h*0.5, x + w, y + h*0.5);\n  per = srate/max(ui_f0, 20);\n  n = clamp(floor(per*2), 64, SCOPE_SIZE - per - 64);\n  // find a rising zero crossing one window + up to one period back\n  start = scope_pos - n - 2; start < 0 ? start += SCOPE_SIZE;\n  j = 0;\n  while (j < per && !(SCOPE[start] >= 0 && SCOPE[start > 0 ? start - 1 : SCOPE_SIZE - 1] < 0)) (\n    start -= 1; start < 0 ? start += SCOPE_SIZE; j += 1;\n  );\n  col(acr, acg, acb, 1);\n  i = 0;\n  loop(w,\n    idx = start + floor(i*n/w); idx >= SCOPE_SIZE ? idx -= SCOPE_SIZE;\n    v = clamp(SCOPE[idx], -1, 1);\n    px = x + i; py = y + h*0.5 - v*h*0.46;\n    i > 0 ? LN(lpx, lpy, px, py);\n    lpx = px; lpy = py;\n    i += 1;\n  );\n);\nfunction draw_throb(x, y, w, h) local(i, idx, v, bw) (\n  col(0.06, 0.065, 0.08, 1); RF(x, y, w, h);\n  bw = w/THROB_SIZE;\n  col(acr, acg, acb, 0.8);\n  i = 0;\n  loop(THROB_SIZE,\n    idx = throb_pos + i; idx >= THROB_SIZE ? idx -= THROB_SIZE;\n    v = clamp(THROB[idx], 0, 1);\n    RF(x + i*bw, y + h - v*h, max(bw, 1), v*h);\n    i += 1;\n  );\n);\nfunction draw_env(x, y, w, h, ia) local(a, d, s, r, tot, sx, px) (\n  col(0.07, 0.075, 0.09, 1); RF(x, y, w, h);\n  a = norm_of(ia, slider(ia)) + 0.02; d = norm_of(ia + 1, slider(ia + 1)) + 0.02;\n  s = slider(ia + 2)*0.01; r = norm_of(ia + 3, slider(ia + 3)) + 0.02;\n  tot = a + d + 0.6 + r; sx = w/tot;\n  col(acr, acg, acb, 1);\n  px = x;\n  LN(px, y + h - 2, px + a*sx, y + 2); px += a*sx;\n  LN(px, y + 2, px + d*sx, y + 2 + (h - 4)*(1 - s)); px += d*sx;\n  LN(px, y + 2 + (h - 4)*(1 - s), px + 0.6*sx, y + 2 + (h - 4)*(1 - s)); px += 0.6*sx;\n  LN(px, y + 2 + (h - 4)*(1 - s), px + r*sx, y + h - 2);\n);\nfunction draw_lfo(x, y, w, h, shape) local(i, p, v, px, py, lpx, lpy) (\n  col(0.07, 0.075, 0.09, 1); RF(x, y, w, h);\n  col(acr, acg, acb, 1);\n  i = 0;\n  loop(w + 1,\n    p = frac(i/w*2);\n    v = shape == 0 ? sin(2*$pi*p) : shape == 1 ? 1 - 4*abs(p - 0.5) : shape == 2 ? p + p - 1 :\n        shape == 3 ? 1 - p - p : shape == 4 ? (p < 0.5 ? 1 : -1) :\n        shape == 5 ? (floor(i/w*8) % 3)*0.8 - 0.8 : sin(i/w*9.7)*cos(i/w*4.1);\n    px = x + i; py = y + h*0.5 - v*(h*0.5 - 3);\n    i > 0 ? LN(lpx, lpy, px, py);\n    lpx = px; lpy = py;\n    i += 1;\n  );\n);\n\n// ================================================================ presets\nPRESETS = \"Init \u00e2\u0080\u0094 Classic Dual Saw|Saunderson \u00e2\u0080\u009988 (CZ)|Terrorist Jungle|Mutant Techstep|Neuro Double Notch|Liquid Roller|Garage PWM|FM Growl|Sync Scream|Filter-Method Reese|Cross-Fold Mod|Yoi Talker|Tempo-Locked Throb|Barberpole Shift|Bitcrushed Sampler|Burial Rumble|Wide Unison Wall|Hoover Reese|Ring-Mod Metal|Talking Flanger\";\nNUM_PRESETS = enum_count(PRESETS);\nfunction pv(i, v) ( p_put(i, v); );\nfunction mod(slot, msrcv, dst, amt) ( pv(83 + slot*3, msrcv); pv(84 + slot*3, dst); pv(85 + slot*3, amt); );\nfunction load_preset(n) local(i) (\n  PDEF[6] = ENGDEF[0]; PDEF[7] = ENGDEF[1]; PDEF[8] = ENGDEF[2];\n  i = 1; loop(100, p_put(i, PDEF[i]); i += 1; );\n  n == 1 ? (\n    pv(81, -5.5);\n    pv(1, 3); pv(2, 14); pv(6, 35); pv(7, 0); pv(8, 100); pv(22, 420); pv(23, 10); pv(25, 30);\n    pv(75, 60); pv(27, 3); pv(30, 150); pv(12, 20); pv(11, 15); pv(69, 20);\n    pv(32, 600); pv(33, 20); mod(1, 3, 5, 30);\n  ) : n == 2 ? (\n    pv(81, -7.5);\n    pv(2, 26); pv(22, 380); pv(23, 18); pv(24, 25); pv(15, 50); pv(66, 2.5); pv(65, 12);\n    pv(67, 60); pv(75, 90); pv(12, 25);\n  ) : n == 3 ? (\n    pv(81, -7.0);\n    pv(2, 34); pv(22, 1400); pv(23, 20); pv(47, 5); pv(48, 55); pv(49, 70); pv(15, 40); pv(20, 90);\n    pv(52, 1); pv(53, 900); pv(54, 60); pv(55, 3); pv(56, 60);\n  ) : n == 4 ? (\n    pv(81, -7.0);\n    pv(1, 1); pv(6, 30); pv(7, 20); pv(8, 60); pv(2, 45); pv(22, 3200); pv(23, 10);\n    pv(48, 45); pv(52, 1); pv(53, 700); pv(54, 80); pv(55, 6); pv(56, 75); pv(57, 30);\n    pv(68, 60); pv(15, 70); pv(20, 120); pv(72, 130); pv(73, 150);\n  ) : n == 5 ? (\n    pv(81, -4.0);\n    pv(6, 33.4); pv(7, 20); pv(2, 12); pv(22, 220); pv(23, 25); pv(25, 50); pv(24, 15);\n    pv(35, 1); pv(36, 1); pv(38, 9); mod(0, 1, 1, 12); pv(69, 50); pv(75, 200);\n  ) : n == 6 ? (\n    pv(81, -7.5);\n    pv(1, 2); pv(2, 25); pv(6, 60); pv(7, 20); pv(8, 70); pv(22, 900); pv(23, 20); pv(75, 50);\n    pv(74, 1); pv(27, 2); pv(28, 250); pv(29, 70); pv(30, 80); pv(15, 50);\n  ) : n == 7 ? (\n    pv(81, -7.0);\n    pv(1, 4); pv(6, 45); pv(7, 20); pv(8, 30); pv(2, 20); pv(22, 2000);\n    pv(35, 0); pv(36, 1); pv(38, 9); mod(0, 1, 5, 40); pv(47, 1); pv(48, 40); pv(68, 30);\n    pv(15, 45); pv(20, 80);\n  ) : n == 8 ? (\n    pv(81, -9.0);\n    pv(1, 5); pv(6, 30); pv(7, 0); pv(8, 30); pv(2, 25); pv(32, 700); pv(33, 20);\n    mod(1, 3, 5, 50); pv(22, 3500); pv(23, 15); pv(47, 2); pv(48, 35); pv(52, 2); pv(55, 3);\n    pv(15, 50); pv(20, 100);\n  ) : n == 9 ? (\n    pv(81, -3.0);\n    pv(1, 6); pv(2, 25); pv(6, 60); pv(7, 50); pv(8, 60); pv(9, 2); pv(22, 1800); pv(23, 10); pv(11, 60);\n  ) : n == 10 ? (\n    pv(81, -6.5);\n    pv(1, 7); pv(6, 40); pv(7, 60); pv(8, 50); pv(2, 18); pv(22, 2500); pv(23, 5);\n    mod(2, 6, 5, 50); pv(15, 40); pv(20, 80);\n  ) : n == 11 ? (\n    pv(81, -6.0);\n    pv(2, 40); pv(22, 5000); pv(23, 0); pv(60, 100); pv(59, 20); pv(35, 1); pv(36, 1); pv(38, 6);\n    mod(0, 1, 12, 45); pv(48, 50); pv(68, 40); pv(15, 60); pv(20, 100);\n  ) : n == 12 ? (\n    pv(81, -6.0);\n    pv(3, 2); pv(5, 9); pv(22, 700); pv(23, 25); mod(5, 10, 1, 25); pv(15, 40);\n  ) : n == 13 ? (\n    pv(81, -2.5);\n    pv(1, 1); pv(6, 30); pv(61, 3); pv(62, 50); pv(22, 2000); pv(11, 50); pv(15, 40); pv(20, 80);\n  ) : n == 14 ? (\n    pv(81, -6.0);\n    pv(2, 28); pv(65, 8); pv(66, 3.3); pv(67, 100); pv(22, 900); pv(12, 40); pv(24, 30);\n  ) : n == 15 ? (\n    pv(81, -4.0);\n    pv(2, 10); pv(22, 260); pv(23, 10); pv(15, 30); pv(65, 10); pv(66, 1.5); pv(67, 40);\n    pv(69, 35); pv(12, 50); pv(27, 60); pv(30, 900); pv(41, 6); mod(3, 2, 1, 15);\n  ) : n == 16 ? (\n    pv(81, -6.5);\n    pv(9, 4); pv(10, 40); pv(11, 80); pv(2, 30); pv(22, 2500); pv(73, 180); pv(20, 80);\n    pv(15, 60); pv(69, 30); pv(72, 150);\n  ) : n == 17 ? (\n    pv(81, -6.0);\n    pv(1, 2); pv(6, 80); pv(2, 35); pv(8, 100); pv(9, 3); pv(10, 60); pv(22, 3000); pv(75, 150);\n    pv(31, 1); pv(32, 150); pv(33, 0); mod(1, 3, 4, -8); pv(76, 1);\n  ) : n == 18 ? (\n    pv(81, -4.0);\n    pv(63, 1.5); pv(64, 60); pv(22, 1500); pv(15, 50); pv(20, 100);\n  ) : n == 19 ? (\n    pv(81, -2.5);\n    pv(52, 3); pv(53, 300); pv(54, 70); pv(55, 3); pv(56, 80); pv(22, 2200);\n  );\n  cur_preset = n; preset_edited = 0;\n);\n\n// ================================================================ mutate\nfunction rnd(a, b) ( a + rand(1)*(b - a); );\nfunction chance(p) ( rand(1) < p; );\nfunction mutate(mode) local(i, s) (\n  mode == 0 || mode == 3 ? (                                   // engine\n    pv(1, floor(rand(8))); pv(6, rnd(0, 100)); pv(7, rnd(0, 100)); pv(8, rnd(20, 100));\n    pv(2, rnd(8, 60)); pv(9, chance(0.6) ? 1 : floor(rnd(2, 5))); pv(10, rnd(10, 60));\n    pv(11, rnd(10, 70)); pv(12, rnd(0, 50));\n  );\n  mode == 1 || mode == 3 ? (                                   // mangle + movement\n    pv(60, chance(0.4) ? rnd(40, 100) : 0); pv(59, rnd(0, 100));\n    pv(62, chance(0.25) ? rnd(20, 70) : 0); pv(61, rnd(-1, 1)^3*300);\n    pv(64, chance(0.25) ? rnd(20, 80) : 0); pv(63, chance(0.5) ? 0.5*floor(rnd(1, 7)) : rnd(0.25, 4));\n    chance(0.3) ? ( pv(65, rnd(4, 12)); pv(66, rnd(1, 6)); pv(67, rnd(30, 100)); ) : ( pv(65, 16); pv(66, 1); );\n    pv(68, chance(0.5) ? rnd(0, 70) : 0);\n    pv(52, chance(0.7) ? floor(rnd(1, 4)) : 0); pv(53, 2^rnd(7, 12)); pv(54, rnd(20, 90));\n    pv(55, floor(rnd(2, 13))); pv(56, rnd(10, 85)); pv(57, rnd(0, 60));\n    pv(47, floor(rand(6))); pv(48, rnd(0, 70)); pv(49, rnd(50, 100));\n  );\n  mode == 2 || mode == 3 ? (                                   // modulation\n    pv(35, floor(rand(7))); pv(36, 1); pv(38, floor(rnd(3, 13))); pv(41, floor(rand(7)));\n    pv(43, 2^rnd(-3, 3)); pv(32, 2^rnd(6, 11));\n    i = 0;\n    loop(4,\n      mod(i, floor(rnd(1, 11)), chance(0.7) ? floor(rnd(1, 16)) : 0, rnd(-60, 60));\n      i += 1;\n    );\n  );\n  mode == 3 ? ( pv(22, 2^rnd(8, 12)); pv(23, rnd(0, 50)); );\n  mode == 4 ? (                                                // nudge everything a little\n    i = 1;\n    loop(82,\n      !PSTEP[i] && i != 81 && i != 14 && i != 15 ? pv(i, val_of(i, norm_of(i, slider(i)) + rnd(-0.06, 0.06)));\n      i += 1;\n    );\n  );\n  preset_edited = 1;\n);\n\ngfx_ext_retina = 1;\nui_drag = 0; ui_page = 0; cur_preset = 0; preset_edited = 0; preset_loaded_once = 0;\n\n@slider\nupdate_params();\n\n@block\n(ui_dirty || srate != last_srate) ? ( ui_dirty = 0; update_params(); );\nmq_n = 0; mq_i = 0; spl_ctr = 0;\nwhile (midirecv(mofs, m1, m2, m3)) (\n  mq_n < 2000 ? (\n    MQ[mq_n*4] = mofs; MQ[mq_n*4 + 1] = m1; MQ[mq_n*4 + 2] = m2; MQ[mq_n*4 + 3] = m3;\n    mq_n += 1;\n  );\n);\nqn_per_s = tempo/60;\nbeat_position_now = beat_position;\n// transport lock for tempo-synced LFOs / movement\nplaying = play_state & 1;\nplaying ? (\n  l1sync && !l1trig ? lfo1.ph = frac(beat_position/BEATS[l1div]);\n  l2sync && !l2trig ? lfo2.ph = frac(beat_position/BEATS[l2div]);\n  mv_ph = frac(beat_position/BEATS[mvrate]);\n);\n\n@sample\n// ------------------------------------------------ MIDI due at this sample\nwhile (mq_i < mq_n && MQ[mq_i*4] <= spl_ctr) (\n  handle_midi(MQ[mq_i*4 + 1], MQ[mq_i*4 + 2], MQ[mq_i*4 + 3]);\n  mq_i += 1;\n);\nspl_ctr += 1;\nbeat_position_now += qn_per_s*isr;\n\n// ------------------------------------------------ modulation sources\naenv = aenv_o.env_tick(a_ca, a_cd, asus_n, a_cr);\nmenv = menv_o.env_tick(m_ca, m_cd, msus_n, m_cr);\nnote_time += isr;\nr1 = (l1sync ? qn_per_s/BEATS[l1div] : l1rate)*2^(MODV[23]*3);\nr2 = (l2sync ? qn_per_s/BEATS[l2div] : l2rate)*2^(MODV[24]*3);\nlfo1v = lfo1.lfo_tick(l1shape, r1);\nlfo2v = lfo2.lfo_tick(l2shape, r2);\nl1fade > 0 ? lfo1v *= min(1, note_time*1000/l1fade);\nl2fade > 0 ? lfo2v *= min(1, note_time*1000/l2fade);\nSRC[1] = lfo1v; SRC[2] = lfo2v; SRC[3] = menv; SRC[4] = aenv; SRC[5] = vel;\nSRC[6] = modwheel; SRC[7] = aftertouch; SRC[8] = clamp((cur_pitch - 48)/24, -1, 1);\nSRC[9] = note_rnd; SRC[10] = cos(2*$pi*beat_ph);\nmi = 0; loop(n_mod, MODV[MDST[mi]] = 0; mi += 1; );\nmi = 0; loop(n_mod, MODV[MDST[mi]] += SRC[MSRC[mi]]*MAMT[mi]; mi += 1; );\n\n// ------------------------------------------------ smoothed parameters\nsm_lcut += (lcut_target - sm_lcut)*smc;\nsm_det += (det - sm_det)*smc;\nsm_beathz += (beathz - sm_beathz)*smc;\nsm_a += (enga - sm_a)*smc; sm_b += (engb - sm_b)*smc; sm_c += (engc - sm_c)*smc;\nsm_vol += (vol_target - sm_vol)*smc;\n\n// ------------------------------------------------ pitch\ncur_pitch += (tgt_pitch - cur_pitch)*gcoef;\npitch = cur_pitch + octave*12 + bend_v*bendr + MODV[4]*24;\nf0 = 440*2^((pitch - 69)/12);\n\n// ------------------------------------------------ detune / beat\ndetmode == 0 ? (\n  dc = sm_det + MODV[3]*100;\n  beat_eff = f0*(2^(dc/1200) - 1);\n) : (\n  bhz = (detmode == 1 ? sm_beathz : qn_per_s/BEATS[beatdiv]) + MODV[3]*10;\n  beat_eff = bhz;\n);\nbeat_ph += beat_eff*isr; beat_ph -= floor(beat_ph);\n\nea = clamp(sm_a + MODV[5]*100, 0, 100)*0.01;\neb = clamp(sm_b + MODV[6]*100, 0, 100)*0.01;\nec = clamp(sm_c + MODV[7]*100, 0, 100)*0.01;\nus_eff = clamp(uspread + MODV[16]*100, 0, 100)*0.6;\nsp_eff = clamp(spread + MODV[17]*100, 0, 100)*0.01;\nabs(sp_eff - last_spread) > 0.0005 ? ( update_pans(sp_eff); last_spread = sp_eff; );\n\n// ------------------------------------------------ engine parameters\ng0 = 1; g1 = 1; detscale = 1;\neng == 0 ? (\n  morph = ea; interval = INTV[floor(eb*7.999)];\n  g0 = min(1, 2 - ec - ec); g1 = min(1, ec + ec);\n) : eng == 1 ? (\n  ss_curve = 1 + eb*2;\n) : eng == 2 ? (\n  detscale = 0; g1 = ec;\n  pw0 = clamp(0.5 - eb*0.45 + ea*0.45*tri(beat_ph), 0.03, 0.97);\n  pw1 = clamp(0.5 - eb*0.45 + ea*0.45*tri(frac(beat_ph + 0.25)), 0.03, 0.97);\n) : eng == 3 ? (\n  cz_d = ea*0.98; cz_w = floor(eb*5.999); g1 = ec;\n) : eng == 4 ? (\n  fm_idx = ea*8; fm_ratio = FMR[floor(eb*5.999)]; fm_fb = ec*1.4;\n) : eng == 5 ? (\n  sy_ratio = 1 + ea*7; sy_morph = eb; sy_mix = ec;\n) : eng == 6 ? (\n  detscale = 0;\n  ph_fb = eb*0.85;\n  ph_stages = 2*(1 + floor(ec*5.999));\n  tl = tri(beat_ph); tr = tri(frac(beat_ph + sp_eff*0.25));\n  fcl = f0*2^(1 + (tl + 1)*ea*2.5); fcr = f0*2^(1 + (tr + 1)*ea*2.5);\n  tl = tan($pi*clamp(fcl, 20, fs_os*0.45)*isr_os); ph_al = (tl - 1)/(tl + 1);\n  tr = tan($pi*clamp(fcr, 20, fs_os*0.45)*isr_os); ph_ar = (tr - 1)/(tr + 1);\n) : (\n  fo_gain = 1 + ea*7; fo_xm = eb; fo_sym = (ec - 0.5);\n);\n\n// ------------------------------------------------ per-oscillator frequencies\ndrift_ctr -= 1;\ndrift_ctr <= 0 ? (\n  drift_ctr = floor(srate*0.35);\n  k = 0; loop(nosc, O_DTGT[k] = rand(2) - 1; k += 1; );\n);\ndrift_c = drift*0.12;\nsumsq = 0;\nk = 0;\nloop(nosc,\n  O_DRIFT[k] += (O_DTGT[k] - O_DRIFT[k])*drift_k;\n  pos = O_POSR[k];\n  eng == 1 ? pos = (pos < 0 ? -1 : 1)*abs(pos)^ss_curve;\n  pos *= detscale;\n  cents = O_UNI[k]*us_eff*0.5 + O_DRIFT[k]*drift_c + (eng == 0 && O_SLOT[k] == 1 ? interval*100 : 0);\n  detmode == 0 ? (\n    fk = f0*exp((pos*dc*0.5 + cents)*0.0005776226504666211);\n  ) : (\n    fk = max(f0 + pos*bhz*0.5, 1)*exp(cents*0.0005776226504666211);\n  );\n  O_DT[k] = min(fk*isr_os, 0.45);\n  eng == 4 ? O_DT2[k] = min(f0*fm_ratio*exp(cents*0.0005776226504666211)*isr_os, 0.45) :\n  eng == 5 ? O_DT2[k] = min(O_DT[k]*sy_ratio, 0.45) :\n  eng == 7 ? (\n    detmode == 0 ? fk = f0*exp((-pos*dc*0.5 + cents)*0.0005776226504666211) :\n                   fk = max(f0 - pos*bhz*0.5, 1)*exp(cents*0.0005776226504666211);\n    O_DT2[k] = min(fk*isr_os, 0.45);\n  );\n  lv = eng == 1 ? 1 + (ec - 1)*abs(O_POSR[k]) : (O_SLOT[k] == 0 ? g0 : g1);\n  O_FB[k + 32] = lv;\n  sumsq += lv*lv;\n  k += 1;\n);\nnorm = osc_gain*0.9/sqrt(max(sumsq, 0.25));\n\n// ------------------------------------------------ filter / drive coefficients\nfc = 2^(sm_lcut + fkey*0.01*(pitch - 48)/12 + fenv*0.06*menv + MODV[1]*6);\ncalc_filter(fc, clamp(reso + MODV[2]*100, 0, 100)*0.01);\nfdv = clamp(fdrive + MODV[8]*100, 0, 100);\nfdrv_on = fdv > 0.05;\nfdg = 1 + fdv*0.07; fdg_out = fdg^(-0.25);\nddv = clamp(ddrive + MODV[9]*100, 0, 100);\ndist_on = ddv > 0.05;\nd_gain = db2g(ddv*0.36);\nnoise_on = noiselvl > 0 || MODV[22] != 0;\nn_lvl = clamp(noiselvl + MODV[22]*100, 0, 100)*0.006;\n\n// ------------------------------------------------ oscillators (oversampled)\nvoice_on = aenv_o.st > 0;\n!voice_on && voice_was_on ? voice_reset();\nvoice_was_on = voice_on;\nvoice_on ? (\n  loop(os,\n    sl = 0; sr = 0; k = 0;\n    eng == 0 ? (\n      loop(nosc,\n        dt = O_DT[k]; ph = O_PH[k] + dt; ph >= 1 ? ph -= 1; O_PH[k] = ph;\n        y = (O_SLOT[k] < 0.5 ? ph + ph - 1 - blep(ph, dt) : wave_morph(ph, dt, morph))*O_FB[k + 32];\n        sl += y*O_GL[k]; sr += y*O_GR[k];\n        k += 1;\n      );\n    ) : eng == 1 ? (\n      loop(nosc,\n        dt = O_DT[k]; ph = O_PH[k] + dt; ph >= 1 ? ph -= 1; O_PH[k] = ph;\n        y = (ph + ph - 1 - blep(ph, dt))*O_FB[k + 32];\n        sl += y*O_GL[k]; sr += y*O_GR[k];\n        k += 1;\n      );\n    ) : eng == 2 ? (\n      loop(nosc,\n        dt = O_DT[k]; ph = O_PH[k] + dt; ph >= 1 ? ph -= 1; O_PH[k] = ph;\n        y = pulse(ph, dt, O_SLOT[k] < 0.5 ? pw0 : pw1)*O_FB[k + 32];\n        sl += y*O_GL[k]; sr += y*O_GR[k];\n        k += 1;\n      );\n    ) : eng == 3 ? (\n      loop(nosc,\n        dt = O_DT[k]; ph = O_PH[k] + dt; ph >= 1 ? ph -= 1; O_PH[k] = ph;\n        y = cz_wave(ph, dt, cz_d, cz_w)*O_FB[k + 32];\n        sl += y*O_GL[k]; sr += y*O_GR[k];\n        k += 1;\n      );\n    ) : eng == 4 ? (\n      loop(nosc,\n        ph = O_PH[k] + O_DT[k]; ph >= 1 ? ph -= 1; O_PH[k] = ph;\n        ph2 = O_PH2[k] + O_DT2[k]; ph2 >= 1 ? ph2 -= 1; O_PH2[k] = ph2;\n        m = sin(2*$pi*ph2 + fm_fb*O_FB[k]);\n        O_FB[k] = m;\n        y = sin(2*$pi*ph + fm_idx*m)*O_FB[k + 32];\n        sl += y*O_GL[k]; sr += y*O_GR[k];\n        k += 1;\n      );\n    ) : eng == 5 ? (\n      loop(nosc,\n        dt = O_DT[k]; ph = O_PH[k] + dt;\n        dt2 = O_DT2[k]; ph2 = O_PH2[k] + dt2;\n        ph >= 1 ? ( ph -= 1; ph2 = ph*(dt2/dt); ) : ( ph2 >= 1 ? ph2 -= floor(ph2); );\n        O_PH[k] = ph; O_PH2[k] = ph2;\n        y = ph2 + ph2 - 1;\n        sy_morph > 0 ? y += ((ph2 < 0.5 ? 1 : -1) - y)*sy_morph;\n        y += sy_mix*(ph + ph - 1 - blep(ph, dt));\n        y *= O_FB[k + 32]*0.8;\n        sl += y*O_GL[k]; sr += y*O_GR[k];\n        k += 1;\n      );\n    ) : eng == 6 ? (\n      loop(nosc,\n        dt = O_DT[k]; ph = O_PH[k] + dt; ph >= 1 ? ph -= 1; O_PH[k] = ph;\n        y = (ph + ph - 1 - blep(ph, dt))*O_FB[k + 32];\n        sl += y*O_GL[k]; sr += y*O_GR[k];\n        k += 1;\n      );\n    ) : (\n      loop(nosc,\n        ph = O_PH[k] + O_DT[k]; ph >= 1 ? ph -= 1; O_PH[k] = ph;\n        ph2 = O_PH2[k] + O_DT2[k]; ph2 >= 1 ? ph2 -= 1; O_PH2[k] = ph2;\n        y = sin(2*$pi*ph)*fo_gain*(1 + fo_xm*sin(2*$pi*ph2));\n        y = sin((y + fo_sym)*1.5707963)*O_FB[k + 32];\n        sl += y*O_GL[k]; sr += y*O_GR[k];\n        k += 1;\n      );\n    );\n    sl *= norm; sr *= norm;\n    eng == 6 ? ( sl = eng_phaser(sl, PHS_L, ph_al); sr = eng_phaser(sr, PHS_R, ph_ar); );\n    noise_on ? (\n      nw = rand(2) - 1; n_sl += (nw - n_sl)*n_c; sl += (n_lpmode ? n_sl : nw - n_sl)*n_lvl;\n      nw = rand(2) - 1; n_sr += (nw - n_sr)*n_c; sr += (n_lpmode ? n_sr : nw - n_sr)*n_lvl;\n    );\n    dist_on && dpos == 1 ? ( sl = dsl.dist(sl); sr = dsr.dist(sr); );\n    ftype < 5 ? ( sl = fl.filt(sl); sr = fr.filt(sr); );\n    dist_on && dpos == 0 ? ( sl = dsl.dist(sl); sr = dsr.dist(sr); );\n    os == 2 ? ( sl = decl.dec2(sl); sr = decr.dec2(sr); ) :\n    os == 4 ? ( sl = decl.dec4(sl); sr = decr.dec4(sr); );\n  );\n) : ( sl = sr = 0; );\n\n// ------------------------------------------------ DC blocker + VCA\ndcy_l = sl - dcx_l + dc_r*dcy_l; dcx_l = sl;\ndcy_r = sr - dcx_r + dc_r*dcy_r; dcx_r = sr;\nvelg += (1 - velsens*0.01*(1 - vel) - velg)*vel_c;\nvca = aenv*velg*clamp(1 + MODV[19], 0, 2);\nxl = dcy_l*vca; xr = dcy_r*vca;\n\n// ------------------------------------------------ MANGLE: formant\nfm_eff = fmix*0.01;\nfm_eff > 0 ? (\n  sm_vowel += (clamp(vowel + MODV[12]*100, 0, 100) - sm_vowel)*smc;\n  vp = sm_vowel*0.03999; vi = floor(vp); vf = vp - vi;\n  vi = FORMT + vi*6;\n  ff1 = vi[0] + (vi[6] - vi[0])*vf; ff2 = vi[1] + (vi[7] - vi[1])*vf; ff3 = vi[2] + (vi[8] - vi[2])*vf;\n  fg1 = vi[3] + (vi[9] - vi[3])*vf; fg2 = vi[4] + (vi[10] - vi[4])*vf; fg3 = vi[5] + (vi[11] - vi[5])*vf;\n  fo1l.svf_set(ff1, 0.12); fo1r.svf_same();\n  fo2l.svf_set(ff2, 0.1); fo2r.svf_same();\n  fo3l.svf_set(ff3, 0.08); fo3r.svf_same();\n  fo1l.svf(xl); fo2l.svf(xl); fo3l.svf(xl);\n  fo1r.svf(xr); fo2r.svf(xr); fo3r.svf(xr);\n  wl = (fo1l.bp*0.12*fg1 + fo2l.bp*0.1*fg2 + fo3l.bp*0.08*fg3)*3.5;\n  wr = (fo1r.bp*0.12*fg1 + fo2r.bp*0.1*fg2 + fo3r.bp*0.08*fg3)*3.5;\n  xl += (wl - xl)*fm_eff; xr += (wr - xr)*fm_eff;\n);\n// ------------------------------------------------ MANGLE: ring mod (key tracked)\nringmix > 0 ? (\n  ring_ph += f0*clamp(ring*2^(MODV[14]*3), 0.05, 32)*isr; ring_ph -= floor(ring_ph);\n  rc = sin(2*$pi*ring_ph);\n  xl += (xl*rc - xl)*ringmix*0.01; xr += (xr*rc - xr)*ringmix*0.01;\n);\n// ------------------------------------------------ MANGLE: frequency shifter\nshmix > 0 ? (\n  sm_shift += (clamp(fshift + MODV[13]*1000, -2000, 2000) - sm_shift)*smc;\n  sh_ph += sm_shift*isr; sh_ph -= floor(sh_ph);\n  shc = cos(2*$pi*sh_ph); shs = sin(2*$pi*sh_ph);\n  re = hilbert(xl, HIL_L); wl = re*shc - hil_im*shs;\n  re = hilbert(xr, HIL_R); wr = re*shc - hil_im*shs;\n  xl += (wl - xl)*shmix*0.01; xr += (wr - xr)*shmix*0.01;\n);\n// ------------------------------------------------ MANGLE: bit crush / downsample\n(crush_on || MODV[15] != 0) && cmix > 0 ? (\n  cb = clamp(bits - MODV[15]*14, 1, 16);\n  cq = 2^(cb - 1);\n  cr_acc += 1;\n  cr_acc >= downs ? (\n    cr_acc -= downs;\n    cr_hl = floor(xl*cq + 0.5)/cq; cr_hr = floor(xr*cq + 0.5)/cq;\n  );\n  xl += (cr_hl - xl)*cmix*0.01; xr += (cr_hr - xr)*cmix*0.01;\n);\n\n// ------------------------------------------------ MOVEMENT\nmv_ph += qn_per_s/BEATS[mvrate]*isr; mv_ph -= floor(mv_ph);\nmvtype > 0 ? (\n  sm_mvf += (mvf_target - sm_mvf)*smc;\n  mvm = clamp(mvmix + MODV[11]*100, 0, 100)*0.01;\n  mtl = tri(mv_ph); mtr = tri(frac(mv_ph + mvstereo*0.005));\n  mfl = 2^(sm_mvf + mtl*mvdepth*0.02 + MODV[10]*5);\n  mfr = 2^(sm_mvf + mtr*mvdepth*0.02 + MODV[10]*5);\n  mvtype == 1 ? (\n    mk = 2 - mvreso*0.019;\n    mn1l.svf_set(mfl, mk); mn2l.svf_set(mfl*2, mk);\n    mn1r.svf_set(mfr, mk); mn2r.svf_set(mfr*2, mk);\n    mn1l.svf(xl); wl = mn1l.lp + mn1l.hp; mn2l.svf(wl); wl = mn2l.lp + mn2l.hp;\n    mn1r.svf(xr); wr = mn1r.lp + mn1r.hp; mn2r.svf(wr); wr = mn2r.lp + mn2r.hp;\n  ) : mvtype == 2 ? (\n    tl = tan($pi*clamp(mfl, 20, srate*0.45)*isr); mal = (tl - 1)/(tl + 1);\n    tr = tan($pi*clamp(mfr, 20, srate*0.45)*isr); mar = (tr - 1)/(tr + 1);\n    mfbk = mvreso*0.0085;\n    wl = xl + mph_fbl*mfbk; wr = xr + mph_fbr*mfbk;\n    i = 0;\n    loop(6,\n      v = mal*wl + MPH_L[i]; MPH_L[i] = wl - mal*v; wl = v;\n      v = mar*wr + MPH_R[i]; MPH_R[i] = wr - mar*v; wr = v;\n      i += 1;\n    );\n    mph_fbl = wl; mph_fbr = wr;\n    wl = 0.5*(xl + wl); wr = 0.5*(xr + wr);\n  ) : (\n    mfbk = mvreso*0.0092;\n    dl = clamp(srate/mfl, 2, FLB_SIZE - 4); dr = clamp(srate/mfr, 2, FLB_SIZE - 4);\n    tl = dread(FLB_L, FLB_SIZE, fl_pos, dl); tr = dread(FLB_R, FLB_SIZE, fl_pos, dr);\n    FLB_L[fl_pos] = xl + tl*mfbk; FLB_R[fl_pos] = xr + tr*mfbk;\n    fl_pos += 1; fl_pos >= FLB_SIZE ? fl_pos = 0;\n    wl = 0.5*(xl + tl); wr = 0.5*(xr + tr);\n  );\n  xl += (wl - xl)*mvm; xr += (wr - xr)*mvm;\n);\n\n// ------------------------------------------------ SQUASH (3-band up/down compressor)\nsquash > 0 ? (\n  sq_l1.svf(xl); sq_l2.svf(sq_l1.lp); bl_l = sq_l2.lp; rl = xl - bl_l;\n  sq_r1.svf(xr); sq_r2.svf(sq_r1.lp); bl_r = sq_r2.lp; rr = xr - bl_r;\n  sq_m1.svf(rl); sq_m2.svf(sq_m1.lp); bm_l = sq_m2.lp; bh_l = rl - bm_l;\n  sq_m3.svf(rr); sq_m4.svf(sq_m3.lp); bm_r = sq_m4.lp; bh_r = rr - bm_r;\n  e = max(abs(bl_l), abs(bl_r)); sq_el += (e - sq_el)*(e > sq_el ? sq_att : sq_rel);\n  e = max(abs(bm_l), abs(bm_r)); sq_em += (e - sq_em)*(e > sq_em ? sq_att : sq_rel);\n  e = max(abs(bh_l), abs(bh_r)); sq_eh += (e - sq_eh)*(e > sq_eh ? sq_att : sq_rel);\n  sqd = squash*0.007;\n  gl_ = clamp((0.3/(sq_el + 0.0001))^sqd, 0.2, 6);\n  gm_ = clamp((0.2/(sq_em + 0.0001))^sqd, 0.2, 8);\n  gh_ = clamp((0.12/(sq_eh + 0.0001))^sqd, 0.2, 10);\n  xl = bl_l*gl_ + bm_l*gm_ + bh_l*gh_;\n  xr = bl_r*gl_ + bm_r*gm_ + bh_r*gh_;\n);\n\n// ------------------------------------------------ Reese low cut (for sub layering)\nlowcut > 0 ? (\n  lc1.svf(xl); lc2.svf(lc1.hp); xl = lc2.hp;\n  lc3.svf(xr); lc4.svf(lc3.hp); xr = lc4.hp;\n);\n\n// ------------------------------------------------ chorus\nchmix > 0 ? (\n  ch_ph += chrate*isr; ch_ph -= floor(ch_ph);\n  CHB_L[ch_pos] = xl; CHB_R[ch_pos] = xr;\n  cdl = (8 + chdepth*0.04*(1 + sin(2*$pi*ch_ph)))*0.001*srate;\n  cdr = (8 + chdepth*0.04*(1 + cos(2*$pi*ch_ph)))*0.001*srate;\n  wl = dread(CHB_L, CHB_SIZE, ch_pos, cdl); wr = dread(CHB_R, CHB_SIZE, ch_pos, cdr);\n  ch_pos += 1; ch_pos >= CHB_SIZE ? ch_pos = 0;\n  chm = chmix*0.01;\n  xl = xl*(1 - chm*0.35) + wr*chm*0.75;\n  xr = xr*(1 - chm*0.35) + wl*chm*0.75;\n);\n// ------------------------------------------------ width\nwd = clamp(width + MODV[18]*200, 0, 200)*0.01;\nwd != 1 ? ( mid = (xl + xr)*0.5; sid = (xl - xr)*0.5*wd; xl = mid + sid; xr = mid - sid; );\n// ------------------------------------------------ mono bass\nmonobass > 0 ? (\n  mb1.svf(xl); mb2.svf(mb1.lp); lo_l = mb2.lp;\n  mb3.svf(xr); mb4.svf(mb3.lp); lo_r = mb4.lp;\n  lo_m = (lo_l + lo_r)*0.5;\n  xl += lo_m - lo_l; xr += lo_m - lo_r;\n);\n\n// ------------------------------------------------ sub oscillator\nsl_eff = clamp(sublvl + MODV[21]*100, 0, 100);\nsl_eff > 0 && voice_on ? (\n  sdt = f0*2^(-suboct)*isr;\n  sub_ph += sdt; sub_ph >= 1 ? sub_ph -= 1;\n  subwave == 0 ? sb = sin(2*$pi*sub_ph) :\n  subwave == 1 ? sb = tri(sub_ph) :\n  subwave == 2 ? sb = pulse(sub_ph, sdt, 0.5)*0.6 :\n  sb = saw(sub_ph, sdt)*0.6;\n  sb *= sl_eff*0.009*aenv*velg*clamp(1 + MODV[19], 0, 2);\n  xl += sb; xr += sb;\n);\n\n// ------------------------------------------------ output\npn = clamp(MODV[20], -1, 1);\npn != 0 ? ( xl *= min(1, 1 - pn); xr *= min(1, 1 + pn); );\nxl *= sm_vol; xr *= sm_vol;\nlimiter ? (\n  xl = abs(xl) < 0.85 ? xl : (xl > 0 ? 1 : -1)*(0.85 + 0.15*sat((abs(xl) - 0.85)/0.15));\n  xr = abs(xr) < 0.85 ? xr : (xr > 0 ? 1 : -1)*(0.85 + 0.15*sat((abs(xr) - 0.85)/0.15));\n);\nspl0 = xl; spl1 = xr;\n\n// ------------------------------------------------ scope / throb meter for UI\nSCOPE[scope_pos] = (xl + xr)*0.5;\nscope_pos += 1; scope_pos >= SCOPE_SIZE ? scope_pos = 0;\nthrob_acc = max(throb_acc, abs(xl) + abs(xr));\nthrob_n += 1;\nthrob_n >= 512 ? (\n  THROB[throb_pos] = throb_acc*0.5; throb_pos += 1; throb_pos >= THROB_SIZE ? throb_pos = 0;\n  throb_acc = 0; throb_n = 0;\n);\nui_f0 = f0; ui_beat = beat_eff; ui_fc = fc;\n\n@gfx 960 684\n// ---------------------------------------------------------------- frame setup\n// Paged UI on a 960 x 684 logical canvas. Pages: 0 synth, 1 mod, 2 fx.\n// NOTE: @gfx runs in its own thread - only use ui_* globals (or function locals) here, never\n// variables the audio code writes (the transpiler rejects shared writes).\n// The canvas grows with the window. Interface size sets the smallest it may be drawn (Retina\n// included), as long as the window is wide enough: a narrower window draws it as wide as the\n// window, never below 100%, so it scrolls up and down but not sideways (1.3). Only below 100%\n// does a window scroll both ways (ADR-015). \"Fit to Window\", and the tiny view embedded in a\n// track panel, shrink it to fit as before.\nUI_W = 960; UI_H = 684;\nui_key = gfx_getchar();   // one key per frame; also makes mouse_cap report Ctrl/Shift\n!ui_font_ok ? pick_font();\nui_retina = max(1, gfx_ext_retina);\nui_zoom = iface_size == 1 ? 1.25 : iface_size == 2 ? 1.5 : iface_size == 3 ? 2 : 1;\nui_fit = min(gfx_w/UI_W, gfx_h/UI_H);\nui_min = (iface_size == 4 || (gfx_ext_flags & 1)) ? 0 : max(ui_retina, min(ui_retina*ui_zoom, gfx_w/UI_W));\nui_s = max(ui_fit, ui_min);\nui_s <= 0 ? ui_s = 1;\nui_s != ui_last_s ? ( setup_fonts(ui_s); ui_last_s = ui_s; );\nui_cw = UI_W*ui_s; ui_ch = UI_H*ui_s;\nui_ovx = ui_cw > gfx_w + 0.5; ui_ovy = ui_ch > gfx_h + 0.5;\nui_now = time_precise();\nui_click = (mouse_cap & 1) && !(ui_last_cap & 1);\nui_release = !(mouse_cap & 1) && (ui_last_cap & 1);\nui_release ? (\n  ui_drag > 0 ? automate(ui_drag, 1);\n  ui_drag = 0;\n);\n// scroll bars, drawn over the edges only when the canvas is larger than the window\nui_sbw = 10*ui_retina;\nui_onsb = (ui_ovy && mouse_x >= gfx_w - ui_sbw && mouse_x < gfx_w && mouse_y >= 0 && mouse_y < gfx_h) ? 1 :\n          (ui_ovx && mouse_y >= gfx_h - ui_sbw && mouse_y < gfx_h && mouse_x >= 0 && mouse_x < gfx_w) ? 2 : 0;\nui_click && ui_onsb && ui_drag == 0 ? (\n  ui_sbdrag = ui_onsb; ui_sbm = ui_onsb == 1 ? mouse_y : mouse_x; ui_sbs = ui_onsb == 1 ? ui_sy : ui_sx;\n  ui_click = 0;\n);\n!(mouse_cap & 1) ? ui_sbdrag = 0;\nui_sbdrag == 1 ? ui_sy = ui_sbs + (mouse_y - ui_sbm)*ui_ch/gfx_h;\nui_sbdrag == 2 ? ui_sx = ui_sbs + (mouse_x - ui_sbm)*ui_cw/gfx_w;\nui_sx = ui_ovx ? clamp(ui_sx, 0, ui_cw - gfx_w) : 0;\nui_sy = ui_ovy ? clamp(ui_sy, 0, ui_ch - gfx_h) : 0;\nui_ox = ui_ovx ? -floor(ui_sx) : floor((gfx_w - ui_cw)*0.5);\nui_oy = ui_ovy ? -floor(ui_sy) : floor((gfx_h - ui_ch)*0.5);\nui_mx = (mouse_x - ui_ox)/ui_s; ui_my = (mouse_y - ui_oy)/ui_s;\n(ui_onsb || ui_sbdrag) ? ( ui_mx = -10000; ui_my = -10000; );\nui_click ? ui_focus = 0;   // pointing takes over from the keyboard\nui_hov = 0; ui_hint = 0; ui_fn = 0; ui_ty = 0;\n// A preset or a mutation replaces the sound. The frame that asks for it adds an undo point\n// (sliderchange(-1) from @gfx), this one makes the change and adds another, so REAPER's\n// Edit \u00e2\u0086\u0092 Undo puts back the sound as it was, knob tweaks included (1.3).\nui_want_preset || ui_want_mutate ? (\n  ui_want_preset ? ( load_preset(ui_want_preset - 1); preset_loaded_once = 1; ) : mutate(ui_want_mutate - 1);\n  sliderchange(-1); ui_want_preset = 0; ui_want_mutate = 0;\n);\n\ncol(0.075, 0.08, 0.095, 1); gfx_rect(0, 0, gfx_w, gfx_h);\n\n// ---------------------------------------------------------------- header\n// Row 1: name, presets, Mutate, Options. Row 2: what is under the pointer or the keyboard\n// focus (else how to use the window), and the live readout. Nothing that matters sits at the\n// bottom edge, which a window dragged off the screen loses first.\naccent(0.24, 0.9, 0.76);\nfont(4); col(0.95, 0.97, 1, 1); TX(\"REESE\", 14, 6, 100, 30, 4);\ncol(atr, atg, atb, 1); TX(\"BASSER\", 118, 6, 130, 30, 4);\n// preset selector\nbutton(201, \"<\", \"Previous preset. Edit \u00e2\u0086\u0092 Undo puts your sound back.\", 262, 8, 28, 28) ? ask_change(1 + (cur_preset > 0 ? cur_preset - 1 : NUM_PRESETS - 1), 0);\nui_pfoc = focusable(202, 7, 302, 8, 270, 28);\nui_phit = inr(302, 8, 270, 28);\n(ui_phit || ui_pfoc) ? ui_hint = \"Preset: click, or press Return, to choose one. Edit \u00e2\u0086\u0092 Undo puts your sound back.\";\ncol(0.07, 0.075, 0.09, 1); RF(302, 8, 270, 28);\nui_phit ? col(acr, acg, acb, 1) : c_edge(); RO(302, 8, 270, 28);\nfont(5); c_text();\nlist_item(#pn, PRESETS, cur_preset);\npreset_edited ? strcat(#pn, \" *\");\n!preset_loaded_once && !preset_edited ? strcpy(#pn, \"Custom / Project Patch\");\nTX(#pn, 302, 8, 270, 28, 5);\n(ui_phit && ui_click) || key_press(202) ? (\n  gfx_x = ui_ox + 302*ui_s; gfx_y = ui_oy + 36*ui_s;\n  ui_res = gfx_showmenu(build_menu(#menu, PRESETS, preset_loaded_once ? cur_preset : -1));\n  ui_res > 0 ? ask_change(ui_res, 0);\n  ui_click = 0;\n);\nui_pfoc ? focus_ring(302, 8, 270, 28);\nbutton(203, \">\", \"Next preset. Edit \u00e2\u0086\u0092 Undo puts your sound back.\", 584, 8, 28, 28) ? ask_change(1 + (cur_preset < NUM_PRESETS - 1 ? cur_preset + 1 : 0), 0);\naccent(1.0, 0.35, 0.55);\nbutton(204, \"MUTATE\", \"Mutate: randomise part of the sound for happy accidents. Edit \u00e2\u0086\u0092 Undo puts it back.\", 624, 8, 110, 28) ? (\n  gfx_x = ui_ox + 624*ui_s; gfx_y = ui_oy + 36*ui_s;\n  ui_res = gfx_showmenu(\"Mutate Engine|Mutate Mangle and Movement|Mutate Modulation|Mutate Everything||Nudge All (Subtle)\");\n  ui_res > 0 ? ask_change(0, ui_res);\n);\naccent(0.8, 0.82, 0.86);\nbutton(205, \"Options\", \"Options: interface size and reduced motion. A larger size needs a wider window.\", 848, 8, 100, 28) ? (\n  gfx_x = ui_ox + 848*ui_s; gfx_y = ui_oy + 36*ui_s;\n  sprintf(#om, \"%sInterface Size 100%%|%sInterface Size 125%%|%sInterface Size 150%%|%sInterface Size 200%%|%sFit Interface to Window||%sReduce Motion||#Reese Basser 1.3\",\n          iface_size == 0 ? \"!\" : \"\", iface_size == 1 ? \"!\" : \"\", iface_size == 2 ? \"!\" : \"\",\n          iface_size == 3 ? \"!\" : \"\", iface_size == 4 ? \"!\" : \"\", reduce_motion ? \"!\" : \"\");\n  ui_res = gfx_showmenu(#om);\n  ui_res >= 1 && ui_res <= 5 ? ( iface_size = ui_res - 1; sliderchange(iface_size); );\n  ui_res == 6 ? ( reduce_motion = !reduce_motion; sliderchange(reduce_motion); );\n);\n\n// ---------------------------------------------------------------- page tabs\n// The chosen tab is filled and carries a thick bar; the others a thin one.\nfunction tab(str, x, w, page) local(hit, on, foc) (\n  hit = inr(x, 64, w, 28); on = ui_page == page;\n  foc = focusable(300 + page, 6, x, 64, w, 28);\n  hit || foc ? ui_hint = page == 0 ? \"Synth page: engine, filter, sub and output.\" :\n                         page == 1 ? \"Modulation page: envelopes, LFOs and the mod matrix.\" :\n                                     \"FX + Mangle page: distortion, movement, mangle and stereo.\";\n  on ? col(acr*0.35, acg*0.35, acb*0.35, 1) : col(hit ? 0.15 : 0.11, hit ? 0.165 : 0.12, hit ? 0.2 : 0.145, 1);\n  RF(x, 64, w, 28);\n  on ? ( col(acr, acg, acb, 1); RF(x, 88, w, 4); ) : ( col(acr, acg, acb, 0.6); RF(x, 91, w, 1); );\n  c_edge(); RO(x, 64, w, 28);\n  font(3); on || hit ? col(1, 1, 1, 1) : c_sec(); TX(str, x, 64, w, 28, 5);\n  foc ? focus_ring(x, 64, w, 28);\n  (hit && ui_click) || key_press(300 + page) ? ( ui_page = page; ui_click = 0; );\n);\naccent(0.24, 0.9, 0.76); tab(\"SYNTH\", 10, 150, 0);\naccent(0.35, 0.65, 1.0); tab(\"MODULATION\", 172, 150, 1);\naccent(1.0, 0.35, 0.55); tab(\"FX + MANGLE\", 334, 150, 2);\n// mini scope so the throb stays visible on every page\nui_page != 0 ? (\n  accent(0.24, 0.9, 0.76);\n  draw_scope(620, 64, 330, 28);\n  col(0.22, 0.24, 0.28, 1); RO(620, 64, 330, 28);\n);\n\n// pages are drawn 10 below their own coordinates, under the header's second row\nui_oy0 = ui_oy; ui_oy += 10*ui_s; ui_my -= 10; ui_ty = 10;\n\n// ================================================================ PAGE: SYNTH\nui_page == 0 ? (\n  // -------------------------------------------------------------- engine\n  accent(0.24, 0.9, 0.76);\n  panel(10, 92, 600, 300, \"OSCILLATOR ENGINE\");\n  dropdown(1, 200, 96, 270, 28) ? engine_defaults();\n  // double-click defaults of A/B/C follow the current engine\n  PDEF[6] = ENGDEF[eng*3]; PDEF[7] = ENGDEF[eng*3 + 1]; PDEF[8] = ENGDEF[eng*3 + 2];\n  font(6); c_sec(); TX(ENGDESC[eng], 20, 130, 580, 12, 0);\n  detmode == 0 ? knob(2, 18, 148, \"DETUNE\") : detmode == 1 ? knob(4, 18, 148, \"BEAT HZ\") : knob(5, 18, 148, \"BEAT SYNC\");\n  knob(6, 90, 148, ENGLBL[eng*3]);\n  knob(7, 162, 148, ENGLBL[eng*3 + 1]);\n  knob(8, 234, 148, ENGLBL[eng*3 + 2]);\n  eng != 1 ? (\n    knob(9, 306, 148, \"UNISON\"); knob(10, 378, 148, \"UNI DET\");\n  ) : (\n    font(6); c_dis();\n    TX(\"UNISON\", 306, 194, 66, 12, 1); TX(\"UNI DET\", 378, 194, 66, 12, 1);\n    c_sec(); TX(\"Supersaw has its\", 306, 208, 138, 12, 1); TX(\"own voices.\", 306, 220, 138, 12, 1);\n  );\n  knob(11, 450, 148, \"STEREO\");\n  knob(12, 522, 148, \"DRIFT\");\n  small_caption(\"DETUNE MODE\", 20, 230, 180);\n  segs(3, 20, 246, 180, 28);\n  small_caption(\"OSC PHASE\", 212, 230, 180);\n  segs(13, 212, 246, 180, 28);\n  font(6); c_sec();\n  TX(detmode == 0 ? \"Beat follows pitch\" : detmode == 1 ? \"Same beat on every note\" : \"Beat locked to the grid\", 20, 280, 180, 12, 1);\n  TX(phasemode == 0 ? \"Never reset\" : phasemode == 1 ? \"Same attack every note\" : \"Random start\", 212, 280, 180, 12, 1);\n  knob(14, 450, 232, \"LEVEL\");\n  knob(79, 522, 232, \"OCTAVE\");\n  small_caption(\"BEAT (THE REESE THROB)\", 20, 308, 580);\n  col(0.07, 0.075, 0.09, 1); RF(20, 326, 580, 28);\n  // the bar pulses with the real beat. Reduce Motion holds it still, and so does a beat faster\n  // than 3 a second: more would be flashing (Apple's Accessibility page; WCAG's three flashes).\n  ui_still = reduce_motion || abs(ui_beat) > 3;\n  ui_bv = ui_still ? 1 : 0.5 + 0.5*cos(2*$pi*beat_ph);\n  col(acr, acg, acb, ui_still ? 0.5 : 0.25 + 0.6*ui_bv); RF(22, 328, 576*ui_bv, 24);\n  c_edge(); RO(20, 326, 580, 28);\n  font(5);\n  sprintf(#bt, \"%.2f Hz (one throb every %.2f s)\", abs(ui_beat), 1/max(abs(ui_beat), 0.001));\n  // the reading sits on its own dark plate, so it stays legible however bright the bar is\n  gfx_measurestr(#bt, ui_tw, ui_th); ui_tw = ui_tw/ui_s + 20;\n  col(0.07, 0.075, 0.09, 1); RF(310 - ui_tw*0.5, 330, ui_tw, 20);\n  c_text(); TX(#bt, 20, 326, 580, 28, 5);\n  font(6); c_sec();\n  TX(\"Tip: Hz or Sync mode keeps the throb speed the same across a whole bassline.\", 20, 362, 580, 12, 1);\n\n  // -------------------------------------------------------------- scope\n  panel(620, 92, 330, 300, \"SCOPE / THROB\");\n  draw_scope(630, 120, 310, 170);\n  font(6); c_sec(); TX(\"Level over the last 3 s\", 630, 296, 310, 12, 0);\n  draw_throb(630, 312, 310, 70);\n\n  // -------------------------------------------------------------- filter\n  accent(1.0, 0.72, 0.2);\n  panel(10, 400, 410, 262, \"FILTER\");\n  dropdown(21, 110, 404, 300, 28);\n  knob(22, 18, 444, \"CUTOFF\"); knob(23, 98, 444, \"RESO\"); knob(24, 178, 444, \"DRIVE\");\n  knob(25, 258, 444, \"KEY\"); knob(26, 338, 444, \"ENV\");\n  draw_filter_curve(20, 526, 390, 126);\n\n  // -------------------------------------------------------------- sub + noise\n  accent(0.55, 0.85, 0.35);\n  panel(430, 400, 250, 262, \"SUB + NOISE\");\n  knob(15, 438, 430, \"SUB\"); knob(18, 518, 430, \"NOISE\"); knob(19, 598, 430, \"COLOR\");\n  knob(20, 438, 516, \"LOW CUT\");\n  small_caption(\"SUB OCT\", 518, 516, 150); segs(17, 518, 532, 150, 28);\n  small_caption(\"SUB WAVE\", 440, 594, 230); segs(16, 440, 610, 230, 28);\n  font(6); c_sec(); TX(\"Sub: mono, no FX  \u00c2\u00b7  Low cut: Reese only\", 440, 644, 230, 12, 1);\n\n  // -------------------------------------------------------------- play + output\n  accent(0.8, 0.82, 0.86);\n  panel(690, 400, 260, 262, \"PLAY + OUTPUT\");\n  knob(75, 698, 430, \"GLIDE\"); knob(77, 778, 430, \"BEND\"); knob(81, 858, 430, \"OUTPUT\");\n  small_caption(\"NOTES\", 700, 514, 114); segs(74, 700, 530, 114, 28);\n  small_caption(\"GLIDE\", 826, 514, 114); segs(76, 826, 530, 114, 28);\n  small_caption(\"OVERSAMPLING\", 700, 570, 114); segs(80, 700, 586, 114, 28);\n  small_caption(\"CLIPPER\", 826, 570, 114); segs(82, 826, 586, 114, 28);\n  font(6); c_sec();\n  TX(\"Overlap notes to glide (legato).\", 700, 622, 240, 12, 1);\n  TX(\"1x for light CPU, 4x for the cleanest drive\", 700, 638, 240, 12, 1);\n);\n\n// ================================================================ PAGE: MODULATION\nfunction lfo_panel(x, y, w, h, base, title) (\n  panel(x, y, w, h, title);\n  dropdown(base, x + 70, y + 4, w - 80, 28);\n  draw_lfo(x + 10, y + 38, w - 20, 52, slider(base));\n  slider(base + 1) ? knob(base + 3, x + 8, y + 100, \"RATE\") : knob(base + 2, x + 8, y + 100, \"RATE\");\n  knob(base + 5, x + 80, y + 100, \"FADE IN\");\n  small_caption(\"SYNC\", x + 160, y + 96, w - 170); segs(base + 1, x + 160, y + 112, w - 170, 28);\n  small_caption(\"TRIGGER\", x + 160, y + 152, w - 170); segs(base + 4, x + 160, y + 168, w - 170, 28);\n  font(6); c_sec();\n  TX(\"Route it in the mod matrix.\", x + 10, y + 206, w - 20, 12, 1);\n  TX(\"BPM and Free lock it to the song.\", x + 10, y + 222, w - 20, 12, 1);\n);\nui_page == 1 ? (\n  accent(0.35, 0.65, 1.0);\n  panel(10, 92, 305, 262, \"AMP ENVELOPE\");\n  draw_env(20, 122, 285, 66, 27);\n  knob(27, 18, 198, \"ATTACK\"); knob(28, 90, 198, \"DECAY\"); knob(29, 162, 198, \"SUSTAIN\"); knob(30, 234, 198, \"RELEASE\");\n  small_caption(\"VELOCITY SENSITIVITY\", 20, 290, 285);\n  hbar(78, 20, 308, 285, 28);\n  panel(325, 92, 305, 262, \"MOD ENVELOPE\");\n  draw_env(335, 122, 285, 66, 31);\n  knob(31, 333, 198, \"ATTACK\"); knob(32, 405, 198, \"DECAY\"); knob(33, 477, 198, \"SUSTAIN\"); knob(34, 549, 198, \"RELEASE\");\n  font(6); c_sec();\n  TX(\"Drives the filter\u00e2\u0080\u0099s ENV knob and any\", 335, 292, 285, 12, 1);\n  TX(\"mod matrix slot using \u00e2\u0080\u009cMod Env\u00e2\u0080\u009d.\", 335, 308, 285, 12, 1);\n  lfo_panel(640, 92, 310, 262, 35, \"LFO 1\");\n  lfo_panel(10, 362, 305, 300, 41, \"LFO 2\");\n\n  panel(325, 362, 625, 300, \"MOD MATRIX\");\n  font(6); c_sec();\n  TX(\"Source  \u00e2\u0086\u0092  destination  \u00c2\u00b7  amount (drag; double-click for 0)\", 470, 368, 470, 14, 2);\n  ui_mi = 0;\n  loop(6,\n    ui_my_ = 400 + ui_mi*42;\n    font(3); c_sec(); sprintf(#mn, \"%d\", ui_mi + 1); TX(#mn, 335, ui_my_, 14, 28, 4);\n    dropdown(83 + ui_mi*3, 352, ui_my_, 166, 28);\n    dropdown(84 + ui_mi*3, 530, ui_my_, 186, 28);\n    hbar(85 + ui_mi*3, 728, ui_my_, 212, 28);\n    ui_mi += 1;\n  );\n);\n\n// ================================================================ PAGE: FX + MANGLE\nui_page == 2 ? (\n  accent(1.0, 0.35, 0.55);\n  panel(10, 92, 300, 262, \"DISTORTION\");\n  dropdown(47, 130, 96, 170, 28);\n  knob(48, 18, 136, \"DRIVE\"); knob(49, 96, 136, \"TONE\"); knob(50, 174, 136, \"MIX\");\n  small_caption(\"POSITION\", 20, 222, 280); segs(51, 20, 238, 280, 28);\n  font(6); c_sec();\n  TX(\"Post filter is classic, pre is gnarly.\", 20, 276, 280, 12, 1);\n  TX(\"Oversampled; drive at 0 is off.\", 20, 292, 280, 12, 1);\n\n  accent(0.7, 0.5, 1.0);\n  panel(320, 92, 630, 262, \"MOVEMENT\");\n  dropdown(52, 440, 96, 220, 28);\n  knob(53, 330, 136, \"FREQ\"); knob(54, 420, 136, \"DEPTH\"); knob(55, 510, 136, \"RATE\");\n  knob(56, 600, 136, \"RESO\"); knob(57, 690, 136, \"STEREO\"); knob(58, 780, 136, \"MIX\");\n  font(5); c_sec();\n  TX(mvtype == 0 ? \"Off \u00e2\u0080\u0094 choose a type above.\" :\n     mvtype == 1 ? \"Two notches an octave apart sweep the harmonics (neuro style).\" :\n     mvtype == 2 ? \"6-stage phaser with feedback, swept in time with the song\" :\n                   \"Comb filter tuned by FREQ, swept by DEPTH, with RESO as feedback\", 330, 232, 610, 16, 1);\n  font(6); c_sec(); TX(\"RATE is a tempo division.\", 330, 256, 610, 12, 1);\n\n  accent(1.0, 0.35, 0.55);\n  panel(10, 362, 700, 300, \"MANGLE\");\n  small_caption(\"FORMANT\", 20, 392, 136); small_caption(\"FREQ SHIFT\", 158, 392, 136);\n  small_caption(\"RING MOD\", 296, 392, 136); small_caption(\"CRUSH\", 434, 392, 204);\n  small_caption(\"SQUASH\", 640, 392, 66);\n  knob(59, 20, 412, \"VOWEL\"); knob(60, 88, 412, \"MIX\");\n  knob(61, 158, 412, \"SHIFT\"); knob(62, 226, 412, \"MIX\");\n  knob(63, 296, 412, \"RATIO\"); knob(64, 364, 412, \"MIX\");\n  knob(65, 434, 412, \"BITS\"); knob(66, 502, 412, \"DOWN\"); knob(67, 570, 412, \"MIX\");\n  knob(68, 640, 412, \"AMOUNT\");\n  font(6); c_sec();\n  TX(\"Talking A-E-I-O-U\", 20, 494, 136, 12, 1);\n  TX(\"Inharmonic, barber-pole\", 158, 494, 136, 12, 1);\n  TX(\"In tune with the note\", 296, 494, 136, 12, 1);\n  TX(\"Bits and sample rate\", 434, 494, 204, 12, 1);\n  TX(\"OTT-ish\", 640, 494, 66, 12, 1);\n  small_caption(\"SIGNAL FLOW\", 20, 540, 680);\n  font(5); c_sec();\n  TX(\"Voice  \u00e2\u0086\u0092  formant  \u00e2\u0086\u0092  ring  \u00e2\u0086\u0092  shift  \u00e2\u0086\u0092  crush  \u00e2\u0086\u0092  movement  \u00e2\u0086\u0092  squash  \u00e2\u0086\u0092  stereo  \u00e2\u0086\u0092  + sub\", 20, 562, 680, 16, 1);\n  font(6); c_sec();\n  TX(\"MUTATE (at the top) randomises these for happy accidents.\", 20, 600, 680, 12, 1);\n\n  accent(0.7, 0.5, 1.0);\n  panel(720, 362, 230, 300, \"STEREO\");\n  knob(69, 728, 392, \"CHORUS\"); knob(70, 800, 392, \"RATE\"); knob(71, 872, 392, \"DEPTH\");\n  knob(72, 764, 480, \"WIDTH\"); knob(73, 836, 480, \"MONO <\");\n  font(6); c_sec();\n  TX(\"Everything below MONO <\", 730, 572, 210, 12, 1);\n  TX(\"is summed to mono.\", 730, 586, 210, 12, 1);\n);\nui_oy = ui_oy0; ui_my += 10; ui_ty = 0;\n\n// ---------------------------------------------------------------- the hint line (header, row 2)\nfont(6);\nui_hov > 0 ? (\n  ui_hov >= 83 ? sprintf(#ft, \"%s (slot %d): %s\", PNAME[ui_hov], floor((ui_hov - 83)/3) + 1, fmt_val(#fv, ui_hov)) :\n                 sprintf(#ft, \"%s: %s\", PNAME[ui_hov], fmt_val(#fv, ui_hov));\n  c_text(); TX(#ft, 14, 44, 580, 12, 0);\n) : ui_hint ? (\n  c_text(); TX(ui_hint, 14, 44, 580, 12, 0);\n) : (\n  c_sec(); TX(\"Drag or scroll to adjust  \u00c2\u00b7  Shift for fine control  \u00c2\u00b7  Double-click to reset  \u00c2\u00b7  Tab to use the keys\", 14, 44, 580, 12, 0);\n);\nc_sec();\nsprintf(#ro, \"Note %.1f Hz  \u00c2\u00b7  Beat %.2f Hz  \u00c2\u00b7  %s  \u00c2\u00b7  %dx\", ui_f0, abs(ui_beat), aenv_o.st > 0 ? \"Voice on\" : \"Idle\",\n        quality == 0 ? 1 : quality == 1 ? 2 : 4);\nTX(#ro, 600, 44, 348, 12, 2);\n\n// ---------------------------------------------------------------- keys\n// Tab and Shift+Tab move the focus through every control in reading order; Return or Space\n// presses, the arrows nudge (Shift for finer), Delete resets, Esc lets go. The plugin never\n// asks for all keyboard input, so REAPER keeps its own shortcuts.\nui_key == 9 ? (\n  ui_fn > 0 ? (\n    ui_cur = -1; ui_i = 0;\n    loop(ui_fn, FOCUSL[ui_i*8] == ui_focus ? ui_cur = ui_i; ui_i += 1; );\n    ui_cur = (mouse_cap & 8) ? (ui_cur <= 0 ? ui_fn - 1 : ui_cur - 1) : (ui_cur < 0 ? 0 : (ui_cur + 1) % ui_fn);\n    ui_focus = FOCUSL[ui_cur*8];\n    // keep it in view when the window is smaller than the interface\n    ui_p = FOCUSL + ui_cur*8;\n    ui_ovx ? (\n      (ui_p[2] - 12)*ui_s < ui_sx ? ui_sx = (ui_p[2] - 12)*ui_s;\n      (ui_p[2] + ui_p[4] + 12)*ui_s > ui_sx + gfx_w ? ui_sx = (ui_p[2] + ui_p[4] + 12)*ui_s - gfx_w;\n    );\n    ui_ovy ? (\n      (ui_p[3] - 12)*ui_s < ui_sy ? ui_sy = (ui_p[3] - 12)*ui_s;\n      (ui_p[3] + ui_p[5] + 12)*ui_s > ui_sy + gfx_h ? ui_sy = (ui_p[3] + ui_p[5] + 12)*ui_s - gfx_h;\n    );\n  );\n) : ui_key == 27 ? ui_focus = 0;\n\n// ---------------------------------------------------------------- scrolling\n// the wheel scrolls where no control took it\nui_ovy && mouse_wheel != 0 ? ui_sy -= mouse_wheel/120*48*ui_s;\nui_ovx && mouse_hwheel != 0 ? ui_sx += mouse_hwheel/120*48*ui_s;\nui_ovy ? (\n  ui_tl = ui_ovx ? gfx_h - ui_sbw : gfx_h;\n  ui_th = max(20*ui_retina, ui_tl*gfx_h/ui_ch);\n  ui_tp = ui_sy/(ui_ch - gfx_h)*(ui_tl - ui_th);\n  col(0.1, 0.11, 0.13, 1); gfx_rect(gfx_w - ui_sbw, 0, ui_sbw, ui_tl);\n  ui_onsb == 1 || ui_sbdrag == 1 ? col(0.6, 0.63, 0.7, 1) : col(0.45, 0.48, 0.55, 1);\n  gfx_rect(gfx_w - ui_sbw + 2*ui_retina, ui_tp, ui_sbw - 4*ui_retina, ui_th);\n);\nui_ovx ? (\n  ui_tl = ui_ovy ? gfx_w - ui_sbw : gfx_w;\n  ui_th = max(20*ui_retina, ui_tl*gfx_w/ui_cw);\n  ui_tp = ui_sx/(ui_cw - gfx_w)*(ui_tl - ui_th);\n  col(0.1, 0.11, 0.13, 1); gfx_rect(0, gfx_h - ui_sbw, ui_tl, ui_sbw);\n  ui_onsb == 2 || ui_sbdrag == 2 ? col(0.6, 0.63, 0.7, 1) : col(0.45, 0.48, 0.55, 1);\n  gfx_rect(ui_tp, gfx_h - ui_sbw + 2*ui_retina, ui_th, ui_sbw - 4*ui_retina);\n);\n\nFOCUSL[ui_fn*8] = 0;   // ends the list (read by the tests)\nmouse_wheel = 0; mouse_hwheel = 0;\nui_last_cap = mouse_cap;\n"};

/* ---- kit/palette.js ---- */
/* The devices' colours in Live: after Ableton Live 8's default theme.
 *
 * The scheme is Starting Blocks' own experiment of 18 September 2026
 * (commit 2765b0a3, "theme the window after Live 8"): a neutral grey chrome
 * meant to sit quietly under brightly coloured clips, controls raised off it,
 * and one warm amber spent where Live spends its accent, on what is switched
 * on. It was built from the theme's described character, not Live's own
 * files, so it is a likeness, not a match.
 *
 * Two changes from that experiment, both for the family's rules (every word
 * 7:1 on what it sits on, ink on every button, marks and edges 3:1):
 *   - the chrome is #3E3E3E, a step darker than its #4A4A4A, because on
 *     #4A4A4A a secondary word cannot reach 7:1 and still look secondary;
 *   - buttons are a light grey with dark ink, as the house scheme's are,
 *     because light words on its #5E5E5E buttons reach only 5:1.
 * The greys are neutral (R = G = B), as Live's are: the house rule that
 * every grey leans blue is the yellow scheme's, and Live's look is not that.
 *
 * Palette.tone(r, g, b) is how the REAPER windows (the JSFX and Lua scripts,
 * drawn through gfx.js) take the scheme without a line of theirs changing:
 *   - the house scheme's own colours map one for one (HOUSE below), each
 *     chosen so the pairs the scripts rely on stay 7:1 for words and 3:1
 *     for edges;
 *   - the house yellow, and the shades the scripts make of it, become the
 *     amber, shaded the same way;
 *   - any other grey loses its tint at the same brightness, so a script
 *     with a palette of its own keeps every contrast it had;
 *   - every other colour (a material, an engine, a part) is left alone.
 */
var Palette = (function () {
  'use strict';
  var C = {
    ground: 0x3E3E3E,     // the chrome: Live 8's #4A4A4A, a step darker (see above)
    raised: 0x484848,     // a control that is off
    sunken: 0x2E2E2E,     // lists, fields, a roll or a page: Live 8's roll ground
    deep: 0x262626,       // a roll's own ground under a sunken frame
    popup: 0x333333,      // menus
    rule: 0x555555,       // separators: they group, they do not act
    edge: 0x8C8C8C,       // the edge of anything that acts: 3.2:1 on the chrome
    control: 0xB4B4B4,    // buttons, with ink on them
    controlHover: 0xC4C4C4,
    controlHeld: 0xAAAAAA,
    accent: 0xD7A93C,     // Live 8's warm amber: what is on
    accentHeld: 0xCDA139,  // held: ink on it still 7.2:1
    ink: 0x1A1A1A,        // words on a button, grey or amber; also a window's darkest ground
                          // (AutoCC paints its window in the ink), so words are 7:1 on it too
    text: 0xF0F0F0,       // 9.4:1 on the chrome
    label: 0xD8D8D8,      // 7.5:1
    dim: 0xD4D4D4,        // secondary words, 7.2:1
    mark: 0xA8A8A8,       // a mark that is not a word, or a control that is off
    note: 0xA8D8E8,       // Live 8's cool note colour, for a roll
    ring: 0xFAFAFA,       // the keyboard's place
    warn: 0xF0605A,       // a warning's mark, never its words: 3.3:1 on the chrome
    warnText: 0xFFC8C2    // a warning's words, 7.3:1
  };
  // The house scheme (HousePalette, every family repo's docs/COLOUR.md) to this one.
  var HOUSE = {
    0x111419: C.deep, 0x14171C: C.ink, 0x1A1D23: C.sunken, 0x1B1F25: C.popup, 0x1E2228: 0x343434,
    0x22262D: 0x363636, 0x23272E: C.ground, 0x2A2F37: C.raised, 0x3A404A: C.rule, 0x585F6B: 0x707070,
    0x646B77: 0x7A7A7A, 0x6D7581: C.edge, 0x8A919C: C.mark, 0x8F96A2: C.controlHeld, 0xA9AFBA: C.control,
    0xB0B6C0: C.dim, 0xB6BCC6: C.dim, 0xBFC5CE: C.label, 0xC0C6CF: C.controlHover, 0xDDE1E7: C.text,
    0xF2F4F7: C.ring, 0xFFF200: C.accent, 0xD1C600: C.accentHeld, 0xFF9E96: C.warnText, 0xFFA6A0: C.warnText, 0xD2483F: C.warn
  };
  function rgb(hex, a) {
    return [((hex >> 16) & 255) / 255, ((hex >> 8) & 255) / 255, (hex & 255) / 255, a === undefined ? 1 : a];
  }
  function lin(c) { return c <= 0.04045 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4); }
  function unlin(l) { return l <= 0.0031308 ? l * 12.92 : 1.055 * Math.pow(l, 1 / 2.4) - 0.055; }
  function luminance(r, g, b) { return 0.2126 * lin(r) + 0.7152 * lin(g) + 0.0722 * lin(b); }
  function contrast(a, b) {
    var la = luminance(a[0], a[1], a[2]), lb = luminance(b[0], b[1], b[2]);
    return (Math.max(la, lb) + 0.05) / (Math.min(la, lb) + 0.05);
  }
  function clamp(x) { return x < 0 ? 0 : x > 1 ? 1 : x; }
  var AMBER = rgb(C.accent);
  // r, g, b from 0 to 1; returns [r, g, b].
  function tone(r, g, b) {
    r = clamp(r); g = clamp(g); b = clamp(b);
    var R = Math.round(r * 255), G = Math.round(g * 255), B = Math.round(b * 255);
    var hex = (R << 16) | (G << 8) | B;
    if (HOUSE[hex] !== undefined) { var t = rgb(HOUSE[hex]); return [t[0], t[1], t[2]]; }
    // The house yellow and its shades: lighter ones mix in white (blue rises
    // from 0), darker ones scale down (red and green fall together).
    if (R >= 120 && G >= 110 && Math.abs(R - G) <= 40 && B <= Math.min(R, G) - 90) {
      var w = B / 255, k = Math.max(R, G) / 255;
      return [0, 1, 2].map(function (i) { return clamp(AMBER[i] * k + (1 - AMBER[i] * k) * w); });
    }
    // A grey with a tint, from any palette: neutral at the same brightness.
    var hi = Math.max(R, G, B), lo = Math.min(R, G, B);
    if (hi - lo <= 28) { var n = unlin(luminance(r, g, b)); return [n, n, n]; }
    return [r, g, b];
  }
  return { C: C, HOUSE: HOUSE, rgb: rgb, tone: tone, luminance: luminance, contrast: contrast };
})();


/* ---- kit/runtime/jsfx.js ---- */
/* Middaw's JSFX runtime: the family's REAPER plug-ins, run unchanged.
 *
 * A JSFX file is a header (sliders, pins, imports) and sections of EEL2 code:
 * @init, @slider, @block, @sample, @serialize and @gfx. This file reads the
 * header, compiles the EEL2 in each section to JavaScript, and runs it the way
 * REAPER does: @init once, @slider when a slider moves, then for every block
 * @block once and @sample once per sample frame. MIDI arrives through
 * midirecv() and leaves through midisend() with its sample offset.
 *
 * @gfx is not run by default: Middaw draws each device's controls itself from
 * the sliders, so a device looks like the rest of the app. With
 * `{ gfx: true }` it is compiled too, and `runGfx(host, ...)` runs it: every
 * gfx_* call goes to the host, which draws (the Ableton devices' [v8ui]).
 *
 * Everything in EEL2 is a double. Variables live in one Float64Array, so the
 * generated code reads `v[12]`; memory (`buf[i]`) is EEL2's 8M words, given
 * out in 64k-word blocks only when written to, as EEL2 itself does.
 */
(function (NS) {
  'use strict';

  var EPS = 0.00001;
  var MAXLOOP = 1048576;
  var BLOCK = 65536, NBLOCKS = 128;

  // ------------------------------------------------------------ header ----
  function parseSliderLine(line) {
    var m = /^slider(\d+):(?:([A-Za-z_][\w.]*)=)?\s*([^<]*?)\s*<([^>]*)>(.*)$/.exec(line);
    if (!m) return null;
    var inner = m[4], enumNames = null;
    var em = /\{([^}]*)\}/.exec(inner);
    if (em) { enumNames = em[1].split(','); inner = inner.replace(em[0], ''); }
    var shape = null, sm = /:(log|sqr)(?:=([^,>]*))?/.exec(inner);
    if (sm) { shape = { kind: sm[1], value: sm[2] === undefined ? null : Number(sm[2]) }; inner = inner.replace(sm[0], ''); }
    var parts = inner.split(',').map(function (s) { return s.trim(); });
    var desc = m[5].trim();
    var hidden = desc[0] === '-';
    if (hidden) desc = desc.slice(1);
    return {
      index: Number(m[1]), variable: (m[2] || ('slider' + m[1])).toLowerCase(),
      def: Number(m[3]) || 0, min: Number(parts[0]) || 0, max: parts[1] === undefined ? 1 : Number(parts[1]),
      step: parts[2] === undefined || parts[2] === '' ? 0 : Number(parts[2]),
      names: enumNames, shape: shape, name: desc, hidden: hidden
    };
  }

  // A JSFX file and its imports -> header and sections.
  function parseFile(text, readImport) {
    var out = { desc: '', sliders: [], inPins: [], outPins: [], options: '', sections: {}, gfxSize: null };
    var order = ['init', 'slider', 'block', 'sample', 'serialize', 'gfx'];
    order.forEach(function (s) { out.sections[s] = []; });
    function take(src, isImport) {
      var lines = src.replace(/\r\n?/g, '\n').split('\n');
      var section = null, buf = [], startLine = 0;
      function flush() {
        if (section && out.sections[section]) out.sections[section].push({ code: buf.join('\n'), line: startLine });
        buf = [];
      }
      for (var i = 0; i < lines.length; i++) {
        var line = lines[i];
        var sm = /^@(\w+)(.*)$/.exec(line);
        if (sm) {
          flush();
          section = sm[1].toLowerCase();
          startLine = i + 2;
          if (section === 'gfx') {
            var sz = sm[2].trim().split(/\s+/).map(Number);
            if (sz.length >= 2 && !out.gfxSize) out.gfxSize = [sz[0], sz[1]];
          }
          continue;
        }
        if (section) { buf.push(line); continue; }
        var t = line.trim();
        if (/^desc:/.test(t)) { if (!isImport || !out.desc) out.desc = t.slice(5).trim(); }
        else if (/^slider\d+:/.test(t)) { var s = parseSliderLine(t); if (s) out.sliders.push(s); }
        else if (/^in_pin:/.test(t)) out.inPins.push(t.slice(7).trim());
        else if (/^out_pin:/.test(t)) out.outPins.push(t.slice(8).trim());
        else if (/^options:/.test(t)) out.options += ' ' + t.slice(8).trim();
        else if (/^import\s+/.test(t)) {
          var name = t.replace(/^import\s+/, '').trim();
          var inc = readImport ? readImport(name) : null;
          if (inc === null || inc === undefined) throw new Error('JSFX import not found: ' + name);
          take(inc, true);
        }
      }
      flush();
    }
    take(text, false);
    out.sliders.sort(function (a, b) { return a.index - b.index; });
    out.inPins = out.inPins.filter(function (p) { return p !== 'none'; });
    out.outPins = out.outPins.filter(function (p) { return p !== 'none'; });
    return out;
  }

  // ------------------------------------------------------------- lexer ----
  var OPS = ['===', '!==', '<<=', '>>=', '==', '!=', '<=', '>=', '<<', '>>', '&&', '||',
    '+=', '-=', '*=', '/=', '%=', '^=', '|=', '&=', '~=',
    '+', '-', '*', '/', '%', '^', '<', '>', '!', '&', '|', '~', '?', ':',
    '(', ')', '[', ']', ',', ';', '='];
  var CONSTS = { pi: Math.PI, phi: (1 + Math.sqrt(5)) / 2, e: Math.E };

  function EelError(msg, line) { this.message = (line ? 'line ' + line + ': ' : '') + msg; this.line = line; }
  EelError.prototype = Object.create(Error.prototype);
  EelError.prototype.name = 'EelError';

  // REAPER's strings are bytes: one character per UTF-8 byte, as the C runtime
  // keeps them.
  function bytes(s) {
    var out = '';
    for (var i = 0; i < s.length; i++) {
      var c = s.codePointAt(i);
      if (c > 0xffff) i++;
      if (c < 0x80) out += String.fromCharCode(c);
      else if (c < 0x800) out += String.fromCharCode(0xc0 | c >> 6, 0x80 | c & 63);
      else if (c < 0x10000) out += String.fromCharCode(0xe0 | c >> 12, 0x80 | c >> 6 & 63, 0x80 | c & 63);
      else out += String.fromCharCode(0xf0 | c >> 18, 0x80 | c >> 12 & 63, 0x80 | c >> 6 & 63, 0x80 | c & 63);
    }
    return out;
  }

  function lex(src, firstLine) {
    var toks = [], i = 0, n = src.length, line = firstLine || 1;
    while (i < n) {
      var c = src[i];
      if (c === '\n') { line++; i++; continue; }
      if (c === ' ' || c === '\t' || c === '\r') { i++; continue; }
      if (c === '/' && src[i + 1] === '/') { var j = src.indexOf('\n', i); i = j < 0 ? n : j; continue; }
      if (c === '/' && src[i + 1] === '*') {
        var k = src.indexOf('*/', i + 2); if (k < 0) k = n;
        for (var q = i; q < k; q++) if (src[q] === '\n') line++;
        i = k + 2; continue;
      }
      if (c === '"') {
        var buf = '', p = i + 1;
        while (p < n && src[p] !== '"') {
          if (src[p] === '\\' && p + 1 < n) {
            var e = src[p + 1];
            buf += e === 'n' ? '\n' : e === 't' ? '\t' : e === 'r' ? '\r' : e; p += 2;
          } else { if (src[p] === '\n') line++; buf += src[p++]; }
        }
        toks.push({ k: 'str', v: bytes(buf), line: line }); i = p + 1; continue;
      }
      if (c === "'") {
        var close = src.indexOf("'", i + 1);
        var val = 0;
        var lit = bytes(src.slice(i + 1, close));
        for (var x = 0; x < lit.length; x++) val = val * 256 + lit.charCodeAt(x);
        toks.push({ k: 'num', v: val, line: line }); i = close + 1; continue;
      }
      if (c === '#') {
        var nm = /^#[A-Za-z_][A-Za-z0-9_.]*/.exec(src.slice(i, i + 200));
        if (nm) { toks.push({ k: 'nstr', v: nm[0].toLowerCase(), line: line }); i += nm[0].length; }
        else { toks.push({ k: 'tmpstr', line: line }); i++; }
        continue;
      }
      if (c === '$') {
        var rest = src.slice(i, i + 64), m;
        if ((m = /^\$x([0-9A-Fa-f]+)/.exec(rest))) { toks.push({ k: 'num', v: parseInt(m[1], 16), line: line }); i += m[0].length; continue; }
        if ((m = /^\$'(.)'/.exec(rest))) { toks.push({ k: 'num', v: m[1].charCodeAt(0), line: line }); i += m[0].length; continue; }
        if ((m = /^\$~(\d+)/.exec(rest))) { toks.push({ k: 'num', v: Math.pow(2, Number(m[1])) - 1, line: line }); i += m[0].length; continue; }
        if ((m = /^\$(pi|phi|e)\b/i.exec(rest))) { toks.push({ k: 'num', v: CONSTS[m[1].toLowerCase()], line: line }); i += m[0].length; continue; }
        throw new EelError('bad $ constant', line);
      }
      var hx = /^0[xX][0-9A-Fa-f]+/.exec(src.slice(i, i + 40));
      if (hx) { toks.push({ k: 'num', v: parseInt(hx[0], 16), line: line }); i += hx[0].length; continue; }
      var num = /^(\d+\.\d*|\.\d+|\d+)/.exec(src.slice(i, i + 64));
      if (num) { toks.push({ k: 'num', v: Number(num[0]), line: line }); i += num[0].length; continue; }
      var id = /^[A-Za-z_][A-Za-z0-9_.]*/.exec(src.slice(i, i + 200));
      if (id) {
        var w = id[0].toLowerCase();
        toks.push({ k: (w === 'function' || w === 'local' || w === 'instance' || w === 'globals' || w === 'global' || w === 'static') ? 'kw' : 'id', v: w, line: line });
        i += id[0].length; continue;
      }
      var op = null;
      for (var o = 0; o < OPS.length; o++) if (src.substr(i, OPS[o].length) === OPS[o]) { op = OPS[o]; break; }
      if (!op) throw new EelError("unexpected '" + c + "'", line);
      toks.push({ k: 'op', v: op, line: line }); i += op.length;
    }
    toks.push({ k: 'eof', line: line });
    return toks;
  }

  // ------------------------------------------------------------ parser ----
  var ASSIGN = { '=': 1, '+=': 1, '-=': 1, '*=': 1, '/=': 1, '%=': 1, '^=': 1, '|=': 1, '&=': 1, '~=': 1, '<<=': 1, '>>=': 1 };
  var CMP = { '==': 1, '===': 1, '!=': 1, '!==': 1, '<': 1, '>': 1, '<=': 1, '>=': 1 };

  function parse(toks, funcs) {
    var p = 0;
    function peek() { return toks[p]; }
    function at(k, v) { var t = toks[p]; return t.k === k && (v === undefined || t.v === v); }
    function eat(k, v) { if (at(k, v)) return toks[p++]; return null; }
    function expect(k, v) {
      var t = eat(k, v);
      if (!t) { var q = toks[p]; throw new EelError('expected ' + (v || k) + ', got ' + (q.v !== undefined ? q.v : q.k), q.line); }
      return t;
    }

    function program() {
      var items = [];
      for (;;) {
        while (eat('op', ';')) {}
        if (at('eof')) break;
        if (at('kw', 'function')) { func(); continue; }
        items.push(assign());
        if (!at('op', ';') && !at('eof') && !at('kw', 'function')) {
          var t = peek();
          throw new EelError("missing ';' before " + (t.v !== undefined ? t.v : t.k), t.line);
        }
      }
      return { k: 'seq', items: items };
    }
    function func() {
      var line = expect('kw', 'function').line;
      var name = expect('id').v;
      expect('op', '(');
      var params = [];
      while (!at('op', ')')) { params.push(expect('id').v.replace(/\*$/, '')); eat('op', ','); }
      expect('op', ')');
      var locals = [], instance = [], globals = null;
      while (at('kw')) {
        var kw = toks[p++].v;
        expect('op', '(');
        var list = [];
        while (!at('op', ')')) {
          if (at('op', '*')) { p++; list.push('*'); }
          else list.push(expect('id').v.replace(/\*$/, ''));
          eat('op', ',');
        }
        expect('op', ')');
        if (kw === 'local' || kw === 'static') locals = locals.concat(list);
        else if (kw === 'instance') instance = instance.concat(list);
        else globals = (globals || []).concat(list);
      }
      expect('op', '(');
      var body = block();
      expect('op', ')');
      while (eat('op', ';')) {}
      funcs[name] = { name: name, params: params, locals: locals, instance: instance, globals: globals, body: body, line: line };
    }
    function block() {
      var items = [];
      for (;;) {
        while (eat('op', ';')) {}
        if (at('op', ')') || at('eof')) break;
        if (at('kw', 'function')) { func(); continue; }
        items.push(assign());
        if (!at('op', ';')) break;
      }
      while (eat('op', ';')) {}
      return items.length === 1 ? items[0] : { k: 'seq', items: items };
    }
    function arg() {
      var items = [assign()];
      while (at('op', ';')) {
        p++;
        if (at('op', ')') || at('op', ',')) break;
        items.push(assign());
      }
      return items.length === 1 ? items[0] : { k: 'seq', items: items };
    }
    function assign() {
      var lhs = ternary();
      var t = peek();
      if (t.k === 'op' && ASSIGN[t.v]) {
        p++;
        return { k: 'assign', op: t.v, lhs: lhs, rhs: assign(), line: t.line };
      }
      return lhs;
    }
    function ternary() {
      var c = logic();
      if (eat('op', '?')) {
        var a = at('op', ':') ? { k: 'num', v: 0 } : assign();
        var b = null;
        if (eat('op', ':')) b = assign();
        return { k: 'if', c: c, a: a, b: b };
      }
      return c;
    }
    function logic() {
      var n = cmp();
      while (at('op', '&&') || at('op', '||')) n = { k: 'logic', op: toks[p++].v, a: n, b: cmp() };
      return n;
    }
    function cmp() {
      var n = bit();
      while (peek().k === 'op' && CMP[peek().v]) n = { k: 'bin', op: toks[p++].v, a: n, b: bit() };
      return n;
    }
    function bit() {
      var n = add();
      while (at('op', '|') || at('op', '&') || at('op', '~')) n = { k: 'bin', op: toks[p++].v, a: n, b: add() };
      return n;
    }
    function add() {
      var n = mul();
      while (at('op', '+') || at('op', '-')) n = { k: 'bin', op: toks[p++].v, a: n, b: mul() };
      return n;
    }
    function mul() {
      var n = shift();
      while (at('op', '*') || at('op', '/')) n = { k: 'bin', op: toks[p++].v, a: n, b: shift() };
      return n;
    }
    function shift() {
      var n = mod();
      while (at('op', '<<') || at('op', '>>')) n = { k: 'bin', op: toks[p++].v, a: n, b: mod() };
      return n;
    }
    function mod() {
      var n = pow();
      while (at('op', '%')) { p++; n = { k: 'bin', op: '%', a: n, b: pow() }; }
      return n;
    }
    function pow() {
      var n = unary();
      if (at('op', '^')) { p++; return { k: 'bin', op: '^', a: n, b: pow() }; }
      return n;
    }
    function unary() {
      var t = peek();
      if (t.k === 'op' && (t.v === '!' || t.v === '-' || t.v === '+')) { p++; return { k: 'un', op: t.v, a: unary() }; }
      return postfix();
    }
    function postfix() {
      var n = primary();
      while (at('op', '[')) {
        p++;
        var idx = at('op', ']') ? { k: 'num', v: 0 } : assign();
        expect('op', ']');
        n = { k: 'index', base: n, idx: idx };
      }
      return n;
    }
    function primary() {
      var t = toks[p++];
      switch (t.k) {
        case 'num': return { k: 'num', v: t.v };
        case 'str': return { k: 'strlit', v: t.v };
        case 'nstr': return { k: 'nstr', v: t.v };
        case 'tmpstr': return { k: 'tmpstr', id: p };
        case 'op':
          if (t.v === '(') { var b = block(); expect('op', ')'); return b; }
          break;
        case 'id':
          if (at('op', '(')) {
            p++;
            var args = [];
            while (!at('op', ')')) { args.push(arg()); if (!eat('op', ',')) break; }
            expect('op', ')');
            if ((t.v === 'while' || t.v === 'loop') && at('op', '(')) {
              p++; var body = block(); expect('op', ')');
              args.push(body);
            }
            return { k: 'call', name: t.v, args: args, line: t.line };
          }
          return { k: 'var', name: t.v, line: t.line };
      }
      throw new EelError('unexpected ' + (t.v !== undefined ? t.v : t.k), t.line);
    }
    return program();
  }

  // ---------------------------------------------------------- compiler ----
  // Builtins that are plain maths: name -> JS expression template.
  var MATH = {
    sin: 'Math.sin', cos: 'Math.cos', tan: 'Math.tan', asin: 'Math.asin', acos: 'Math.acos',
    atan: 'Math.atan', atan2: 'Math.atan2', sqrt: 'H.sqrt', exp: 'Math.exp', log: 'Math.log',
    log10: 'Math.log10', abs: 'Math.abs', floor: 'Math.floor', ceil: 'Math.ceil',
    min: 'Math.min', max: 'Math.max', pow: 'Math.pow', sign: 'H.sign', invsqrt: 'H.invsqrt',
    sqr: 'H.sqr', rand: 'H.rand', exp2: 'H.exp2'
  };

  function Compiler(slotsOf) {
    this.slots = slotsOf;          // name -> index into v
    this.funcs = {};
    this.compiledFuncs = {};
    this.funcCode = [];
    this.strConsts = [];
    this.temps = 0;
    this.gfx = false;              // compile gfx_* calls for a host to draw
  }
  Compiler.prototype.slot = function (name) {
    var s = this.slots[name];
    if (s === undefined) { s = this.slots.__count++; this.slots[name] = s; }
    return s;
  };

  Compiler.prototype.compileSection = function (code, firstLine) {
    var ast = parse(lex(code, firstLine), this.funcs);
    var saveTemps = this.temps;
    this.temps = 0;
    var body = this.stmts(ast, null, true, 'r');
    var temps = this.tempDecl();
    this.temps = saveTemps;
    return 'var r = 0;' + temps + body + 'return r;';
  };
  Compiler.prototype.tempDecl = function () {
    if (!this.temps) return '';
    var names = [];
    for (var i = 1; i <= this.temps; i++) names.push('t' + i);
    return 'var ' + names.join(', ') + ';';
  };
  Compiler.prototype.temp = function () { this.temps++; return 't' + this.temps; };

  // Names inside a function: parameters, statics, instance variables, or
  // globals. A function called as ns.f() keeps its instance() variables, and
  // anything it names as this.x, in ns: ns.x (REAPER's pseudo-objects).
  Compiler.prototype.ref = function (name, ctx) {
    if (ctx) {
      var pi = ctx.fn.params.indexOf(name);
      if (pi >= 0) return 'p' + pi;
      if (ctx.fn.locals.indexOf(name) >= 0) return 'v[' + this.slot(ctx.fn.name + '::' + name) + ']';
      if (ctx.fn.instance.indexOf(name) >= 0) return 'v[' + this.slot(ctx.ns ? ctx.ns + '.' + name : name) + ']';
    }
    if (name.indexOf('this.') === 0) return 'v[' + this.slot(resolveThis(name, ctx)) + ']';
    return 'v[' + this.slot(name) + ']';
  };
  // this.x, this.child.x: the namespace the function was called in.
  function resolveThis(name, ctx) {
    var ns = ctx && ctx.ns ? ctx.ns : '';
    if (name === 'this') return ns;
    return ns ? ns + '.' + name.slice(5) : name.slice(5);
  }

  function hasControl(n) {
    if (!n || typeof n !== 'object') return false;
    if (n.k === 'call' && (n.name === 'loop' || n.name === 'while')) return true;
    for (var key in n) {
      var c = n[key];
      if (Array.isArray(c)) { for (var i = 0; i < c.length; i++) if (hasControl(c[i])) return true; }
      else if (c && typeof c === 'object' && c.k && hasControl(c)) return true;
    }
    return false;
  }

  // Statements computing `n`; the value lands in `target` when wanted.
  Compiler.prototype.stmts = function (n, ctx, want, target) {
    if (n.k === 'seq') {
      var out = '';
      if (!n.items.length) return want ? target + ' = 0;' : '';
      for (var i = 0; i < n.items.length; i++) {
        var last = i === n.items.length - 1;
        out += this.stmts(n.items[i], ctx, want && last, target);
      }
      return out;
    }
    if (n.k === 'call' && n.name === 'loop') {
      var cnt = this.temp(), ii = this.temp();
      var s = cnt + ' = Math.min(' + MAXLOOP + ', Math.trunc(' + this.expr(n.args[0], ctx) + ')); ';
      if (want) s += target + ' = 0; ';
      s += 'for (' + ii + ' = 0; ' + ii + ' < ' + cnt + '; ' + ii + '++) {' + (n.args[1] ? this.stmts(n.args[1], ctx, want, target) : '') + '}';
      return s;
    }
    if (n.k === 'call' && n.name === 'while') {
      var guard = this.temp(), r = this.temp();
      if (n.args.length >= 2) {
        return guard + ' = 0; ' + (want ? target + ' = 0; ' : '') + 'while (Math.abs(' + this.expr(n.args[0], ctx) + ') >= ' + EPS + ' && ' + guard + '++ < ' + MAXLOOP + ') {' +
          this.stmts(n.args[1], ctx, want, target) + '}';
      }
      return guard + ' = 0; do {' + this.stmts(n.args[0], ctx, true, r) + (want ? target + ' = ' + r + ';' : '') +
        '} while (Math.abs(' + r + ') >= ' + EPS + ' && ++' + guard + ' < ' + MAXLOOP + ');';
    }
    if (n.k === 'if' && hasControl(n)) {
      var o = 'if (Math.abs(' + this.expr(n.c, ctx) + ') >= ' + EPS + ') {' + this.stmts(n.a, ctx, want, target) + '}';
      if (n.b) o += ' else {' + this.stmts(n.b, ctx, want, target) + '}';
      else if (want) o += ' else { ' + target + ' = 0; }';
      return o;
    }
    var e = this.expr(n, ctx);
    return (want ? target + ' = ' + e : e) + ';';
  };

  function T(e) { return '(Math.abs(' + e + ') >= ' + EPS + ')'; }

  Compiler.prototype.expr = function (n, ctx) {
    var self = this;
    // A loop inside an expression: the statements holding it run in a
    // closure. Only a loop, a sequence or a conditional is one; anything else
    // compiles its parts, each of which takes its own closure if it needs one.
    if (hasControl(n) && (n.k === 'seq' || n.k === 'if' || (n.k === 'call' && (n.name === 'loop' || n.name === 'while')))) {
      return '(() => { var rr = 0; ' + this.stmts(n, ctx, true, 'rr') + ' return rr; })()';
    }
    switch (n.k) {
      case 'raw': return n.code;
      case 'num': return n.v < 0 ? '(' + String(n.v) + ')' : String(n.v);
      case 'strlit': return String(this.strConst(n.v));
      case 'nstr': return 'S.named(' + JSON.stringify(n.v) + ')';
      case 'tmpstr': return 'S.tempStr(' + n.id + ')';
      case 'var': return this.varRead(n.name, ctx);
      case 'seq': {
        if (!n.items.length) return '0';
        return '(' + n.items.map(function (x) { return self.expr(x, ctx); }).join(', ') + ')';
      }
      case 'if':
        return '(' + T(this.expr(n.c, ctx)) + ' ? ' + this.expr(n.a, ctx) + ' : ' + (n.b ? this.expr(n.b, ctx) : '0') + ')';
      case 'logic': {
        var a = T(this.expr(n.a, ctx)), b = T(this.expr(n.b, ctx));
        return '((' + a + (n.op === '&&' ? ' && ' : ' || ') + b + ') ? 1 : 0)';
      }
      case 'un':
        if (n.op === '!') return '(' + T(this.expr(n.a, ctx)) + ' ? 0 : 1)';
        if (n.op === '-') return '(-' + this.expr(n.a, ctx) + ')';
        return this.expr(n.a, ctx);
      case 'bin': return this.binary(n.op, this.expr(n.a, ctx), this.expr(n.b, ctx));
      case 'index': return this.memRead(n, ctx);
      case 'assign': return this.assignment(n, ctx);
      case 'call': return this.call(n, ctx);
    }
    throw new EelError('cannot compile ' + n.k);
  };

  Compiler.prototype.binary = function (op, a, b) {
    switch (op) {
      case '+': return '(' + a + ' + ' + b + ')';
      case '-': return '(' + a + ' - ' + b + ')';
      case '*': return '(' + a + ' * ' + b + ')';
      case '/': return '(' + a + ' / ' + b + ')';
      case '%': return 'H.mod(' + a + ', ' + b + ')';
      case '^': return 'Math.pow(' + a + ', ' + b + ')';
      case '<<': return 'H.shl(' + a + ', ' + b + ')';
      case '>>': return 'H.shr(' + a + ', ' + b + ')';
      case '|': return 'H.bor(' + a + ', ' + b + ')';
      case '&': return 'H.band(' + a + ', ' + b + ')';
      case '~': return 'H.bxor(' + a + ', ' + b + ')';
      case '==': return '(Math.abs(' + a + ' - ' + b + ') < ' + EPS + ' ? 1 : 0)';
      case '!=': return '(Math.abs(' + a + ' - ' + b + ') < ' + EPS + ' ? 0 : 1)';
      case '===': return '(' + a + ' === ' + b + ' ? 1 : 0)';
      case '!==': return '(' + a + ' !== ' + b + ' ? 1 : 0)';
      case '<': case '>': case '<=': case '>=': return '(' + a + ' ' + op + ' ' + b + ' ? 1 : 0)';
    }
    throw new EelError('bad operator ' + op);
  };

  Compiler.prototype.strConst = function (s) {
    var i = this.strConsts.indexOf(s);
    if (i < 0) { i = this.strConsts.length; this.strConsts.push(s); }
    return 10000 + i;
  };

  Compiler.prototype.varRead = function (name, ctx) {
    if (name === 'gmem') return 'S.gmemBase';
    return this.ref(name, ctx);
  };

  Compiler.prototype.address = function (n, ctx) {
    if (n.base.k === 'var' && n.base.name === 'gmem') return { gmem: true, addr: this.expr(n.idx, ctx) };
    var base = this.expr(n.base, ctx);
    var idx = n.idx.k === 'num' && n.idx.v === 0 ? null : this.expr(n.idx, ctx);
    return { gmem: false, addr: idx === null ? base : '(' + base + ' + ' + idx + ')' };
  };
  Compiler.prototype.memRead = function (n, ctx) {
    var a = this.address(n, ctx);
    if (a.gmem) return 'S.grd(' + a.addr + ')';
    // Inline: a typed array read out of range is undefined, which || makes 0.
    return '(M[(' + a.addr + ' + ' + EPS + ') | 0] || 0)';
  };

  var COMPOUND = { '+=': '+', '-=': '-', '*=': '*', '/=': '/', '%=': '%', '^=': '^', '|=': '|', '&=': '&', '~=': '~', '<<=': '<<', '>>=': '>>' };

  Compiler.prototype.assignment = function (n, ctx) {
    var self = this;
    var lhs = n.lhs, rhs = this.expr(n.rhs, ctx);
    function value(cur) { return n.op === '=' ? rhs : self.binary(COMPOUND[n.op], cur, rhs); }
    if (lhs.k === 'var') {
      var r = this.ref(lhs.name, ctx);
      return '(' + r + ' = ' + value(r) + ')';
    }
    if (lhs.k === 'index') {
      var a = this.address(lhs, ctx), t = this.temp();
      var rdf = a.gmem ? 'S.grd' : 'rd', wrf = a.gmem ? 'S.gwr' : 'wr';
      return '(' + t + ' = ' + a.addr + ', ' + wrf + '(' + t + ', ' + value(rdf + '(' + t + ')') + '))';
    }
    if (lhs.k === 'if') {
      var tv = this.temp();
      var asg = function (side) { return side ? self.assignment({ k: 'assign', op: '=', lhs: side, rhs: { k: 'raw', code: tv } }, ctx) : '0'; };
      if (n.op !== '=') throw new EelError('compound assignment to a conditional is not supported');
      return '(' + tv + ' = ' + rhs + ', ' + T(this.expr(lhs.c, ctx)) + ' ? ' + asg(lhs.a) + ' : ' + asg(lhs.b) + ')';
    }
    if (lhs.k === 'nstr' || lhs.k === 'strlit') {
      return 'S.strcpy(' + this.expr(lhs, ctx) + ', ' + rhs + ')';
    }
    if (lhs.k === 'call' && lhs.name === 'slider') {
      var si = this.temp();
      return '(' + si + ' = ' + this.expr(lhs.args[0], ctx) + ', S.setSliderByIndex(' + si + ', ' + value('S.sliderByIndex(' + si + ')') + '))';
    }
    if (lhs.k === 'seq' && lhs.items.length) {
      var head = lhs.items.slice(0, -1).map(function (x) { return self.expr(x, ctx); });
      return '(' + head.concat([this.assignment({ k: 'assign', op: n.op, lhs: lhs.items[lhs.items.length - 1], rhs: n.rhs }, ctx)]).join(', ') + ')';
    }
    throw new EelError('cannot assign to ' + lhs.k);
  };

  // A variable passed by reference (midirecv, file_var): its JS lvalue.
  Compiler.prototype.lvalue = function (n, ctx) {
    if (n.k === 'var') return this.ref(n.name, ctx);
    return null;
  };

  Compiler.prototype.call = function (n, ctx) {
    var self = this, name = n.name, args = n.args;
    function A(i) { return args[i] === undefined ? '0' : self.expr(args[i], ctx); }
    function all() { return args.map(function (x) { return self.expr(x, ctx); }).join(', '); }
    if (MATH[name]) return MATH[name] + '(' + all() + ')';
    switch (name) {
      case 'midirecv': {
        var lv = args.map(function (x) { return self.lvalue(x, ctx); });
        var sets = [];
        for (var i = 0; i < lv.length; i++) {
          if (!lv[i]) continue;
          var src = lv.length >= 4 ? 'S.mr[' + i + ']' : (i === 2 ? '(S.mr[2] + S.mr[3] * 256)' : 'S.mr[' + i + ']');
          sets.push(lv[i] + ' = ' + src);
        }
        return '(S.midirecv() ? (' + (sets.length ? sets.join(', ') + ', ' : '') + 'S.mr[1]) : 0)';
      }
      case 'midisend':
        if (args.length >= 4) return 'S.midisend(' + A(0) + ', ' + A(1) + ', ' + A(2) + ', ' + A(3) + ')';
        return 'S.midisend3(' + A(0) + ', ' + A(1) + ', ' + A(2) + ')';
      case 'midisend_buf': return 'S.midisendBuf(' + A(0) + ', ' + A(1) + ', ' + A(2) + ')';
      case 'midisyx': return 'S.midisendBuf(' + A(0) + ', ' + A(1) + ', ' + A(2) + ')';
      case 'file_var': {
        var fv = this.lvalue(args[1], ctx);
        if (!fv) return 'S.fileVar(' + A(0) + ', ' + A(1) + ')';
        return '(' + fv + ' = S.fileVar(' + A(0) + ', ' + fv + '))';
      }
      case 'file_riff': {
        // channels and sample rate come back through the arguments
        var nc = this.lvalue(args[1], ctx), fr = this.lvalue(args[2], ctx);
        var t0 = this.temp();
        return '(' + t0 + ' = S.fileRiff(' + A(0) + ')' + (nc ? ', ' + nc + ' = S.riff[0]' : '') + (fr ? ', ' + fr + ' = S.riff[1]' : '') + ', ' + t0 + ')';
      }
      case 'slider': return 'S.sliderByIndex(' + A(0) + ')';
      case 'loop': case 'while':
        return '(() => { var rr = 0; ' + this.stmts(n, ctx, true, 'rr') + ' return rr; })()';
      case 'match': case 'matchi': {
        var refs = args.slice(2).map(function (x) { return self.lvalue(x, ctx); });
        var call = 'S.match(' + (name === 'matchi' ? 'true' : 'false') + ', ' + A(0) + ', ' + A(1) + ')';
        if (!refs.length) return call;
        var tm = this.temp();
        var assigns = refs.map(function (r, k) { return r ? r + ' = S.matchOut[' + k + ']' : ''; }).filter(Boolean);
        return '(' + tm + ' = ' + call + ', ' + tm + ' ? (' + (assigns.length ? assigns.join(', ') + ', ' : '') + '1) : 0)';
      }
    }
    if (this.funcs[name]) return this.userCall(this.funcs[name], args, ctx, '');
    if (name.indexOf('.') > 0) {
      var base = name.slice(name.lastIndexOf('.') + 1), prefix = name.slice(0, name.lastIndexOf('.'));
      if (this.funcs[base]) return this.userCall(this.funcs[base], args, ctx, prefix === 'this' || prefix.indexOf('this.') === 0 ? resolveThis(prefix, ctx) : prefix);
    }
    if (/^gfx_|^mouse_/.test(name)) {
      if (!this.gfx) return '(' + (args.length ? all() + ', ' : '') + '0)';
      // Width and height come back through the arguments, as file_riff's do.
      if (name === 'gfx_measurestr' || name === 'gfx_measurechar' || name === 'gfx_getimgdim') {
        var mw = this.lvalue(args[1] || { k: 'num', v: 0 }, ctx), mh = this.lvalue(args[2] || { k: 'num', v: 0 }, ctx);
        var tg = this.temp();
        return '(' + tg + ' = S.call(' + JSON.stringify(name) + ', ' + A(0) + ')' + (mw ? ', ' + mw + ' = S.gm[0]' : '') +
               (mh ? ', ' + mh + ' = S.gm[1]' : '') + ', ' + tg + ')';
      }
    }
    return 'S.call(' + JSON.stringify(name) + (args.length ? ', ' + all() : '') + ')';
  };

  // One compiled copy per function and namespace, as EEL2 does: a.f() and
  // b.f() are two functions, each with its own instance variables.
  Compiler.prototype.userCall = function (fn, args, ctx, ns) {
    var self = this;
    ns = ns || '';
    if (args.length !== fn.params.length && !(args.length === 1 && fn.params.length === 0)) {
      // EEL2 refuses the wrong number of arguments at compile time.
      throw new EelError(fn.name + '() takes ' + fn.params.length + ' arguments, given ' + args.length);
    }
    var jsName = 'F_' + fn.name.replace(/\./g, '_') + (ns ? '$' + ns.replace(/\./g, '$') : '');
    var key = fn.name + '@' + ns;
    if (!this.compiledFuncs[key]) {
      this.compiledFuncs[key] = true;
      var saved = this.temps;
      this.temps = 0;
      var body = this.stmts(fn.body, { fn: fn, ns: ns }, true, 'r');
      var temps = this.tempDecl();
      this.temps = saved;
      var params = fn.params.map(function (_, i) { return 'p' + i; });
      this.funcCode.push('function ' + jsName + '(' + params.join(', ') + ') { var r = 0;' + temps + body + ' return r; }');
    }
    return jsName + '(' + args.slice(0, fn.params.length).map(function (x) { return self.expr(x, ctx); }).join(', ') + ')';
  };

  // ----------------------------------------------------------- helpers ----
  function i64(x) { return Math.trunc(x); }
  function bigOp(a, b, f) { return Number(BigInt.asIntN(64, f(BigInt(i64(a)), BigInt(i64(b))))); }
  var H = {
    sqrt: function (x) { return Math.sqrt(Math.abs(x)); },
    sign: function (x) { return x > 0 ? 1 : (x < 0 ? -1 : 0); },
    invsqrt: function (x) { return 1 / Math.sqrt(x); },
    sqr: function (x) { return x * x; },
    exp2: function (x) { return Math.pow(2, x); },
    rand: function (x) { return Math.random() * (x === undefined ? 1 : x); },
    mod: function (a, b) {
      var ib = Math.trunc(Math.abs(b));
      return ib ? Math.trunc(Math.abs(a)) % ib : 0;
    },
    shl: function (a, b) { return bigOp(a, b, function (x, y) { return x << (y & 63n); }); },
    shr: function (a, b) { return bigOp(a, b, function (x, y) { return x >> (y & 63n); }); },
    bor: function (a, b) {
      if (Math.abs(a) < 2147483648 && Math.abs(b) < 2147483648) return (i64(a) | i64(b));
      return bigOp(a, b, function (x, y) { return x | y; });
    },
    band: function (a, b) {
      if (Math.abs(a) < 2147483648 && Math.abs(b) < 2147483648) return (i64(a) & i64(b));
      return bigOp(a, b, function (x, y) { return x & y; });
    },
    bxor: function (a, b) {
      if (Math.abs(a) < 2147483648 && Math.abs(b) < 2147483648) return (i64(a) ^ i64(b));
      return bigOp(a, b, function (x, y) { return x ^ y; });
    }
  };

  // C's %f: the double's exact decimal value, rounded half to even.
  var F64 = new Float64Array(1), U32 = new Uint32Array(F64.buffer);
  function toFixedC(x, f) {
    if (!isFinite(x)) return String(x);
    var neg = x < 0; F64[0] = Math.abs(x);
    var hi = U32[1], lo = U32[0], exp = (hi >>> 20) & 0x7ff;
    var mant = (BigInt(hi & 0xfffff) << 32n) | BigInt(lo);
    if (exp === 0) exp = 1; else mant |= 1n << 52n;
    var e = exp - 1075, D, sc;
    if (e >= 0) { D = mant << BigInt(e); sc = 0; } else { D = mant * (5n ** BigInt(-e)); sc = -e; }
    var q;
    if (f >= sc) q = D * (10n ** BigInt(f - sc));
    else {
      var div = 10n ** BigInt(sc - f); q = D / div; var r2 = (D % div) * 2n;
      if (r2 > div || (r2 === div && (q & 1n) === 1n)) q += 1n;
    }
    var s = q.toString();
    if (f > 0) { while (s.length <= f) s = '0' + s; s = s.slice(0, s.length - f) + '.' + s.slice(s.length - f); }
    return (neg && /[1-9]/.test(s) ? '-' : (neg ? '-' : '')) + s;
  }

  // EEL2's sprintf, on doubles.
  function eelFormat(fmt, values) {
    var vi = 0;
    return fmt.replace(/%([-+ 0#]*)(\d*)(?:\.(\d+))?([dixXfgecs%])/g, function (all, flags, width, prec, conv) {
      if (conv === '%') return '%';
      var v = values[vi++], s;
      if (v === undefined) v = 0;
      switch (conv) {
        case 'd': case 'i': s = String(Math.trunc(v.num !== undefined ? v.num : v)); break;
        case 'x': s = (Math.trunc(v) >>> 0).toString(16); break;
        case 'X': s = (Math.trunc(v) >>> 0).toString(16).toUpperCase(); break;
        case 'f': s = toFixedC(Number(v), prec === undefined ? 6 : Number(prec)); break;
        case 'e': s = Number(v).toExponential(prec === undefined ? 6 : Number(prec)); break;
        case 'g': s = String(Number(Number(v).toPrecision(prec === undefined ? 6 : Math.max(1, Number(prec))))); break;
        case 'c': s = String.fromCharCode(Math.trunc(v)); break;
        case 's': s = v.str !== undefined ? v.str : String(v); break;
      }
      if (flags.indexOf('+') >= 0 && conv !== 's' && Number(v) >= 0) s = '+' + s;
      var w = Number(width || 0);
      while (s.length < w) s = flags.indexOf('-') >= 0 ? s + ' ' : (flags.indexOf('0') >= 0 && conv !== 's' ? '0' + s : ' ' + s);
      return s;
    });
  }

  // ---------------------------------------------------------- instance ----
  function JSFX(text, opts) {
    opts = opts || {};
    this.file = parseFile(text, opts.readImport);
    this.srate = opts.sampleRate || 48000;
    this.slots = { __count: 0 };
    var self = this;
    var C = new Compiler(this.slots);
    C.gfx = !!opts.gfx;
    // Predeclare what the host reads and writes.
    ['srate', 'samplesblock', 'tempo', 'play_state', 'play_position', 'beat_position', 'ts_num', 'ts_denom',
     'num_ch', 'trigger', 'pdc_delay', 'pdc_bot_ch', 'pdc_top_ch', 'pdc_midi', 'ext_noinit', 'ext_nodenorm',
     'ext_midi_bus', 'midi_bus', 'gfx_ext_retina'].forEach(function (n) { C.slot(n); });
    for (var c = 0; c < 64; c++) C.slot('spl' + c);
    for (var s = 1; s <= 64; s++) C.slot('slider' + s);
    this.file.sliders.forEach(function (sl) { C.slot(sl.variable); });
    if (C.gfx) ['gfx_r', 'gfx_g', 'gfx_b', 'gfx_a', 'gfx_a2', 'gfx_x', 'gfx_y', 'gfx_w', 'gfx_h', 'gfx_texth', 'gfx_mode', 'gfx_clear',
                'gfx_dest', 'gfx_ext_flags', 'mouse_x', 'mouse_y', 'mouse_cap', 'mouse_wheel', 'mouse_hwheel'].forEach(function (n) { C.slot(n); });

    var sections = {};
    ['init', 'slider', 'block', 'sample', 'serialize'].concat(C.gfx ? ['gfx'] : []).forEach(function (name) {
      var parts = self.file.sections[name];
      if (!parts.length) return;
      sections[name] = parts.map(function (part) { return C.compileSection(part.code, part.line); });
    });
    // @gfx is parsed for its functions only, so @init code that calls a
    // helper defined there still compiles.
    if (!C.gfx) this.file.sections.gfx.forEach(function (part) {
      try { parse(lex(part.code, part.line), C.funcs); } catch (e) { /* the window is not run */ }
    });

    // Room for names a later eval() adds: the generated code holds on to v.
    this.v = new Float64Array(this.slots.__count + 4096);
    this.strConsts = C.strConsts;
    var src = [];
    src.push('"use strict";');
    // Memory is one Float64Array that doubles when written past its end, up
    // to EEL2's 8M words; rd and wr sit beside it so V8 can inline them.
    src.push('var v = S.v, M = new Float64Array(' + BLOCK + ');');
    src.push('function rd(a) { var i = (a + ' + EPS + ') | 0; return (i >= 0 && i < M.length) ? M[i] : 0; }');
    src.push('function wr(a, x) { var i = (a + ' + EPS + ') | 0; if (i >= 0 && i < M.length) { M[i] = x; return x; } return grow(i, x); }');
    src.push('function grow(i, x) { if (i < 0 || i >= ' + (BLOCK * NBLOCKS) + ') return x; var n = M.length; while (n <= i) n *= 2;' +
             ' var N = new Float64Array(Math.min(n, ' + (BLOCK * NBLOCKS) + ')); N.set(M); M = N; M[i] = x; return x; }');
    src.push('S.rd = rd; S.wr = wr; S.clearMem = function () { M = new Float64Array(' + BLOCK + '); };');
    // Code compiled later (eval) runs in this scope, beside M, v and the helpers.
    src.push('S.evalIn = function (code) { return eval(code); };');
    src.push(C.funcCode.join('\n'));
    Object.keys(sections).forEach(function (name) {
      src.push('S.sec_' + name + ' = [' + sections[name].map(function (b) { return 'function () {' + b + '}'; }).join(',\n') + '];');
    });
    this.code = src.join('\n');
    this.reset();
    new Function('S', 'H', this.code)(this, H);
  }

  JSFX.prototype.reset = function () {
    this.v.fill(0);
    this.mem = new Array(NBLOCKS);
    this.gmem = NS.sharedGmem || (NS.sharedGmem = {});
    this.gmemName = (/gmem=(\S+)/.exec(this.file.options) || [])[1] || '';
    this.strings = {};
    this.namedIds = {};
    this.nextNamed = 90000;
    this.midiIn = []; this.midiInPos = 0; this.midiOut = [];
    this.mr = [0, 0, 0, 0];
    this.matchOut = [];
    this.serial = null;
    this.blockCount = 0;
    this.sliderDirty = true;
    this.sampleFrame = 0;
    var self = this;
    if (this.clearMem) this.clearMem();
    this.file.sliders.forEach(function (sl) { self.v[self.slots[sl.variable]] = sl.def; });
  };

  JSFX.prototype.slot = function (name) { return this.slots[name.toLowerCase()]; };
  JSFX.prototype.getVar = function (name) { var s = this.slot(name); return s === undefined ? 0 : this.v[s]; };
  JSFX.prototype.setVar = function (name, val) { var s = this.slot(name); if (s !== undefined) this.v[s] = val; };

  JSFX.prototype.sliderVar = function (n) {
    for (var i = 0; i < this.file.sliders.length; i++) if (this.file.sliders[i].index === n) return this.file.sliders[i].variable;
    return 'slider' + n;
  };
  JSFX.prototype.sliderByIndex = function (n) { return this.v[this.slots[this.sliderVar(Math.trunc(n))]] || 0; };
  JSFX.prototype.setSliderByIndex = function (n, val) { this.v[this.slots[this.sliderVar(Math.trunc(n))]] = val; return val; };
  JSFX.prototype.getSlider = function (n) { return this.sliderByIndex(n); };
  JSFX.prototype.setSlider = function (n, val) {
    this.setSliderByIndex(n, val);
    this.sliderDirty = true;
  };

  JSFX.prototype.runSection = function (name) {
    var list = this['sec_' + name];
    if (!list) return 0;
    var r = 0;
    for (var i = 0; i < list.length; i++) r = list[i]();
    return r;
  };

  JSFX.prototype.setTime = function (t) {
    var v = this.v, s = this.slots;
    if (t.tempo !== undefined) v[s.tempo] = t.tempo;
    if (t.playState !== undefined) v[s.play_state] = t.playState;
    if (t.beat !== undefined) v[s.beat_position] = t.beat;
    if (t.seconds !== undefined) v[s.play_position] = t.seconds;
    if (t.num !== undefined) v[s.ts_num] = t.num;
    if (t.den !== undefined) v[s.ts_denom] = t.den;
  };

  JSFX.prototype.init = function (sampleRate) {
    if (sampleRate) this.srate = sampleRate;
    var keep = this.file.sliders.map(function (sl) { return this.v[this.slots[sl.variable]]; }, this);
    this.reset();
    this.file.sliders.forEach(function (sl, i) { this.v[this.slots[sl.variable]] = keep[i]; }, this);
    var v = this.v, s = this.slots;
    v[s.srate] = this.srate;
    v[s.num_ch] = Math.max(this.file.inPins.length, this.file.outPins.length);
    v[s.tempo] = v[s.tempo] || 120; v[s.ts_num] = v[s.ts_num] || 4; v[s.ts_denom] = v[s.ts_denom] || 4;
    this.runSection('init');
    this.runSection('slider');
    this.sliderDirty = false;
    this.initialised = true;
  };

  /* One block: `inputs`/`outputs` are arrays of Float32Array per channel (or
   * null for a MIDI-only device), `midi` is [{offset, data:[b1,b2,b3]}]
   * sorted by offset. Returns the MIDI sent, with offsets. */
  JSFX.prototype.process = function (n, inputs, outputs, midi) {
    if (!this.initialised) this.init();
    var v = this.v, s = this.slots;
    if (this.sliderDirty) { this.sliderDirty = false; this.runSection('slider'); }
    v[s.samplesblock] = n;
    this.midiIn = midi || [];
    this.midiInPos = 0;
    this.midiOut = [];
    this.runSection('block');
    var sec = this.sec_sample;
    if (sec && sec.length) {
      var nIn = inputs ? inputs.length : 0, nOut = outputs ? outputs.length : 0;
      var nch = Math.max(nIn, nOut, 2);
      var spl = [];
      for (var c = 0; c < nch; c++) spl.push(s['spl' + c]);
      for (var i = 0; i < n; i++) {
        this.sampleFrame = i;
        for (var ci = 0; ci < nch; ci++) v[spl[ci]] = ci < nIn && inputs[ci] ? inputs[ci][i] : 0;
        for (var k = 0; k < sec.length; k++) sec[k]();
        for (var co = 0; co < nOut; co++) if (outputs[co]) outputs[co][i] = v[spl[co]];
      }
    } else if (outputs && inputs) {
      for (var ch = 0; ch < outputs.length; ch++) if (outputs[ch] && inputs[ch]) outputs[ch].set(inputs[ch]);
    }
    // MIDI a plug-in did not read passes through, as in REAPER.
    for (var r = this.midiInPos; r < this.midiIn.length; r++) this.midiOut.push(this.midiIn[r]);
    this.blockCount++;
    var out = this.midiOut;
    out.sort(function (a, b) { return a.offset - b.offset; });
    return out;
  };

  // ------------------------------------------------------- the host API --
  JSFX.prototype.midirecv = function () {
    if (this.midiInPos >= this.midiIn.length) return 0;
    var ev = this.midiIn[this.midiInPos++];
    this.mr[0] = ev.offset; this.mr[1] = ev.data[0]; this.mr[2] = ev.data[1] || 0; this.mr[3] = ev.data[2] || 0;
    return 1;
  };
  JSFX.prototype.midisend = function (offset, b1, b2, b3) {
    this.midiOut.push({ offset: Math.max(0, Math.trunc(offset)), data: [Math.trunc(b1) & 255, Math.trunc(b2) & 127, Math.trunc(b3) & 127] });
    return b1;
  };
  JSFX.prototype.midisend3 = function (offset, b1, b23) {
    b23 = Math.trunc(b23);
    return this.midisend(offset, b1, b23 & 255, (b23 >> 8) & 255);
  };
  JSFX.prototype.midisendBuf = function (offset, buf, len) {
    var data = [];
    for (var i = 0; i < len; i++) data.push(Math.trunc(this.rd(buf + i)) & 255);
    this.midiOut.push({ offset: Math.max(0, Math.trunc(offset)), data: data });
    return len;
  };

  JSFX.prototype.grd = function (a) { var g = this.gmem[this.gmemName]; if (!g) return 0; var i = (a + EPS) | 0; return g[i] || 0; };
  JSFX.prototype.gwr = function (a, val) {
    var g = this.gmem[this.gmemName] || (this.gmem[this.gmemName] = {});
    g[(a + EPS) | 0] = val; return val;
  };

  // Strings: literals are 10000+, named strings 90000+, slots 0-1023 free.
  JSFX.prototype.str = function (id) {
    id = Math.trunc(id);
    if (id >= 10000 && id < 90000) return this.strConsts[id - 10000] || '';
    return this.strings[id] || '';
  };
  JSFX.prototype.setStr = function (id, s) { this.strings[Math.trunc(id)] = s; return id; };
  JSFX.prototype.named = function (name) {
    var id = this.namedIds[name];
    if (id === undefined) { id = this.namedIds[name] = this.nextNamed++; this.strings[id] = ''; }
    return id;
  };
  JSFX.prototype.tempStr = function (site) { var id = 200000 + site; if (this.strings[id] === undefined) this.strings[id] = ''; return id; };
  JSFX.prototype.strcpy = function (d, s) { return this.setStr(d, this.str(s)); };
  JSFX.prototype.match = function (ci, pat, sid) {
    var p = this.str(pat), s = this.str(sid);
    var re = '^' + p.replace(/[.+^${}()|[\]\\]/g, '\\$&').replace(/\*/g, '.*').replace(/\?/g, '.') + '$';
    return new RegExp(re, ci ? 'i' : '').test(s) ? 1 : 0;
  };

  JSFX.prototype.riff = [0, 0];
  JSFX.prototype.fileRiff = function (h) {
    var f = this.files && this.files[Math.trunc(h)];
    this.riff = f ? [f.channels, f.rate] : [0, 0];
    return f ? 1 : 0;
  };
  // One frame of @gfx, drawn by `host`: an object with a method per gfx_*
  // function (each called with the JSFX first), as the Ableton devices give.
  // `w`, `h` and `mouse` ({x, y, cap, wheel, hwheel}) are what REAPER sets.
  JSFX.prototype.runGfx = function (host, w, h, mouse) {
    if (!this.sec_gfx) return 0;
    if (!this.initialised) this.init();
    var v = this.v, s = this.slots;
    this.gfxHost = host;
    v[s.gfx_w] = w; v[s.gfx_h] = h;
    if (mouse) {
      v[s.mouse_x] = mouse.x; v[s.mouse_y] = mouse.y; v[s.mouse_cap] = mouse.cap;
      if (mouse.wheel) v[s.mouse_wheel] += mouse.wheel;
      if (mouse.hwheel) v[s.mouse_hwheel] += mouse.hwheel;
    }
    return this.runSection('gfx');
  };
  JSFX.prototype.gm = [0, 0];

  JSFX.prototype.call = function (name) {
    var a = Array.prototype.slice.call(arguments, 1);
    if (this.gfxHost && this.gfxHost[name]) return +this.gfxHost[name].apply(this.gfxHost, [this].concat(a)) || 0;
    var f = BUILTINS[name];
    if (!f) {
      if (!this.warned) this.warned = {};
      if (!this.warned[name] && typeof console !== 'undefined') { this.warned[name] = true; console.warn('JSFX: no ' + name + '()'); }
      return 0;
    }
    return f.apply(this, a);
  };

  // @serialize: values written in order, read back in order.
  JSFX.prototype.fileVar = function (h, cur) {
    h = Math.trunc(h);
    if (h === 0 && this.serial) {
      if (this.serial.mode === 'write') { this.serial.data.push(cur); return cur; }
      var d = this.serial.data[this.serial.pos++];
      return d === undefined ? cur : (typeof d === 'number' ? d : cur);
    }
    var f = this.files && this.files[h];
    if (f && f.pos < f.values.length) return f.values[f.pos++];
    return cur;
  };
  JSFX.prototype.serialize = function () {
    this.serial = { mode: 'write', data: [], pos: 0 };
    this.runSection('serialize');
    var data = this.serial.data;
    this.serial = null;
    return { sliders: this.file.sliders.map(function (sl) { return this.v[this.slots[sl.variable]]; }, this), data: data };
  };
  JSFX.prototype.deserialize = function (state) {
    if (!state) return;
    if (!this.initialised) this.init();
    if (state.sliders) this.file.sliders.forEach(function (sl, i) {
      if (state.sliders[i] !== undefined) this.v[this.slots[sl.variable]] = state.sliders[i];
    }, this);
    this.serial = { mode: 'read', data: state.data || [], pos: 0 };
    this.runSection('serialize');
    this.serial = null;
    this.sliderDirty = true;
  };

  // Run a line of EEL2 against this instance: how a device's own buttons
  // (Panic, Transfer to Pads...) are pressed from Middaw's controls.
  JSFX.prototype.eval = function (code) {
    var C = new Compiler(this.slots);
    C.gfx = !!opts.gfx;
    C.strConsts = this.strConsts;
    // reuse the instance's functions by recompiling them into this snippet
    var funcs = {};
    var self = this;
    ['init', 'slider', 'block', 'sample', 'serialize', 'gfx'].forEach(function (name) {
      self.file.sections[name].forEach(function (part) { try { parse(lex(part.code, part.line), funcs); } catch (e) {} });
    });
    C.funcs = funcs;
    var body = C.compileSection(code, 1);
    var fn = this.evalIn('(function () {' + C.funcCode.join('\n') + ' return function () {' + body + '}; })()');
    if (this.slots.__count > this.v.length) throw new EelError('too many new variables in eval');
    return fn();
  };

  var BUILTINS = {
    memset: function (d, val, n) { for (var i = 0; i < n; i++) this.wr(d + i, val); return d; },
    memcpy: function (d, s, n) {
      var tmp = [];
      for (var i = 0; i < n; i++) tmp.push(this.rd(s + i));
      for (var j = 0; j < n; j++) this.wr(d + j, tmp[j]);
      return d;
    },
    freembuf: function (n) { return n; },
    mem_set_values: function () { return 0; },
    time: function () { return Math.floor(Date.now() / 1000); },
    time_precise: function () { return (typeof performance !== 'undefined' ? performance.now() : Date.now()) / 1000; },
    sliderchange: function () { if (this.onSliderChange) this.onSliderChange(); return 0; },
    slider_automate: function () { if (this.onSliderChange) this.onSliderChange(); return 0; },
    slider_show: function () { return 0; },
    strlen: function (s) { return this.str(s).length; },
    strcpy: function (d, s) { return this.setStr(d, this.str(s)); },
    strcat: function (d, s) { return this.setStr(d, this.str(d) + this.str(s)); },
    strcmp: function (a, b) { var x = this.str(a), y = this.str(b); return x < y ? -1 : x > y ? 1 : 0; },
    stricmp: function (a, b) { var x = this.str(a).toLowerCase(), y = this.str(b).toLowerCase(); return x < y ? -1 : x > y ? 1 : 0; },
    strncpy: function (d, s, n) { return this.setStr(d, this.str(s).slice(0, n)); },
    strcpy_substr: function (d, s, off, len) {
      var str = this.str(s);
      if (off < 0) off = Math.max(0, str.length + off);
      return this.setStr(d, len === undefined ? str.slice(off) : str.substr(off, Math.max(0, len)));
    },
    str_getchar: function (s, i) { var str = this.str(s); if (i < 0) i += str.length; return i >= 0 && i < str.length ? str.charCodeAt(i) : 0; },
    str_setchar: function (s, i, c) {
      var str = this.str(s); if (i < 0) i += str.length;
      if (i >= 0 && i <= str.length) this.setStr(s, str.slice(0, i) + String.fromCharCode(c) + str.slice(i + 1));
      return c;
    },
    sprintf: function (d, fmt) {
      var self = this, vals = Array.prototype.slice.call(arguments, 2);
      var f = this.str(fmt);
      // %s takes a string handle
      var vi = 0;
      var mapped = [];
      f.replace(/%[-+ 0#]*\d*(?:\.\d+)?([dixXfgecs%])/g, function (all, conv) {
        if (conv === '%') return all;
        var x = vals[vi++];
        mapped.push(conv === 's' ? { str: self.str(x) } : x);
        return all;
      });
      return this.setStr(d, eelFormat(f, mapped));
    },
    file_open: function (s) {
      var name = this.str(s);
      var vals = this.openFile ? this.openFile(name) : null;
      if (!vals) return -1;
      if (!this.files) { this.files = {}; this.nextFile = 1; }
      var h = this.nextFile++;
      this.files[h] = { values: vals.samples || vals, pos: 0, channels: vals.channels || 1, rate: vals.rate || this.srate };
      return h;
    },
    file_close: function (h) { if (this.files) delete this.files[h]; return 0; },
    file_rewind: function (h) { if (this.files && this.files[h]) this.files[h].pos = 0; return 0; },
    file_avail: function (h) {
      h = Math.trunc(h);
      if (h === 0 && this.serial) return this.serial.mode === 'write' ? -1 : this.serial.data.length - this.serial.pos;
      var f = this.files && this.files[h];
      return f ? f.values.length - f.pos : 0;
    },
    file_riff: function () { return 0; },
    file_text: function () { return 0; },
    file_mem: function (h, addr, n) {
      h = Math.trunc(h);
      if (h === 0 && this.serial) {
        if (this.serial.mode === 'write') { for (var i = 0; i < n; i++) this.serial.data.push(this.rd(addr + i)); }
        else { for (var j = 0; j < n; j++) { var d = this.serial.data[this.serial.pos++]; this.wr(addr + j, typeof d === 'number' ? d : 0); } }
        return n;
      }
      var f = this.files && this.files[h];
      if (!f) return 0;
      var k = 0;
      for (; k < n && f.pos < f.values.length; k++) this.wr(addr + k, f.values[f.pos++]);
      return k;
    },
    file_string: function (h, s) {
      h = Math.trunc(h);
      if (h === 0 && this.serial) {
        if (this.serial.mode === 'write') this.serial.data.push({ s: this.str(s) });
        else { var d = this.serial.data[this.serial.pos++]; if (d && d.s !== undefined) this.setStr(s, d.s); }
      }
      return 1;
    },
    export_buffer_to_project: function () { return this.exportBuffer ? this.exportBuffer.apply(this, arguments) : 0; },
    get_host_placement: function () { return 0; },
    get_host_numchan: function () { return 2; },
    set_host_numchan: function () { return 0; },
    get_pin_mapping: function () { return 0; },
    set_pdc: function () { return 0; },
    printf: function () { return 0; },
    gfx_getchar: function () { return 0; }
  };

  NS.JSFX = JSFX;
  NS.parseFile = parseFile;
  NS.parseSliderLine = parseSliderLine;
  NS.lexEel = lex;
  NS.parseEel = parse;
  NS.EelError = EelError;
})(typeof module === 'object' && module.exports
  ? (module.exports = (globalThis.MiddawJSFX = globalThis.MiddawJSFX || {}))
  : (globalThis.MiddawJSFX = globalThis.MiddawJSFX || {}));


/* ---- kit/gfx.js ---- */
/* REAPER's gfx_* drawing, on Max's mgraphics: the host a JSFX's @gfx runs on
 * (MiddawJSFX's runGfx). Each method takes the JSFX first, reads gfx_r, gfx_x
 * and the rest from its variables, and draws as REAPER would: text from its
 * top-left, gfx_x moved on past it, angles from twelve o'clock clockwise.
 *
 * gfx_showmenu cannot wait for a choice inside a frame, so it asks for one:
 * `menu` is set, the frame returns 0, and the device draws the menu. When an
 * item is chosen the device puts the variables back as they were at the start
 * of that frame and runs it again, and this time gfx_showmenu returns the item.
 */
var Gfx = (function () {
  'use strict';
  function Host(g) {
    this.g = g;
    this.fonts = { 0: { name: 'Arial', size: 13, flags: 0 } };
    this.font = 0;
    this.menu = null;        // { text, x, y } asked for this frame
    this.choice = 0;         // the item to give gfx_showmenu on the replayed frame
    this.slots = null;
  }
  Host.prototype.begin = function (g, fx) {
    this.g = g;
    if (!this.slots || this.fx !== fx) {
      this.fx = fx;
      var s = fx.slots;
      this.slots = { r: s.gfx_r, g: s.gfx_g, b: s.gfx_b, a: s.gfx_a, x: s.gfx_x, y: s.gfx_y, texth: s.gfx_texth,
                     mx: s.mouse_x, my: s.mouse_y, clear: s.gfx_clear };
    }
    this.menu = null;
    this.applyFont();
  };
  Host.prototype.v = function (k) { return this.fx.v[this.slots[k]]; };
  Host.prototype.set = function (k, x) { this.fx.v[this.slots[k]] = x; };
  // Every colour the script sets goes through Palette.tone: the house scheme
  // becomes Live's, other greys lose their tint, other colours stay.
  function toned(r, g, b) { return typeof Palette !== 'undefined' ? Palette.tone(r, g, b) : [clamp(r), clamp(g), clamp(b)]; }
  Host.prototype.colour = function () {
    var c = toned(this.v('r') || 0, this.v('g') || 0, this.v('b') || 0);
    this.g.set_source_rgba(c[0], c[1], c[2], clamp(this.v('a')));
  };
  // EEL2 strings are bytes; REAPER draws them as UTF-8.
  function utf8(s) { try { return decodeURIComponent(escape(s)); } catch (e) { return s; } }
  function clamp(x) { return x < 0 ? 0 : x > 1 ? 1 : (x || 0); }
  function num(x, d) { return x === undefined || x !== x ? d : x; }

  // ------------------------------------------------------------ colour ---
  Host.prototype.gfx_set = function (fx, r, g, b, a) {
    r = num(r, 0);
    this.set('r', r); this.set('g', num(g, r)); this.set('b', num(b, r)); this.set('a', num(a, 1));
    return 0;
  };

  // ------------------------------------------------------------ shapes ---
  Host.prototype.gfx_rect = function (fx, x, y, w, h, filled) {
    if (!(w > 0 && h > 0)) return 0;
    this.colour();
    if (num(filled, 1)) { this.g.rectangle(x, y, w, h); this.g.fill(); }
    else { this.g.set_line_width(1); this.g.rectangle(x + 0.5, y + 0.5, w - 1, h - 1); this.g.stroke(); }
    return 0;
  };
  Host.prototype.gfx_line = function (fx, x1, y1, x2, y2) {
    this.colour();
    this.g.set_line_width(1);
    this.g.move_to(x1 + 0.5, y1 + 0.5); this.g.line_to(x2 + 0.5, y2 + 0.5); this.g.stroke();
    return 0;
  };
  Host.prototype.gfx_lineto = function (fx, x, y) {
    this.gfx_line(fx, this.v('x'), this.v('y'), x, y);
    this.set('x', x); this.set('y', y);
    return 0;
  };
  Host.prototype.gfx_circle = function (fx, x, y, r, fill) {
    this.colour();
    this.g.arc(x, y, Math.max(0, r), 0, Math.PI * 2);
    if (num(fill, 0)) this.g.fill(); else { this.g.set_line_width(1); this.g.stroke(); }
    return 0;
  };
  Host.prototype.gfx_arc = function (fx, x, y, r, a1, a2) {
    this.colour();
    this.g.set_line_width(1);
    this.g.arc(x, y, Math.max(0, r), a1 - Math.PI / 2, a2 - Math.PI / 2);
    this.g.stroke();
    return 0;
  };
  Host.prototype.gfx_roundrect = function (fx, x, y, w, h, radius) {
    this.colour();
    this.g.set_line_width(1);
    this.g.rectangle_rounded(x + 0.5, y + 0.5, w, h, radius * 2, radius * 2);
    this.g.stroke();
    return 0;
  };
  Host.prototype.gfx_triangle = function (fx) {
    var p = Array.prototype.slice.call(arguments, 1);
    if (p.length < 6) return 0;
    this.colour();
    this.g.move_to(p[0], p[1]);
    for (var i = 2; i + 1 < p.length; i += 2) this.g.line_to(p[i], p[i + 1]);
    this.g.close_path();
    this.g.fill();
    return 0;
  };
  Host.prototype.gfx_gradrect = function (fx, x, y, w, h, r, g, b, a) {
    var c = toned(r || 0, g || 0, b || 0);
    this.g.set_source_rgba(c[0], c[1], c[2], clamp(num(a, 1)));
    this.g.rectangle(x, y, w, h); this.g.fill();
    return 0;
  };

  // -------------------------------------------------------------- text ---
  // gfx_setfont(idx, name, size, flags): flags is a character code, 'b' bold, 'i' italic.
  Host.prototype.gfx_setfont = function (fx, idx, name, size, flags) {
    idx = Math.trunc(num(idx, 0));
    if (name !== undefined && idx > 0) {
      this.fonts[idx] = { name: fx.str(name) || 'Arial', size: num(size, 13), flags: Math.trunc(num(flags, 0)) };
    }
    this.font = this.fonts[idx] ? idx : 0;
    this.applyFont();
    return 1;
  };
  Host.prototype.gfx_getfont = function () { return this.font; };
  Host.prototype.applyFont = function () {
    var f = this.fonts[this.font] || this.fonts[0], fl = f.flags;
    // REAPER's names for the system face are not names Max can ask for
    var face = /^\./.test(f.name) || /^segoe/i.test(f.name) ? 'Arial' : f.name;
    var bold = fl === 98 || ((fl >> 8) & 255) === 98 || ((fl >> 16) & 255) === 98;
    var italic = fl === 105 || ((fl >> 8) & 255) === 105 || ((fl >> 16) & 255) === 105;
    this.g.select_font_face(face, italic ? 'italic' : 'normal', bold ? 'bold' : 'normal');
    this.g.set_font_size(f.size);
    this.size = f.size;
    if (this.slots) this.set('texth', Math.round(f.size));
  };
  Host.prototype.measure = function (s) {
    var m = this.g.text_measure(s);
    return [m[0], Math.max(m[1], this.size)];
  };
  Host.prototype.gfx_measurestr = function (fx, s) { this.fx.gm = this.measure(utf8(fx.str(s))); return this.fx.gm[0]; };
  Host.prototype.gfx_measurechar = function (fx, c) { this.fx.gm = this.measure(String.fromCharCode(c)); return this.fx.gm[0]; };
  Host.prototype.text = function (s, flags, right, bottom) {
    var x = this.v('x'), y = this.v('y'), m = this.measure(s);
    flags = Math.trunc(num(flags, 0));
    if (right !== undefined && !(flags & 256)) {
      if (flags & 1) x = x + (right - x - m[0]) / 2; else if (flags & 2) x = right - m[0];
      if (flags & 4) y = y + (bottom - y - m[1]) / 2; else if (flags & 8) y = bottom - m[1];
    }
    this.colour();
    this.g.move_to(x, y + this.size * 0.8);
    this.g.show_text(s);
    this.set('x', x + m[0]);
    return 0;
  };
  Host.prototype.gfx_drawstr = function (fx, s, flags, right, bottom) { return this.text(utf8(fx.str(s)), flags, right, bottom); };
  Host.prototype.gfx_drawchar = function (fx, c) { return this.text(String.fromCharCode(c)); };
  Host.prototype.gfx_drawnumber = function (fx, n, digits) { return this.text(Number(n).toFixed(Math.max(0, Math.trunc(num(digits, 0))))); };
  Host.prototype.gfx_printf = function (fx, fmt) {
    var args = Array.prototype.slice.call(arguments, 2);
    var s = fx.str(fmt).replace(/%(-?\d*)(?:\.(\d+))?([dfsxXc%])/g, function (m, w, p, k) {
      if (k === '%') return '%';
      var a = args.shift();
      if (k === 's') return fx.str(a);
      if (k === 'c') return String.fromCharCode(a);
      if (k === 'x' || k === 'X') { var h = Math.trunc(a).toString(16); return k === 'X' ? h.toUpperCase() : h; }
      return k === 'd' ? String(Math.trunc(a)) : Number(a).toFixed(p === undefined ? 6 : +p);
    });
    return this.text(utf8(s));
  };

  // ------------------------------------------------------------- input ---
  // gfx_getchar(65536) asks about the window: 1 it has focus, 2 it is shown,
  // 4 the mouse is in it. With no argument it is the next key typed, which the
  // window's [key] hands in (Host.key); with a key it asks whether it is held.
  Host.prototype.gfx_getchar = function (fx, c) {
    if (c === 65536) return 1 | 2 | (this.mouseIn ? 4 : 0);
    if (c) return 0;
    return this.keys && this.keys.length ? this.keys.shift() : 0;
  };
  // Max's key codes as REAPER's gfx_getchar gives them: the arrows and the
  // editing keys are four-letter codes there.
  var KEYS = { 28: 0x6C656674, 29: 0x72676874, 30: 0x7570, 31: 0x646F776E, 127: 0x64656C, 8: 8, 9: 9, 13: 13, 27: 27,
               '-9': 0x6C656674, '-10': 0x72676874, '-11': 0x7570, '-12': 0x646F776E };
  Host.prototype.key = function (code) {
    (this.keys = this.keys || []).push(KEYS[code] !== undefined ? KEYS[code] : code);
    if (this.keys.length > 32) this.keys.shift();
  };
  Host.prototype.gfx_showmenu = function (fx, s) {
    if (this.choice) { var k = this.choice; this.choice = 0; return k; }
    this.menu = { text: utf8(fx.str(s)), x: this.v('x'), y: this.v('y') };
    return 0;
  };
  Host.prototype.gfx_setcursor = function () { return 0; };
  Host.prototype.gfx_getdropfile = function () { return 0; };
  Host.prototype.gfx_update = function () { return 0; };

  // A menu as gfx_showmenu writes it: items split by |, '#' greyed, '!'
  // ticked, '>' opens a submenu, '<' closes one. Numbered as REAPER numbers
  // them: every item that is not a submenu's title, in order, from 1.
  function parseMenu(text) {
    var out = [], depth = 0, n = 0;
    String(text).split('|').forEach(function (raw) {
      var t = raw, grey = false, tick = false, opens = false, closes = false;
      for (;;) {
        var c = t.charAt(0);
        if (c === '#') { grey = true; t = t.slice(1); } else if (c === '!') { tick = true; t = t.slice(1); }
        else if (c === '>') { opens = true; t = t.slice(1); } else if (c === '<') { closes = true; t = t.slice(1); } else break;
      }
      if (opens) { out.push({ label: t, title: true, depth: depth }); depth++; return; }
      if (t === '' && !closes) { out.push({ rule: true, depth: depth }); return; }
      n++;
      out.push({ label: t, index: n, grey: grey, tick: tick, depth: depth });
      if (closes) depth = Math.max(0, depth - 1);
    });
    return out;
  }

  // gfx_clear's colour (r + g * 256 + b * 65536) as Live draws it.
  function clearColour(c) { return toned((c & 255) / 255, ((c >> 8) & 255) / 255, ((c >> 16) & 255) / 255); }

  // The menu gfx_showmenu asked for, drawn the same in every device.
  var ITEM_H = 20;
  function drawMenu(g, r, items, hover) {
    var P = Palette.C, rgb = Palette.rgb, c;
    c = rgb(P.popup); g.set_source_rgba(c[0], c[1], c[2], 1); g.rectangle(r[0], r[1], r[2], r[3]); g.fill();
    c = rgb(P.edge); g.set_source_rgba(c[0], c[1], c[2], 1); g.set_line_width(1); g.rectangle(r[0] + 0.5, r[1] + 0.5, r[2] - 1, r[3] - 1); g.stroke();
    items.forEach(function (it, i) {
      var y = r[1] + 4 + i * ITEM_H;
      if (it.rule) { c = rgb(P.rule); g.set_source_rgba(c[0], c[1], c[2], 1); g.rectangle(r[0] + 6, y + ITEM_H / 2, r[2] - 12, 1); g.fill(); return; }
      var on = i === hover && it.index && !it.grey;
      if (on) { c = rgb(P.accent); g.set_source_rgba(c[0], c[1], c[2], 1); g.rectangle(r[0] + 2, y, r[2] - 4, ITEM_H); g.fill(); }
      c = rgb(on ? P.ink : it.grey || it.title ? P.dim : P.text);
      g.set_source_rgba(c[0], c[1], c[2], 1);
      g.move_to(r[0] + 22 + it.depth * 12, y + 14);
      g.show_text(it.label);
      if (it.tick) { g.move_to(r[0] + 7 + it.depth * 12, y + 14); g.show_text('✓'); }
    });
  }

  return { Host: Host, parseMenu: parseMenu, clearColour: clearColour, drawMenu: drawMenu, ITEM_H: ITEM_H };
})();


/* ---- kit/live.js ---- */
/* The Live set, as the family's devices need it: the song's tempo, meter and
 * scale, the notes of the clip being edited, somewhere to put new notes, and
 * a way to hear notes before they are used.
 *
 * Everything goes through the Live Object Model (LiveAPI). Times are beats,
 * which in Live are quarter notes - the unit every family engine already
 * speaks - so nothing is converted but the field names.
 */
var Live = (function () {
  'use strict';
  function api(path) { return new LiveAPI(null, path); }
  function one(a, prop) { var v = a.get(prop); return Array.isArray(v) ? v[0] : v; }
  function exists(a) { return a && Number(a.id) !== 0; }
  function json(v) {
    if (typeof v === 'string') return JSON.parse(v);
    if (Array.isArray(v) && typeof v[0] === 'string' && v.length === 1) return JSON.parse(v[0]);
    return v;
  }

  // Live 12's scale names, as ScaleView numbers its scales (1-16). A scale
  // ScaleView has no name for is left out: the device keeps its own key.
  var SCALE = {
    'Major': 1, 'Minor': 2, 'Harmonic Minor': 3, 'Dorian': 5, 'Phrygian': 6, 'Lydian': 7,
    'Mixolydian': 8, 'Major Pentatonic': 10, 'Minor Pentatonic': 11, 'Minor Blues': 13,
    'Whole Tone': 14, 'Whole-half Dim.': 15, 'Half-whole Dim.': 16
  };
  // ScaleView's eighteen roots, and the spelling a key on each pitch class
  // takes: flats for the major side, sharps where a minor key has them.
  var ROOTS = ['C', 'C#', 'Db', 'D', 'D#', 'Eb', 'E', 'F', 'F#', 'Gb', 'G', 'G#', 'Ab', 'A', 'A#', 'Bb', 'B', 'Cb'];
  var MAJOR_SIDE = ['C', 'Db', 'D', 'Eb', 'E', 'F', 'F#', 'G', 'Ab', 'A', 'Bb', 'B'];
  var MINOR_SIDE = ['C', 'C#', 'D', 'Eb', 'E', 'F', 'F#', 'G', 'G#', 'A', 'Bb', 'B'];
  var MINORISH = { 2: 1, 3: 1, 5: 1, 6: 1, 11: 1, 13: 1 };
  var SCALE_NAMES = ['Major', 'Minor (Natural)', 'Harmonic Minor', 'Ionian', 'Dorian', 'Phrygian', 'Lydian',
                     'Mixolydian', 'Aeolian', 'Major Pentatonic', 'Minor Pentatonic', 'Major Blues', 'Minor Blues',
                     'Whole Tone', 'Diminished Whole-Half', 'Diminished Half-Whole'];

  // Live's scale (a root pitch class and a name) as the family's key, or
  // null for a scale ScaleView does not have.
  function keyOf(pc, name) {
    var sc = SCALE[String(name)];
    if (!sc) return null;
    return { root: ROOTS.indexOf((MINORISH[sc] ? MINOR_SIDE : MAJOR_SIDE)[((+pc % 12) + 12) % 12]) + 1, scale: sc };
  }

  function song() {
    var s = api('live_set');
    var out = { tempo: +one(s, 'tempo') || 120, num: +one(s, 'signature_numerator') || 4,
                den: +one(s, 'signature_denominator') || 4, playing: !!+one(s, 'is_playing'),
                position: +one(s, 'current_song_time') || 0, key: null };
    var mode = s.get('scale_mode');
    if (mode !== undefined && mode !== null) {
      var name = String(one(s, 'scale_name')), pc = +one(s, 'root_note');
      out.liveScale = { on: !!+(Array.isArray(mode) ? mode[0] : mode), name: name, root: pc };
      out.key = keyOf(pc, name);
    }
    return out;
  }

  function detailClip() {
    var c = api('live_set view detail_clip');
    if (!exists(c) || !+one(c, 'is_midi_clip')) return null;
    return c;
  }

  // The clip being edited: its selected notes if any are selected, else every
  // note in its loop. Starts are from the start of what was taken.
  function clipNotes() {
    var c = detailClip();
    if (!c) return null;
    var from = +one(c, 'loop_start') || 0, to = +one(c, 'loop_end') || 0;
    var raw = null, selected = false;
    try { raw = json(c.call('get_selected_notes_extended')); selected = raw && raw.notes && raw.notes.length > 0; } catch (e) { raw = null; }
    if (!selected) raw = json(c.call('get_notes_extended', 0, 128, from, Math.max(0, to - from)));
    var notes = ((raw && raw.notes) || []).filter(function (n) { return !n.mute; }).map(function (n) {
      return { start: n.start_time, len: n.duration, pitch: n.pitch, vel: Math.round(n.velocity) };
    });
    var first = selected && notes.length ? Math.min.apply(null, notes.map(function (n) { return n.start; })) : from;
    var beats = to - from;
    if (selected) {
      var bar = 4, end = 0;
      notes.forEach(function (n) { end = Math.max(end, n.start + n.len); });
      first = Math.floor(first / bar) * bar;
      beats = Math.ceil((end - first) / bar) * bar;
    }
    notes.forEach(function (n) { n.start -= first; });
    notes.sort(function (a, b) { return a.start - b.start || a.pitch - b.pitch; });
    return { notes: notes, beats: beats, name: String(one(c, 'name') || ''), selected: selected, drums: drumTrack() };
  }

  // A track whose instrument is a Drum Rack plays drums: its note numbers name
  // drums, not pitches, and the engines treat them that way.
  function drumTrack() {
    try {
      var track = api('this_device canonical_parent'), n = track.getcount('devices');
      for (var i = 0; i < n; i++) if (+one(api(track.unquotedpath + ' devices ' + i), 'can_have_drum_pads')) return true;
    } catch (e) { /* not known: not drums */ }
    return false;
  }

  function liveNotes(notes) {
    return { notes: notes.map(function (n) {
      return { pitch: Math.max(0, Math.min(127, Math.round(n.pitch))), start_time: Math.max(0, n.start),
               duration: Math.max(1 / 128, n.len), velocity: Math.max(1, Math.min(127, Math.round(n.vel || 100))), mute: 0 };
    }) };
  }

  function undoable(fn) {
    var s = api('live_set');
    try { s.call('begin_undo_step'); } catch (e) { /* Live before 11.1 */ }
    try { return fn(); } finally { try { s.call('end_undo_step'); } catch (e2) { /* as above */ } }
  }

  function show(clip) {
    try { api('live_set view').set('detail_clip', 'id', Number(clip.id)); } catch (e) { /* the clip is made either way */ }
  }

  function selectedScene() {
    var scene = api('live_set view selected_scene'), n = api('live_set').getcount('scenes');
    for (var i = 0; i < n; i++) if (Number(api('live_set scenes ' + i).id) === Number(scene.id)) return i;
    return 0;
  }
  function thisTrack() {
    var track = api('this_device canonical_parent');
    if (!exists(track) || !+one(track, 'has_midi_input')) return null;
    return track;
  }
  // Where this device's track is in the set, for putting new tracks beside it.
  function trackIndex(track) {
    var n = api('live_set').getcount('tracks');
    for (var i = 0; i < n; i++) if (Number(api('live_set tracks ' + i).id) === Number(track.id)) return i;
    return n - 1;
  }
  function clipInSlot(slot, notes, beats, name) {
    slot.call('create_clip', Math.max(1, beats));
    var clip = api(slot.unquotedpath + ' clip');
    if (name) clip.set('name', name);
    clip.call('add_new_notes', liveNotes(notes));
    return clip;
  }
  function freeSlot(track, from) {
    var n = track.getcount('clip_slots');
    for (var k = 0; k < n; k++) {
      var at = (from + k) % n, slot = api(track.unquotedpath + ' clip_slots ' + at);
      if (!+one(slot, 'has_clip')) return { slot: slot, at: at };
    }
    return null;
  }
  function arrangementClipOn(track, notes, beats, name, at) {
    var before = track.getcount('arrangement_clips');
    try { track.call('create_midi_clip', at, Math.max(1, beats)); } catch (e) { /* checked below */ }
    var count = track.getcount('arrangement_clips');
    if (!(count > before)) return false;
    for (var i = 0; i < count; i++) {
      var clip = api(track.unquotedpath + ' arrangement_clips ' + i);
      if (Math.abs((+one(clip, 'start_time') || 0) - at) < 1e-6) {
        if (name) clip.set('name', name);
        clip.call('add_new_notes', liveNotes(notes));
        return true;
      }
    }
    return false;
  }

  // New notes, as a new clip in the first free slot on this device's track,
  // from the selected scene down. `more` are further parts ({name, notes}),
  // each on a new MIDI track after this one, in the same scene. Returns what
  // happened, for the status line.
  function newClip(notes, beats, name, more) {
    var track = thisTrack();
    if (!track) return { ok: false, message: 'This device needs to be on a MIDI track.' };
    var free = freeSlot(track, selectedScene());
    if (!free) return { ok: false, message: 'Every clip slot on this track is full. Add a scene, then try again.' };
    return undoable(function () {
      var clip = clipInSlot(free.slot, notes, beats, name);
      var made = newTracks(track, more, function (t) {
        clipInSlot(api(t.unquotedpath + ' clip_slots ' + free.at), this.notes, beats, this.name);
      });
      show(clip);
      return { ok: true, message: 'Added a clip in scene ' + (free.at + 1) + (made ? ', and ' + made + ' on new tracks beside it.' : '.') };
    });
  }

  // New notes on a new MIDI track beside this one, in the selected scene:
  // a suggestion goes with the music it was made for, not over it.
  function newTrackClip(notes, beats, name, more) {
    var track = thisTrack();
    if (!track) return { ok: false, message: 'This device needs to be on a MIDI track.' };
    var scene = selectedScene();
    return undoable(function () {
      var parts = [{ name: name, notes: notes }].concat(more || []);
      newTracks(track, parts, function (t) { show(clipInSlot(api(t.unquotedpath + ' clip_slots ' + scene), this.notes, beats, this.name)); });
      return { ok: true, message: parts.length === 1 ? 'Added a track beside this one, with the clip in scene ' + (scene + 1) + '.'
                                                     : 'Added ' + parts.length + ' tracks beside this one, with the clips in scene ' + (scene + 1) + '.' };
    });
  }

  // Each further part on a new MIDI track, in order, after this one.
  function newTracks(track, more, put) {
    if (!more || !more.length) return '';
    var at = trackIndex(track), song = api('live_set');
    more.forEach(function (part, k) {
      song.call('create_midi_track', at + 1 + k);
      var t = api('live_set tracks ' + (at + 1 + k));
      t.set('name', part.name);
      put.call(part, t);
    });
    return more.length === 1 ? 'one more part' : more.length + ' more parts';
  }

  // New notes in place of the notes of the clip being edited, from its loop start.
  function replaceInClip(notes, beats) {
    var c = detailClip();
    if (!c) return { ok: false, message: 'No MIDI clip is open. Open one in Detail View, then try again.' };
    var from = +one(c, 'loop_start') || 0;
    return undoable(function () {
      var span = Math.max(beats, (+one(c, 'loop_end') || 0) - from);
      c.call('remove_notes_extended', 0, 128, from, span);
      c.call('add_new_notes', liveNotes(notes.map(function (n) {
        return { start: n.start + from, len: n.len, pitch: n.pitch, vel: n.vel };
      })));
      if ((+one(c, 'loop_end') || 0) < from + beats) c.set('loop_end', from + beats);
      return { ok: true, message: 'Replaced the notes in “' + (String(one(c, 'name') || '') || 'the clip') + '”.' };
    });
  }

  // New notes in the Arrangement at the insert marker, on this device's track
  // (Track.create_midi_clip, Live 12.2 and later); further parts as above.
  function arrangementClip(notes, beats, name, more) {
    var track = thisTrack();
    if (!track) return { ok: false, message: 'This device needs to be on a MIDI track.' };
    var at = +one(api('live_set'), 'current_song_time') || 0;
    return undoable(function () {
      if (!arrangementClipOn(track, notes, beats, name, at)) {
        return { ok: false, message: 'This version of Live can\u2019t add Arrangement clips from a device. Choose New Clip instead.' };
      }
      var made = newTracks(track, more, function (t) { arrangementClipOn(t, this.notes, beats, this.name, at); });
      return { ok: true, message: 'Added a clip to the Arrangement at beat ' + (Math.round(at * 100) / 100 + 1) +
               (made ? ', and ' + made + ' on new tracks beside it.' : '.') };
    });
  }

  // ------------------------------------------------------------ player ---
  // Notes heard through this device's MIDI out: the instrument after it on
  // the track plays them. A Task ticks every few milliseconds and sends what
  // is due; nothing waits on the transport.
  function Player(send) {
    this.send = send; this.events = []; this.pos = 0; this.t0 = 0; this.task = null; this.sounding = {};
    this.onEnd = null;
  }
  Player.prototype.play = function (notes, tempo, onEnd) {
    this.stop();
    var ms = 60000 / (tempo || 120), ev = [];
    notes.forEach(function (n) {
      ev.push({ t: n.start * ms, on: true, pitch: n.pitch, vel: n.vel || 100 });
      ev.push({ t: (n.start + n.len) * ms - 1, on: false, pitch: n.pitch });
    });
    ev.sort(function (a, b) { return a.t - b.t || (a.on === b.on ? 0 : a.on ? 1 : -1); });
    this.events = ev; this.pos = 0; this.t0 = Date.now(); this.onEnd = onEnd || null;
    var self = this;
    this.task = new Task(function () { self.tick(); }, this);
    this.task.interval = 4;
    this.task.repeat();
    this.tick();
  };
  Player.prototype.tick = function () {
    var now = Date.now() - this.t0;
    while (this.pos < this.events.length && this.events[this.pos].t <= now) {
      var e = this.events[this.pos++];
      if (e.on) { this.sounding[e.pitch] = (this.sounding[e.pitch] || 0) + 1; this.send([0x90, e.pitch, Math.max(1, Math.min(127, Math.round(e.vel)))]); }
      else if (this.sounding[e.pitch]) { this.sounding[e.pitch]--; this.send([0x80, e.pitch, 0]); }
    }
    if (this.pos >= this.events.length) {
      var end = this.onEnd;
      this.stop();
      if (end) end();
    }
  };
  Player.prototype.playing = function () { return !!this.task; };
  Player.prototype.stop = function () {
    if (this.task) { this.task.cancel(); this.task.freepeer && this.task.freepeer(); this.task = null; }
    var self = this;
    Object.keys(this.sounding).forEach(function (p) {
      for (var i = 0; i < self.sounding[p]; i++) self.send([0x80, +p, 0]);
    });
    this.sounding = {};
    this.onEnd = null;
  };

  return { song: song, clipNotes: clipNotes, newClip: newClip, newTrackClip: newTrackClip, replaceInClip: replaceInClip,
           arrangementClip: arrangementClip, drumTrack: drumTrack, Player: Player, ROOTS: ROOTS, SCALE_NAMES: SCALE_NAMES,
           keyOf: keyOf };
})();


/* ---- kit/jsfx_device.js ---- */
/* A family JSFX as a Max for Live MIDI effect: the .jsfx itself, unchanged,
 * on Middaw's EEL2 runtime, with its own @gfx window drawn in this [v8ui].
 *
 * The [v8ui] sits in the device's window subpatcher, which the device strip's
 * Show Window button opens. Its code runs whether the window is open or not.
 *
 * A Task ticks every few milliseconds: the MIDI that arrived since the last
 * tick goes in, a block as long as the time that passed is run, and what the
 * plug-in sends comes straight out. Live's tempo, meter, transport and song
 * position are what REAPER would give it.
 *
 * Expects, before it: Gfx, Live, MiddawJSFX, and DEVICE = { main, files,
 * actions? }. A device's own buttons (Load Clip, Insert the Take) are in
 * ACTIONS, defined in the repository's ableton/actions.js, which shares this
 * file's global scope: its own functions must not reuse a name defined here
 * (send, say, load, tick...), or this file's takes its place.
 * Inlet 0: bang (Live is ready), MIDI bytes, restore, and the strip's
 * commands. Outlets: 0 MIDI bytes, 1 the saved state to [pattr], 2 the
 * strip's status line.
 *
 * DEVICE.audio: the sound is gen~'s (ableton/kit/jsfx2gen.js), not this
 * file's. The plug-in here runs @init, @slider and @gfx only, for its window;
 * what its sliders say goes to gen~ (outlet 3, "sliderN value"), with Live's
 * tempo and transport, and MIDI goes to gen~ through the buffer~ the patcher
 * names in "mqname" (three values a message, the count at 0).
 */
inlets = 1;
outlets = DEVICE.audio ? (DEVICE.drops ? 5 : 4) : 3;
mgraphics.init();
mgraphics.relative_coords = 0;
mgraphics.autofill = 0;

var SR = 48000;
var ACTIONS = typeof ACTIONS === 'undefined' ? {} : ACTIONS;

// The bundle keeps files as bytes; the runtime reads a .jsfx as text.
function source(name) {
  var t = DEVICE.files[name];
  if (t === undefined) return null;
  try { return decodeURIComponent(escape(t)); } catch (e) { return t; }
}
var fx = new MiddawJSFX.JSFX(source(DEVICE.main), { gfx: true, sampleRate: SR, readImport: source });
fx.init(SR);

var D = {
  ready: false, pending: null, task: null, last: 0, beat: 0, pos: 0,
  midiIn: [], running: [], status: '', host: new Gfx.Host(mgraphics),
  mouse: { x: -1, y: -1, cap: 0, wheel: 0 }, release: false, frameSaw: true,
  menu: null, menuSnap: null, menuMouse: null, frames: 0, song: { tempo: 120, num: 4, den: 4, playing: false }
};

function say(msg) { D.status = msg || ''; outlet(2, 'set', D.status); }
function send(data) { for (var i = 0; i < data.length; i++) outlet(0, data[i]); }

// ---------------------------------------------------------------- MIDI --
// [midiin] gives a byte at a time; a message is whole once its data are in.
function msg_int(b) {
  b = b & 255;
  if (b >= 0xF8) return;                      // real-time: not passed to the plug-in
  if (b & 0x80) { D.running = [b]; return; }
  if (!D.running.length) return;
  D.running.push(b);
  var st = D.running[0] & 0xF0, need = (st === 0xC0 || st === 0xD0) ? 2 : 3;
  if (D.running[0] >= 0xF0) { D.running = []; return; }  // system messages are not passed on
  if (D.running.length === need) {
    D.midiIn.push(need === 2 ? [D.running[0], D.running[1], 0] : D.running.slice());
    D.running = [D.running[0]];
  }
}

// --------------------------------------------------------------- clock --
function readSong() {
  try {
    var s = Live.song();
    D.song = { tempo: s.tempo, num: s.num, den: s.den, playing: s.playing, position: s.position };
  } catch (e) { /* outside Live */ }
}
// ------------------------------------------------------------ gen~ ----
var GEN = { sent: {}, mq: null, written: 0, CAP: 256, every: 0 };
function mqname(name) {
  try { GEN.mq = new Buffer(String(name)); } catch (e) { GEN.mq = null; }
}
function toGen() {
  fx.file.sliders.forEach(function (sl) {
    var v = fx.sliderByIndex(sl.index);
    if (GEN.sent[sl.index] !== v) { GEN.sent[sl.index] = v; outlet(3, 'slider' + sl.index, v); }
  });
  (DEVICE.fromWindow || []).forEach(function (n) {
    var v = fx.getVar(n);
    if (GEN.sent['w_' + n] !== v) { GEN.sent['w_' + n] = v; outlet(3, 'w_' + n, v); }
  });
  if ((GEN.every++ % 12) === 0) {
    outlet(3, 'tempo', D.song.tempo); outlet(3, 'play_state', D.song.playing ? 1 : 0);
    outlet(3, 'beat_position', D.song.playing ? D.song.position : D.beat);
    outlet(3, 'ts_num', D.song.num); outlet(3, 'ts_denom', D.song.den);
  }
}
function midiToGen(data) {
  if (!GEN.mq) return;
  var at = 1 + 3 * (GEN.written % GEN.CAP);
  GEN.mq.poke(1, at, [data[0], data[1], data[2]]);
  GEN.written++;
  GEN.mq.poke(1, 0, GEN.written);
}

function tick() {
  if (DEVICE.audio) {
    if ((D.frames++ & 63) === 0) readSong();
    if (D.midiIn.length) { D.midiIn.forEach(midiToGen); D.midiIn = []; }
    if ((D.frames % 5) === 0) toGen();
    if (ACTIONS.tick) ACTIONS.tick(fx);
    if ((D.frames & 511) === 0) save();
    return;
  }
  var now = Date.now();
  var ms = Math.min(100, Math.max(0, now - D.last));
  D.last = now;
  if ((D.frames++ & 63) === 0 || D.song.playing) readSong();
  var n = Math.max(1, Math.round(ms * SR / 1000));
  var spb = SR * 60 / D.song.tempo;
  fx.setTime({ tempo: D.song.tempo, num: D.song.num, den: D.song.den, playState: D.song.playing ? 1 : 0,
               beat: D.song.playing ? D.song.position : D.beat, seconds: (D.song.playing ? D.song.position : D.beat) * 60 / D.song.tempo });
  if (!D.song.playing) D.beat += n / spb;
  var midi = D.midiIn.map(function (data) { return { offset: 0, data: data }; });
  D.midiIn = [];
  var out = fx.process(n, null, null, midi);
  for (var i = 0; i < out.length; i++) send(out[i].data);
  if (ACTIONS.tick) ACTIONS.tick(fx);
  if ((D.frames & 511) === 0) save();
}
function start() {
  if (D.task) return;
  D.last = Date.now();
  D.task = new Task(tick, this);
  D.task.interval = 4;
  D.task.repeat();
  var draw = new Task(function () { mgraphics.redraw(); }, this);
  draw.interval = 33;
  draw.repeat();
  D.drawTask = draw;
}

// ------------------------------------------------------------ messages --
function bang() {
  D.ready = true;
  readSong();
  if (D.pending) { load(D.pending); D.pending = null; }
  start();
}
function restore(text) {
  var st = null;
  try { st = JSON.parse(String(text)); } catch (e) { return; }
  if (!D.ready) { D.pending = st; return; }
  load(st);
}
function load(st) {
  if (st && st.v === 1 && st.fx) { fx.deserialize(st.fx); fx.runSection('slider'); lastSaved = JSON.stringify(st); GEN.sent = {}; }
}
// The plug-in's @serialize, kept with the Live set: written when it changes,
// so an untouched device does not mark the set as changed.
var lastSaved = '';
function save() {
  var s = JSON.stringify({ v: 1, fx: fx.serialize() });
  if (s === lastSaved) return;
  lastSaved = s;
  outlet(1, 'set', s);
}
// The strip's buttons: "action <name>".
function action(name) {
  var a = ACTIONS[name];
  if (!a) return;
  try { var msg = a(fx, Live); if (msg) say(msg); } catch (e) { say(String(e.message || e)); }
  save();
  mgraphics.redraw();
}
// Keys typed while the window has focus, from its [key].
function key(code) { D.host.key(code); mgraphics.redraw(); }
function anything() {
  var a = ACTIONS[messagename];
  if (a) action(messagename);
}

// --------------------------------------------------------------- paint --
function size() {
  var r = (typeof box !== 'undefined' && box.rect) ? box.rect : [0, 0].concat(fx.file.gfxSize || [800, 600]);
  return [r[2] - r[0], r[3] - r[1]];
}
function paint() {
  var g = mgraphics, sz = size(), h = D.host;
  var clear = fx.getVar('gfx_clear');
  var c = clear >= 0 ? clear : 0;           // REAPER keeps the last frame for -1; a [v8ui] cannot
  var k = Gfx.clearColour(c);
  g.set_source_rgba(k[0], k[1], k[2], 1);
  g.rectangle(0, 0, sz[0], sz[1]);
  g.fill();
  if (D.menu) { frame(g, sz, D.menuMouse); drawMenu(g, sz); return; }
  var snap = new Float64Array(fx.v);
  var mouse = { x: D.mouse.x, y: D.mouse.y, cap: D.mouse.cap, wheel: D.mouse.wheel };
  D.mouse.wheel = 0;
  frame(g, sz, mouse);
  D.frameSaw = true;
  if (D.release) { D.release = false; D.mouse.cap = 0; }
  if (h.menu) { D.menu = { items: Gfx.parseMenu(h.menu.text), x: mouse.x, y: mouse.y, hover: -1 }; D.menuSnap = snap; D.menuMouse = mouse; }
}
function frame(g, sz, mouse) {
  D.host.begin(g, fx);
  D.host.mouseIn = mouse.x >= 0 && mouse.y >= 0 && mouse.x < sz[0] && mouse.y < sz[1];
  try { fx.runGfx(D.host, sz[0], sz[1], mouse); } catch (e) { say('The window stopped: ' + (e.message || e)); }
}

// The menu gfx_showmenu asked for, over the window.
var ITEM_H = Gfx.ITEM_H;
function menuRect(sz) {
  var m = D.menu, w = 40;
  mgraphics.select_font_face('Arial', 'normal', 'normal');
  mgraphics.set_font_size(12);
  m.items.forEach(function (it) { if (it.label) w = Math.max(w, mgraphics.text_measure(it.label)[0] + 40 + it.depth * 12); });
  var h = m.items.length * ITEM_H + 8;
  var x = Math.min(m.x, sz[0] - w - 2), y = Math.min(m.y, sz[1] - h - 2);
  return [Math.max(0, x), Math.max(0, y), w, h];
}
function drawMenu(g, sz) {
  g.select_font_face('Arial', 'normal', 'normal'); g.set_font_size(12);
  Gfx.drawMenu(g, menuRect(sz), D.menu.items, D.menu.hover);
}
function menuAt(x, y) {
  var r = menuRect(size());
  if (x < r[0] || x >= r[0] + r[2] || y < r[1] + 4 || y >= r[1] + r[3] - 4) return -1;
  return Math.floor((y - r[1] - 4) / ITEM_H);
}
function chooseMenu(i) {
  var m = D.menu, it = i >= 0 ? m.items[i] : null;
  if (it && (!it.index || it.grey)) return;          // a title, a rule or a greyed item: the menu stays
  D.menu = null;
  // The frame that asked runs again from where it started, and gets the answer.
  fx.v.set(D.menuSnap);
  D.host.choice = it ? it.index : 0;
  if (!it) { D.host.choice = 0; D.host.cancelled = true; }
  var g = mgraphics, sz = size();
  if (it) frame(g, sz, D.menuMouse);
  D.host.choice = 0;
  D.mouse.cap = 0;
  save();
  mgraphics.redraw();
}

// --------------------------------------------------------------- mouse --
// REAPER's mouse_cap: 1 left, 2 right, 4 Command, 8 Shift, 16 Option, 32 Control.
function caps(but, cmd, shift, opt, ctrl) {
  return (ctrl ? 2 : 1) | (cmd ? 4 : 0) | (shift ? 8 : 0) | (opt ? 16 : 0);
}
function onclick(x, y, but, cmd, shift, capslock, opt, ctrl) {
  if (D.menu) { chooseMenu(menuAt(x, y)); return; }
  D.mouse.x = x; D.mouse.y = y; D.mouse.cap = caps(but, cmd, shift, opt, ctrl);
  D.frameSaw = false;
  mgraphics.redraw();
}
function ondrag(x, y, but) {
  if (D.menu) return;
  D.mouse.x = x; D.mouse.y = y;
  if (!but) {
    // A click shorter than a frame is still seen down for one frame.
    if (D.frameSaw) D.mouse.cap = 0; else D.release = true;
    save();
  }
  mgraphics.redraw();
}
function onidle(x, y) {
  if (D.menu) { var i = menuAt(x, y); if (i !== D.menu.hover) { D.menu.hover = i; mgraphics.redraw(); } return; }
  D.mouse.x = x; D.mouse.y = y;
}
function onidleout() { if (!D.menu) { D.mouse.x = -1; D.mouse.y = -1; } }
function onwheel(x, y, dx, dy) { D.mouse.wheel += Math.round(dy * 120); mgraphics.redraw(); }

