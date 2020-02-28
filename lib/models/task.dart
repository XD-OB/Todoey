import 'package:flutter/cupertino.dart';
import 'dart:collection';

class Task {
  String  name;
  bool    isDone;

  Task({this.name, this.isDone = false});

  void    switchState() {
    isDone = !isDone;
  }
}

class ListTasks extends ChangeNotifier {
  List<Task>  _tasks = [];

  int get tasksCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task>  get   tasks {
    return UnmodifiableListView(_tasks);
  }

  void    addTask(String taskName) {
    _tasks.add(Task(
      name: taskName,
    ));
    notifyListeners();
  }

  void    deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void    switchTaskState(int index) {
    _tasks[index].switchState();
    notifyListeners();
  }
}