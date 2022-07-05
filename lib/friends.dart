import 'dart:math';

import 'package:flutter/material.dart';
import 'package:splity/add_expense_button.dart';
import 'package:splity/user_group_model.dart';

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

  const Friend({Key? key, required this.user, required this.groups})
      : super(key: key);
  final OurUser user;
  final List<OurGroup> groups;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: user.friends.length,
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
            title: Text(user.friends[index]["FriendName"],
                style: const TextStyle(fontSize: 18)),
            subtitle: Text(
              user.friends[index]["friendEmail"],
              style: const TextStyle(fontSize: 15),
            ),
          );
        },
      ),
      floatingActionButton: ExpenseButton(
        tag: 2,
        user: user,
        groups: groups,
        selectedGroup: '',
      ),
    );
  }
}
