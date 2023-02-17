import 'package:bloc/bloc.dart';
import 'package:crypto_price/src/getit.dart';
import 'package:crypto_price/src/modules/favorite/bloc/favorite_event.dart';
import 'package:crypto_price/src/modules/favorite/bloc/favorite_state.dart';
import 'package:crypto_price/src/repositories/database_repository.dart';
import 'package:flutter/cupertino.dart';

class FavoriteBloc extends Bloc<FavoriteScreenEvent, FavoriteScreenState> {
  final DatabaseRepository _databaseRepository = getIt<DatabaseRepository>();

  FavoriteBloc() : super(FavoriteInitialState()) {
    on<StartEvent>((event, emit) => _start(event, emit));
    on<RemoveItemEvent>((event, emit) => _remove(event, emit));
  }

  _start(StartEvent event, Emitter<FavoriteScreenState> emit) async {
    try {
      var list = _databaseRepository.getFavorites();
      emit(FavoriteStartData(list));
    } catch (e) {
      emit(ErrorMessage(e.toString()));
    }
  }

  _remove(RemoveItemEvent event, Emitter<FavoriteScreenState> emit) async {
    try {
      await _databaseRepository.removeFromFavs(event.model);
      var list = _databaseRepository.getFavorites();
      debugPrint("${list.length}----");
      emit(FavoriteRefreshData(list));
    } catch (e) {
      emit(ErrorMessage("${e}from bloc"));
    }
  }
}
