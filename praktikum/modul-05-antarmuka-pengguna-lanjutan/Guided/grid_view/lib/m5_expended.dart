import 'package:flutter/material.dart';

class M5Expended extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        color: Colors.blue[100],
        width: 100,
        height: 100,
        child: Icon(Icons.home),
      ),
      Expanded(
        child: Container(
          color: const Color.fromARGB(255, 240, 249, 144),
          width: 100,
          height: 100,
          child: Icon(Icons.search),
        ),
      ),
      Container(
        color: const Color.fromARGB(255, 251, 187, 226),
        width: 100,
        height: 100,
        child: Icon(Icons.settings),
      ),
    ],);
  }
}