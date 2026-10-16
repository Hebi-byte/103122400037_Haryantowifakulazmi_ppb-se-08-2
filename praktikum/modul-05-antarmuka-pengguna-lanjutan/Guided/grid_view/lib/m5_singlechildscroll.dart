import 'package:flutter/material.dart';

class M5SingleChildScrollView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
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
        ],
      ),
    );
  }
}