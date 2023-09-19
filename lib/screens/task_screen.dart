import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/tasks.dart';
import 'package:flutter_todo_app/screens/add_task_screen.dart';
import 'package:flutter_todo_app/screens/my_drawer.dart';
import 'package:flutter_todo_app/widgets/tasks_list.dart';

import '../blocs/bloc_exports.dart';

// ignore: must_be_immutable
class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);
  static const id = 'task_screen';

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const AddTaskScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(
                  child: Chip(
                    label: Text(
                      '${state.allTasks.length} Tasks',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
              TasksList(taskList: taskList),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addTask(context);
            },
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
