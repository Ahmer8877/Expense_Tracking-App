import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/Categories.dart';
import '../../data/controller/ExpenseController.dart';
import '../../data/models/ExpenseModel.dart';
import '../../widgets/CategoryDropdown.dart';
import '../../widgets/CustomTextField.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() =>
      _AddExpenseScreenState();
}

class _AddExpenseScreenState
    extends State<AddExpenseScreen> {

  // Form Key
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final titleController =
  TextEditingController();

  final amountController =
  TextEditingController();

  final notesController =
  TextEditingController();

  String? selectedCategory;

  DateTime selectedDate = DateTime.now();

  final ExpenseController expenseController =
  Get.find<ExpenseController>();

  /// Open Date Picker
  Future<void> pickDate() async {

    DateTime? pickedDate =
    await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDate: selectedDate,
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  void dispose() {

    titleController.dispose();

    amountController.dispose();

    notesController.dispose();

    super.dispose();
  }

  /// Save Expense
  void saveExpense() {

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final expense = ExpenseModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),

      title: titleController.text,

      amount: double.parse(amountController.text,
      ),

      category: selectedCategory!,

      date: selectedDate,

      notes: notesController.text,
    );

    expenseController.addExpense(expense);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Expense",
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: Column(
            children: [

              /// TITLE
              CustomTextField(
                controller:
                titleController,

                hintText:
                "Expense Title",

                validator: (value) {

                  if (value == null ||
                      value.isEmpty) {
                    return "Title is required";
                  }

                  return null;
                },
              ),

              const SizedBox(
                height: 15,
              ),

              /// AMOUNT
              CustomTextField(
                controller:
                amountController,

                hintText:
                "Amount",

                keyboardType:
                TextInputType.number,

                validator: (value) {

                  if (value == null ||
                      value.isEmpty) {
                    return "Amount required";
                  }

                  double? amount =
                  double.tryParse(
                    value,
                  );

                  if (amount == null ||
                      amount <= 0) {
                    return "Enter valid amount";
                  }

                  return null;
                },
              ),

              const SizedBox(
                height: 15,
              ),

              /// CATEGORY
              CategoryDropdown(
                selectedCategory:
                selectedCategory,

                categories:
                Categories
                    .expenseCategories,

                onChanged: (value) {
                  setState(() {
                    selectedCategory =
                        value;
                  });
                },
              ),

              const SizedBox(
                height: 15,
              ),

              /// DATE PICKER
              InkWell(
                onTap: pickDate,

                child: Container(
                  width: double.infinity,

                  padding:
                  const EdgeInsets.all(
                    16,
                  ),

                  decoration:
                  BoxDecoration(
                    border:
                    Border.all(
                      color:
                      Colors.grey,
                    ),

                    borderRadius:
                    BorderRadius
                        .circular(
                      12,
                    ),
                  ),

                  child: Text(
                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              /// NOTES
              CustomTextField(
                controller:
                notesController,

                hintText:
                "Notes (Optional)",

                validator:
                    (value) {
                  return null;
                },

                maxLines: 4,
              ),

              const SizedBox(
                height: 30,
              ),

              /// SAVE BUTTON
              SizedBox(
                width:
                double.infinity,

                height: 50,

                child: ElevatedButton(
                  onPressed:(){
                    saveExpense();
                    Get.back();
                    Get.snackbar(
                      "Success",
                      "Expense Added",
                    );
                  },

                  child: const Text(
                    "Save Expense",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}