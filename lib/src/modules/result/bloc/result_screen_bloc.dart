import 'package:bloc/bloc.dart';
import 'package:crypto_price/src/data/models/favorite/favorite_model.dart';
import 'package:crypto_price/src/getit.dart';
import 'package:crypto_price/src/repositories/database_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
part 'result_screen_event.dart';
part 'result_screen_state.dart';

class ResultScreenBloc extends Bloc<ResultScreenEvent, ResultScreenState> {
  final DatabaseRepository _databaseRepository = getIt<DatabaseRepository>();

  ResultScreenBloc() : super(ResultScreenInitial()) {
    on<ResultScreenEvent>((event, emit) {
      emit(ResultScreenInitial());
    });
    on<Save2FavoritesEvent>((event, emit) => _save2Favs(event, emit));
  }

  _save2Favs(Save2FavoritesEvent event, Emitter<ResultScreenState> emit) async {
    debugPrint("burdayık");

    try {
      debugPrint("burdayık");
      await _databaseRepository.save2Favorite(event.favoriteModel);
      emit(SavedItemData(true));
    } catch (e) {
      emit(ErrorMessage(e.toString()));
    }
  }
}
