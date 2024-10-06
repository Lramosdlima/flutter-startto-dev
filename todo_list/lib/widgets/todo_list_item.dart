import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/models/task.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.task, required this.onDelete});

  final Task task;
  final Function(Task) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.25,
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
          ],
        ),
        child: _content(context),
      ),
    );
  }

  Widget _content(context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(100, 103, 80, 164),
        borderRadius: BorderRadius.all(Radius.circular(8)),
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
