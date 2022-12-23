import 'package:crypto_price/src/data/models/favorite/favorite_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavoriteScreenEvent extends Equatable {}

class StartEvent extends FavoriteScreenEvent {
  @override
  List<Object?> get props => [];
}

class RemoveItemEvent extends FavoriteScreenEvent {
  final FavoriteModel model;

  RemoveItemEvent(this.model);
  @override
  List<Object?> get props => [model];
}
