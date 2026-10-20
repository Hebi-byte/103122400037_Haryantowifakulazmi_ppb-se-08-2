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
      title: 'PPB Modul 5',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF438BFA)),
        scaffoldBackgroundColor: const Color(0xFFF0F7FD),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    BerandaPage(),
    PesanPage(),
    BiodataPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[selectedIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.message_outlined), label: 'Message'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final pageHeight = constraints.maxHeight;
        return SizedBox(
          width: double.infinity,
          height: pageHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background memenuhi seluruh halaman; warna biru hanya di bagian atas.
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.48, 0.49, 1.0],
                    colors: [
                      Color(0xFF8CC8F7),
                      Color(0xFFB9DFFB),
                      Color(0xFFF0F7FD),
                      Color(0xFFF0F7FD),
                    ],
                  ),
                ),
              ),
              const Positioned(
                top: 18,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'Beranda',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: pageHeight * 0.38,
                left: 12,
                right: 12,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 28, 12, 18),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 18),
                      const Text(
                        'PPB MODUL 5!',
                        style: TextStyle(
                          color: Color(0xFF438BFA),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Random Text 1',
                              style: TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 12),
                          Flexible(
                            child: Text(
                              'Random Text 2',
                              style: TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Text(
                        'Hari ini.',
                        style: TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                      const SizedBox(height: 28),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PesanPage extends StatelessWidget {
  const PesanPage({super.key});

  // Setiap Map berisi 3 String dan 1 Color.
  static final List<Map<String, dynamic>> daftarPesan = [
    {
      'nama': 'Vio',
      'pesan': 'Hari Kamis tuh selalu punya vibe yang berbeda.',
      'waktu': '07:45 AM',
      'warna': const Color(0xFFFF4F91),
    },
    {
      'nama': 'Tila',
      'pesan': 'Lucu ya kamu',
      'waktu': '08:30 AM',
      'warna': const Color(0xFF438BFA),
    },
    {
      'nama': 'Raka',
      'pesan': 'Jangan lupa mengerjakan tugas PPB!',
      'waktu': '09:15 AM',
      'warna': const Color(0xFF20B486),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Pesan',
            style: TextStyle(
              color: Color(0xFF438BFA),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            itemCount: daftarPesan.length,
            itemBuilder: (context, index) {
              final item = daftarPesan[index];
              return Card(
                elevation: 1.5,
                margin: const EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: item['warna'] as Color,
                    child: const Icon(
                      Icons.message,
                      color: Colors.white,
                      size: 19,
                    ),
                  ),
                  title: Text(
                    item['nama'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  subtitle: Text(
                    item['pesan'] as String,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                  trailing: Text(
                    item['waktu'] as String,
                    style: const TextStyle(fontSize: 9, color: Colors.grey),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
      child: Column(
        children: [
          const Text(
            'Form Biodata',
            style: TextStyle(
              color: Color(0xFF438BFA),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 22),
          const BiodataField(label: 'Nama Lengkap', icon: Icons.person_outline),
          const SizedBox(height: 12),
          const BiodataField(label: 'NIM', icon: Icons.badge_outlined),
          const SizedBox(height: 12),
          const BiodataField(label: 'Jurusan', icon: Icons.school_outlined),
          const SizedBox(height: 12),
          const BiodataField(label: 'Umur', icon: Icons.cake_outlined),
        ],
      ),
    );
  }
}

class BiodataField extends StatelessWidget {
  final String label;
  final IconData icon;

  const BiodataField({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: Icon(icon, size: 19, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFD6DCE4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFD6DCE4)),
        ),
      ),
    );
  }
}
