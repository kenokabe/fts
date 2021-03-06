//+------------------------------------------------------------------+
//|                                               THV Trix v6.01.mq4 |
//|                                        Copyright � 2009, pipware |
//|                                                  www.pipware.com |
//+------------------------------------------------------------------+
#property copyright "basic version by Luis Damiani, all mods by Cobraforex, forbidden to distribute without permission of Cobraforex"
#property link      "www.cobraforex.com"

#property indicator_separate_window
#property indicator_buffers 6
#property indicator_color1 Green
#property indicator_color2 Crimson
#property indicator_color3 Lime
#property indicator_color4 Red
#property indicator_color5 Lime
#property indicator_color6 Red

int gi_124 = 20;
int gi_128 = 35;
extern string note1 = "===Trix level colors===";
extern color HighLine_Color = FireBrick;
extern color ZeroLine_Color = DimGray;
extern color LowLine_Color = DarkGreen;
extern int Line_Style = 2;
extern string note2 = "===Cobra Label colors===";
extern color text1Color = C'0x77,0x77,0x00';
extern color text2Color = C'0x77,0x77,0x00';
extern color text3Color = Green;
extern int Shift_UP_DN = 10;
extern int Shift_Left_Right = 50;
double gd_284 = 0.0;
extern string note5a = "=How many bars in history=";
extern int Trixnum_bars = 750;
int gi_304 = 0;
int gi_308 = 0;
double gd_312 = 1.2;
double g_ibuf_320[];
double g_ibuf_324[];
double g_ibuf_328[];
double g_ibuf_332[];
double g_ibuf_336[];
double g_ibuf_340[];
double gd_344;
double gd_352;
int g_bars_360;
string gs_364;
string gs_372;
datetime g_time_380;
datetime g_time_384;
extern bool ShowIn1MChart = FALSE;
double g_ibuf_576[];
double g_ibuf_580[];

int init() {
   IndicatorBuffers(8);
   SetIndexStyle(0, DRAW_LINE);
   SetIndexBuffer(0, g_ibuf_324);
   SetIndexStyle(1, DRAW_LINE);
   SetIndexBuffer(1, g_ibuf_328);
   SetIndexStyle(2, DRAW_LINE);
   SetIndexBuffer(2, g_ibuf_336);
   SetIndexStyle(3, DRAW_LINE);
   SetIndexBuffer(3, g_ibuf_340);
   SetIndexBuffer(4, g_ibuf_576);
   SetIndexBuffer(5, g_ibuf_580);
   SetIndexStyle(4, DRAW_ARROW);
   SetIndexStyle(5, DRAW_ARROW);
   SetIndexArrow(4, 233);
   SetIndexArrow(5, 234);
   SetIndexDrawBegin(5, 9);
   IndicatorDigits(Digits + 2);
   SetIndexBuffer(6, g_ibuf_332);
   SetIndexBuffer(7, g_ibuf_320);
   gs_364 = "THV Trix v" + "6" + "." + "01";
   gs_372 = gs_364;
   IndicatorShortName(gs_364);
   return (0);
}

int deinit() {
   DeleteObjects("Trix_");
   Comment("");
   return (0);
}

void drawLine(string a_name_0, double a_price_8, color a_color_16, int a_style_20) {
   if (WindowFind(gs_372) > -1) {
      ObjectDelete(a_name_0);
      ObjectCreate(a_name_0, OBJ_HLINE, WindowFind(gs_364), Time[0], a_price_8);
      ObjectSet(a_name_0, OBJPROP_STYLE, a_style_20);
      ObjectSet(a_name_0, OBJPROP_COLOR, a_color_16);
      ObjectSet(a_name_0, OBJPROP_WIDTH, 1);
   }
}

void DeleteObjects(string as_0) {
   string l_name_12;
   for (int li_8 = ObjectsTotal() - 1; li_8 >= 0; li_8--) {
      l_name_12 = ObjectName(li_8);
      if (StringFind(l_name_12, as_0) > -1) ObjectDelete(l_name_12);
   }
}

int start() {
   double ld_0;
   string ls_404;
   string ls_unused_428;
   if (WindowFind(gs_372) > -1) {
   }
   if (Period() == PERIOD_M1) ld_0 = 0.00018;
   if (Period() == PERIOD_M5) ld_0 = 0.00025;
   if (Period() == PERIOD_M15) ld_0 = 0.0005;
   if (Period() == PERIOD_M30) ld_0 = 0.008;
   if (Period() == PERIOD_H1) ld_0 = 0.0012;
   if (Period() == PERIOD_H4) ld_0 = 0.003;
   if (Period() == PERIOD_D1) ld_0 = 0.005;
   if (Period() == PERIOD_W1) ld_0 = 0.08;
   if (Period() == PERIOD_MN1) ld_0 = 0.015;
   if (gd_284 > 0.0) ld_0 = gd_284;
   double ld_8 = ld_0;
   double ld_16 = -1.0 * ld_0;
   if (WindowFind(gs_372) > -1) {
      drawLine("Trix_" + "line_HL", ld_8, HighLine_Color, Line_Style);
      drawLine("Trix_" + "line_ZL", 0, ZeroLine_Color, Line_Style);
      drawLine("Trix_" + "line_LL", ld_16, LowLine_Color, Line_Style);
   }
   int li_24 = 0;
   double ld_28 = 0;
   double ld_36 = 0;
   double ld_unused_44 = 0;
   double ld_52 = 0;
   double ld_60 = 0;
   double ld_68 = 0;
   double ld_76 = 0;
   double ld_84 = 0;
   double ld_92 = 0;
   double ld_100 = 0;
   double ld_108 = 0;
   double ld_116 = 0;
   double ld_124 = 0;
   double ld_132 = 0;
   double ld_140 = 0;
   double ld_148 = 0;
   double ld_156 = 0;
   double ld_164 = 0;
   double ld_172 = 0;
   double ld_180 = 0;
   double ld_188 = 0;
   double ld_196 = 0;
   double ld_204 = 0;
   double ld_212 = 0;
   double ld_220 = 0;
   double ld_228 = 0;
   double ld_236 = 0;
   double ld_244 = 0;
   double ld_252 = 0;
   double ld_260 = 0;
   double ld_268 = 0;
   double ld_276 = 0;
   double ld_284 = 0;
   double ld_292 = 0;
   double ld_300 = 0;
   double ld_308 = 0;
   double ld_316 = 0;
   double ld_324 = 0;
   double ld_332 = 0;
   double ld_340 = 0;
   double ld_348 = 1;
   double ld_356 = 0;
   double l_bars_364 = 0;
   double ld_372 = 0;
   double ld_380 = 0;
   double ld_388 = 0;
   double ld_396 = 0;
   string ls_412 = "nonono";
   int l_ind_counted_420 = IndicatorCounted();
   bool li_424 = TRUE;
   ld_380 = Trixnum_bars + gi_124 + gi_304 + gi_128 + gi_308 + gd_312;
   if (ld_380 == ld_388 && ls_412 == Symbol() && ld_396 == Time[4] - Time[5] && Bars - l_bars_364 < 2.0) ld_372 = Bars - l_bars_364;
   else ld_372 = -1;
   ls_412 = Symbol();
   ld_396 = Time[4] - Time[5];
   l_bars_364 = Bars;
   ld_388 = ld_380;
   if (ld_372 == 1.0 || ld_372 == 0.0) ld_356 = ld_372;
   else ld_348 = 1;
   if (!ShowIn1MChart && Period() == PERIOD_M1) li_424 = FALSE;
   if (ld_348 == 1.0) {
      ld_332 = gd_312 * gd_312;
      ld_340 = ld_332 * gd_312;
      ld_116 = -ld_340;
      ld_124 = 3.0 * (ld_332 + ld_340);
      ld_132 = -3.0 * (2.0 * ld_332 + gd_312 + ld_340);
      ld_140 = 3.0 * gd_312 + 1.0 + ld_340 + 3.0 * ld_332;
      ld_292 = gi_124;
      if (ld_292 < 1.0) ld_292 = 1;
      ld_292 = (ld_292 - 1.0) / 2.0 + 1.0;
      ld_300 = 2 / (ld_292 + 1.0);
      ld_308 = 1 - ld_300;
      ld_292 = gi_128;
      if (ld_292 < 1.0) ld_292 = 1;
      ld_292 = (ld_292 - 1.0) / 2.0 + 1.0;
      ld_316 = 2 / (ld_292 + 1.0);
      ld_324 = 1 - ld_316;
      g_ibuf_320[Trixnum_bars - 1] = 0;
      ld_244 = 0;
      ld_252 = 0;
      ld_260 = 0;
      ld_268 = 0;
      ld_276 = 0;
      ld_284 = 0;
      g_ibuf_332[Trixnum_bars - 1] = 0;
      ld_148 = 0;
      ld_156 = 0;
      ld_164 = 0;
      ld_172 = 0;
      ld_180 = 0;
      ld_188 = 0;
      ld_356 = Trixnum_bars - 2;
      ld_348 = 0;
   }
   for (li_24 = ld_356; li_24 >= 0; li_24--) {
      if (gi_304 == 1) ld_196 = ld_300 * Open[li_24] + ld_308 * ld_244;
      else ld_196 = ld_300 * Close[li_24] + ld_308 * ld_244;
      ld_204 = ld_300 * ld_196 + ld_308 * ld_252;
      ld_212 = ld_300 * ld_204 + ld_308 * ld_260;
      ld_220 = ld_300 * ld_212 + ld_308 * ld_268;
      ld_228 = ld_300 * ld_220 + ld_308 * ld_276;
      ld_236 = ld_300 * ld_228 + ld_308 * ld_284;
      ld_28 = ld_116 * ld_236 + ld_124 * ld_228 + ld_132 * ld_220 + ld_140 * ld_212;
      if ((ld_372 == 1.0 && li_24 == 1) || ld_372 == -1.0) {
         ld_244 = ld_196;
         ld_252 = ld_204;
         ld_260 = ld_212;
         ld_268 = ld_220;
         ld_276 = ld_228;
         ld_284 = ld_236;
      }
      ld_68 = ld_316 * Close[li_24] + ld_324 * ld_148;
      ld_76 = ld_316 * ld_68 + ld_324 * ld_156;
      ld_84 = ld_316 * ld_76 + ld_324 * ld_164;
      ld_92 = ld_316 * ld_84 + ld_324 * ld_172;
      ld_100 = ld_316 * ld_92 + ld_324 * ld_180;
      ld_108 = ld_316 * ld_100 + ld_324 * ld_188;
      ld_52 = ld_116 * ld_108 + ld_124 * ld_100 + ld_132 * ld_92 + ld_140 * ld_84;
      if (gi_308 == 1) {
         g_ibuf_320[li_24] = (ld_28 - ld_36) / ld_36 + (ld_52 - ld_60) / ld_60;
         g_ibuf_332[li_24] = (ld_28 - ld_36) / ld_36;
         gd_352 = g_ibuf_332[li_24];
      } else {
         if (ld_60 > 0.0 && ld_36 > 0.0) {
            g_ibuf_320[li_24] = (ld_52 - ld_60) / ld_60;
            g_ibuf_332[li_24] = (ld_28 - ld_36) / ld_36;
            gd_352 = g_ibuf_332[li_24];
         }
      }
      g_ibuf_324[li_24] = EMPTY_VALUE;
      g_ibuf_328[li_24] = EMPTY_VALUE;
      if (g_ibuf_320[li_24 + 1] < g_ibuf_320[li_24]) {
         if (g_ibuf_324[li_24 + 1] == EMPTY_VALUE) g_ibuf_324[li_24 + 1] = g_ibuf_320[li_24 + 1];
         g_ibuf_324[li_24] = g_ibuf_320[li_24];
      } else {
         if (g_ibuf_320[li_24 + 1] > g_ibuf_320[li_24]) {
            if (g_ibuf_328[li_24 + 1] == EMPTY_VALUE) g_ibuf_328[li_24 + 1] = g_ibuf_320[li_24 + 1];
            g_ibuf_328[li_24] = g_ibuf_320[li_24];
         }
      }
      g_ibuf_336[li_24] = EMPTY_VALUE;
      g_ibuf_340[li_24] = EMPTY_VALUE;
      if (g_ibuf_332[li_24 + 1] < g_ibuf_332[li_24]) {
         if (g_ibuf_336[li_24 + 1] == EMPTY_VALUE) g_ibuf_336[li_24 + 1] = g_ibuf_332[li_24 + 1];
         g_ibuf_336[li_24] = g_ibuf_332[li_24];
      } else {
         if (g_ibuf_332[li_24 + 1] > g_ibuf_332[li_24]) {
            if (g_ibuf_340[li_24 + 1] == EMPTY_VALUE) g_ibuf_340[li_24 + 1] = g_ibuf_332[li_24 + 1];
            g_ibuf_340[li_24] = g_ibuf_332[li_24];
         }
      }
      if ((ld_372 == 1.0 && li_24 == 1) || ld_372 == -1.0) {
         ld_36 = ld_28;
         ld_60 = ld_52;
         ld_148 = ld_68;
         ld_156 = ld_76;
         ld_164 = ld_84;
         ld_172 = ld_92;
         ld_180 = ld_100;
         ld_188 = ld_108;
      }

   }
   if (gd_352 > 0.0) {
      if (WindowFind(gs_372) > -1) {
         if (gd_352 < 0.0) {
            if (WindowFind(gs_372) > -1) {
            }
         }
      }
   }

   gd_344 = gd_352;
   return (0);
}


