import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LogInEvent extends SignInEvent {
  final String email;
  final String password;
  LogInEvent(this.email, this.password);
}