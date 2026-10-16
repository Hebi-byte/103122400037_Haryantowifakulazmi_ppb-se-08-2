import 'package:flutter/material.dart';

class M5ListViewSeparated extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    List items = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"];

    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue[100 * (index % 9 + 1)],
          height: 200,
          child: Center(child: Text("${items[index]}")),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.black,
          thickness: 2,
        );
      }
    );
   
  }
}