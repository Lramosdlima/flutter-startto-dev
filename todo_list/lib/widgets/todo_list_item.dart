import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/models/task.dart';

class TodoListItem extends StatelessWidget {
  TodoListItem({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onComplete,
  });

  final Task task;
  final Function(Task) onDelete;
  final Function(Task) onComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              onPressed: (context) {
                onDelete(task);
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Deletar',
            ),
            SlidableAction(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              onPressed: (context) {
                onComplete(task);
              },
              backgroundColor: task.isCompleted ? Colors.grey : Colors.green,
              foregroundColor: Colors.white,
              icon: task.isCompleted ? Icons.backspace : Icons.check,
              label: task.isCompleted ? 'Voltar' : 'Feito',
            ),
          ],
        ),
        child: _content(context),
      ),
    );
  }

  Widget _content(context) {
    return Container(
      decoration: BoxDecoration(
        color: task.isCompleted
            ? const Color.fromARGB(99, 80, 164, 118)
            : const Color.fromARGB(100, 103, 80, 164),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
            color: task.isCompleted ? Colors.green : Colors.transparent),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(DateFormat('dd/MM/yyyy').format(task.date),
              style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 8),
          Text(task.title, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
