import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/ExpenseModel.dart';

class ExpenseController extends GetxController {

  RxList<ExpenseModel> expenses = <ExpenseModel>[].obs;

  late Box<ExpenseModel> expenseBox;

  @override
  void onInit() {
    super.onInit();

    expenseBox =
        Hive.box<ExpenseModel>(
          'expenses',
        );

    loadExpenses();
  }

  /// Load Data From Hive
  void loadExpenses() {

    expenses.assignAll(
      expenseBox.values.toList(),
    );

    expenses.sort(
          (a, b) =>
          b.date.compareTo(a.date),
    );

    expenses.refresh();
  }

  /// Add Expense
  void addExpense(
      ExpenseModel expense) {

    expenseBox.put(
      expense.id,
      expense,
    );

    loadExpenses();
  }

  /// Delete Expense
  void deleteExpense(
      String id) {

    expenseBox.delete(id);

    loadExpenses();
  }

  /// Update Expense
  void updateExpense(
      String id,
      ExpenseModel updatedExpense,
      ) {

    expenseBox.put(
      id,
      updatedExpense,
    );

    loadExpenses();
  }

  /// Monthly Summary
  Map<String, double> get monthlySummary {

    Map<String, double> summary = {};

    for (var expense in expenses) {

      final monthKey =
          "${expense.date.year}-${expense.date.month}";

      summary[monthKey] =
          (summary[monthKey] ?? 0) +
              expense.amount;
    }

    return summary;
  }

  /// Total Expense
  double get totalExpenses {

    return expenses.fold(
      0.0,
          (sum, expense) =>
      sum + expense.amount,
    );
  }

  /// Total Transactions
  int get totalTransactions {

    return expenses.length;
  }

  /// Highest Expense
  double get highestExpense {

    if (expenses.isEmpty) {
      return 0;
    }

    return expenses
        .map((e) => e.amount)
        .reduce(
          (a, b) =>
      a > b ? a : b,
    );
  }

  /// Category Summary
  Map<String, double>
  get categorySummary {

    Map<String, double> summary = {};

    for (var expense in expenses) {

      summary[expense.category] =
          (summary[expense.category] ?? 0) +
              expense.amount;
    }

    return summary;
  }
}