import 'package:flutter/material.dart';
import 'package:splity/friends.dart';
import 'package:splity/group_info.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Group Settings", style: TextStyle(fontSize: 20)),
        backgroundColor: const Color(0xff373445),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            leading: const GroupInfo().getBox(Colors.red, 50, 50, null,
                "assets/pattern3.jpg", 8, BlendMode.modulate),
            title: const Text("Sangam Trip", style: TextStyle(fontSize: 18)),
            trailing:
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          ),
          const Divider(color: Colors.grey),
          const ListTile(title: Text("Group members")),
          ListTile(
              leading: const Icon(Icons.group_add),
              onTap: () {},
              title: const Text(
                "Add people to group",
                style: TextStyle(fontSize: 20),
              )),
          ListTile(
              leading: const Icon(Icons.link),
              onTap: () {},
              title: const Text(
                "Invite via link",
                style: TextStyle(fontSize: 20),
              )),
          ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 3000000),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, idx) {
                    return ListTile(
                      minVerticalPadding: 15,
                      leading: Container(
                          width: 35,
                          height: 35,
                          decoration: const Friend().getDecoration()),
                      trailing: Column(
                        children: const [
                          Text("owes",
                              style: TextStyle(color: Color(0xff9D2228))),
                          Text("INR rs 189.00",
                              style: TextStyle(color: Color(0xff1ec677))),
                        ],
                      ),
                      subtitle: const Text("shanuagrawal133@gmail.com",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12)),
                      title: const Text("Shalini Agrawal"),
                    );
                  })),
          ListTile(
              onTap: () {},
              title: const Text("Leave group", style: TextStyle(fontSize: 20)),
              leading: const Icon(Icons.logout, size: 30)),
          ListTile(
              onTap: () {},
              title: const Text("Delete Group",
                  style: TextStyle(color: Color(0xff9d2228), fontSize: 20)),
              leading:
                  const Icon(Icons.delete, color: Color(0xff9d2228), size: 30))
        ],
      ),
    );
  }
}
