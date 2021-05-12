import 'package:flutter/material.dart';
import 'package:todoer/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoer/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskdata.tasks[index].name,
              taskdata.tasks[index].isDone,
              (bool checkBoxState) {
                taskdata.updateTask(taskdata.tasks[index]);
              },
              () {
                taskdata.deleteTask(taskdata.tasks[index]);
              },
            );
          },
          itemCount: taskdata.tasks.length,
        );
      },
    );
  }
}
