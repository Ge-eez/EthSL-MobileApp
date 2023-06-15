import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpDataProvider {
  Future<Map<String, dynamic>> signupEmail(
      {required String email,
      required String password,
      required String firstName,
      required String lastName,
      required String username,
      required String phone}) async {
    const String apiUrl = 'https://blink-backend-service.onrender.com';

    final response = await http.post(
      Uri.parse('$apiUrl/auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "email": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "phone": phone
      }),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      print(body);
      return body;
    }
    if (response.statusCode == 401) {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      throw Exception(body["error"]);
    } else {
      throw Exception('Failed to register user');
    }
  }
}
