import 'dart:convert';
import 'package:bank_flutter/modules/account/account_module.dart';
import 'package:http/http.dart' as http;



class AccountController{

  static balance(String token) async {
    try {
      final url = "https://apidev.ewally.com.br/account/balance";

      Map<String, String> headers = {"Content-Type": "application/json","Authorization": "Bearer $token"};

      final response = await http.get(url, headers: headers);
      final s = response.body;
      final r = Account.fromJson(json.decode(s));
      print('balance > : $r');

      return r;
    } catch (e) {
    }
  }

}