part of 'challenges_bloc_bloc.dart';

@immutable
abstract class ChallengesBlocState {}

class ChallengesLoadingState extends ChallengesBlocState {
  @override
  List<Object?> get props => [];
}

class ChallengesLoadedState extends ChallengesBlocState {
  final List<ChallengeModel> challenges;

  ChallengesLoadedState(this.challenges);
  @override
  List<Object?> get props => [challenges];
}

class ChallengesErrorState extends ChallengesBlocState {
  final String error;

  ChallengesErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
