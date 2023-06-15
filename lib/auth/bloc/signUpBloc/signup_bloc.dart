import 'dart:convert';

import 'package:blink/auth/bloc/secure_storage.dart';
import 'package:blink/auth/bloc/signUpBloc/signup_event.dart';
import 'package:blink/auth/bloc/signUpBloc/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/signup_dataproviders.dart';

// part 'signin_state.dart';
// part 'signin_event.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepository signUpRepository;

  SignUpBloc({required this.signUpRepository}) : super(InitialState()) {
    on<RegisterEvent>((event, emit) async {
      emit(LoadingState());
      final email = event.email;
      final password = event.password;
      final firstName = event.firstName;
      final lastName = event.lastName;
      final username = event.username;
      final phone = event.phone;

      try {
        final data = await signUpRepository.signupEmail(
            email: email, password: password, username: username, firstName: firstName, lastName: lastName, phone: phone, );

        SecureStorage _secureStorage = SecureStorage();

        
        emit(SignUpSuccessUser());
      } catch (e) {
        emit(SignUpFailed(e.toString()));
      }
    });
  }
}
