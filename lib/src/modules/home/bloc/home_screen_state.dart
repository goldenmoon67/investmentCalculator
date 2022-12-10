part of 'home_screen_bloc.dart';

abstract class HomeScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeScreenInitial extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

class HomeScreenStartData extends HomeScreenState {
  final Future<List<Crypto>> cryptosFuture;
  final List<Crypto> cryptos;

  HomeScreenStartData(this.cryptosFuture, this.cryptos);
  @override
  List<Object?> get props => [cryptos, cryptosFuture];
}

class PercentCalculateData extends HomeScreenState {
  final PercentResult resultModel;

  PercentCalculateData(this.resultModel);
  @override
  List<Object?> get props => [resultModel];
}

class PriceCalculateData extends HomeScreenState {
  final PriceResult resultModel;

  PriceCalculateData(this.resultModel);
  @override
  List<Object?> get props => [resultModel];
}

class ErrorMessage extends HomeScreenState {
  final String message;

  ErrorMessage(this.message);
  @override
  List<Object?> get props => [message];
}
