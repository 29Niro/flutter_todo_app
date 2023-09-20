import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/tasks.dart';

class EditTaskScreen extends StatelessWidget {
  final Task oldTask;
  const EditTaskScreen({
    Key? key,
    required this.oldTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: oldTask.title);
    TextEditingController descriptionController =
        TextEditingController(text: oldTask.description);
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        const Text(
          'Edit Task',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextField(
            autofocus: true,
            controller: descriptionController,
            maxLines: 5,
            minLines: 3,
            decoration: const InputDecoration(
              labelText: 'Description',
              border: OutlineInputBorder(),
            ),
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
                var editedTask = Task(
                  title: titleController.text,
                  description: descriptionController.text,
                  id: oldTask.id,
                  isDone: false,
                  isFavourite: oldTask.isFavourite,
                  date: DateTime.now().toString(),
                );
                context.read<TasksBloc>().add(EditTask(
                      oldTask: oldTask,
                      newTask: editedTask,
                    ));
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ]),
    );
  }
}
