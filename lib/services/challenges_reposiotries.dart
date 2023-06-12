import 'dart:convert';

import 'package:blink/models/challenges_model.dart';
import 'package:http/http.dart';

String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0N2I1NDkxZTQ3OTM3NmMxOTZhNmQ2MyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjg2NTYzNTIzLCJleHAiOjE2ODY2NDk5MjN9.qRMIcTJOp5t4CvhBtYSKB7iolAuA1ySIlOk1eVyXvak';

class ChallengeRepository {
  String baseUrl = 'https://blink-backend-service.onrender.com/';

  Future<List<ChallengeModel>> getChallenges() async {
    Response response = await get(
      Uri.parse('${baseUrl}challenges'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if(response.statusCode == 200){
      final List result = jsonDecode(response.body);
      return result.map((e) => ChallengeModel.fromJson(e)).toList();
    }else {
      throw Exception(response.reasonPhrase);
    }
  }

  
}
