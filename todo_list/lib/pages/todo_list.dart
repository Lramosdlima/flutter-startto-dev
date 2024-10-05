import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _addTaskController = TextEditingController();

  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _addTaskController,
                      onSubmitted: _addTask,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Adicione uma tarefa",
                        hintText: "Exemplo: Estudar Flutter",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(14),
                      shape: const CircleBorder(),
                    ),
                    onPressed: () => _addTask(_addTaskController.text),
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Flexible(
                // ocupa o máximo de altura disponível e permite o scroll
                child: ListView(
                  shrinkWrap:
                      true, // essa propriedade faz com que o ListView seja redimensionado ao adicionar novos itens
                  children: [
                    for (Task task in tasks) TodoListItem(task: task),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                      child: Text(
                          'Você possui ${tasks.length} tarefa(s) pendente(s).')),
                  const SizedBox(width: 8),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(14),
                      ),
                      onPressed: () {
                        setState(() => tasks.clear());
                      },
                      child: const Text('Limpar tudo'))
                ],
              )
            ],
          ),
        )),
      ),
    );
  }

  _addTask(value) {
    if (value.isNotEmpty) {
      String title = value;
      Task task = Task(title: title, date: DateTime.now());

      setState(() => tasks.add(task));
      _addTaskController.clear();
    }
  }
}
