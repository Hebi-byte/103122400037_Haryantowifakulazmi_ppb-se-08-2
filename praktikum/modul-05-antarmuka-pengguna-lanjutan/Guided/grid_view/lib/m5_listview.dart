import 'package:flutter/material.dart';

class M5ListView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          color: Colors.blue[100],
          width: 200,
          child: const Center(child: Text("Item 1")),
        ),
        Container(
          color: Colors.blue[200],
          width: 200,
          child: const Center(child: Text("Item 2")),
        ),
        Container(
          color: Colors.blue[300],
          width: 200,
          child: const Center(child: Text("Item 3")),
        ),
      ]
    );
  }
}