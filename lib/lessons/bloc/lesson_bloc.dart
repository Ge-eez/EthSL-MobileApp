import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  LessonBloc() : super(LessonInitial()) {
    on<LessonEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
