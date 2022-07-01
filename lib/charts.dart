import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Charts extends StatelessWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spending Trends", style: TextStyle(fontSize: 20)),
        backgroundColor: const Color(0xff373445),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
