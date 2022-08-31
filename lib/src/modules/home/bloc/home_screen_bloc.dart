import 'package:bloc/bloc.dart';
import 'package:crypto_price/src/data/models/result_models/percent_result_model.dart';
import 'package:crypto_price/src/data/models/result_models/price_result_model.dart';
import 'package:crypto_price/src/getit.dart';
import 'package:crypto_price/src/repositories/calculate_repository.dart';
import 'package:equatable/equatable.dart';
part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final CalculateRepositroy _calculateRepositroy = getIt<CalculateRepositroy>();
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<HomeScreenEvent>((event, emit) {
      emit(HomeScreenInitial());
    });
    on<CalculateWithPercent>(
        (event, emit) => _calculateWithPercent(event, emit));
    on<CalculateWithPrice>((event, emit) => _calculateWithPrice(event, emit));
    on<SetSliderValue>((event, emit) => _getSliderValue(event, emit));
    on<SetWhichPercent>((event, emit) => _setWhichPercent(event, emit));
  }

  _calculateWithPercent(
      CalculateWithPercent event, Emitter<HomeScreenState> emit) {
    try {
      var result = _calculateRepositroy.calculateWithPercent(
          event.name, event.percent, event.currentPrice);

      emit(PercentCalculateData(result));
    } catch (e) {
      emit(ErrorMessage(e.toString()));
    }
  }

  _calculateWithPrice(CalculateWithPrice event, Emitter<HomeScreenState> emit) {
    try {
      var result = _calculateRepositroy.calculateWithPrice(
          event.name, event.currentPrice, event.howMuch, event.expectingProfit);

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
}
