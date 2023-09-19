// ignore_for_file: avoid_print
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/task_screen.dart';
import 'package:flutter_todo_app/services/app_router.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/bloc_exports.dart';

void main() async {
  // Ensure bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize HydratedStorage
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory(),
    );

    runApp(MyApp(
      appRouter: AppRouter(),
    ));
  } catch (e) {
    print('Error initializing HydratedStorage: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TaskScreen(),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
