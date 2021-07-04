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
int OnInit()
  {
    Print( 1 );
    return 1;
  }
input double   Lot=0.1;          // Lots to Trade
void OnStart()
{
	Alert(
		"Running file: ", __FILE__, 
		"Symbol is: ", Symbol(), 
		" TERMINAL_TRADE_ALLOWED is: ", TerminalInfoInteger(TERMINAL_TRADE_ALLOWED),
		" MQL_TRADE_ALLOWED is: ", MQLInfoInteger(MQL_TRADE_ALLOWED),
		" ACCOUNT_TRADE_EXPERT is: ", AccountInfoInteger(ACCOUNT_TRADE_EXPERT)
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
	request.action       = TRADE_ACTION_PENDING;
	request.symbol       = Symbol();
	request.volume       = 0.1;
	// request.type_filling = orderFillingType;
	// request.type         = (type == OP_BUY) ? ORDER_TYPE_BUY : ORDER_TYPE_SELL;
	// request.price        = (type == OP_BUY) ? tick.ask : tick.bid;
	// request.deviation    = 10;
	// request.sl           = stopLossPrice;
	// request.tp           = takeProfitPrice;
	// request.comment      = OrderComment;


	// request.action = TRADE_ACTION_DEAL;
	// request.magic = 112;
	// request.order = 1;
	// request.symbol = "symbol";
	// request.volume = 0.05;
	request.price = 34000;
	// request.stoplimit = 33000;
	request.sl = 32000;
	request.tp = 36000;
	request.deviation = 33800;
	request.type = ORDER_TYPE_BUY; // ENUM_ORDER_TYPE
	request.type_filling = ORDER_FILLING_RETURN;
	// request.type_time = ORDER_TIME_GTC;
	// request.expiration = 0;
	request.comment = "first test comment";
	// request.position = 10;
	// request.position_by = 20;

 	bool isOrderCheck = OrderCheck(request,check);
	string retcode = ResultRetcodeDescription(check.retcode);

	if(!isOrderCheck)
	{
		Alert("OrderCheck: ", __FUNCTION__, " ", retcode);
	}
 	// bool isOrderSend = OrderSend(request,result);

 	// Alert(isOrderSend);
 	// Print(OrdersTotal());
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


	// datetime datetime_array[];
	// ArrayResize(datetime_array,1);
	// Alert(datetime_array);
	// Alert(Symbol());
	// Print(Symbol());
	// Print(OrderGetTicket(0));

// Print(natije);
// Print(OrdersTotal());


// int buyticker = OrderSend(
//     Symbol(),
//     OP_BUY,
//     0.1
//     ASK,
//     3,
//     ASK-100 * _Point,
//     ASK+100 * _Point,
//     NULL,
//     0,
//     0,
//     Green
//  );

// https://www.mql5.com/en/docs/constants/tradingconstants/orderproperties

// struct MqlTradeRequest
//   {
//    ENUM_TRADE_REQUEST_ACTIONS    action;           // Trade operation type
//    ulong                         magic;            // Expert Advisor ID (magic number)
//    ulong                         order;            // Order ticket
//    string                        symbol;           // Trade symbol
//    double                        volume;           // Requested volume for a deal in lots
//    double                        price;            // Price
//    double                        stoplimit;        // StopLimit level of the order
//    double                        sl;               // Stop Loss level of the order
//    double                        tp;               // Take Profit level of the order
//    ulong                         deviation;        // Maximal possible deviation from the requested price
//    ENUM_ORDER_TYPE               type;             // Order type
//    ENUM_ORDER_TYPE_FILLING       type_filling;     // Order execution type
//    ENUM_ORDER_TYPE_TIME          type_time;        // Order expiration type
//    datetime                      expiration;       // Order expiration time (for the orders of ORDER_TIME_SPECIFIED type)
//    string                        comment;          // Order comment
//    ulong                         position;         // Position ticket
//    ulong                         position_by;      // The ticket of an opposite position
//   };

// 1. TRADE_ACTION_DEAL

// 	Place a trade order for an immediate execution with the specified parameters (market order)

// 2. TRADE_ACTION_PENDING

// 	Place a trade order for the execution under specified conditions (pending order)

// 3. TRADE_ACTION_SLTP

// 	Modify Stop Loss and Take Profit values of an opened position

// 4. TRADE_ACTION_MODIFY

// 	Modify the parameters of the order placed previously

// 5. TRADE_ACTION_REMOVE

// 	Delete the pending order placed previously

// 6. TRADE_ACTION_CLOSE_BY

// 	Close a position by an opposite one

// ------------------------------------------------------------------------------

// 1. ORDER_TYPE_BUY

// 	Market Buy order

// 2. ORDER_TYPE_SELL

// Market Sell order

// 3. ORDER_TYPE_BUY_LIMIT

// Buy Limit pending order

// 4. ORDER_TYPE_SELL_LIMIT

// Sell Limit pending order

// 5. ORDER_TYPE_BUY_STOP

// Buy Stop pending order

// 6. ORDER_TYPE_SELL_STOP

// Sell Stop pending order

// 7. ORDER_TYPE_BUY_STOP_LIMIT

// Upon reaching the order price, a pending Buy Limit order is placed at the StopLimit price

// 8. ORDER_TYPE_SELL_STOP_LIMIT

// Upon reaching the order price, a pending Sell Limit order is placed at the StopLimit price

// 9. ORDER_TYPE_CLOSE_BY

// Order to close a position by an opposite one

// -----------------------------------------------------------

// 1. ORDER_FILLING_FOK

// This filling policy means that an order can be filled only in the specified amount. If the necessary amount of a financial instrument is currently unavailable in the market, the order will not be executed. The required volume can be filled using several offers available on the market at the moment.

// 2. ORDER_FILLING_IOC

// This mode means that a trader agrees to execute a deal with the volume maximally available in the market within that indicated in the order. In case the the entire volume of an order cannot be filled, the available volume of it will be filled, and the remaining volume will be canceled.

// 3. ORDER_FILLING_RETURN

// This policy is used only for market orders (ORDER_TYPE_BUY and ORDER_TYPE_SELL), limit and stop limit orders (ORDER_TYPE_BUY_LIMIT, ORDER_TYPE_SELL_LIMIT, ORDER_TYPE_BUY_STOP_LIMIT and ORDER_TYPE_SELL_STOP_LIMIT ) and only for the symbols with Market or Exchange execution. In case of partial filling a market or limit order with remaining volume is not canceled but processed further.

// For the activation of the ORDER_TYPE_BUY_STOP_LIMIT and ORDER_TYPE_SELL_STOP_LIMIT orders, a corresponding limit order ORDER_TYPE_BUY_LIMIT/ORDER_TYPE_SELL_LIMIT with the ORDER_FILLING_RETURN execution type is created.

// ----------------------------------------------------------------