import 'package:flutter/material.dart';
import 'm7_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: firstpage(),
    );
  }
}

class firstpage extends StatelessWidget {
  const firstpage({super.key});
  final String nama = "Ezio Auditore";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Page")),
      body: Center(
        child: Column(
          children: [
            const Text("Hello, World!"),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => secondpage(nama: nama),
                ),
              ),
              child: const Text("Go to Second Page"),
            )
          ],
        ),
      ),
    );
  }
}

class secondpage extends StatelessWidget {
  final String nama;
  const secondpage({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Page")),
      body: Center(
        child: Column(
          children: [
            Text("Hello, $nama!"),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Go Back"),
            )
          ],
        ),
      ),
    );
  }
}
