import 'package:bank_flutter/pages/login_page.dart';
import 'package:bank_flutter/routes/ConstRoutes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Flutter',
      debugShowCheckedModeBanner: false,

      home: LoginPage(),
    );
  }
}


