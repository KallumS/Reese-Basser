/* Runtime + test driver for jsfx2c generated code.
 *
 * render mode:  prog render <srate> <seconds> <events.txt> <out.wav> [tempo]
 *   events.txt lines:  <sec> midi <status> <d1> <d2>
 *                      <sec> slider <index> <value>
 * gfx mode:     prog gfx <srate> <script.txt> <out.log>
 *   script lines: audio <sec>            run audio (with events file semantics below)
 *                 note <n> <vel> | noteoff <n>
 *                 slider <index> <value>  (sets + runs @slider)
 *                 mouse <x> <y> <cap>     sets mouse state
 *                 wheel <delta>
 *                 menu <result>           result returned by the next gfx_showmenu
 *                 frame                   run @gfx once (log only the last frame)
 *                 size <w> <h>            window size
 *                 dumpsliders             print slider values
 */
#include "runtime.h"
#include <time.h>

double SL[257];
static double *MEM;
#define MEM_SIZE (16 * 1024 * 1024)

void die(const char *msg) {
  fprintf(stderr, "RUNTIME ERROR: %s\n", msg);
  exit(3);
}

double *memp(double idx) {
  long long i = (long long)floor(idx + 0.00001);
  if (i < 0 || i >= MEM_SIZE) {
    fprintf(stderr, "RUNTIME ERROR: memory index out of range: %f\n", idx);
    exit(3);
  }
  return &MEM[i];
}

double *sliderp(double idx) {
  int i = (int)floor(idx + 0.00001);
  if (i < 1 || i > 256) {
    fprintf(stderr, "RUNTIME ERROR: slider index out of range: %f\n", idx);
    exit(3);
  }
  return &SL[i];
}

double r_log(double x) { return log(x); }
double r_log10(double x) { return log10(x); }
static unsigned long long rng = 88172645463325252ULL;
double r_rand(double x) {
  rng ^= rng << 13; rng ^= rng >> 7; rng ^= rng << 17;
  return (double)(rng >> 11) / 9007199254740992.0 * (x < 1 ? 1 : x);
}

/* ---------------------------------------------------------------- MIDI */
typedef struct { int ofs; int m1, m2, m3; } Ev;
static Ev blockev[4096];
static int nblockev, blockev_pos;
double r_midirecv(double *ofs, double *m1, double *m2, double *m3) {
  if (blockev_pos >= nblockev) return 0;
  Ev *e = &blockev[blockev_pos++];
  *ofs = e->ofs; *m1 = e->m1; *m2 = e->m2; *m3 = e->m3;
  return 1;
}
RF(midisend) { (void)n; (void)a; return 1; }

/* ---------------------------------------------------------------- sliders */
static int n_automate, n_sliderchange;
RF(slider_automate) { (void)n; (void)a; n_automate++; return 0; }
RF(sliderchange) { (void)n; (void)a; n_sliderchange++; return 0; }
RF(slider_show) { (void)n; (void)a; return 1; }
RF(memset) {
  (void)n;
  for (long long i = 0; i < (long long)a[2]; i++) *memp(a[0] + i) = a[1];
  return a[0];
}
RF(memcpy) {
  (void)n;
  long long cnt = (long long)a[2];
  if (a[0] < a[1]) for (long long i = 0; i < cnt; i++) *memp(a[0] + i) = *memp(a[1] + i);
  else for (long long i = cnt - 1; i >= 0; i--) *memp(a[0] + i) = *memp(a[1] + i);
  return a[0];
}
RF(freembuf) { (void)n; (void)a; return 0; }
static double sim_time = 1000.0;
RF(time_precise) { (void)n; (void)a; return sim_time; }

/* ---------------------------------------------------------------- strings */
#define NSTR 4096
static char strbuf[NSTR][2048];
static char *strp(double id) {
  int i = (int)id;
  if (i >= STR_LIT_BASE && i < STR_LIT_BASE + NUM_STR_LIT) return (char *)STR_LIT[i - STR_LIT_BASE];
  if (i >= STR_NAMED_BASE && i < STR_NAMED_BASE + NUM_STR_NAMED) return strbuf[1024 + i - STR_NAMED_BASE];
  if (i >= 0 && i < 1024) return strbuf[i];
  fprintf(stderr, "RUNTIME ERROR: bad string id %f\n", id);
  exit(3);
}
static char *strw(double id) {
  int i = (int)id;
  if (i >= STR_LIT_BASE && i < STR_LIT_BASE + NUM_STR_LIT) die("write to string literal");
  return strp(id);
}
double r_strcpy_2(double d, double s) {
  char tmp[2048];
  snprintf(tmp, sizeof tmp, "%s", strp(s));
  strcpy(strw(d), tmp);
  return d;
}
double r_strcat_2(double d, double s) {
  char tmp[2048];
  snprintf(tmp, sizeof tmp, "%s%s", strp(d), strp(s));
  strcpy(strw(d), tmp);
  return d;
}
RF(strlen) { (void)n; return (double)strlen(strp(a[0])); }
RF(strcpy) { (void)n; return r_strcpy_2(a[0], a[1]); }
RF(strcat) { (void)n; return r_strcat_2(a[0], a[1]); }
RF(strcmp) { (void)n; return (double)strcmp(strp(a[0]), strp(a[1])); }
RF(stricmp) { (void)n; return (double)strcasecmp(strp(a[0]), strp(a[1])); }
RF(strncpy) {
  (void)n;
  char tmp[2048];
  snprintf(tmp, sizeof tmp, "%.*s", (int)a[2], strp(a[1]));
  strcpy(strw(a[0]), tmp);
  return a[0];
}
RF(strcpy_substr) {
  const char *s = strp(a[1]);
  int L = (int)strlen(s), ofs = (int)a[2], len = n > 3 ? (int)a[3] : L;
  if (ofs < 0) ofs += L;
  if (ofs < 0) ofs = 0;
  if (ofs > L) ofs = L;
  if (len < 0) len = L - ofs + len;
  if (len < 0) len = 0;
  if (ofs + len > L) len = L - ofs;
  char tmp[2048];
  snprintf(tmp, sizeof tmp, "%.*s", len, s + ofs);
  strcpy(strw(a[0]), tmp);
  return a[0];
}
RF(str_getchar) {
  (void)n;
  const char *s = strp(a[0]);
  int L = (int)strlen(s), i = (int)a[1];
  if (i < 0) i += L;
  if (i < 0 || i >= L) return 0;
  return (unsigned char)s[i];
}
RF(str_setchar) {
  (void)n;
  char *s = strw(a[0]);
  int L = (int)strlen(s), i = (int)a[1];
  if (i < 0) i += L;
  if (i >= 0 && i < L) s[i] = (char)a[2];
  else if (i == L) { s[i] = (char)a[2]; s[i + 1] = 0; }
  return a[2];
}
static void do_format(char *out, size_t outsz, const char *fmt, int nargs, double *args) {
  size_t o = 0;
  int ai = 0;
  out[0] = 0;
  for (const char *p = fmt; *p && o < outsz - 1;) {
    if (*p != '%') { out[o++] = *p++; out[o] = 0; continue; }
    if (p[1] == '%') { out[o++] = '%'; out[o] = 0; p += 2; continue; }
    char spec[32];
    int sl = 0;
    spec[sl++] = *p++;
    while (*p && strchr("-+ #0123456789.", *p) && sl < 30) spec[sl++] = *p++;
    char conv = *p ? *p++ : 0;
    double v = ai < nargs ? args[ai++] : 0;
    char tmp[1024];
    if (conv == 'd' || conv == 'i') { spec[sl++] = 'l'; spec[sl++] = 'l'; spec[sl++] = 'd'; spec[sl] = 0; snprintf(tmp, sizeof tmp, spec, (long long)v); }
    else if (conv == 'x' || conv == 'X') { spec[sl++] = 'l'; spec[sl++] = 'l'; spec[sl++] = conv; spec[sl] = 0; snprintf(tmp, sizeof tmp, spec, (long long)v); }
    else if (conv == 'c') { spec[sl++] = 'c'; spec[sl] = 0; snprintf(tmp, sizeof tmp, spec, (int)v); }
    else if (conv == 's') { spec[sl++] = 's'; spec[sl] = 0; snprintf(tmp, sizeof tmp, spec, strp(v)); }
    else if (conv == 'f' || conv == 'g' || conv == 'e') { spec[sl++] = conv; spec[sl] = 0; snprintf(tmp, sizeof tmp, spec, v); }
    else { fprintf(stderr, "RUNTIME ERROR: unsupported format %%%c in \"%s\"\n", conv, fmt); exit(3); }
    size_t tl = strlen(tmp);
    if (o + tl >= outsz) tl = outsz - 1 - o;
    memcpy(out + o, tmp, tl);
    o += tl;
    out[o] = 0;
  }
}
RF(sprintf) {
  char tmp[2048];
  do_format(tmp, sizeof tmp, strp(a[1]), n - 2, a + 2);
  strcpy(strw(a[0]), tmp);
  return a[0];
}
RF(printf) {
  char tmp[2048];
  do_format(tmp, sizeof tmp, strp(a[0]), n - 1, a + 1);
  fputs(tmp, stderr);
  return 0;
}
RF(match) { (void)n; (void)a; die("match() not supported"); return 0; }

/* ---------------------------------------------------------------- gfx log */
static FILE *glog;
static int gfx_logging;
static double menu_result;
static char last_menu[4096];
#define GL(...) do { if (gfx_logging && glog) fprintf(glog, __VA_ARGS__); } while (0)
static double font_size = 14;
RF(gfx_set) {
  v_gfx_r = a[0];
  v_gfx_g = n > 1 ? a[1] : a[0];
  v_gfx_b = n > 2 ? a[2] : a[0];
  v_gfx_a = n > 3 ? a[3] : 1;
  return 0;
}
#define COL "%.4f %.4f %.4f %.4f", v_gfx_r, v_gfx_g, v_gfx_b, v_gfx_a
RF(gfx_rect) {
  GL("rect %.2f %.2f %.2f %.2f %d ", a[0], a[1], a[2], a[3], n > 4 ? (int)a[4] : 1); GL(COL); GL("\n");
  return 0;
}
RF(gfx_line) {
  GL("line %.2f %.2f %.2f %.2f ", a[0], a[1], a[2], a[3]); GL(COL); GL("\n");
  return 0;
}
RF(gfx_lineto) {
  (void)n;
  GL("line %.2f %.2f %.2f %.2f ", v_gfx_x, v_gfx_y, a[0], a[1]); GL(COL); GL("\n");
  v_gfx_x = a[0]; v_gfx_y = a[1];
  return 0;
}
RF(gfx_circle) {
  GL("circle %.2f %.2f %.2f %d ", a[0], a[1], a[2], n > 3 ? (int)a[3] : 0); GL(COL); GL("\n");
  return 0;
}
RF(gfx_arc) {
  (void)n;
  GL("arc %.2f %.2f %.2f %.5f %.5f ", a[0], a[1], a[2], a[3], a[4]); GL(COL); GL("\n");
  return 0;
}
RF(gfx_roundrect) {
  (void)n;
  GL("roundrect %.2f %.2f %.2f %.2f %.2f ", a[0], a[1], a[2], a[3], a[4]); GL(COL); GL("\n");
  return 0;
}
RF(gfx_triangle) {
  GL("poly %d", n / 2);
  for (int i = 0; i + 1 < n; i += 2) GL(" %.2f %.2f", a[i], a[i + 1]);
  GL(" "); GL(COL); GL("\n");
  return 0;
}
RF(gfx_gradrect) {
  (void)n;
  GL("rect %.2f %.2f %.2f %.2f 1 %.4f %.4f %.4f %.4f\n", a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]);
  return 0;
}
static double char_w(void) { return font_size * 0.55; }
static double font_sizes[32], font_flags[32];
RF(gfx_setfont) {
  int idx = n >= 1 ? (int)a[0] : 0;
  if (idx < 0 || idx > 31) idx = 0;
  if (n >= 3) { font_sizes[idx] = a[2]; font_flags[idx] = n >= 4 ? a[3] : 0; }
  font_size = idx == 0 ? 12 : (font_sizes[idx] > 0 ? font_sizes[idx] : 12);
  v_gfx_texth = font_size;
  GL("font %.2f %d\n", font_size, (int)font_flags[idx]);
  return 0;
}
double r_gfx_measurestr(double s, double *w, double *h) {
  *w = strlen(strp(s)) * char_w();
  *h = font_size;
  return 0;
}
RF(gfx_drawstr) {
  const char *s = strp(a[0]);
  int flags = n > 1 ? (int)a[1] : 0;
  double w = strlen(s) * char_w(), h = font_size;
  double x = v_gfx_x, y = v_gfx_y;
  if (n > 3) {
    if (flags & 1) x = v_gfx_x + (a[2] - v_gfx_x - w) / 2;
    if (flags & 2) x = a[2] - w;
    if (flags & 4) y = v_gfx_y + (a[3] - v_gfx_y - h) / 2;
    if (flags & 8) y = a[3] - h;
  }
  GL("textbox %.2f %.2f %.2f %.2f %d %d %.2f ", v_gfx_x, v_gfx_y, n > 3 ? a[2] : 0, n > 3 ? a[3] : 0, flags, n > 3, font_size);
  GL(COL); GL(" %s\n", s);
  v_gfx_x = x + w;
  return 0;
}
RF(gfx_drawnumber) {
  char tmp[64];
  snprintf(tmp, sizeof tmp, "%.*f", (int)a[1], a[0]);
  GL("text %.2f %.2f %.2f ", v_gfx_x, v_gfx_y, font_size); GL(COL); GL(" %s\n", tmp);
  (void)n;
  return 0;
}
RF(gfx_showmenu) {
  (void)n;
  snprintf(last_menu, sizeof last_menu, "%s", strp(a[0]));
  fprintf(stderr, "[menu] %s -> %g\n", last_menu, menu_result);
  double r = menu_result;
  menu_result = 0;
  return r;
}
RF(gfx_getchar) { (void)n; (void)a; return 0; }
RF(gfx_setcursor) { (void)n; (void)a; return 0; }

/* ---------------------------------------------------------------- driver */
static int blocksize = 128;
static double *events_t; static int *events_kind; static double (*events_v)[3];
static int nevents, evpos;

static void load_events(const char *path) {
  FILE *f = fopen(path, "r");
  if (!f) die("cannot open events");
  char line[512];
  int cap = 1024;
  events_t = malloc(sizeof(double) * cap);
  events_kind = malloc(sizeof(int) * cap);
  events_v = malloc(sizeof(double[3]) * cap);
  while (fgets(line, sizeof line, f)) {
    double t, x = 0, y = 0, z = 0;
    char kind[32];
    if (line[0] == '#' || sscanf(line, "%lf %31s %lf %lf %lf", &t, kind, &x, &y, &z) < 2) continue;
    if (nevents == cap) {
      cap *= 2;
      events_t = realloc(events_t, sizeof(double) * cap);
      events_kind = realloc(events_kind, sizeof(int) * cap);
      events_v = realloc(events_v, sizeof(double[3]) * cap);
    }
    events_t[nevents] = t;
    events_kind[nevents] = strcmp(kind, "midi") == 0 ? 0 : 1;
    events_v[nevents][0] = x; events_v[nevents][1] = y; events_v[nevents][2] = z;
    nevents++;
  }
  fclose(f);
}

static long long total_samples;
static int nan_count;
static double peak;
static void run_block(float *out, int n) {
  double t0 = total_samples / v_srate;
  double t1 = (total_samples + n) / v_srate;
  nblockev = blockev_pos = 0;
  int slider_changed = 0;
  while (evpos < nevents && events_t[evpos] < t1) {
    if (events_kind[evpos] == 0) {
      int ofs = (int)((events_t[evpos] - t0) * v_srate);
      if (ofs < 0) ofs = 0;
      if (ofs >= n) ofs = n - 1;
      Ev *e = &blockev[nblockev++];
      e->ofs = ofs; e->m1 = (int)events_v[evpos][0]; e->m2 = (int)events_v[evpos][1]; e->m3 = (int)events_v[evpos][2];
    } else {
      SL[(int)events_v[evpos][0]] = events_v[evpos][1];
      slider_changed = 1;
    }
    evpos++;
  }
  if (slider_changed) sec_slider();
  v_samplesblock = n;
  sec_block();
  for (int i = 0; i < n; i++) {
    v_spl0 = v_spl1 = 0;
    sec_sample();
    if (!isfinite(v_spl0) || !isfinite(v_spl1)) {
      if (nan_count++ < 5) fprintf(stderr, "NaN/Inf at sample %lld\n", total_samples + i);
      v_spl0 = v_spl1 = 0;
    }
    if (fabs(v_spl0) > peak) peak = fabs(v_spl0);
    if (fabs(v_spl1) > peak) peak = fabs(v_spl1);
    if (out) { out[2 * i] = (float)v_spl0; out[2 * i + 1] = (float)v_spl1; }
  }
  total_samples += n;
  v_beat_position += n / v_srate * v_tempo / 60.0;
  v_play_position += n / v_srate;
  sim_time += n / v_srate;
}

static void write_wav(const char *path, float *data, long long frames, int sr) {
  FILE *f = fopen(path, "wb");
  if (!f) die("cannot write wav");
  unsigned int datasz = (unsigned int)(frames * 2 * 4);
  unsigned int u32; unsigned short u16;
  fwrite("RIFF", 1, 4, f); u32 = 36 + datasz; fwrite(&u32, 4, 1, f); fwrite("WAVE", 1, 4, f);
  fwrite("fmt ", 1, 4, f); u32 = 16; fwrite(&u32, 4, 1, f);
  u16 = 3; fwrite(&u16, 2, 1, f); u16 = 2; fwrite(&u16, 2, 1, f);
  u32 = sr; fwrite(&u32, 4, 1, f); u32 = sr * 8; fwrite(&u32, 4, 1, f);
  u16 = 8; fwrite(&u16, 2, 1, f); u16 = 32; fwrite(&u16, 2, 1, f);
  fwrite("data", 1, 4, f); fwrite(&datasz, 4, 1, f);
  fwrite(data, 4, frames * 2, f);
  fclose(f);
}

static void setup(double sr, double tempo) {
  MEM = calloc(MEM_SIZE, sizeof(double));
  for (int i = 0; SLIDER_DEFS[i].idx; i++) SL[SLIDER_DEFS[i].idx] = SLIDER_DEFS[i].def;
  v_srate = sr; v_tempo = tempo; v_play_state = 1; v_beat_position = 0; v_num_ch = 2;
  v_ts_num = 4; v_ts_denom = 4;
  v_gfx_a = 1;
  /* JSFX_INIT_SRATE: run @init with a different (stale) srate, as REAPER may do with ext_noinit */
  if (getenv("JSFX_INIT_SRATE")) v_srate = atof(getenv("JSFX_INIT_SRATE"));
  sec_init();
  v_srate = sr;
  sec_slider();
}

int main(int argc, char **argv) {
  if (argc >= 6 && strcmp(argv[1], "render") == 0) {
    double sr = atof(argv[2]), secs = atof(argv[3]);
    double tempo = argc > 6 ? atof(argv[6]) : 174;
    if (argc > 7) blocksize = atoi(argv[7]);
    load_events(argv[4]);
    setup(sr, tempo);
    long long frames = (long long)(secs * sr);
    float *out = malloc(sizeof(float) * 2 * (frames + blocksize));
    clock_t c0 = clock();
    for (long long pos = 0; pos < frames; pos += blocksize) {
      int n = (int)((frames - pos) < blocksize ? (frames - pos) : blocksize);
      run_block(out + 2 * pos, n);
    }
    double el = (double)(clock() - c0) / CLOCKS_PER_SEC;
    write_wav(argv[5], out, frames, (int)sr);
    printf("rendered %.2fs in %.3fs (%.1fx realtime), peak %.3f (%.1f dBFS), nan %d, automate %d\n",
           secs, el, secs / el, peak, 20 * log10(peak + 1e-12), nan_count, n_automate);
    return nan_count ? 2 : 0;
  }
  if (argc >= 5 && strcmp(argv[1], "gfx") == 0) {
    double sr = atof(argv[2]);
    setup(sr, 174);
    glog = fopen(argv[4], "w");
    FILE *sc = fopen(argv[3], "r");
    if (!sc) die("cannot open script");
    char line[512];
    v_gfx_w = GFX_W; v_gfx_h = GFX_H;
    while (fgets(line, sizeof line, sc)) {
      char cmd[32];
      double x = 0, y = 0, z = 0;
      if (sscanf(line, "%31s %lf %lf %lf", cmd, &x, &y, &z) < 1 || cmd[0] == '#') continue;
      if (!strcmp(cmd, "audio")) {
        long long frames = (long long)(x * sr);
        for (long long pos = 0; pos < frames; pos += blocksize) run_block(NULL, blocksize);
      } else if (!strcmp(cmd, "note") || !strcmp(cmd, "noteoff")) {
        nevents = 0; evpos = 0;
        free(events_t);
        events_t = malloc(sizeof(double)); events_kind = malloc(sizeof(int)); events_v = malloc(sizeof(double[3]));
        events_t[0] = total_samples / sr; events_kind[0] = 0;
        events_v[0][0] = !strcmp(cmd, "note") ? 0x90 : 0x80; events_v[0][1] = x; events_v[0][2] = !strcmp(cmd, "note") ? y : 0;
        nevents = 1;
      } else if (!strcmp(cmd, "slider")) {
        SL[(int)x] = y;
        sec_slider();
      } else if (!strcmp(cmd, "mouse")) {
        v_mouse_x = x; v_mouse_y = y; v_mouse_cap = z;
      } else if (!strcmp(cmd, "wheel")) {
        v_mouse_wheel += x;
      } else if (!strcmp(cmd, "menu")) {
        menu_result = x;
      } else if (!strcmp(cmd, "size")) {
        v_gfx_w = x; v_gfx_h = y;
      } else if (!strcmp(cmd, "frame") || !strcmp(cmd, "logframe")) {
        int log = !strcmp(cmd, "logframe");
        if (log) { fclose(glog); glog = fopen(argv[4], "w"); fprintf(glog, "size %g %g\n", v_gfx_w, v_gfx_h); }
        gfx_logging = log;
        v_gfx_x = v_gfx_y = 0;
        sec_gfx();
        gfx_logging = 0;
        sim_time += 0.033;
      } else if (!strcmp(cmd, "renderwav")) {
        /* renderwav <seconds> <events.txt> <out.wav> : render audio with the current state */
        char evp[256], outp[256];
        if (sscanf(line, "%*s %lf %255s %255s", &x, evp, outp) == 3) {
          free(events_t);
          nevents = 0; evpos = 0;
          load_events(evp);
          double base = total_samples / sr;
          for (int i = 0; i < nevents; i++) events_t[i] += base;
          long long frames = (long long)(x * sr);
          float *buf = malloc(sizeof(float) * 2 * (frames + blocksize));
          peak = 0; nan_count = 0;
          for (long long pos = 0; pos < frames; pos += blocksize) {
            int nn = (int)((frames - pos) < blocksize ? (frames - pos) : blocksize);
            run_block(buf + 2 * pos, nn);
          }
          write_wav(outp, buf, frames, (int)sr);
          free(buf);
          printf("renderwav %s peak %.3f nan %d\n", outp, peak, nan_count);
        }
      } else if (!strcmp(cmd, "dumpsliders")) {
        for (int i = 0; SLIDER_DEFS[i].idx; i++)
          printf("slider%d = %g  (%s)\n", SLIDER_DEFS[i].idx, SL[SLIDER_DEFS[i].idx], SLIDER_DEFS[i].label);
      } else {
        fprintf(stderr, "unknown script command %s\n", cmd);
      }
    }
    fclose(glog);
    printf("gfx done, automate calls %d, sliderchange %d\n", n_automate, n_sliderchange);
    return 0;
  }
  fprintf(stderr, "usage: see runtime.c header\n");
  return 1;
}
