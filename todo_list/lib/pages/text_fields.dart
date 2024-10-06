import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {
  TextFieldPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

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
                    onPressed: save,
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
      ),
    );
  }

  void save() {
    // Recebe os valores de cada campo.
    String textEmail = _emailController.text;
    String textPrice = _priceController.text;
    String textWeight = _weightController.text;
    String textDate = _dateController.text;

    print(textEmail);
    print(textPrice);
    print(textWeight);
    print(textDate);

    // Limpa os campos.
    _priceController.clear();
    // Preenche o campo.
    _dateController.text = '01/01/2024';

    print('Save!');
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
