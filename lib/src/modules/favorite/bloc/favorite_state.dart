import 'package:crypto_price/src/data/models/favorite/favorite_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavoriteScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoriteInitialState extends FavoriteScreenState {
  @override
  List<Object?> get props => [];
}

class FavoriteStartData extends FavoriteScreenState {
  final List<FavoriteModel?> items;

  FavoriteStartData(this.items);
  @override
  List<Object?> get props => [items];
}

class FavoriteRefreshData extends FavoriteScreenState {
  final List<FavoriteModel?> items;

  FavoriteRefreshData(this.items);
  @override
  List<Object?> get props => [items];
}

class ErrorMessage extends FavoriteScreenState {
  final String message;

  ErrorMessage(this.message);
  @override
  List<Object?> get props => [message];
}
