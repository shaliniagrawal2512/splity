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
        children: [
          Expanded(
              child: BarChart(
            BarChartData(barGroups: [
              BarChartGroupData(
                  x: 200,
                  groupVertically: true,
                  barsSpace: 20,
                  barRods: [
                    BarChartRodData(toY: 300, width: 20),
                    BarChartRodData(toY: 100, width: 40, color: Colors.green)
                  ]),
              BarChartGroupData(x: 100, groupVertically: true, barsSpace: 20),
              BarChartGroupData(x: 300, groupVertically: true, barsSpace: 20),
              BarChartGroupData(x: 400, groupVertically: true, barsSpace: 20),
            ]
                // read about it in the BarChartData section
                ),
            swapAnimationDuration:
                const Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear, // Optional
          ))
        ],
      ),
    );
  }
}
