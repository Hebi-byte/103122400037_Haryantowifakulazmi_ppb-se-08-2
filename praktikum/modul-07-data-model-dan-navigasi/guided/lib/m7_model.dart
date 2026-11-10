import 'package:flutter/material.dart';

class mahasiswa {
  final String nama;
  final String nim;
  final int umur;

  mahasiswa({required this.nama, required this.nim, required this.umur});

  factory mahasiswa.fromJson(Map<String, dynamic> json) {
    return mahasiswa(
      nama: json["nama"],
      nim: json["nim"],
      umur: int.parse(json["umur"].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nama": nama,
      "nim": nim,
      "umur": umur,
    };
  }
}

class M7Model extends StatelessWidget {
  const M7Model({super.key});

  @override
  Widget build(BuildContext context) {
    mahasiswa mahasiswa1 = mahasiswa(nama: "John Doe", nim: "123456789", umur: 20);
    print(mahasiswa1);
    // return const Placeholder();

    Map<String, dynamic> json = {
      "nama": "Ezio Auditore",
      "nim": "987654321",
      "umur": "25",
    };
    mahasiswa mahasiswa2 = mahasiswa.fromJson(json);
    print(mahasiswa2);

    Map<String, dynamic> json2 = mahasiswa2.toJson();
    print(json2);
    return const Placeholder();
  }
}
  