// part of 'auth_bloc.dart';

import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends SignInState {}

class LoadingState extends SignInState {}

class SignInSuccessUser extends SignInState {}


class SignInFailed extends SignInState {
  final String errMsg;
  SignInFailed(this.errMsg);
}
