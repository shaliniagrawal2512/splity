import 'dart:math';

import 'package:flutter/material.dart';
import 'package:splity/add_expense_button.dart';

class Friend extends StatelessWidget {
  BoxDecoration getDecoration() {
    return BoxDecoration(
      image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Colors.primaries[Random().nextInt(Colors.primaries.length)],
              BlendMode.modulate),
          fit: BoxFit.fill,
          image: const AssetImage("assets/pattern3.jpg")),
      shape: BoxShape.circle,
    );
  }

  const Friend({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            minVerticalPadding: 25,
            leading:
                Container(width: 45, height: 45, decoration: getDecoration()),
            trailing: Column(
              children: const [
                Text("yow owe", style: TextStyle(color: Color(0xff9D2228))),
                Text("INR rs 189.00",
                    style: TextStyle(color: Color(0xff1ec677))),
              ],
            ),
            title:
                const Text("Shalini Agrawal", style: TextStyle(fontSize: 18)),
          );
        },
      ),
      floatingActionButton: const ExpenseButton(tag: 2),
    );
  }
}
