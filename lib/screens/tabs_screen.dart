import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/completed_task_screen.dart';
import 'package:flutter_todo_app/screens/favourite_task_screen.dart';
import 'package:flutter_todo_app/screens/my_drawer.dart';
import 'package:flutter_todo_app/screens/pendig_task_screen.dart';

import 'add_task_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {
      'page': const PendingTaskScreen(),
      'title': 'Pending Tasks',
    },
    {
      'page': const CompletedTaskScreen(),
      'title': 'Completed Tasks',
    },
    {
      'page': const FavouriteTaskScreen(),
      'title': 'Favourite Tasks',
    },
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
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
    return Scaffold(
      appBar: AppBar(
        title: Text('${_pageDetails[_selectedPageIndex]['title']}'),
      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['page'],
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                _addTask(context);
              },
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.incomplete_circle_sharp),
            label: 'Pending Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Completed Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite Tasks',
          ),
        ],
      ),
    );
  }
}
