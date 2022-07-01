import 'dart:math';
import 'package:flutter/material.dart';
import 'package:splity/add_expense_button.dart';
import 'package:splity/balances.dart';
import 'package:splity/charts.dart';
import 'package:splity/settle_up.dart';
import 'package:splity/totals.dart';

import 'group_settings.dart';

class GroupInfo extends StatelessWidget {
  Widget getBox(Color color, double width, double height, IconData? icon,
      String image, double radius, BlendMode blend) {
    return Material(
      elevation: 40,
      child: Container(
          width: width,
          height: height,
          child: Icon(icon, size: 45),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            image: DecorationImage(
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(color, blend),
              image: AssetImage(image),
            ),
          )),
    );
  }

  const GroupInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> labels = ["Settle up", "Balances", "Totals", "Charts"];
    List<Widget> tabs = [
      const SettleUp(),
      const Balances(),
      const Totals(),
      const Charts()
    ];
    final Color color =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    Widget getNav(int idx) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary:
                  idx == 0 ? const Color(0xff1dce77) : const Color(0xff4a435f)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => tabs[idx]));
          },
          child: Text(labels[idx], style: const TextStyle(color: Colors.white)),
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: getBox(color, MediaQuery.of(context).size.width, 140,
                        null, "assets/pattern3.jpg", 0, BlendMode.colorBurn)),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                        color: Color(0xff362B45),
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: getBox(color, 70, 70, Icons.flight,
                        "assets/pattern2.jpg", 6, BlendMode.modulate),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const Settings()));
                },
                icon: const Icon(Icons.settings)),
            title: const Text("Sangam Trip", style: TextStyle(fontSize: 30)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "You owe INR rs165.66 overall",
              style: TextStyle(fontSize: 18, color: Color(0xff9D2228)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 5),
            child: Text(
              "Apr 24, 2021",
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(
              height: 90,
              child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(20),
                  itemBuilder: (context, idx) {
                    return getNav(idx);
                  })),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 3000000),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, idx) {
                  return Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: ListTile(
                        title: const Text("Happy birthday"),
                        trailing: Column(
                          children: const [
                            Text("you borrowed",
                                style: TextStyle(color: Color(0xff9d2228))),
                            Text("INR rs169",
                                style: TextStyle(color: Color(0xff9d2228))),
                          ],
                        ),
                        subtitle: const Text("shanu paid INR rs43.00 "),
                        leading: Container(
                          padding: const EdgeInsets.all(5),
                          child: const Icon(Icons.receipt_outlined, size: 35),
                          width: 50,
                          color: const Color(0xff84CAEA),
                        ),
                      ));
                }),
          )
        ],
      ),
      floatingActionButton: const ExpenseButton(tag: 4),
    );
  }
}
