import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateField extends StatelessWidget {
  final DateTime? date;
  final void Function(dynamic) onPicked;

  const DateField({super.key, this.date, required this.onPicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: date ?? DateTime.now(),
          firstDate: DateTime(DateTime.now().year),
          lastDate: DateTime(2100),
        );
        if (picked != null && picked != date) {
          onPicked(picked);
        }
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: TextEditingController(
              text: date != null ? DateFormat('dd/MM/yyyy').format(date!) : ''),
          decoration: const InputDecoration(
            labelText: 'Data',
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.calendar_today),
          ),
          validator: (value) =>
              date == null ? 'Este campo é obrigatório' : null,
        ),
      ),
    );
  }
}
