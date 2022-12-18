import 'package:equatable/equatable.dart';

abstract class FavoriteScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoriteStartData extends FavoriteScreenState {
  @override
  List<Object?> get props => [];
}

class ErrorMessage extends FavoriteScreenState {
  final String message;

  ErrorMessage(this.message);
  @override
  List<Object?> get props => [message];
}
