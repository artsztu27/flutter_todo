import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks {
    return [..._tasks];
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void editTask(Task task) {
    removeTask(task.id);
    addTask(task);
  }

  void removeTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void changeStatus(String id) {
    int index = _tasks.indexWhere((task) => task.id == id);
    _tasks[index].isDone = !_tasks[index].isDone;
  }
}
