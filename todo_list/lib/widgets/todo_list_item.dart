import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('2022-07-01', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 8),
          Text('Task 1', style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
