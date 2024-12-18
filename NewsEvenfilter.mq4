//+------------------------------------------------------------------+
//|                                               NewsEvenfilter.mq4 |
//|                                  Copyright 2024, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict

datetime NewsTime;
bool BlockTrading = false;


//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   datetime currentTime = TimeCurrent();

     {
      if(IsNewsTime(currentTime))
        {
         BlockTrading = true;
        }
      else
        {
         BlockTrading = false;
        }
      if(BlockTrading)
        {
         Print("Trading is block");

        }




     }
  
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double LoadNewsData()
  {
   NewsTime = StrToTime("2024.10.10. 15:30");
   return 0;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsNewsTime( datetime CurrentTime)
  {
   int minutesBefore = 15;
   int minutesAfter = 30;
   if((CurrentTime >= (NewsTime-minutesBefore*60)) && (CurrentTime<=(NewsTime + minutesAfter*60)))
     {
      return true;

     }
   return false;

  }




//+------------------------------------------------------------------+
