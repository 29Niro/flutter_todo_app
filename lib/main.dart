import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/task_screen.dart';

import 'blocs/bloc_exports.dart';
import 'models/tasks.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()
        ..add(AddTask(
          task: Task(title: 'Task 1'),
        )),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskScreen(),
      ),
    );
  }
}
