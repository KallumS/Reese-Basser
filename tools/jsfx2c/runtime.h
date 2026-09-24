/* Minimal JSFX runtime for jsfx2c generated code. */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define STR_LIT_BASE 20000
#define STR_NAMED_BASE 30000

typedef struct { int idx; double def, mn, mx, step; const char *label; } SliderDef;

extern double SL[257];
extern const char *STR_LIT[];
extern const int NUM_STR_LIT, NUM_STR_NAMED, NUM_SLIDER_DEFS, GFX_W, GFX_H;
extern const SliderDef SLIDER_DEFS[];

void die(const char *msg);
double *memp(double idx);
double *sliderp(double idx);

#define TRUTH(x) (fabs(x) >= 0.00001)
static inline double r_sqr(double x) { return x * x; }
static inline double r_sign(double x) { return x > 0 ? 1.0 : (x < 0 ? -1.0 : 0.0); }
static inline double r_sqrt(double x) { return sqrt(fabs(x)); }
static inline double r_invsqrt(double x) { return 1.0 / sqrt(fabs(x)); }
double r_log(double x);
double r_log10(double x);
double r_rand(double x);
static inline double r_mod(double a, double b) {
  long long ib = (long long)fabs(b), ia = (long long)fabs(a);
  return ib ? (double)(ia % ib) : 0.0;
}
#define OP_ADD(a, b) ((a) + (b))
#define OP_SUB(a, b) ((a) - (b))
#define OP_MUL(a, b) ((a) * (b))
#define OP_DIV(a, b) ((a) / (b))
#define OP_MOD(a, b) r_mod((a), (b))
#define OP_POW(a, b) pow((a), (b))
#define OP_OR(a, b) ((double)(((long long)(a)) | ((long long)(b))))
#define OP_AND(a, b) ((double)(((long long)(a)) & ((long long)(b))))
#define OP_XOR(a, b) ((double)(((long long)(a)) ^ ((long long)(b))))

double r_midirecv(double *ofs, double *m1, double *m2, double *m3);
double r_gfx_measurestr(double s, double *w, double *h);

#define RF(name) double r_##name(int n, double *a)
RF(midisend); RF(slider_automate); RF(sliderchange); RF(slider_show); RF(memset); RF(memcpy);
RF(freembuf); RF(time_precise); RF(gfx_set); RF(gfx_rect); RF(gfx_line); RF(gfx_lineto);
RF(gfx_circle); RF(gfx_arc); RF(gfx_roundrect); RF(gfx_drawstr); RF(gfx_setfont); RF(gfx_triangle);
RF(gfx_showmenu); RF(gfx_drawnumber); RF(gfx_getchar); RF(gfx_setcursor); RF(gfx_gradrect);
RF(strlen); RF(strcpy); RF(strcat); RF(strcmp); RF(stricmp); RF(strcpy_substr); RF(str_getchar);
RF(str_setchar); RF(sprintf); RF(strncpy); RF(match); RF(printf);
double r_strcpy_2(double d, double s);
double r_strcat_2(double d, double s);

extern double v_srate, v_spl0, v_spl1, v_tempo, v_beat_position, v_play_state, v_play_position,
    v_samplesblock, v_num_ch, v_ts_num, v_ts_denom, v_ext_noinit, v_ext_nodenorm, v_gfx_r, v_gfx_g,
    v_gfx_b, v_gfx_a, v_gfx_x, v_gfx_y, v_gfx_w, v_gfx_h, v_gfx_texth, v_gfx_ext_retina, v_gfx_clear,
    v_gfx_mode, v_gfx_dest, v_mouse_x, v_mouse_y, v_mouse_cap, v_mouse_wheel, v_mouse_hwheel,
    v_trigger, v_pdc_delay, v_pdc_bot_ch, v_pdc_top_ch, v_midi_bus, v_ext_midi_bus;

void sec_init(void);
void sec_slider(void);
void sec_block(void);
void sec_sample(void);
void sec_gfx(void);
