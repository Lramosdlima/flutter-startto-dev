import 'package:flutter/material.dart';
import 'package:flutter_app/pages/calculate_imc.dart';
import 'package:flutter_app/pages/skeleton.dart';
import 'package:flutter_app/pages/text_fields.dart';
import 'package:flutter_app/pages/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Theme.of(context).primaryColor,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.checklist, color: Colors.white),
            icon: Icon(Icons.checklist),
            label: 'Tarefas',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.text_fields_outlined, color: Colors.white),
            icon: Icon(Icons.text_fields),
            label: 'TextFields',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.refresh, color: Colors.white),
            icon: Icon(Icons.refresh),
            label: 'Skeleton',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.calculate, color: Colors.white),
            icon: Icon(Icons.calculate),
            label: 'Calcular IMC',
          ),
        ],
      ),
      body: <Widget>[
        const TodoListPage(),
        TextFieldPage(),
        const SkeletonizerDemoPage(),
        const CalculateIMCPage(),
      ][currentPageIndex],
    );
  }
}
