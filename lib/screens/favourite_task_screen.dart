import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/tasks.dart';
import 'package:flutter_todo_app/widgets/tasks_list.dart';

import '../blocs/bloc_exports.dart';

// ignore: must_be_immutable
class FavouriteTaskScreen extends StatelessWidget {
  const FavouriteTaskScreen({Key? key}) : super(key: key);
  static const id = 'favourite_task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.favouriteTasks;
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(
                  child: Chip(
                    label: Text(
                      '${state.favouriteTasks.length} Tasks',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              TasksList(taskList: taskList),
            ],
          ),
        );
      },
    );
  }
}
