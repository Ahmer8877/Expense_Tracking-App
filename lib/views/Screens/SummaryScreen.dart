import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/ExpenseController.dart';
import '../../widgets/CategoryPieChart.dart';
import '../../widgets/CategorySummaryTile.dart';
import '../../widgets/MonthlyBarChart.dart';
import '../../widgets/SummaryStatCard.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen({super.key});

  final ExpenseController controller =
  Get.find<ExpenseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense Summary",
        ),
      ),

      body: Obx(() {

        /// No Data Found
        if (controller.expenses.isEmpty) {
          return const Center(
            child: Text(
              "No Expense Data Available",
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              /// Statistics Row
              Row(
                children: [

                  Expanded(
                    child: SummaryStatCard(
                      title: "Total Spent",
                      value:
                      "Rs ${controller.totalExpenses.toStringAsFixed(0)}",
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: SummaryStatCard(
                      title: "Transactions",
                      value: controller
                          .totalTransactions
                          .toString(),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// Highest Expense
              SummaryStatCard(
                title: "Highest Expense",
                value:
                "Rs ${controller.highestExpense.toStringAsFixed(0)}",
              ),

              const SizedBox(height: 25),

              /// Pie Chart Title
              const Text(
                "Category Distribution",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Monthly Analytics",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              MonthlyBarChart(
                data: controller.monthlySummary,
              ),

              const SizedBox(height: 15),

              /// Pie Chart
              CategoryPieChart(
                categoryData:
                controller.categorySummary,
              ),

              const SizedBox(height: 25),

              /// Breakdown Title
              const Text(
                "Category Breakdown",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              /// Category Wise List
              ListView.builder(
                shrinkWrap: true,
                physics:
                const NeverScrollableScrollPhysics(),

                itemCount: controller
                    .categorySummary.length,

                itemBuilder: (context, index) {

                  final entry = controller
                      .categorySummary
                      .entries
                      .elementAt(index);

                  return CategorySummaryTile(
                    category: entry.key,
                    amount: entry.value,
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}