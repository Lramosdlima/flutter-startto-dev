import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/task.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
