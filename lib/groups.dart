import 'dart:math';

import 'package:flutter/material.dart';
import 'package:splity/constants.dart';
import 'package:splity/group_info.dart';
import 'package:splity/home_screen.dart';
import 'package:splity/user_group_model.dart';

import 'add_expense_button.dart';

class Groups extends StatelessWidget {
  const Groups({Key? key, required this.group}) : super(key: key);
  final List<OurGroup> group;
  @override
  Widget build(BuildContext context) {
    Color color1 = Colors.blue;

    IconData getIcon(String label) {
      if (label == "Home") return Icons.home;
      if (label == "Couple") return Icons.favorite;
      if (label == "Home") return Icons.home;
      return Icons.receipt;
    }

    Widget getGroupUi(int idx) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        GroupInfo(groupInfo: group, user: user, index: idx)));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Icon(
                  getIcon(group[idx].type),
                  size: 50,
                ),
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter:
                            ColorFilter.mode(color1, BlendMode.modulate),
                        fit: BoxFit.fill,
                        image: const AssetImage("assets/pattern2.jpg")),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(group[idx].name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20)),
                  const SizedBox(height: 7),
                  const Text(
                    "you owe INR rs 350",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xff9D2228)),
                  ),
                  const SizedBox(height: 7),
                  Text(
                      group[idx].groupCreated.toDate().toString().split(' ')[0])
                ],
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: group.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView(padding: const EdgeInsets.all(20), children: [
              const Text("Overall, you owe INR rs 305.76",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              ListView.builder(
                  padding: const EdgeInsets.only(top: 25),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: group.length,
                  itemBuilder: (BuildContext context, int index) {
                    color1 = Colors
                        .primaries[Random().nextInt(Colors.primaries.length)];
                    return getGroupUi(index);
                  }), //ExpansionTile(title: const Text("Non Group Expenses")
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        child: const Icon(
                          Icons.receipt,
                          size: 50,
                        ),
                        width: 85,
                        height: 85,
                        decoration: kBoxDecoration),
                    const SizedBox(width: 20),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          maxHeight: 20000, maxWidth: 230, minWidth: 200),
                      child: ExpansionTile(
                          title: const Text("Non Group Expenses",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                          subtitle: const Text(
                            'Settled Up',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff1ec677)),
                          ),
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: user.expenses.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    subtitle: Text(user.expenses[index]
                                            ["dateSpent"]
                                        .toDate()
                                        .toString()
                                        .split(' ')[0]),
                                    trailing: Text(
                                        user.expenses[index]["amount"]
                                            .toString(),
                                        style: kTextStyle12),
                                    title: Text(
                                        user.expenses[index]["description"],
                                        style: kTextStyle1),
                                  );
                                })
                          ]),
                    )
                  ],
                ),
              ),
            ]),
      floatingActionButton: ExpenseButton(
        tag: 1,
        user: user,
        groups: const [],
        selectedGroup: "",
      ),
    );
  }
}
