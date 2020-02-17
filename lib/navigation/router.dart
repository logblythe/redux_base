import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github_search/navigation/route_paths.dart';
import 'package:github_search/views/pages/search_screen.dart';
import 'package:github_search/views/pages/login_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Entry:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(title: 'Hello world'),
          settings: RouteSettings(name: RoutePaths.Entry),
        );
      case RoutePaths.Home:
        return MaterialPageRoute(
          builder: (_) => SearchScreen(),
          settings: RouteSettings(name: RoutePaths.Home),
        );
    }
  }
}
