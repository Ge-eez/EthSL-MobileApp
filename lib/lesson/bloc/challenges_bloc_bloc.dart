import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../models/challenges_model.dart';
import '../../models/lessons_model.dart';
import '../../services/service_barrel.dart';
part 'lessons_bloc_event.dart';
part 'lessons_bloc_state.dart';

class LessonBlocBloc extends Bloc<LessonsBlocEvent, LessonsBlocState> {
  final LessonRepository _challengesRepository;

  LessonBlocBloc(this._challengesRepository) : super(LessonsLoadingState()) {
    on<LoadLessonsEvent>((event, emit) async {
      emit(LessonsLoadingState());
      try {
        final challenges = await _challengesRepository.getChallenges();
        emit(LessonsLoadedState(challenges));
      } catch (e) {
        emit(LessonsErrorState(e.toString()));
      }
    });
  }
}
