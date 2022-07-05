import 'dart:math';
import 'package:flutter/material.dart';
import 'package:splity/add_expense_button.dart';
import 'package:splity/balances.dart';
import 'package:splity/charts.dart';
import 'package:splity/services.dart';
import 'package:splity/settle_up.dart';
import 'package:splity/totals.dart';
import 'package:splity/user_group_model.dart';

import 'get_box.dart';
import 'group_settings.dart';

class GroupInfo extends StatefulWidget {
  const GroupInfo(
      {Key? key,
      required this.groupInfo,
      required this.user,
      required this.index})
      : super(key: key);
  final List<OurGroup> groupInfo;
  final OurUser user;
  final int index;

  @override
  State<GroupInfo> createState() => _GroupInfoState();
}

class _GroupInfoState extends State<GroupInfo> {
  List<OurUser> memberInfo = [];
  @override
  void initState() {
    getMembersDetails();
    super.initState();
  }

  getMembersDetails() async {
    for (int i = 0; i < widget.groupInfo[widget.index].members.length; i++) {
      OurUser _user = await DataBases()
          .getInfo(widget.groupInfo[widget.index].members[i]["email"]);
      memberInfo.add(_user);
      setState(() {});
    }
  }

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
    IconData getIcon(String label) {
      if (label == "Home") return Icons.home;
      if (label == "Couple") return Icons.favorite;
      if (label == "Home") return Icons.home;
      return Icons.receipt;
    }

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
                    child: Box(
                        color: color,
                        width: MediaQuery.of(context).size.width,
                        radius: 0,
                        blend: BlendMode.colorBurn,
                        image: 'assets/pattern3.jpg',
                        height: 140),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          color: Color(0xff362B45),
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Box(
                          color: color,
                          height: 70,
                          width: 70,
                          icon: getIcon(widget.groupInfo[widget.index].type),
                          image: "assets/pattern2.jpg",
                          radius: 6,
                          blend: BlendMode.modulate),
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
                            builder: (BuildContext context) => Settings(
                                group: widget.groupInfo[widget.index],
                                members: memberInfo)));
                  },
                  icon: const Icon(Icons.settings)),
              title: Text(widget.groupInfo[widget.index].name,
                  style: const TextStyle(fontSize: 30)),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "You owe INR rs165.66 overall",
                style: TextStyle(fontSize: 18, color: Color(0xff9D2228)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: Text(
                widget.groupInfo[widget.index].groupCreated
                    .toDate()
                    .toString()
                    .split(' ')[0],
                style: const TextStyle(fontSize: 14),
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
        floatingActionButton: ExpenseButton(
            tag: 4,
            selectedGroup: "",
            groups: widget.groupInfo,
            user: widget.user));
  }
}
