import 'package:bank_flutter/pages/home_page.dart';
import 'package:bank_flutter/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'ConstRoutes.dart';

class Routes{
  static Route<dynamic> pathRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginViewRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case HomeViewRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}