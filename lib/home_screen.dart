import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:splity/account.dart';
import 'package:splity/activity.dart';
import 'package:splity/add_friend.dart';
import 'package:splity/create_group.dart';
import 'package:splity/groups.dart';
import 'package:splity/services.dart';
import 'package:splity/user_group_model.dart';

import 'friends.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

OurUser user = OurUser(
    uid: '',
    email: '',
    name: '',
    accountCreated: Timestamp.now(),
    groups: [],
    friends: [],
    activity: [],
    expenses: []);
List<OurGroup> groupsInfo = [];

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      OurUser _user = await DataBases().getInfo(currentUser.email!);
      user = _user;
      getGroupInfo();
      fetched = true;
      setState(() {});
    }
  }

  getGroupInfo() async {
    for (int i = 0; i < user.groups.length; i++) {
      OurGroup temp = await DataBases().groupInfo(user.groups[i]);
      groupsInfo.add(temp);
    }
  }

  int index = 0;
  bool fetched = false;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Groups(group: groupsInfo),
      Friend(user: user, groups: groupsInfo),
      Activity(user: user),
      Account(user: user),
    ];
    return Scaffold(
      appBar: index <= 1
          ? AppBar(
              leading: const Icon(Icons.emoji_emotions),
              actions: [
                index == 0
                    ? IconButton(
                        tooltip: "Search",
                        onPressed: () {},
                        icon: const Icon(Icons.search))
                    : Container(),
                IconButton(
                    tooltip: index == 0 ? "Create group" : "Add friend",
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return index == 0
                            ? const CreateGroup()
                            : AddFriend(email: user.email);
                      }));
                    },
                    icon:
                        Icon(index == 0 ? Icons.group_add : Icons.person_add)),
              ],
              backgroundColor: const Color(0xff373445),
              title: const Text("Splity 😄"),
            )
          : null,
      body: Center(
        child: fetched
            ? IndexedStack(index: index, children: screens)
            : const Center(child: CircularProgressIndicator()),
      ),
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
