import 'package:flutter/material.dart';

class CategorySummaryTile
    extends StatelessWidget {

  final String category;
  final double amount;

  const CategorySummaryTile({
    super.key,
    required this.category,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        title: Text(category),

        trailing: Text(
          "Rs ${amount.toStringAsFixed(0)}",
          style: const TextStyle(
            fontWeight:
            FontWeight.bold,
          ),
        ),
      ),
    );
  }
}