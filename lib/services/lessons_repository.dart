import 'dart:convert';

import 'package:blink/models/challenges_model.dart';
import 'package:blink/models/lessons_model.dart';
import 'package:http/http.dart';

import '../auth/bloc/secure_storage.dart';

class LessonRepository {
  String baseUrl = 'https://blink-backend-service.onrender.com/';

  Future<List<LessonModel>> getChallenges() async {
    final SecureStorage _secureStorage = SecureStorage();
    String? token = await _secureStorage.getToken();
    Response response = await get(
      Uri.parse('${baseUrl}lessons'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => LessonModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

