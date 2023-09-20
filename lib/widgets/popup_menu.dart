import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/tasks.dart';

class PopMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;

  const PopMenu({
    super.key,
    required this.cancelOrDeleteCallback,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false
          ? (context) {
              return [
                PopupMenuItem(
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit')),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.bookmark),
                      label: const Text('Add to Bookmark')),
                  onTap: () {},
                ),
                PopupMenuItem(
                  onTap: cancelOrDeleteCallback,
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete')),
                ),
              ];
            }
          : (context) {
              return [
                PopupMenuItem(
                  onTap: () {},
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.restore_from_trash),
                      label: const Text('Restore')),
                ),
                PopupMenuItem(
                  onTap: cancelOrDeleteCallback,
                  child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Delete Permanently')),
                )
              ];
            },
    );
  }
}
