import 'package:flutter/material.dart';
import 'package:splity/add_expenses.dart';
import 'package:splity/user_group_model.dart';

class ExpenseButton extends StatelessWidget {
  const ExpenseButton({
    Key? key,
    required this.tag,
    required this.groups,
    required this.user,
    required this.selectedGroup,
  }) : super(key: key);
  final int tag;
  final List<OurGroup> groups;
  final OurUser user;
  final String selectedGroup;
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
                builder: (BuildContext context) => AddExpense(
                    inGroup: tag == 4 ? true : false,
                    groups: groups,
                    user: user)));
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
