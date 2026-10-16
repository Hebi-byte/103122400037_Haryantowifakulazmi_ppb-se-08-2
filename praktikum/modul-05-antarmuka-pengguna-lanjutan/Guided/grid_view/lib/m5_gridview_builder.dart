import 'package:flutter/material.dart';

class M5GridViewBuilder extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    List items = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent:  100,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue[100 * (index % 9 + 1)],
          child: Center(child: Text("${items[index]}")),
        );
      },
    );
  }
}