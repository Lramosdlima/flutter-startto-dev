import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {
  const TextFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Exemplos de TextFields',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                )),
            const SizedBox(height: 32),
            const TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Email",
                hintText: "exemplo@email.com",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Preço",
                prefixText: "R\$ ",
                hintText: "00.00",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Peso",
                suffixText: "kg",
                hintText: "00.00",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Data",
                suffixIcon: Icon(Icons.calendar_today),
                hintText: "00/00/0000",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              keyboardType: TextInputType.datetime,
            )
          ],
        ),
      )),
    );
  }
}
