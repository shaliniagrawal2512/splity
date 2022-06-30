import 'dart:math';

import 'package:flutter/material.dart';

import 'add_expense_button.dart';

class Groups extends StatelessWidget {
  const Groups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color1;
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("Overall, you owe INR rs 305.76",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          ListView.builder(
            padding: const EdgeInsets.only(top: 25),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              color1 =
                  Colors.primaries[Random().nextInt(Colors.primaries.length)];
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: const Icon(
                        Icons.home_outlined,
                        size: 70,
                      ),
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              colorFilter:
                                  ColorFilter.mode(color1, BlendMode.modulate),
                              fit: BoxFit.fill,
                              image: const AssetImage("assets/pattern2.jpg")),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Non Group Expenses",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20)),
                        SizedBox(height: 7),
                        Text(
                          "You owe 1200.00 rs",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xff9D2228)),
                        ),
                        SizedBox(height: 7),
                        Text("25 Aug   2:35 pm")
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: const ExpenseButton(tag: 1),
    );
  }
}
