import 'package:flutter/material.dart';

void main() {
  runApp(const TesApp());
}

class TesApp extends StatelessWidget {
  const TesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riwayat Tes',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF8FF),
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Setiap item memiliki tepat dua key: tanggal dan nilai.
  static const List<Map<String, String>> riwayatTes = [
    {'tanggal': '02/03/2022', 'nilai': '150'},
    {'tanggal': '01/02/2022', 'nilai': '140'},
    {'tanggal': '12/01/2022', 'nilai': '170'},
    {'tanggal': '11/12/2021', 'nilai': '110'},
    {'tanggal': '10/11/2021', 'nilai': '180'},
    {'tanggal': '09/10/2021', 'nilai': '130'},
    {'tanggal': '02/03/2021', 'nilai': '150'},
    {'tanggal': '01/02/2021', 'nilai': '160'},
    {'tanggal': '12/01/2021', 'nilai': '165'},
    {'tanggal': '11/12/2020', 'nilai': '170'},
    {'tanggal': '10/11/2020', 'nilai': '160'},
    {'tanggal': '09/10/2020', 'nilai': '130'},
    {'tanggal': '02/03/2020', 'nilai': '150'},
    {'tanggal': '01/02/2020', 'nilai': '160'},
    {'tanggal': '12/01/2020', 'nilai': '165'},
    {'tanggal': '11/12/2019', 'nilai': '170'},
    {'tanggal': '10/11/2019', 'nilai': '180'},
    {'tanggal': '09/10/2019', 'nilai': '160'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header tetap di tempat saat riwayat di-scroll.
              Row(
                children: [
                  const CircleAvatar(
                    radius: 12,
                    backgroundColor: Color(0xFF2196F3),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Welcome,',
                        style: TextStyle(
                          color: Color(0xFF673AB7),
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '10312240037 - Haryato Wifakul Azmi',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),
              // Kartu ringkasan skor.
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2196F3), Color(0xFFD72EFF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Status tes TOEFL Anda:',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      'LULUS',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        _ScoreColumn(title: 'Listening', score: '80'),
                        _ScoreColumn(title: 'Structure', score: '80'),
                        _ScoreColumn(title: 'Reading', score: '90'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Riwayat Tes',
                style: TextStyle(
                  color: Color(0xFF29232D),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Expanded membatasi area scroll hanya pada ListView.
              // Header, kartu skor, dan judul tidak ikut bergerak.
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: riwayatTes.length,
                  itemBuilder: (context, index) {
                    final data = riwayatTes[index];
                    return _RiwayatItem(
                      tanggal: data['tanggal']!,
                      nilai: data['nilai']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreColumn extends StatelessWidget {
  final String title;
  final String score;

  const _ScoreColumn({required this.title, required this.score});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 9),
        ),
        const SizedBox(height: 3),
        Text(
          score,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _RiwayatItem extends StatelessWidget {
  final String tanggal;
  final String nilai;

  const _RiwayatItem({required this.tanggal, required this.nilai});

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF2196F3);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFD9D1DB), width: 0.7),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tanggal tes:',
                  style: TextStyle(color: blue, fontSize: 11),
                ),
                const SizedBox(height: 3),
                Text(
                  'Nilai: $nilai',
                  style: const TextStyle(color: blue, fontSize: 11),
                ),
              ],
            ),
          ),
          Text(
            tanggal,
            style: const TextStyle(color: blue, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
