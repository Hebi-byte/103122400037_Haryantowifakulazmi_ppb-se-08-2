import 'package:flutter/material.dart';

class M5GridViewExtend extends StatelessWidget {
  const M5GridViewExtend({super.key});

  @override
  Widget build(BuildContext context) {
    final alphabet = List<String>.generate(
      26,
      (index) => String.fromCharCode(65 + index),
    );

    return GridView.extent(
      padding: const EdgeInsets.all(10),
      maxCrossAxisExtent: 120,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1.2,
      children: List<Widget>.generate(
        alphabet.length,
        (index) => Container(
          color: Colors.blue[(index % 9 + 1) * 100],
          alignment: Alignment.center,
          child: Text(
            alphabet[index],
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
