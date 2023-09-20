import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/tasks.dart';
import 'package:flutter_todo_app/widgets/tasks_list.dart';

import '../blocs/bloc_exports.dart';

// ignore: must_be_immutable
class PendingTaskScreen extends StatelessWidget {
  const PendingTaskScreen({Key? key}) : super(key: key);
  static const id = 'pending_task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.pendingTasks;
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
                      '${state.pendingTasks.length} Pending | ${state.completedTasks.length} Completed',
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
