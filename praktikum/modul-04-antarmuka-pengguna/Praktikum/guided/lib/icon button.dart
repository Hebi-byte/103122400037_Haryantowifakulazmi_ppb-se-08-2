import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home : Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Flutter Demo Home Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(
                FontAwesomeIcons.house,
                size: 100,
              ),
              TextButton(
                onPressed: () {
                  // Aksi ketika tombol ditekan
                },
                style: const ButtonStyle(
                  side: MaterialStatePropertyAll(BorderSide(color: Colors.blue)),
                ),
                child: const Text('Tekan Saya'),
              ),
              IconButton(onPressed: () {
                // Aksi ketika tombol ditekan
              }, icon: const FaIcon(FontAwesomeIcons.heart))
            ],
          ),
        ),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
