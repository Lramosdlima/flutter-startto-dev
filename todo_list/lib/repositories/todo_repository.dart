import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/task.dart';

class TaskRepository {
  TaskRepository() {
    SharedPreferences.getInstance().then((value) => _sharedPreferences = value);
  }

  late SharedPreferences _sharedPreferences;

  void saveTaskList(List<Task> tasks) {
    final String jsonString = json.encode(tasks);
    _sharedPreferences.setString('tasks', jsonString);
  }
}
