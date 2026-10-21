import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Model Data Item
class TechItem {
  final String name;
  final String platform;
  final String lang;
  final DateTime date;
  final Color color;

  TechItem({
    required this.name,
    required this.platform,
    required this.lang,
    required this.date,
    required this.color,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jurnal ListView + FAB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List data untuk menampung elemen ListView
  final List<TechItem> _items = [];

  // Fungsi untuk menampilkan Form Dialog Tambah Data
  void _showAddDialog() {
    final nameController = TextEditingController();
    final platformController = TextEditingController();
    final langController = TextEditingController();
    
    DateTime? selectedDate;
    Color selectedColor = Colors.blue;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              title: const Text(
                'Add New Tech',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Tech Name',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: platformController,
                      decoration: const InputDecoration(
                        labelText: 'Platform',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: langController,
                      decoration: const InputDecoration(
                        labelText: 'Lang',
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Row untuk Date Picker
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedDate == null
                              ? 'No date selected'
                              : '${selectedDate!.day.toString().padLeft(2, '0')}/${selectedDate!.month.toString().padLeft(2, '0')}/${selectedDate!.year}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        OutlinedButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) {
                              setDialogState(() {
                                selectedDate = picked;
                              });
                            }
                          },
                          child: const Text('Select Date', style: TextStyle(fontSize: 12)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    
                    // Dropdown Pilihan Warna
                    DropdownButtonFormField<Color>(
                      value: selectedColor,
                      decoration: const InputDecoration(
                        labelText: 'Choose Color',
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: Colors.blue,
                          child: Text('Blue'),
                        ),
                        DropdownMenuItem(
                          value: Colors.red,
                          child: Text('Red'),
                        ),
                        DropdownMenuItem(
                          value: Colors.green,
                          child: Text('Green'),
                        ),
                        DropdownMenuItem(
                          value: Colors.orange,
                          child: Text('Orange'),
                        ),
                      ],
                      onChanged: (Color? value) {
                        if (value != null) {
                          setDialogState(() {
                            selectedColor = value;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty && selectedDate != null) {
                      setState(() {
                        _items.add(
                          TechItem(
                            name: nameController.text,
                            platform: platformController.text,
                            lang: langController.text,
                            date: selectedDate!,
                            color: selectedColor,
                          ),
                        );
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Fungsi untuk menampilkan SnackBar saat FAB ditekan
  void _showSnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('FAB Clicked'),
        action: SnackBarAction(
          label: 'Add',
          onPressed: () {
            _showAddDialog();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Jurnal ListView + FAB',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: _items.isEmpty
          ? const Center(
              child: Text(
                'Belum ada data',
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                final dateStr =
                    '${item.date.day.toString().padLeft(2, '0')}/${item.date.month.toString().padLeft(2, '0')}/${item.date.year}';
                return Card(
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: item.color,
                      radius: 14,
                    ),
                    title: Text(
                      item.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Text(
                      '${item.platform} - ${item.lang}\nDate: $dateStr',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showSnackBar,
        child: const Icon(Icons.add),
      ),
    );
  }
}