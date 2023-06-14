import 'dart:convert';

import 'package:blink/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'helper_service.dart';
import 'service_barrel.dart';

class AuthService {
  static const String loginPath = 'token/';
  static const String registerPath = 'users/';
  static const String refreshPath = 'token/refresh/';
  static const String verifyPath = 'token/verify/';

  static Future<UserModel> loadUser() async {
    final json = await SecureStorageService.storage.read(
      key: SecureStorageService.userKey,
    );
    if (json != null) {
      return UserModel.fromJson(jsonDecode(json));
    } else {
      throw Exception("secure storage error");
    }
  }

  static void saveUser(UserModel user) async {
    await SecureStorageService.storage.write(
      key: SecureStorageService.userKey,
      value: jsonEncode(user.toJson()),
    );
  }

  static Future<UserModel> register({
    required String email,
    required String password,
    required String cellphone,
    required String firstName,
    required String lastName,
  }) async {
    final response = await http.post(
      HelperService.buildUri(loginPath),
      headers: HelperService.buildHeaders(),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
          'cellphone': cellphone,
          'first_name': firstName,
          'last_name': lastName
        },
      ),
    );

    final statusType = (response.statusCode / 100).floor() * 100;
    switch (statusType) {
      case 200:
        final json = jsonDecode(response.body);
        final user = UserModel.fromJson(json);

        saveUser(user);

        return user;
      case 400:
        final json = jsonDecode(response.body);
        throw Exception(json);
      case 300:
      case 500:
      default:
        throw Exception('Error contacting the server!');
    }
  }

  static Future<void> logout() async {
    await SecureStorageService.storage.delete(
      key: SecureStorageService.userKey,
    );
  }

  static Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      HelperService.buildUri(loginPath),
      headers: HelperService.buildHeaders(),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ),
    );

    final statusType = (response.statusCode / 100).floor() * 100;
    switch (statusType) {
      case 200:
        final json = jsonDecode(response.body);
        final user = UserModel.fromJson(json);

        saveUser(user);

        return user;
      case 400:
        final json = jsonDecode(response.body);
        throw Exception(json);
      case 300:
      case 500:
      default:
        throw Exception('Error contacting the server!');
    }
  }
}
