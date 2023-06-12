part of 'challenges_bloc_bloc.dart';

@immutable
abstract class ChallengesBlocEvent extends Equatable {
  const ChallengesBlocEvent();
}

class LoadChallengesEvent extends ChallengesBlocEvent{
  @override
  List<Object?> get props => [];
}

