import 'package:todoer/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String taskTitle;
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.teal,
                fontWeight: FontWeight.w600),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              taskTitle = value;
            },
          ),
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false).addTask(taskTitle);
              Navigator.pop(context);
            },
            color: Colors.teal,
            child: Text(
              'Add',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
