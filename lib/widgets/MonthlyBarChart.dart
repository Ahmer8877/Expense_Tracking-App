import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MonthlyBarChart extends StatelessWidget {
  final Map<String, double> data;

  const MonthlyBarChart({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {

    if (data.isEmpty) {
      return const SizedBox();
    }

    int index = 0;

    return SizedBox(
      height: 300,
      child: BarChart(
        BarChartData(
          barGroups: data.entries.map((entry) {

            final group = BarChartGroupData(
              x: index++,
              barRods: [
                BarChartRodData(
                  toY: entry.value,
                ),
              ],
            );

            return group;

          }).toList(),
        ),
      ),
    );
  }
}