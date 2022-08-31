part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {}

class HomeScreenStartEvent extends HomeScreenEvent {
  @override
  List<Object?> get props => [];
}

class CalculateWithPercent extends HomeScreenEvent {
  final String name;
  final double percent;
  final double currentPrice;

  CalculateWithPercent(
    this.name,
    this.percent,
    this.currentPrice,
  );
  @override
  List<Object?> get props => [name, percent, currentPrice];
}

class CalculateWithPrice extends HomeScreenEvent {
  final String name;
  final double currentPrice;
  final double howMuch;
  final double expectingProfit;

  CalculateWithPrice(
      this.name, this.currentPrice, this.howMuch, this.expectingProfit);
  @override
  List<Object?> get props => [name, currentPrice, howMuch, expectingProfit];
}

class SetSliderValue extends HomeScreenEvent {
  final double percent;

  SetSliderValue(this.percent);
  @override
  List<Object?> get props => [percent];
}

class SetWhichPercent extends HomeScreenEvent {
  final bool wannaMore;

  SetWhichPercent(this.wannaMore);
  @override
  List<Object?> get props => [wannaMore];
}
