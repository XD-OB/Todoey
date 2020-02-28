import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

class TaskTile extends StatelessWidget {
  final Function  changeCheckState;
  final Function  deleteTask;
  final String    taskText;
  final bool      isChecked;

  TaskTile({this.taskText, this.isChecked,
            this.changeCheckState, this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: deleteTask,
      child: ListTile(
        title: Text(
          taskText,
          style: TextStyle(
            decoration: isChecked ?
              TextDecoration.lineThrough : null,
            fontFamily: 'Kalam',
            fontSize: 22.0,
          ),
        ),
        trailing: Checkbox(
          activeColor: kColorScaffold,
          value: isChecked,
          onChanged: changeCheckState,
        ),
      ),
    );
  }
}