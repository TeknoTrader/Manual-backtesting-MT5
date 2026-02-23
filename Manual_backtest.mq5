#property copyright "Nicola Chimenti (@tekno_trader)"
#property link "https://www.nicolachimenti.com"
#property version   "1.00"
#property description "Minimalist manual trading interface"
#property strict

// Button definitions
#define BTN_BUY "BTN_BUY"
#define BTN_SELL "BTN_SELL"
#define BTN_P "BTN_P"
#define BTN_M "BTN_M"
#define BTN_LOT "BTN_LOT"
#define BTN_CLOSE "BTN_CLOSE"
#define LBL_TITLE "LBL_TITLE"
#define LBL_INFO "LBL_INFO"

input color clr_Background = C'15,15,20'; // Main background 
input color clr_BuyButton = C'46,204,113'; // BUY button 
input color clr_SellButton = C'231,76,60'; // SELL button 
input color clr_NeutralButton = C'52,73,94'; // Neutral buttons 
input color clr_TextLight = C'236,240,241'; // Light text 
input color clr_TextDark = C'44,62,80'; // Dark text 
input color clr_Accent = C'241,196,15'; // Accent color 
input color clr_Border = C'127,140,141'; // Borders

input group "═══ SETTINGS ═══"
input double init_lot = 0.01;                       // Initial lot size
input double lot_step = 0.01;                       // Lot increment step
input double max_lot = 1.00;                        // Maximum lot size
input string trade_comment = "Elegant Trade";       // Trade comment

#include <Trade/Trade.mqh>
CTrade trade;

//+------------------------------------------------------------------+
//| Utility functions                                                |
//+------------------------------------------------------------------+
bool GetBtnState(string name) { return (bool)ObjectGetInteger(0, name, OBJPROP_STATE); }
string GetBtnText(string name) { return ObjectGetString(0, name, OBJPROP_TEXT); }

//+------------------------------------------------------------------+
//| Expert initialization                                            |
//+------------------------------------------------------------------+
int OnInit()
{
   // Remove previous objects
   ObjectsDeleteAll(0, 0, OBJ_BUTTON);
   ObjectsDeleteAll(0, 0, OBJ_LABEL);
   
   // Create elegant interface
   CreateInterface();
   
   ChartRedraw(0);
   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Expert deinitialization                                          |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
   // Clean interface
   ObjectsDeleteAll(0, 0, OBJ_BUTTON);
   ObjectsDeleteAll(0, 0, OBJ_LABEL);
   ChartRedraw(0);
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
   // Update information
   UpdateInfo();
   
   // Handle button clicks
   HandleButtons();
}

//+------------------------------------------------------------------+
//| Create elegant interface                                         |
//+------------------------------------------------------------------+
void CreateInterface()
{
   int base_x = 20;
   int base_y = 30;
   
   // ═══ TITLE ═══
   CreateLabel(LBL_TITLE, base_x + 25, base_y, "M A D E  B Y  T E K N O  T R A D E R", 
               10, clr_Accent, "Segoe UI Light");
   
   // ═══ LOT CONTROL ═══
   int lot_y = base_y + 40;
   
   CreateButton(BTN_M, base_x, lot_y, 35, 32, "−", 
                18, clr_TextLight, clr_NeutralButton, clr_Border, "Segoe UI");
   
   CreateButton(BTN_LOT, base_x + 40, lot_y, 90, 32, DoubleToString(init_lot, 2), 
                13, clr_TextDark, clr_TextLight, clr_Border, "Segoe UI Semibold");
   
   CreateButton(BTN_P, base_x + 135, lot_y, 35, 32, "+", 
                18, clr_TextLight, clr_NeutralButton, clr_Border, "Segoe UI");
   
   // ═══ TRADE BUTTONS ═══
   int trade_y = lot_y + 45;
   
   CreateButton(BTN_BUY, base_x, trade_y, 85, 45, "B U Y", 
                12, clr_TextLight, clr_BuyButton, clr_BuyButton, "Segoe UI");
   
   CreateButton(BTN_SELL, base_x + 90, trade_y, 85, 45, "S E L L", 
                12, clr_TextLight, clr_SellButton, clr_SellButton, "Segoe UI");
   
   // ═══ PANIC BUTTON ═══
   int close_y = trade_y + 55;
   
   CreateButton(BTN_CLOSE, base_x, close_y, 175, 38, "⊗  C L O S E   A L L", 
                11, clr_TextLight, clr_Background, clr_SellButton, "Segoe UI");
   
   // ═══ INFO LABEL ═══
   CreateLabel(LBL_INFO, base_x, close_y + 48, "Ready", 
               9, clr_Border, "Segoe UI");
}

//+------------------------------------------------------------------+
//| Create elegant button                                            |
//+------------------------------------------------------------------+
void CreateButton(string name, int x, int y, int width, int height, 
                  string text, int fontsize, color clr_text, 
                  color clr_bg, color clr_border, string font = "Arial")
{
   ObjectCreate(0, name, OBJ_BUTTON, 0, 0, 0);
   ObjectSetInteger(0, name, OBJPROP_XDISTANCE, x);
   ObjectSetInteger(0, name, OBJPROP_YDISTANCE, y);
   ObjectSetInteger(0, name, OBJPROP_XSIZE, width);
   ObjectSetInteger(0, name, OBJPROP_YSIZE, height);
   ObjectSetInteger(0, name, OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetString(0, name, OBJPROP_TEXT, text);
   ObjectSetInteger(0, name, OBJPROP_FONTSIZE, fontsize);
   ObjectSetInteger(0, name, OBJPROP_COLOR, clr_text);
   ObjectSetInteger(0, name, OBJPROP_BGCOLOR, clr_bg);
   ObjectSetInteger(0, name, OBJPROP_BORDER_COLOR, clr_border);
   ObjectSetString(0, name, OBJPROP_FONT, font);
   ObjectSetInteger(0, name, OBJPROP_BACK, false);
}

//+------------------------------------------------------------------+
//| Create elegant label                                             |
//+------------------------------------------------------------------+
void CreateLabel(string name, int x, int y, string text, 
                 int fontsize, color clr_text, string font = "Arial")
{
   ObjectCreate(0, name, OBJ_LABEL, 0, 0, 0);
   ObjectSetInteger(0, name, OBJPROP_XDISTANCE, x);
   ObjectSetInteger(0, name, OBJPROP_YDISTANCE, y);
   ObjectSetInteger(0, name, OBJPROP_CORNER, CORNER_LEFT_UPPER);
   ObjectSetString(0, name, OBJPROP_TEXT, text);
   ObjectSetInteger(0, name, OBJPROP_FONTSIZE, fontsize);
   ObjectSetInteger(0, name, OBJPROP_COLOR, clr_text);
   ObjectSetString(0, name, OBJPROP_FONT, font);
}

//+------------------------------------------------------------------+
//| Update information display                                       |
//+------------------------------------------------------------------+
void UpdateInfo()
{
   int total_positions = PositionsTotal();
   double total_profit = 0;
   
   // Calculate total profit
   for(int i = 0; i < total_positions; i++)
   {
      if(PositionSelectByTicket(PositionGetTicket(i)))
      {
         if(PositionGetString(POSITION_SYMBOL) == _Symbol)
         {
            total_profit += PositionGetDouble(POSITION_PROFIT);
         }
      }
   }
   
   // Update info label
   string info = "";
   if(total_positions == 0)
      info = "Ready";
   else
      info = StringFormat("Positions: %d  |  P/L: %.2f", total_positions, total_profit);
   
   ObjectSetString(0, LBL_INFO, OBJPROP_TEXT, info);
   
   // Change color based on profit
   if(total_profit > 0)
      ObjectSetInteger(0, LBL_INFO, OBJPROP_COLOR, clr_BuyButton);
   else if(total_profit < 0)
      ObjectSetInteger(0, LBL_INFO, OBJPROP_COLOR, clr_SellButton);
   else
      ObjectSetInteger(0, LBL_INFO, OBJPROP_COLOR, clr_Border);
}

//+------------------------------------------------------------------+
//| Handle button clicks                                             |
//+------------------------------------------------------------------+
void HandleButtons()
{
   // Increase lot size
   if(GetBtnState(BTN_P))
   {
      double current_lot = StringToDouble(GetBtnText(BTN_LOT));
      current_lot += lot_step;
      if(current_lot > max_lot) current_lot = max_lot;
      current_lot = NormalizeDouble(current_lot, 2);
      
      ObjectSetString(0, BTN_LOT, OBJPROP_TEXT, DoubleToString(current_lot, 2));
      ObjectSetInteger(0, BTN_P, OBJPROP_STATE, false);
      ChartRedraw(0);
   }
   
   // Decrease lot size
   if(GetBtnState(BTN_M))
   {
      double current_lot = StringToDouble(GetBtnText(BTN_LOT));
      current_lot -= lot_step;
      if(current_lot < lot_step) current_lot = lot_step;
      current_lot = NormalizeDouble(current_lot, 2);
      
      ObjectSetString(0, BTN_LOT, OBJPROP_TEXT, DoubleToString(current_lot, 2));
      ObjectSetInteger(0, BTN_M, OBJPROP_STATE, false);
      ChartRedraw(0);
   }
   
   // Open BUY position
   if(GetBtnState(BTN_BUY))
   {
      double lot = StringToDouble(GetBtnText(BTN_LOT));
      double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
      
      if(trade.Buy(lot, _Symbol, ask, 0, 0, trade_comment))
      {
         PlaySound("ok.wav");
      }
      
      ObjectSetInteger(0, BTN_BUY, OBJPROP_STATE, false);
      ChartRedraw(0);
   }
   
   // Open SELL position
   if(GetBtnState(BTN_SELL))
   {
      double lot = StringToDouble(GetBtnText(BTN_LOT));
      double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
      
      if(trade.Sell(lot, _Symbol, bid, 0, 0, trade_comment))
      {
         PlaySound("ok.wav");
      }
      
      ObjectSetInteger(0, BTN_SELL, OBJPROP_STATE, false);
      ChartRedraw(0);
   }
   
   // Close all positions
   if(GetBtnState(BTN_CLOSE))
   {
      CloseAllPositions();
      ObjectSetInteger(0, BTN_CLOSE, OBJPROP_STATE, false);
      PlaySound("stops.wav");
      ChartRedraw(0);
   }
}

//+------------------------------------------------------------------+
//| Close all positions                                              |
//+------------------------------------------------------------------+
void CloseAllPositions()
{
   for(int i = PositionsTotal() - 1; i >= 0; i--)
   {
      ulong ticket = PositionGetTicket(i);
      if(ticket > 0)
      {
         if(PositionSelectByTicket(ticket))
         {
            if(PositionGetString(POSITION_SYMBOL) == _Symbol)
            {
               trade.PositionClose(ticket);
            }
         }
      }
   }
}
//+------------------------------------------------------------------+
