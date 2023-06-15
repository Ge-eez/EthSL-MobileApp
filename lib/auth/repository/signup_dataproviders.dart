import '../data_provider/index.dart';

class SignUpRepository {
  // ignore: non_constant_identifier_names
  final SignUpDataProvider signup_dataprovider;

  // ignore: non_constant_identifier_names
  SignUpRepository({required this.signup_dataprovider});

  Future<Map<String, dynamic>> signupEmail({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String username,
    required String phone,
  }) async {
    return await signup_dataprovider.signupEmail(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        username: username,
        phone: phone);
  }
}
