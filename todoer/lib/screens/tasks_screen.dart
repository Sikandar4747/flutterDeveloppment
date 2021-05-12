import 'package:flutter/material.dart';
import 'package:todoer/models/task_data.dart';
import 'package:todoer/widgets/tasks_list.dart';
import 'package:todoer/screens/add_tasks_screen.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40.0,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
      ),
      backgroundColor: Colors.teal,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 70.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    color: Colors.teal,
                    size: 35.0,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Todoer',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '${Provider.of<TaskData>(context).tasks.length} Tasks',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(15.0),
                  right: Radius.circular(15.0),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
