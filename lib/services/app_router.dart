import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/recycle_bin.dart';
import 'package:flutter_todo_app/screens/tabs_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case TabsScreen.id:
        return MaterialPageRoute(
          builder: (context) => const TabsScreen(),
        );
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (context) => const RecycleBin(),
        );
      default:
        return null;
    }
  }
}
