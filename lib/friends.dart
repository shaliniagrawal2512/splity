import 'package:flutter/material.dart';
import 'package:splity/add_expense_button.dart';

class Friend extends StatelessWidget {
  const Friend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [],
      ),
      floatingActionButton: const ExpenseButton(tag: 2),
    );
  }
}
