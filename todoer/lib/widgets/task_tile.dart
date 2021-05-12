import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String title;
  final Function longPress;
  final Function change;

  TaskTile(this.title, this.isChecked, this.change, this.longPress);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPress,
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.teal,
        value: isChecked,
        onChanged: change,
      ),
    );
  }
}
