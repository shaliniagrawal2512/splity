import 'package:flutter/material.dart';
import 'package:splity/account.dart';
import 'package:splity/activity.dart';
import 'package:splity/create_group.dart';
import 'package:splity/groups.dart';

import 'friends.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  List<Widget> screens = [
    const Groups(),
    const Friend(),
    const Activity(),
    const Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: index <= 1
          ? AppBar(
              leading: const Icon(Icons.emoji_emotions),
              actions: [
                IconButton(
                    tooltip: "Search",
                    onPressed: () {},
                    icon: const Icon(Icons.search)),
                IconButton(
                    tooltip: "Create group",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const CreateGroup()));
                    },
                    icon: const Icon(Icons.group_add)),
              ],
              backgroundColor: const Color(0xff373445),
              title: const Text("Splity 😄"),
            )
          : null,
      body: Column(children: [
        Expanded(child: IndexedStack(index: index, children: screens)),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        unselectedFontSize: 14,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        backgroundColor: const Color(0xff373445),
        showUnselectedLabels: true,
        selectedItemColor: const Color(0xff1DCE77),
        unselectedItemColor: Colors.white60,
        currentIndex: index,
        onTap: (idx) {
          setState(() {
            index = idx;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Groups"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Friends"),
          BottomNavigationBarItem(icon: Icon(Icons.notes), label: "Activity"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Account"),
        ],
      ),
    );
  }
}
