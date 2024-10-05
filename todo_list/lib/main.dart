import 'package:flutter/material.dart';
import 'package:todo_list/pages/text_fields.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TextFieldPage());
  }
}
