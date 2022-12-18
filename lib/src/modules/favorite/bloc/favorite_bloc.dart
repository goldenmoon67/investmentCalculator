import 'package:bloc/bloc.dart';
import 'package:crypto_price/src/getit.dart';
import 'package:crypto_price/src/modules/favorite/bloc/favorite_event.dart';
import 'package:crypto_price/src/modules/favorite/bloc/favorite_state.dart';
import 'package:crypto_price/src/repositories/database_repository.dart';

class FavoriteBloc extends Bloc<FavoriteScreenEvent, FavoriteScreenState> {
  final DatabaseRepository _databaseRepository = getIt<DatabaseRepository>();

  FavoriteBloc() : super(FavoriteStartData()) {
    on<StartEvent>((event, emit) => _start(event, emit));
  }

  _start(StartEvent event, Emitter<FavoriteScreenState> emit) async {
    try {
      var list = await _databaseRepository.getFavorites();
      //TODO:: implement emit
    } catch (e) {
      emit(ErrorMessage(e.toString()));
    }
  }
}
