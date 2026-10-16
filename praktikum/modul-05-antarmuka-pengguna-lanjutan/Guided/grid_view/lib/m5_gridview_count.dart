import 'package:flutter/material.dart';

class M5GridViewCount extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l"];

    return GridView.count(
      crossAxisCount: 2,
      children : [
        for (var i = 0; i < alphabet.length; i++)
          Container(color: Colors.blue[100 * (i % 9 + 1)],
          child : Text("${alphabet[i]}"))
      ]
    );
  }
}