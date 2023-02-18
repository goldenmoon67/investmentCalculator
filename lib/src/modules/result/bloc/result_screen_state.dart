part of 'result_screen_bloc.dart';

abstract class ResultScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResultScreenInitial extends ResultScreenState {}

class CalculateData extends ResultScreenState {}

class SavedItemData extends ResultScreenState {
  final bool succes;

  SavedItemData(this.succes);
  @override
  List<Object?> get props => [succes];
}

class ErrorMessage extends ResultScreenState {
  final String message;

  ErrorMessage(this.message);
  @override
  List<Object?> get props => [message];
}

class ResultScreenErrorState extends ResultScreenState {
  final String message;

  ResultScreenErrorState(this.message);
  @override
  List<Object?> get props => [message];
}
