import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:todo_list/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aprendendo Flutter',
      theme: ThemeData(
        extensions: const [
          SkeletonizerConfigData(),
        ],
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color.fromARGB(255, 103, 80, 164),
        extensions: const [
          SkeletonizerConfigData.dark(),
        ],
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
