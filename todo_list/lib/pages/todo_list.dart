import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

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
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
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
                  onPressed: () {},
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
                Container(color: Colors.grey, height: 50),
                Container(color: Colors.red, height: 50),
                Container(color: Colors.green, height: 50),
                Container(color: Colors.blue, height: 50),
                Container(color: Colors.yellow, height: 50),
                Container(color: Colors.purple, height: 50),
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
                    onPressed: () {},
                    child: const Text('Limpar tudo'))
              ],
            )
          ],
        ),
      )),
    );
  }
}
