import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/models/ExpenseModel.dart';


class ExpenseCard extends StatelessWidget {
  final ExpenseModel expense;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ExpenseCard({
    super.key,
    required this.expense,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,

      margin: const EdgeInsets.only(
        bottom: 12,
      ),

      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            /// Title + Amount
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [
                Expanded(
                  child: Text(
                    expense.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),

                Text(
                  "Rs ${expense.amount}",
                  style: const TextStyle(
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// Category
            Text(
              "Category: ${expense.category}",
            ),

            const SizedBox(height: 4),

            /// Date
            Text(
              DateFormat(
                "dd MMM yyyy",
              ).format(expense.date),
            ),

            if (expense.notes != null &&
                expense.notes!.isNotEmpty)
              Padding(
                padding:
                const EdgeInsets.only(
                  top: 6,
                ),
                child: Text(
                  maxLines: 1,
                  expense.notes!,overflow: TextOverflow.ellipsis,
                ),
              ),

            const SizedBox(height: 10),

            /// Action Buttons
            Row(
              mainAxisAlignment:
              MainAxisAlignment.end,

              children: [

                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(
                    Icons.edit,
                  ),
                ),

                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}