import 'package:flutter/material.dart';
import 'package:flutter_todo_app/widgets/tasks_tile.dart';

import '../models/tasks.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          var task = taskList[index];
          return TasksTile(task: task);
        },
      ),
    );
  }
}


