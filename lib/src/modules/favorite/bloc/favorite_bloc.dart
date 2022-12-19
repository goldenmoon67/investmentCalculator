import 'package:bloc/bloc.dart';
import 'package:crypto_price/src/getit.dart';
import 'package:crypto_price/src/modules/favorite/bloc/favorite_event.dart';
import 'package:crypto_price/src/modules/favorite/bloc/favorite_state.dart';
import 'package:crypto_price/src/repositories/database_repository.dart';
import 'package:flutter/material.dart';

class FavoriteBloc extends Bloc<FavoriteScreenEvent, FavoriteScreenState> {
  final DatabaseRepository _databaseRepository = getIt<DatabaseRepository>();

  FavoriteBloc() : super(FavoriteInitialState()) {
    on<StartEvent>((event, emit) => _start(event, emit));
  }

  _start(StartEvent event, Emitter<FavoriteScreenState> emit) async {
    try {
      var list = _databaseRepository.getFavorites();
      debugPrint(list.length.toString());
      emit(FavoriteStartData(list));
    } catch (e) {
      emit(ErrorMessage(e.toString()));
    }
  }
}
