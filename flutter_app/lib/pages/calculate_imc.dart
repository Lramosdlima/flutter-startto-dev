import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculateIMCPage extends StatefulWidget {
  const CalculateIMCPage({super.key});

  @override
  State<CalculateIMCPage> createState() => _CalculateIMCPageState();
}

class _CalculateIMCPageState extends State<CalculateIMCPage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.calculate,
                size: 100,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 32),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          TextInputMask(
                            mask: '99,9',
                            reverse: false,
                          )
                        ],
                        controller: pesoController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          suffixText: 'kg',
                          border: OutlineInputBorder(),
                          labelText: "Peso (kg)",
                          hintText: "Exemplo: 70,0",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          TextInputMask(
                            mask: '9,99',
                            reverse: false,
                          )
                        ],
                        controller: alturaController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          suffixText: 'cm',
                          border: OutlineInputBorder(),
                          labelText: "Altura (cm)",
                          hintText: "Exemplo: 1,70",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text('Calcular'),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
