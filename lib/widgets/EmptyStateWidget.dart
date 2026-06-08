import 'package:flutter/material.dart';

class EmptyStateWidget
    extends StatelessWidget {

  const EmptyStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return const Center(
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,

        children: [

          Icon(
            Icons.receipt_long,
            size: 70,
            color: Colors.grey,
          ),

          SizedBox(height: 10),

          Text(
            "No Expenses Found",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}