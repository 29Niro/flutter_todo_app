import 'package:flutter/material.dart';
import 'package:flutter_todo_app/services/guid_gen.dart';

import '../blocs/bloc_exports.dart';
import '../models/tasks.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        const Text(
          'Add Task',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          autofocus: true,
          controller: titleController,
          decoration: const InputDecoration(
            labelText: 'Title',
            border: OutlineInputBorder(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Cancel'),
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {
                var task = Task(
                  title: titleController.text,
                  id: GUIDGen.generate(),
                );
                // print(task.id);
                context.read<TasksBloc>().add(AddTask(task: task));
                Navigator.pop(context);
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ]),
    );
  }
}
