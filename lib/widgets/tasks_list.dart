import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListTasks>(
      builder: (context, listTasks, child) {
        return ListView.builder(
          itemCount: listTasks.tasksCount,
          itemBuilder: (context, index) => TaskTile(
            taskText: listTasks.tasks[index].name,
            isChecked: listTasks.tasks[index].isDone,
            changeCheckState: (newValue) {
              Provider.of<ListTasks>(
                context,
                listen: false,
              ).switchTaskState(index);
            },
            deleteTask: () {
              Provider.of<ListTasks>(
                context,
                listen: false,
              ).deleteTask(index);
            }
          ),
        );
      },
    );
  }
}
