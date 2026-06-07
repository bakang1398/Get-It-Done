import 'package:flutter/material.dart';
import 'package:my_todo/constants/appColors.dart';
import 'package:my_todo/views/todo_home_view.dart';

import 'helpers/ui_helpers.dart';
import 'models/to_do.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<ToDo> savedTasks  = UIHelpers.localTasks.map((e) => ToDo.fromJson(e)).toList();
    return MaterialApp(
      title: 'Get It Done',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: primaryColor),
      ),
      home: TodoHomeView(
        tasks: savedTasks,
      ),
    );
  }
}
