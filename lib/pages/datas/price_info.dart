class PriceInfo{
  double term;   // 호가
  double start;  // 시가
  double top;    // 고가
  double bottom; // 저가
  double end;    // 종가

  double top52;     // 52주 고
  double bottom52;  // 52주 저
  double vi;        // vi 기준
  double vi_up;     // 상승 vi
  double vi_down;   // 하락 vi
  double pre_trade_amount;  // 전일 거래량
  double pre_end;   // 전일 종가
}

class PriceRow{
  double waitAmount;
  double price;
  double ratio;
}