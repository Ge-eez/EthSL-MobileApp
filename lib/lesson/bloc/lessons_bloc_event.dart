part of 'challenges_bloc_bloc.dart';

@immutable
abstract class LessonsBlocEvent extends Equatable {
  const LessonsBlocEvent();
}

class LoadLessonsEvent extends LessonsBlocEvent {
  @override
  List<Object?> get props => [];
}
