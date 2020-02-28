import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/screens/task_screen.dart';
import 'package:todoey/models/task.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListTasks(),
      child: MaterialApp(
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: kColorScaffold,
          primaryTextTheme: TextTheme(
            body1: TextStyle(
              fontFamily: 'Sriracha',
            ),
          ),
        ),
        home: TasksScreen(),
      ),
    );
  }
}
