import 'dart:math';

import 'package:flutter/material.dart';
import 'package:splity/constants.dart';

class Balances extends StatelessWidget {
  const Balances({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Balances", style: TextStyle(fontSize: 20)),
        backgroundColor: const Color(0xff373445),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, idx) {
            return ExpansionTile(
              leading: Container(
                width: 40,
                decoration: getDecoration(),
              ),
              title: const Text("Shanu owes INR rs 167.00 in total"),
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 3000000),
                  child: ListView.builder(
                      padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, idx) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: getDecoration(),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                    "Shanu owes INR rs 167.00 to harsh gupta",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Remind",
                                        style: TextStyle(color: Colors.white)),
                                    style: kStyling2),
                                ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Settle Up",
                                        style: TextStyle(color: Colors.white))),
                              ],
                            )
                          ],
                        );
                      }),
                )
              ],
            );
          }),
    );
  }
}
