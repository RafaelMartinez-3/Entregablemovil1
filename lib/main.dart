import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscar Imagen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Buscar Imagen Aleatoria'),
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
  String? _imageUrl;

  Future<void> _buscarImagen() async {
    final String imageUrl = 'https://picsum.photos/600/400?random=${DateTime.now().millisecondsSinceEpoch}';

    setState(() {
      _imageUrl = imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _buscarImagen,
              child: const Text('Buscar Imagen Aleatoria'),
            ),
            const SizedBox(height: 20),
            _imageUrl == null
                ? const Text('Presiona el botón para buscar una imagen')
                : Image.network(_imageUrl!),
          ],
        ),
      ),
    );
  }
}
