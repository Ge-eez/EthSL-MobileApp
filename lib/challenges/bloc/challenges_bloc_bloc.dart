import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../models/challenges_model.dart';
import '../../services/service_barrel.dart';
part 'challenges_bloc_event.dart';
part 'challenges_bloc_state.dart';

class ChallengesBlocBloc
    extends Bloc<ChallengesBlocEvent, ChallengesBlocState> {
  final ChallengeRepository _challengesRepository;

  ChallengesBlocBloc(this._challengesRepository)
      : super(ChallengesLoadingState()) {
    on<LoadChallengesEvent>((event, emit) async {
      emit(ChallengesLoadingState());
      try {
        final challenges = await _challengesRepository.getChallenges();
        emit(ChallengesLoadedState(challenges));
      } catch (e) {
        emit(ChallengesErrorState(e.toString()));
      }
    });
  }
}
