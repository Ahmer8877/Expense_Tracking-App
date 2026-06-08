import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CategoryPieChart extends StatelessWidget {
  final Map<String, double> categoryData;

  const CategoryPieChart({
    super.key,
    required this.categoryData,
  });

  @override
  Widget build(BuildContext context) {
    if (categoryData.isEmpty) {
      return const SizedBox();
    }

    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.purple,
      Colors.teal,
      Colors.amber,
      Colors.indigo,
    ];

    int colorIndex = 0;

    return SizedBox(
      height: 250,
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 40,

          sections: categoryData.entries.map((entry) {
            final section = PieChartSectionData(
              value: entry.value,

              // Category Name
              title: entry.key,

              color: colors[
              colorIndex % colors.length],

              radius: 80,

              titleStyle:
              const TextStyle(
                color: Colors.white,
                fontWeight:
                FontWeight.bold,
                fontSize: 12,
              ),
            );

            colorIndex++;

            return section;
          }).toList(),
        ),
      ),
    );
  }
}