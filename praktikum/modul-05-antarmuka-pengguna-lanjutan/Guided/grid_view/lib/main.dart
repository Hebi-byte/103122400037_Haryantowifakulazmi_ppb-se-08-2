import 'package:flutter/material.dart';

// import 'package:grid_view/m5_gridview_count.dart';
// import 'package:grid_view/m5_gridview_builder.dart';
// import 'package:grid_view/m5_gridview_exkstend.dart';
// import 'package:grid_view/m5_listview.dart';
// import 'package:grid_view/m5_listview_builder.dart';
// import 'package:grid_view/m5_listview_sperated.dart';
// import 'package:grid_view/m5_expended.dart';
// import 'package:grid_view/m5_flexible.dart';
import 'package:grid_view/m5_spacer.dart';
// import 'package:grid_view/m5_cusromscrollview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(body: SafeArea(child: M5Spacer()),)
    );
  }
}
