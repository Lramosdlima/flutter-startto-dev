import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/repositories/todo_repository.dart';
import 'package:todo_list/widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _addTaskController = TextEditingController();
  final TaskRepository taskRepository = TaskRepository();

  List<Task> tasks = [];
  Task? deletedTask;
  int? deletedTaskPos;

  String? errorText;

  @override
  void initState() {
    super.initState();

    taskRepository
        .loadTaskList()
        .then((value) => setState(() => tasks = value));
  }

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
              Text('Minhas Tarefas',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _addTaskController,
                      onSubmitted: _addTask,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        errorText: errorText,
                        labelText: "Adicione uma tarefa",
                        hintText: "Exemplo: Estudar Flutter",
                        hintStyle: const TextStyle(color: Colors.grey),
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
                    for (Task task in tasks)
                      TodoListItem(task: task, onDelete: _removeTask),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              tasks.isEmpty
                  ? const SizedBox()
                  : Row(
                      children: [
                        Expanded(
                            child: Text(tasks.length == 1
                                ? 'Você possui 1 tarefa pendente.'
                                : 'Você possui ${tasks.length} tarefas pendentes.')),
                        const SizedBox(width: 8),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(14),
                            ),
                            onPressed: _showDeleteConfirmationDialog,
                            child: const Text('Limpar tudo'))
                      ],
                    )
            ],
          ),
        )),
      ),
    );
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Limpar Tudo?'),
        content: const Text('Tem certeza que deseja excluir todas as tarefas?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar')),
          TextButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  tasks.clear();
                  taskRepository.saveTaskList(tasks);
                });
              },
              child: const Text('Limpar Tudo')),
        ],
      ),
    );
  }

  void _removeTask(Task task) {
    deletedTask = task;
    deletedTaskPos = tasks.indexOf(task);

    setState(() => tasks.remove(task));
    taskRepository.saveTaskList(tasks);

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tarefa ${task.title} removida!'),
        backgroundColor: Theme.of(context).primaryColor,
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () => setState(() {
            tasks.insert(deletedTaskPos!, deletedTask!);
            taskRepository.saveTaskList(tasks);
          }),
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void _addTask(value) {
    if (value.isNotEmpty) {
      String title = value;
      Task task = Task(title: title, date: DateTime.now());

      setState(() {
        tasks.add(task);
        errorText = null;
      });
      _addTaskController.clear();

      taskRepository.saveTaskList(tasks);
    } else {
      setState(() => errorText = 'O título não pode ser vazio!');
    }
  }
}
