import 'dart:convert';

import 'package:bank_flutter/modules/statement/response/statement_response.dart';
import 'package:bank_flutter/modules/statement/statement_module.dart';
import 'package:http/http.dart' as http;
class StatementController{

  static Future<StatementResponse> statement(String token,String dataIni, String dataFim) async {
    try {
      var headers = {
        'Authorization': 'Bearer $token'
      };
      final String url = "https://apidev.ewally.com.br/b2b/statement?initialDate=$dataIni&finalDate=$dataFim";
      //var request = http.Request('GET', Uri.parse('https://apidev.ewally.com.br/b2b/statement?initialDate=$dataIni&finalDate=$dataFim'));

      //request.headers.addAll(headers);

      //http.StreamedResponse response = await request.send();
      final response = await http.get(url, headers: headers);
      final s = response.body;

      if (response.statusCode == 200) {
        print("aq" + await response.body);
        print("oq " + response.reasonPhrase);
      }
      else {
        print("oq " + response.reasonPhrase);
      }
      final r = StatementResponse.fromJson(json.decode(s));
      print('R : $r');

      return r;
    } catch (e) {
    }
  }
}