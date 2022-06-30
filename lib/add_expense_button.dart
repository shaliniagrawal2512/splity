import 'package:flutter/material.dart';
import 'package:splity/add_expenses.dart';

class ExpenseButton extends StatelessWidget {
  const ExpenseButton({Key? key, required this.tag}) : super(key: key);
  final int tag;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: "btn$tag",
      hoverColor: const Color(0xff217A54),
      elevation: 5,
      hoverElevation: 10,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const AddExpense()));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      tooltip: "Add expenses",
      label: const Text("Add expense",
          style: TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
      icon: const Icon(
        Icons.receipt_outlined,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
