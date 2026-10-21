
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView dengan Dialog',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFFFF8FF),
      ),
      home: const HomePage(),
    );
  }
}

class AppData {
  final String title;
  final String subtitle;
  final Color color;
  final String description;
  final String information;

  const AppData({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.description,
    required this.information,
  });
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<AppData> apps = const [
    AppData(
      title: 'Native App',
      subtitle: 'Android, iOS',
      color: Color(0xFFFF4438),
      description: 'Aplikasi yang dikembangkan secara native.',
      information: 'Java, Kotlin, Swift, C#',
    ),
    AppData(
      title: 'Hybrid App',
      subtitle: 'Android, iOS, Web',
      color: Color(0xFF9E9E9E),
      description: 'Aplikasi yang menggabungkan teknologi web '
          'dan dapat dijalankan di berbagai platform.',
      information: 'Javascript, Dart',
    ),
  ];

  void showDetailDialog(BuildContext context, AppData app) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF5EFF7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Detail',
            style: TextStyle(fontSize: 18),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                app.title,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                app.subtitle,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                app.information,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 12),
              Text(
                app.description,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ListView dengan Dialog',
          style: TextStyle(fontSize: 14),
        ),
        backgroundColor: const Color(0xFF2196F3),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        itemCount: apps.length,
        itemBuilder: (context, index) {
          final app = apps[index];

          return Card(
            elevation: 1,
            color: const Color(0xFFF5EFF7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            margin: const EdgeInsets.only(bottom: 4),
            child: ListTile(
              leading: CircleAvatar(
                radius: 12,
                backgroundColor: app.color,
              ),
              title: Text(
                app.title,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                app.subtitle,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black54,
                ),
              ),
              onTap: () {
                showDetailDialog(context, app);
              },
            ),
          );
        },
      ),
    );
  }
}
