part of 'lesson_bloc.dart';

abstract class LessonState extends Equatable {
  const LessonState();
  
  @override
  List<Object> get props => [];
}

class LessonInitial extends LessonState {}
