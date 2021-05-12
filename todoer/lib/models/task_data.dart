import 'package:flutter/foundation.dart';
import 'package:todoer/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(String newTaskTitle) {
    tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
