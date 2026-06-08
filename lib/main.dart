import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:personal_expense_tracking_service/views/Screens/AddExpenseScreen.dart';
import 'package:personal_expense_tracking_service/views/Screens/DashboardScreen.dart';
import 'package:personal_expense_tracking_service/views/Screens/ExpenseListScreen.dart';
import 'package:personal_expense_tracking_service/views/Screens/SummaryScreen.dart';
import 'package:personal_expense_tracking_service/views/Screens/splash_screen.dart';

import 'core/theme/theme_controller.dart';
import 'data/controller/ExpenseController.dart';
import 'data/models/ExpenseModel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Hive Init
  await Hive.initFlutter();

  /// Register Hive Adapter
  Hive.registerAdapter(
    ExpenseModelAdapter(),
  );

  await Hive.openBox<ExpenseModel>(
    'expenses',
  );

  await Hive.openBox(
    'settings',
  );

  /// Register Controllers
  Get.put(
    ExpenseController(),
  );
   ///Theme Controller
  Get.put(
    ThemeController(),
  );

  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      home: SplashScreen(),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark(),
      getPages: [

        GetPage(
          name: '/dashboard',
          page: () =>
          DashboardScreen(),
        ),

        GetPage(
          name: '/add-expense',
          page: () =>
          const AddExpenseScreen(),
        ),

        GetPage(
          name: '/expense-list',
          page: () =>
              ExpenseListScreen(),
        ),

        GetPage(
          name: '/summary',
          page: () =>
              SummaryScreen(),
        ),
      ],
    );
  }
}