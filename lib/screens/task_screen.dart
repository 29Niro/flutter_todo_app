import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/tasks.dart';

// ignore: must_be_immutable
class TaskScreen extends StatelessWidget {
  TaskScreen({Key? key}) : super(key: key);

  List<Task> taskList = [
    Task(title: 'Task 1'),
    Task(title: 'Task 2'),
    Task(title: 'Task 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: const Center(
              child: Text(
                'Tasks',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                var task = taskList[index];
                return ListTile(
                    title: Text(task.title),
                    trailing: Checkbox(
                      value: task.isDone,
                      onChanged: (value) {},
                    ));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
