import 'package:flutter/material.dart';

void main() => runApp(const MyCalculator());

class MyCalculator extends StatelessWidget {
  const MyCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Sederhana',
      home: const CalculatorForm(),
    );
  }
}

class CalculatorForm extends StatefulWidget {
  const CalculatorForm({super.key});

  @override
  State<CalculatorForm> createState() => CalculatorFormState();
}

class CalculatorFormState extends State<CalculatorForm> {
  final formKey = GlobalKey<FormState>();
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  String result = 'Hasil akan muncul di sini';
  String selectedOp = '+'; 

  @override
  void dispose() {
    num1Controller.dispose();
    num2Controller.dispose();
    super.dispose();
  }

  void performCalculation() {
    if (formKey.currentState!.validate()) {
      double num1 = double.tryParse(num1Controller.text) ?? 0;
      double num2 = double.tryParse(num2Controller.text) ?? 0;
      double hasil = 0;

      switch (selectedOp) {
        case '+':
          hasil = num1 + num2;
          break;
        case '-':
          hasil = num1 - num2;
          break;
        case '*':
          hasil = num1 * num2;
          break;
        case '/':
          hasil = num2 != 0 ? num1 / num2 : 0; 
          break;
      }

      setState(() {
        result = 'Hasil: $hasil';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Perhitungan berhasil!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator Matematika'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              TextFormField(
                controller: num1Controller,
                decoration: const InputDecoration(
                  labelText: 'Angka Pertama',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan angka pertama';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Harus berupa angka';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
             
              TextFormField(
                controller: num2Controller,
                decoration: const InputDecoration(
                  labelText: 'Angka Kedua',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan angka kedua';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Harus berupa angka';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() => selectedOp = '+');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedOp == '+' ? Colors.blue : Colors.grey,
                    ),
                    child: const Text('+'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() => selectedOp = '-');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedOp == '-' ? Colors.blue : Colors.grey,
                    ),
                    child: const Text('-'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() => selectedOp = '*');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedOp == '*' ? Colors.blue : Colors.grey,
                    ),
                    child: const Text('*'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() => selectedOp = '/');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedOp == '/' ? Colors.blue : Colors.grey,
                    ),
                    child: const Text('/'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              
              ElevatedButton(
                onPressed: performCalculation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Hitung', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),
              
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  result,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}