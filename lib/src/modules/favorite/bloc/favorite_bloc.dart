import 'package:bloc/bloc.dart';
import 'package:crypto_price/src/modules/favorite/bloc/favorite_event.dart';
import 'package:crypto_price/src/modules/favorite/bloc/favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteScreenEvent, FavoriteScreenState> {
  FavoriteBloc() : super(FavoriteStartData()) {
    on<StartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
