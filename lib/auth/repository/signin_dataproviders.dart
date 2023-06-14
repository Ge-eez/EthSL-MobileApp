import '../data_provider/index.dart';

class SignInRepository {
  // ignore: non_constant_identifier_names
  final SignInDataProvider signin_dataprovider;

  // ignore: non_constant_identifier_names
  SignInRepository({required this.signin_dataprovider});

  Future<Map<String, dynamic>> signinEmail({
    required String email,
    required String password,
  }) async {
    return await signin_dataprovider.signinEmail(
        email: email, password: password);
  }
}