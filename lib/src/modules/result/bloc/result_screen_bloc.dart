import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'result_screen_event.dart';
part 'result_screen_state.dart';

class ResultScreenBloc extends Bloc<ResultScreenEvent, ResultScreenState> {
  ResultScreenBloc() : super(ResultScreenInitial()) {
    on<ResultScreenEvent>((event, emit) {
      emit(ResultScreenInitial());
    });
  }
}
