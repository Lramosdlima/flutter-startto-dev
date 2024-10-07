import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculateIMCPage extends StatefulWidget {
  const CalculateIMCPage({super.key});

  @override
  State<CalculateIMCPage> createState() => _CalculateIMCPageState();
}

class _CalculateIMCPageState extends State<CalculateIMCPage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = 'Informe seus dados';

  late Color infoTextColor = Theme.of(context).primaryColor;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    weightController.text = '';
    heightController.text = '';
    _formKey.currentState!.reset();
    setState(() {
      _infoText = 'Informe seus dados';
      infoTextColor = Theme.of(context).primaryColor;
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      SystemChannels.textInput.invokeMethod('TextInput.hide');

      setState(() {
        double weight =
            double.parse(weightController.text.replaceAll(',', '.'));
        double height =
            double.parse(heightController.text.replaceAll(',', '.'));
        double imc = weight / (height * height);
        if (imc < 18.6) {
          _infoText = 'Abaixo do Peso (${imc.toStringAsPrecision(4)})';
          infoTextColor = Colors.red;
        } else if (imc >= 18.6 && imc < 24.9) {
          _infoText = 'Peso Ideal (${imc.toStringAsPrecision(4)})';
          infoTextColor = Colors.green;
        } else if (imc >= 24.9 && imc < 29.9) {
          _infoText = 'Levemente Acima do Peso (${imc.toStringAsPrecision(4)})';
          infoTextColor = Colors.amber;
        } else if (imc >= 29.9 && imc < 34.9) {
          _infoText = 'Obesidade Grau I (${imc.toStringAsPrecision(4)})';
          infoTextColor = Colors.orange;
        } else if (imc >= 34.9 && imc < 39.9) {
          _infoText = 'Obesidade Grau II (${imc.toStringAsPrecision(4)})';
          infoTextColor = Colors.deepOrange;
        } else if (imc >= 40) {
          _infoText = 'Obesidade Grau III (${imc.toStringAsPrecision(4)})';
          infoTextColor = Colors.red;
        }
      });
    }
  }

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
            onPressed: _resetFields,
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
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
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Este campo é obrigatório';
                          }

                          if (double.parse(value.replaceAll(',', '.')) <=
                              30.0) {
                            return 'Peso inválido';
                          }

                          if (double.parse(value.replaceAll(',', '.')) >=
                              300.0) {
                            return 'Peso inválido';
                          }
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          TextInputMask(
                            mask: '999,9',
                            reverse: false,
                          )
                        ],
                        controller: weightController,
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
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Este campo é obrigatório';
                          }

                          if (double.parse(value.replaceAll(',', '.')) >= 2.5) {
                            return 'Altura muito alta';
                          }

                          if (double.parse(value.replaceAll(',', '.')) <= 1.0) {
                            return 'Altura muito baixa';
                          }
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          TextInputMask(
                            mask: '9,99',
                            reverse: false,
                          )
                        ],
                        controller: heightController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          suffixText: 'm',
                          border: OutlineInputBorder(),
                          labelText: "Altura (m)",
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
                onPressed: _calculate,
                child: const Text('Calcular'),
              ),
              const SizedBox(height: 16),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: infoTextColor ?? Theme.of(context).primaryColor,
                    fontSize: 20),
              )
            ],
          ),
        ),
      )),
    );
  }
}
