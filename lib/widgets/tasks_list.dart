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
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList
              .map(
                (task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isExpanded) {
                    return TasksTile(task: task);
                  },
                  body: ListTile(
                    title: SelectableText.rich(
                      TextSpan(children: [
                        const TextSpan(
                          text: 'Title\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '${task.title}\n',
                        ),
                        const TextSpan(
                          text: '\n\nDescription\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: task.description,
                        ),
                      ]),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}


// Expanded(
//       child: ListView.builder(
//         itemCount: taskList.length,
//         itemBuilder: (context, index) {
//           var task = taskList[index];
//           return TasksTile(task: task);
//         },
//       ),
//     );