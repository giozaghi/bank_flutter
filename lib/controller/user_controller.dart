import 'dart:convert';
import 'package:bank_flutter/modules/user/userToken_module.dart';
import 'package:http/http.dart' as http;



class UserController{

  static Future<UserToken> login(String username, String password) async {
    try {
      final url = "https://apidev.ewally.com.br/user/login";

      Map<String, String> headers = {"Content-Type": "application/json"};

      Map params = {'username': username, 'password': password};

      final body = json.encode(params);

      final response = await http.post(url, headers: headers, body: body);

      final s = response.body;

      final r = UserToken.fromJson(json.decode(s));

      return r;
    } catch (e) {
    }
  }

}