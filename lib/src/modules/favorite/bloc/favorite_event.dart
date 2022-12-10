import 'package:equatable/equatable.dart';

abstract class FavoriteScreenEvent extends Equatable {}

class StartEvent extends FavoriteScreenEvent {
  @override
  List<Object?> get props => [];
}
