import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/edit_task_screen.dart';
import 'package:flutter_todo_app/widgets/popup_menu.dart';
import 'package:intl/intl.dart';

import '../blocs/bloc_exports.dart';
import '../models/tasks.dart';

class TasksTile extends StatelessWidget {
  const TasksTile({
    super.key,
    required this.task,
  });

  final Task task;

  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: EditTaskScreen(
            oldTask: task,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                task.isFavourite == false
                    ? const Icon(Icons.star_border_rounded)
                    : const Icon(Icons.star_rounded),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          decoration:
                              task.isDone! ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        DateFormat()
                            .add_yMMMd()
                            .add_Hms()
                            .format(DateTime.parse(task.date)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: task.isDone,
                onChanged: task.isDeleted == false
                    ? (value) {
                        context.read<TasksBloc>().add(UpdateTask(task: task));
                      }
                    : null,
              ),
              PopMenu(
                cancelOrDeleteCallback: () {
                  _removeOrDeleteTask(context, task);
                },
                task: task,
                likeOrDislike: () {
                  context.read<TasksBloc>().add(
                        MarkFavouriteOrUnFavourite(task: task),
                      );
                },
                editTaskCallback: () {
                  Navigator.of(context).pop();
                  _editTask(context);
                },
                restoreTaskCallback: () {
                  context.read<TasksBloc>().add(RestoreTask(task: task));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
