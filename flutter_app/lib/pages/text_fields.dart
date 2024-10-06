import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/date_field.dart';
import 'package:intl/intl.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _priceController = TextEditingController();

  final TextEditingController _weightController = TextEditingController();

  final TextEditingController _nameController =
      TextEditingController(text: 'Léo do Chapéu');

  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Exemplos de TextFields',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )),
              const SizedBox(height: 32),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        hintText: "exemplo@email.com",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: onChanged,
                      onSubmitted: onSubmitted,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      textAlign: TextAlign.right,
                      controller: _priceController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Preço",
                        prefixText: "R\$ ",
                        hintText: "10,50",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      inputFormatters: [
                        TextInputMask(
                          mask: 'R\$! !9+,99',
                          placeholder: '0',
                          maxPlaceHolders: 3,
                          reverse: true,
                        )
                      ],
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _weightController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Peso",
                        suffixText: "kg",
                        hintText: "70,5",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      inputFormatters: [
                        TextInputMask(
                          mask: '99,9',
                          reverse: false,
                        )
                      ],
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    DateField(
                        date: date,
                        onPicked: (picked) {
                          setState(() => date = picked);
                        }),
                    const SizedBox(height: 16),
                    TextField(
                      enabled: false,
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nome",
                      ),
                    ),
                  ],
                ),
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
                    onPressed: tap,
                    child: const Text('Verificar'),
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
      ),
    );
  }

  void tap() {
    // Recebe os valores de cada campo.
    String textEmail = _emailController.text;
    String textPrice = _priceController.text;
    String textWeight = _weightController.text;
    String textDate =
        date != null ? DateFormat('dd/MM/yyyy').format(date!) : '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Campos Preenchidos'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Email: $textEmail'),
            Text('Preço: $textPrice'),
            Text('Peso: $textWeight'),
            Text('Data: $textDate'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void onChanged(String text) {
    // Não precisa necessariamente de um controller.
    // Ele é executado quando o texto mudar.
    print('onChanged: $text');
  }

  void onSubmitted(String text) {
    // Ele é executado quando o botão Salvar é apertado ou do próprio Enter do teclado!
    print('onSubmitted: $text');
  }
}
