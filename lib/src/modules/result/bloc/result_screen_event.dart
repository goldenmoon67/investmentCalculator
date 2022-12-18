part of 'result_screen_bloc.dart';

abstract class ResultScreenEvent extends Equatable {}

class ResultScreenStartEvent extends ResultScreenEvent {
  @override
  List<Object?> get props => [];
}

class Save2FavoritesEvent extends ResultScreenEvent {
  final FavoriteModel favoriteModel;

  Save2FavoritesEvent(this.favoriteModel);
  @override
  List<Object?> get props => [favoriteModel];
}
