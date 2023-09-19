import 'package:flutter/material.dart';
import 'package:flutter_todo_app/blocs/bloc_exports.dart';

import '../widgets/tasks_list.dart';
import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = 'recycle_bin';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
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
                      '${state.removedTasks.length} Tasks',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
              TasksList(taskList: state.removedTasks),
            ],
          ),
        );
      },
    );
  }
}
