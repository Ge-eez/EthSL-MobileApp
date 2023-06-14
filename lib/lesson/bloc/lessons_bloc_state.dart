part of 'challenges_bloc_bloc.dart';

@immutable
abstract class LessonsBlocState {}

class LessonsLoadingState extends LessonsBlocState {
  @override
  List<Object?> get props => [];
}

class LessonsLoadedState extends LessonsBlocState {
  final List<LessonModel> lessons;

  LessonsLoadedState(this.lessons);
  @override
  List<Object?> get props => [lessons];
}

class LessonsErrorState extends LessonsBlocState {
  final String error;

  LessonsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
