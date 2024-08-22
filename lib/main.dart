import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operaciones Básicas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora Simple'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  double _resultado = 0;

  void _realizarOperacion(String operacion) {
    setState(() {
      double numero1 = double.tryParse(_controller1.text) ?? 0;
      double numero2 = double.tryParse(_controller2.text) ?? 0;

      switch (operacion) {
        case '+':
          _resultado = numero1 + numero2;
          break;
        case '-':
          _resultado = numero1 - numero2;
          break;
        case '*':
          _resultado = numero1 * numero2;
          break;
        case '/':
          if (numero2 != 0) {
            _resultado = numero1 / numero2;
          } else {
            _resultado = double.nan; // Resultado indefinido si se divide por 0
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número 1',
              ),
            ),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número 2',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _realizarOperacion('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _realizarOperacion('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _realizarOperacion('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _realizarOperacion('/'),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Resultado: $_resultado',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
