//+------------------------------------------------------------------+
//|                                                       ZigZag.mq4 |
//|                   Copyright 2006-2014, MetaQuotes Software Corp. |
//|                                              http://www.mql4.com |
//+------------------------------------------------------------------+
#property copyright "2006-2014, MetaQuotes Software Corp."
#property link      "http://www.mql4.com"
#property strict

#property indicator_chart_window
#property indicator_buffers 1
#property indicator_color1  Red

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   Print("Started!!!");
   return(0);
  
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

void delete_obj()
{
    
    string  name = "";
    for(int i=ObjectsTotal()-1;i>=0;i--)
    {
        name = ObjectName(i);
        if(StringFind(name,"RF",0)==0)
        ObjectDelete(name);
    }
}
int deinit()
{
    delete_obj();
    return (0);
}

int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
 delete_obj();
      int    i,limit,counterZ,whatlookfor=0;
   
      ObjectCreate("Priceinfo", OBJ_LABEL, 0, 10,20);
      ObjectSetText("Priceinfo",Symbol()+" "+ Period()+"M");
      ObjectSet("Priceinfo",OBJPROP_XDISTANCE, 50);
      ObjectSet("Priceinfo",OBJPROP_YDISTANCE, 50);
      ObjectSet("Priceinfo",OBJPROP_FONTSIZE, 30);
      ObjectSet("Priceinfo",OBJPROP_COLOR, Black);
      
      ObjectCreate("PriceAsk", OBJ_LABEL, 0, 50,50);
      ObjectSetText("PriceAsk",DoubleToStr(Ask,5 ));
      ObjectSet("PriceAsk",OBJPROP_XDISTANCE, 50);
      ObjectSet("PriceAsk",OBJPROP_YDISTANCE, 90);
      ObjectSet("PriceAsk",OBJPROP_FONTSIZE, 20);
      ObjectSet("PriceAsk",OBJPROP_COLOR, Black);
  
      ObjectCreate("PriceBid", OBJ_LABEL, 0, 50,50);
      ObjectSetText("PriceBid",DoubleToStr(Bid,5 ));
      ObjectSet("PriceBid",OBJPROP_XDISTANCE, 50);
      ObjectSet("PriceBid",OBJPROP_YDISTANCE, 120);
      ObjectSet("PriceBid",OBJPROP_FONTSIZE, 20);
      ObjectSet("PriceBid",OBJPROP_COLOR, Blacka);
//--- main loop  

    limit = Bars-10;
    
      
   for(i=limit; i>=0; i--)
     {
      
       if(TimeDayOfWeek(Time[i+1]) != TimeDayOfWeek(Time[i]))
        { 
            
          if(Period() <= 60)
          {
          verticalDotLine(i, Gray); 
            if(TimeDayOfWeek(Time[i]) ==0) //Monday
            verticalDotLine(i, Blue);
            if(TimeDayOfWeek(Time[i]) ==1) //Monday
            verticalDotLine(i, Blue);
           
           } 
            if(TimeMonth(Time[i+1]) != TimeMonth(Time[i]))
             verticalLine(i-1, Orange);
    
        }
      
      
     }
//--- final cutting 
  
   for(i=limit; i>=0; i--)
     {
        
     }
   
//--- return value of prev_calculated for next call
   return(rates_total);
  }


 
 
 
 
 
void verticalLine(int lx0, color c)
{
    string name = "RF_Line@_"+lx0+"-Vertical" ;
    ObjectCreate(name,OBJ_VLINE,0, Time[lx0],0,0);
    ObjectSet(name,OBJPROP_COLOR,c);
    
    ObjectSet(name,OBJPROP_STYLE,STYLE_SOLID);
    ObjectSet(name,OBJPROP_WIDTH,1);
}


void verticalDotLine(int lx0, color c)
{
    string name = "RF_Line@_"+lx0+"-Vertical" ;
    ObjectCreate(name,OBJ_VLINE,0, Time[lx0],0,0);
    ObjectSet(name,OBJPROP_COLOR,c);
    
    ObjectSet(name,OBJPROP_STYLE,STYLE_DOT);
    ObjectSet(name,OBJPROP_WIDTH,1);
}
