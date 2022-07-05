import 'dart:math';
import 'package:flutter/material.dart';
import 'package:splity/add_expense_button.dart';
import 'package:splity/user_group_model.dart';

class Activity extends StatelessWidget {
  const Activity({Key? key, required this.user}) : super(key: key);
  final OurUser user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
        children: [
          const SizedBox(
            height: 40,
            child: ListTile(
                title: Text("Activity",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w500))),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: const Icon(Icons.flight),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)],
                                  BlendMode.modulate),
                              fit: BoxFit.fill,
                              image: const AssetImage("assets/pattern2.jpg")),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Non Group Expenses",
                            style: TextStyle(fontSize: 17)),
                        SizedBox(height: 2),
                        Text(
                          "You owe 1200.00 rs",
                          style:
                              TextStyle(fontSize: 15, color: Color(0xff9D2228)),
                        ),
                        SizedBox(height: 2),
                        Text("25 Aug   2:35 pm",
                            style: TextStyle(color: Colors.white60))
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: ExpenseButton(
        tag: 3,
        user: user,
        groups: const [],
        selectedGroup: "",
      ),
    );
  }
}
