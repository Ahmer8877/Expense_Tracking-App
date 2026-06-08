import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/ExpenseController.dart';
import '../../widgets/EmptyStateWidget.dart';
import '../../widgets/ExpenseCard.dart';
import 'EditExpenseScreen.dart';

class ExpenseListScreen
    extends StatelessWidget {

  ExpenseListScreen({super.key});

  final ExpenseController controller =
  Get.find<ExpenseController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Expenses",
        ),
      ),

      body: Obx(
            () {

          /// Empty List
          if (controller.expenses.isEmpty) {

            return const EmptyStateWidget();
          }

          /// Expense List
          return ListView.builder(
            padding:
            const EdgeInsets.all(16),

            itemCount:
            controller.expenses.length,

            itemBuilder:
                (context, index) {

              final expense = controller.expenses[index];

              return ExpenseCard(
                expense: expense,

                onEdit: () {

                  Get.to(
                        () => EditExpenseScreen(
                      expense: expense,
                    ),
                  );
                },

                onDelete: () {

                  showDeleteDialog(
                    context,
                    expense.id,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  /// Delete Confirmation Dialog
  void showDeleteDialog(
      BuildContext context,
      String id,
      ) {

    Get.defaultDialog(
      title: "Delete Expense",

      middleText:
      "Are you sure you want to delete this expense?",

      textCancel: "Cancel",

      textConfirm: "Delete",

      confirmTextColor:
      Colors.white,

      onConfirm: () {

        controller.deleteExpense(id);

        Get.back();

        Get.snackbar(
          "Deleted",
          "Expense deleted successfully",
        );
      },
    );
  }
}