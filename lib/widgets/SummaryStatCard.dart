import 'package:flutter/material.dart';

class SummaryStatCard
    extends StatelessWidget {

  final String title;
  final String value;

  const SummaryStatCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding:
        const EdgeInsets.all(16),

        child: Column(
          children: [

            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight:
                FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}