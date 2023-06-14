import 'dart:convert';

import 'package:blink/models/challenges_model.dart';
import 'package:http/http.dart';

import '../auth/bloc/secure_storage.dart';

class ChallengeRepository {
  String baseUrl = 'https://blink-backend-service.onrender.com/';

  Future<List<ChallengeModel>> getChallenges() async {
    final SecureStorage _secureStorage = SecureStorage();
    String? token = await _secureStorage.getToken();
    Response response = await get(
      Uri.parse('${baseUrl}challenges'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => ChallengeModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<void> completeChallenge() async {
    final SecureStorage _secureStorage = SecureStorage();
    String? token = await _secureStorage.getToken();
    Response response = await get(
      Uri.parse('${baseUrl}challenges'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }
}
