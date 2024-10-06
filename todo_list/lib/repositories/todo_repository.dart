import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/task.dart';

// Chave das tasks.
const taskListKey = 'task_list';

class TaskRepository {
  late SharedPreferences _sharedPreferences;

  Future<List<Task>> loadTaskList() async {
    // getInstance usa um padrão de singleton, para que apenas uma instância
    // seja criada.
    _sharedPreferences = await SharedPreferences.getInstance();

    // Pega os dados do SharedPreferences pelo chave 'task_list'.
    final String jsonString = _sharedPreferences.getString(taskListKey) ?? '[]';

    // Converte o json para uma lista.
    final List jsonDecoded = json.decode(jsonString) as List;

    // Converte a lista de json para uma lista de Task.
    return jsonDecoded.map((e) => Task.fromJson(e)).toList();
  }

  void saveTaskList(List<Task> tasks) {
    // Converte a lista de Task para uma lista de json.
    final String jsonString = json.encode(tasks);

    // O json vai ser armazenado no SharedPreferences.
    _sharedPreferences.setString(taskListKey, jsonString);
  }
}
