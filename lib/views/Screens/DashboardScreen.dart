import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/theme_controller.dart';
import '../../data/controller/ExpenseController.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final ExpenseController controller =
  Get.find<ExpenseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        leading:Image(image: AssetImage('assets/icons/expense.png'),height: 40,width: 40,fit: BoxFit.cover,),
        actions: [
          PopupMenuButton(
              itemBuilder: (context)=>[
                PopupMenuItem(
                  onTap: (){
                    Get.find<ThemeController>().toggleTheme();
                  },
                    child: Row(children: [
                      const Icon(Icons.dark_mode),
                      const Text('Dark Theme'),
                    ],)
                )
              ]
          )
        ],
      ),
      body: Stack(
        children: [

          SizedBox.expand(
            child:Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black,
                    Colors.orange,
                    Colors.white,
                  ],
                  stops: [0.1, 0.6, 1.0], // Optional: fine-tunes color distribution
                ),
              ),
            )

          ),

          Obx(
                () => Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                /// Total Expense Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          "Total Expenses",
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Rs ${controller.totalExpenses}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// Add Expense Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(
                        '/add-expense',
                      );
                    },
                    child: const Text(
                      "Add Expense",
                    ),
                  ),
                ),

                /// View Expense Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(
                        '/expense-list',
                      );
                    },
                    child: const Text(
                      "View Expenses",
                    ),
                  ),
                ),

                /// Summary Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(
                        '/summary',
                      );
                    },
                    child: const Text(
                      "Summary",
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Recent Expenses",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Expanded(
                  child: controller
                      .expenses.isEmpty
                      ? const Center(
                    child: Text(
                      "No Expenses Yet",
                    ),
                  )
                      : ListView.builder(
                    itemCount:
                    controller
                        .expenses
                        .length >
                        5
                        ? 5
                        : controller
                        .expenses
                        .length,
                    itemBuilder:
                        (context, index) {
                      final expense =
                      controller
                          .expenses[index];

                      return Card(
                        child: ListTile(
                          title: Text(
                            expense.title,
                          ),
                          subtitle: Text(
                            expense.category,
                          ),
                          trailing: Text(
                            "Rs ${expense.amount}",
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}