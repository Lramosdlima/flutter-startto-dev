import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController _addTaskController = TextEditingController();

  List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _addTaskController,
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
                  onPressed: () {
                    if (_addTaskController.text.isNotEmpty) {
                      String task = _addTaskController.text;
                      setState(() => tasks.add(task));
                      _addTaskController.clear();
                    }
                  },
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            ListView(
              shrinkWrap:
                  true, // essa propriedade faz com que o ListView seja redimensionado ao adicionar novos itens
              children: [
                for (String task in tasks)
                  ListTile(
                    title: Text(task),
                    leading: const Icon(Icons.task),
                    onTap: () => {
                      print('Tarefa $task foi concluída!'),
                    },
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(
                    child: Text('Você possui 0 tarefa(s) pendente(s).')),
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
    );
  }
}
