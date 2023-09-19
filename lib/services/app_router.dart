import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/recycle_bin.dart';
import 'package:flutter_todo_app/screens/task_screen.dart';



class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case TaskScreen.id:
        return MaterialPageRoute(
          builder: (context) => const TaskScreen(),
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