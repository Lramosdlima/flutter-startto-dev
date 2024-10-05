import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {
  TextFieldPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

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
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
                hintText: "exemplo@email.com",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Preço",
                prefixText: "R\$ ",
                hintText: "00.00",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _weightController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Peso",
                suffixText: "kg",
                hintText: "00.00",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Data",
                suffixIcon: Icon(Icons.calendar_today),
                hintText: "00/00/0000",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text('Salvar'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: null,
                  child: const Text('Botão Desabilitado'),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
