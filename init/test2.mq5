//+------------------------------------------------------------------+
//|                                                      initial.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+

static input double Entry_Lot    = 20; // Amount for a new position [%]
int OnInit()
  {
  Alert(
    "Running: ", __FILE__, 
    " Symbol: ", Symbol(), 
    " Entry_Lot: ", Entry_Lot, 
    " TERMINAL_TRADE_ALLOWED: ", TerminalInfoInteger(TERMINAL_TRADE_ALLOWED),
    " MQL_TRADE_ALLOWED: ", MQLInfoInteger(MQL_TRADE_ALLOWED),
    " ACCOUNT_TRADE_EXPERT: ", AccountInfoInteger(ACCOUNT_TRADE_EXPERT)
  );
  string varString = "string";
  int varInt = 123458;
  bool varBool = true;
  // datetime date;
  double array[3];
  int arrayLength = ArraySize(array);
  // string buttons[] = {"Button 1", "Button 2", "Button 3"};
  // ArrayResize(buttons, 2);
  for(int i = 0; i < ArraySize(array); i ++)
  {
  }

  MqlTradeRequest request = {};
  MqlTradeResult result = {};
  MqlTradeCheckResult check = {};
  ZeroMemory(request);
  ZeroMemory(result);
  ZeroMemory(check);

  // double orderLots       = NormalizeEntrySize(lots);
  request.action       = TRADE_ACTION_DEAL;
  request.symbol       = _Symbol;
  // request.volume       = orderLots;
  // request.type_filling = orderFillingType;
  // request.type         = (type == OP_BUY) ? ORDER_TYPE_BUY : ORDER_TYPE_SELL;
  // request.price        = (type == OP_BUY) ? tick.ask : tick.bid;
  request.deviation    = 10;
  // request.sl           = stopLossPrice;
  // request.tp           = takeProfitPrice;
  // request.comment      = OrderComment;


  // request.action = TRADE_ACTION_DEAL;
  // request.magic = 112;
  // request.order = 1;
  // request.symbol = "symbol";
  request.volume = 0.01 * Entry_Lot;
  request.price = SymbolInfoDouble(Symbol(),SYMBOL_BID);
  // request.stoplimit = 33000;
  // request.sl = 32000;
  // request.tp = 36000;
  // request.deviation = 33800;
  request.type = ORDER_TYPE_SELL; // ENUM_ORDER_TYPE ORDER_TYPE_SELL
  request.type_filling = ORDER_FILLING_FOK;
  // request.type_filling = ORDER_FILLING_RETURN;
  // request.type_time = ORDER_TIME_GTC;
  // request.expiration = 0;
  // request.comment = "first test comment";
  // request.position = 10;
  // request.position_by = 20;

  bool isOrderCheck = OrderCheck(request,check);
  string checkRetcodeString = ResultRetcodeDescription(check.retcode);
  Alert("isOrderCheck: ", isOrderCheck, " code is: ", check.retcode, " means: ", checkRetcodeString);
  
  bool isOrderSend = OrderSend(request,result);
  string sendRetcodeString = ResultRetcodeDescription(result.retcode);
  Alert("isOrderSend: ",  isOrderSend, " code is: ", result.retcode, " means: ", sendRetcodeString);

  Alert("OrdersTotal: ", OrdersTotal());
  Alert("PositionsTotal: ", PositionsTotal());

  return(INIT_SUCCEEDED);

}



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string ResultRetcodeDescription(int code)
  {
   string message;
   switch(code)
     {
      case TRADE_RETCODE_REQUOTE:            message = "Requote"; break;
      case TRADE_RETCODE_REJECT:             message = "Request rejected"; break;
      case TRADE_RETCODE_CANCEL:             message = "Request canceled by trader"; break;
      case TRADE_RETCODE_PLACED:             message = "Order placed"; break;
      case TRADE_RETCODE_DONE:               message = "Request completed"; break;
      case TRADE_RETCODE_DONE_PARTIAL:       message = "Only part of the request was completed"; break;
      case TRADE_RETCODE_ERROR:              message = "Request processing error"; break;
      case TRADE_RETCODE_TIMEOUT:            message = "Request canceled by timeout"; break;
      case TRADE_RETCODE_INVALID:            message = "Invalid request"; break;
      case TRADE_RETCODE_INVALID_VOLUME:     message = "Invalid volume in the request"; break;
      case TRADE_RETCODE_INVALID_PRICE:      message = "Invalid price in the request"; break;
      case TRADE_RETCODE_INVALID_STOPS:      message = "Invalid stops in the request"; break;
      case TRADE_RETCODE_TRADE_DISABLED:     message = "Trade is disabled"; break;
      case TRADE_RETCODE_MARKET_CLOSED:      message = "Market is closed"; break;
      case TRADE_RETCODE_NO_MONEY:           message = "There is not enough money to complete the request"; break;
      case TRADE_RETCODE_PRICE_CHANGED:      message = "Prices changed"; break;
      case TRADE_RETCODE_PRICE_OFF:          message = "There are no quotes to process the request"; break;
      case TRADE_RETCODE_INVALID_EXPIRATION: message = "Invalid order expiration date in the request"; break;
      case TRADE_RETCODE_ORDER_CHANGED:      message = "Order state changed"; break;
      case TRADE_RETCODE_TOO_MANY_REQUESTS:  message = "Too frequent requests"; break;
      case TRADE_RETCODE_NO_CHANGES:         message = "No changes in request"; break;
      case TRADE_RETCODE_SERVER_DISABLES_AT: message = "Autotrading disabled by server"; break;
      case TRADE_RETCODE_CLIENT_DISABLES_AT: message = "Autotrading disabled by client terminal"; break;
      case TRADE_RETCODE_LOCKED:             message = "Request locked for processing"; break;
      case TRADE_RETCODE_FROZEN:             message = "Order or position frozen"; break;
      case TRADE_RETCODE_INVALID_FILL:       message = "Invalid order filling type"; break;
      case TRADE_RETCODE_CONNECTION:         message = "No connection with the trade server"; break;
      case TRADE_RETCODE_ONLY_REAL:          message = "Operation is allowed only for live accounts"; break;
      case TRADE_RETCODE_LIMIT_ORDERS:       message = "The number of pending orders has reached the limit"; break;
      case TRADE_RETCODE_LIMIT_VOLUME:       message = "The volume of orders and positions has reached the limit"; break;
      case TRADE_RETCODE_INVALID_ORDER:      message = "Incorrect or prohibited order type"; break;
      case TRADE_RETCODE_POSITION_CLOSED:    message = "Position specified has already been closed"; break;
      default:                               message = "Unknown result"; break;
     }
   return (message);
  }
//+------------------------------------------------------------------+
