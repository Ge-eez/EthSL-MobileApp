import 'dart:convert';

import 'package:blink/auth/bloc/secure_storage.dart';
import 'package:blink/auth/bloc/signInBloc/signin_event.dart';
import 'package:blink/auth/bloc/signInBloc/signin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/signin_dataproviders.dart';

// part 'signin_state.dart';
// part 'signin_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepository signInRepository;

  SignInBloc({required this.signInRepository}) : super(InitialState()) {
    on<LogInEvent>((event, emit) async {
      emit(LoadingState());
      final email = event.email;
      final password = event.password;

      try {
        final data = await signInRepository.signinEmail(
            email: email, password: password);

        SecureStorage _secureStorage = SecureStorage();

        await _secureStorage.persistEmailAndToken(event.email, data['token']!);
        print(data['user']);
        await _secureStorage.persistUser(data['user']);
        emit(SignInSuccessUser());
      } catch (e) {
        emit(SignInFailed(e.toString()));
      }
    });
  }
}
