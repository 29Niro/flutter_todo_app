import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/tasks.dart';

class PopMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislike;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;

  const PopMenu({
    super.key,
    required this.cancelOrDeleteCallback,
    required this.task,
    required this.likeOrDislike,
    required this.editTaskCallback,
    required this.restoreTaskCallback,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false
          ? (context) {
              return [
                PopupMenuItem(
                  onTap: null,
                  child: TextButton.icon(
                      onPressed: editTaskCallback,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit')),
                ),
                PopupMenuItem(
                  onTap: likeOrDislike,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: task.isFavourite == false
                        ? const Icon(Icons.bookmark_add_outlined)
                        : const Icon(Icons.bookmark_remove),
                    label: task.isFavourite == false
                        ? const Text('Add to \nBookmark')
                        : const Text('Remove \nfrom Bookmark'),
                  ),
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
                  onTap: restoreTaskCallback,
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
