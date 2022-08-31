class PriceResult {
  final String investmentName;
  final double currentRange;
  final double howMuch;
  final double lastPrice;
  final double expectingProfit;

  PriceResult(
      {required this.investmentName,
      required this.expectingProfit,
      required this.currentRange,
      required this.howMuch,
      required this.lastPrice});
}
