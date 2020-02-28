import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/constants.dart';

const BoxDecoration   kContainerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
  ),
);

String  text = '';

class AddTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
        decoration: kContainerDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kColorScaffold,
                fontFamily: 'Sriracha',
                fontSize: 30.0,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              cursorColor: kColorScaffold,
              decoration: InputDecoration(
                hintText: 'New Task',
              ),
              onChanged: (newValue) {
                text = newValue;
              },
            ),
            SizedBox(height: 30.0),
            AddButton(
              text: text,
            ),
          ],
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  final String    text;

  AddButton({this.text});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      color: kColorScaffold,
      child: Text(
        'Add',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Sriracha',
          fontSize: 17.0,
        ),
      ),
      onPressed: () {
        Provider.of<ListTasks>(
          context,
          listen: false,
        ).addTask(text);
        Navigator.pop(context);
      },
    );
  }
}