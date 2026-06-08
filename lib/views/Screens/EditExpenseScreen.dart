import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/Categories.dart';
import '../../data/controller/ExpenseController.dart';
import '../../data/models/ExpenseModel.dart';
import '../../widgets/CategoryDropdown.dart';
import '../../widgets/CustomTextField.dart';


class EditExpenseScreen extends StatefulWidget {
  final ExpenseModel expense;

  const EditExpenseScreen({
    super.key,
    required this.expense,
  });

  @override
  State<EditExpenseScreen> createState() =>
      _EditExpenseScreenState();
}

class _EditExpenseScreenState
    extends State<EditExpenseScreen> {

  final _formKey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController amountController;
  late TextEditingController notesController;

  late String selectedCategory;
  late DateTime selectedDate;

  final ExpenseController controller =
  Get.find<ExpenseController>();

  @override
  void initState() {
    super.initState();

    /// Prefill existing data
    titleController = TextEditingController(
      text: widget.expense.title,
    );

    amountController = TextEditingController(
      text: widget.expense.amount.toString(),
    );

    notesController = TextEditingController(
      text: widget.expense.notes ?? "",
    );

    selectedCategory = widget.expense.category;

    selectedDate = widget.expense.date;
  }

  @override
  void dispose() {

    titleController.dispose();

    amountController.dispose();

    notesController.dispose();

    super.dispose();
  }

  /// Pick Date
  Future<void> pickDate() async {
    DateTime? pickedDate =
    await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  /// Update Expense
  void updateExpense() {

    if (!_formKey.currentState!.validate()) {
      return;
    }

    ExpenseModel updatedExpense =
    ExpenseModel(
      id: widget.expense.id,

      title: titleController.text,

      amount: double.parse(
        amountController.text,
      ),

      category: selectedCategory,

      date: selectedDate,

      notes: notesController.text,
    );

    controller.updateExpense(
      widget.expense.id,
      updatedExpense,
    );

    Get.back();

    Get.snackbar(
      "Success",
      "Expense Updated",
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Expense",
        ),
      ),

      body: SingleChildScrollView(
        padding:
        const EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: Column(
            children: [

              /// Title
              CustomTextField(
                controller:
                titleController,

                hintText:
                "Expense Title",

                validator: (value) {
                  if (value == null ||
                      value.isEmpty) {
                    return "Title Required";
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 15,
              ),

              /// Amount
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
                    return "Amount Required";
                  }

                  double? amount =
                  double.tryParse(
                    value,
                  );

                  if (amount == null ||
                      amount <= 0) {
                    return "Invalid Amount";
                  }

                  return null;
                },
              ),

              const SizedBox(
                height: 15,
              ),

              /// Category
              CategoryDropdown(
                selectedCategory:
                selectedCategory,

                categories:
                Categories
                    .expenseCategories,

                onChanged: (value) {
                  setState(() {
                    selectedCategory =
                    value!;
                  });
                },
              ),

              const SizedBox(
                height: 15,
              ),

              /// Date Picker
              InkWell(
                onTap: pickDate,

                child: Container(
                  width:
                  double.infinity,

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

              /// Notes
              CustomTextField(
                controller:
                notesController,

                hintText:
                "Notes",

                maxLines: 4,

                validator:
                    (value) {
                  return null;
                },
              ),

              const SizedBox(
                height: 25,
              ),

              /// Update Button
              SizedBox(
                width:
                double.infinity,

                height: 50,

                child: ElevatedButton(
                  onPressed:
                  updateExpense,

                  child: const Text(
                    "Update Expense",
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