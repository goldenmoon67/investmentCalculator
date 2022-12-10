import 'package:bloc/bloc.dart';
import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/data/models/result_models/percent_result_model.dart';
import 'package:crypto_price/src/data/models/result_models/price_result_model.dart';
import 'package:crypto_price/src/getit.dart';
import 'package:crypto_price/src/repositories/calculate_repository.dart';
import 'package:crypto_price/src/repositories/crypto_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final CalculateRepositroy _calculateRepositroy = getIt<CalculateRepositroy>();
  final CryptoRepository _cryptoRepository = getIt<CryptoRepository>();

  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<HomeScreenStartEvent>((event, emit) => _getInitial(event, emit));
    on<CalculateWithPercent>(
        (event, emit) => _calculateWithPercent(event, emit));
    on<CalculateWithPrice>((event, emit) => _calculateWithPrice(event, emit));
    on<SetSliderValue>((event, emit) => _getSliderValue(event, emit));
    on<SetWhichPercent>((event, emit) => _setWhichPercent(event, emit));
  }

  _calculateWithPercent(
      CalculateWithPercent event, Emitter<HomeScreenState> emit) async {
    try {
      var crypto = await _cryptoRepository.getCrypto(event.context, event.name);
      var result = _calculateRepositroy.calculateWithPercent(
          crypto, event.percent, event.currentPrice);

      emit(PercentCalculateData(result));
    } catch (e) {
      emit(ErrorMessage(e.toString()));
    }
  }

  _calculateWithPrice(
      CalculateWithPrice event, Emitter<HomeScreenState> emit) async {
    try {
      var crypto = await _cryptoRepository.getCrypto(event.context, event.name);
      var result = _calculateRepositroy.calculateWithPrice(
          crypto, event.currentPrice, event.howMuch, event.expectingProfit);

      emit(PriceCalculateData(result));
    } catch (e) {
      emit(ErrorMessage(e.toString()));
    }
  }

  _getSliderValue(SetSliderValue event, Emitter<HomeScreenState> emit) {
    _calculateRepositroy.setSliderPercent(event.percent);
  }

  _setWhichPercent(SetWhichPercent event, Emitter<HomeScreenState> emit) {
    _calculateRepositroy.setWhichPercent(event.wannaMore);
  }

  _getInitial(HomeScreenStartEvent event, Emitter<HomeScreenState> emit) async {
    try {
      Future<List<Crypto>> cryptosFuture =
          _cryptoRepository.getAllCryptos(event.context);
      var cryptos = await cryptosFuture;
      emit(HomeScreenStartData(cryptosFuture, cryptos));
    } catch (e) {
      emit(ErrorMessage(e.toString()));
    }
  }
}
