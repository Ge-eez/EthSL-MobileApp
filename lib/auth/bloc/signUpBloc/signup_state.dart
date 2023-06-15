// part of 'auth_bloc.dart';

import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends SignUpState {}

class LoadingState extends SignUpState {}

class SignUpSuccessUser extends SignUpState {}


class SignUpFailed extends SignUpState {
  final String errMsg;
  SignUpFailed(this.errMsg);
}
