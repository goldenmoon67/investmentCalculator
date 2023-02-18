import 'package:bloc/bloc.dart';
import 'package:crypto_price/src/data/models/favorite/favorite_model.dart';
import 'package:crypto_price/src/getit.dart';
import 'package:crypto_price/src/repositories/database_repository.dart';
import 'package:equatable/equatable.dart';
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
    try {
      String? result =
          await _databaseRepository.save2Favorite(event.favoriteModel);
      if (result == null) {
        emit(SavedItemData(true));
      } else {
        emit(ResultScreenErrorState(result));
      }
    } catch (e) {
      emit(ErrorMessage(e.toString()));
    }
  }
}
