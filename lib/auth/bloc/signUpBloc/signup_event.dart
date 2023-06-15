import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterEvent extends SignUpEvent {
  final String email;
  final String password;
  final String phone;
  final String firstName;
  final String lastName;
  final String username;
  RegisterEvent(this.email, this.password, this.firstName, this.lastName, this.username, this.phone);
}