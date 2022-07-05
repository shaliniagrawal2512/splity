import 'dart:math';
import 'package:flutter/material.dart';
import 'package:splity/services.dart';
import 'package:splity/user_group_model.dart';
import 'get_box.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key, required this.group, required this.members})
      : super(key: key);
  final OurGroup group;
  final List<OurUser> members;
  @override
  Widget build(BuildContext context) {
    IconData getIcon(String label) {
      if (label == "Home") return Icons.home;
      if (label == "Couple") return Icons.favorite;
      if (label == "Home") return Icons.home;
      return Icons.receipt;
    }

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
        title: const Text("Group Settings", style: TextStyle(fontSize: 20)),
        backgroundColor: const Color(0xff373445),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            leading: Box(
                color: Colors.pink,
                width: 50,
                icon: getIcon(group.type),
                radius: 10,
                blend: BlendMode.modulate,
                image: 'assets/pattern3.jpg',
                height: 50),
            title: Text(group.name, style: const TextStyle(fontSize: 18)),
            trailing:
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          ),
          const Divider(color: Colors.grey),
          const ListTile(title: Text("Group members")),
          ListTile(
              leading: const Icon(Icons.group_add),
              onTap: () async {
                String res = await DataBases()
                    .addPeopleToGroup(['shanuagrawal133@gmail.com'], group.id);
              },
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
                  itemCount: members.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, idx) {
                    int p = group.members[idx]["totalShare"];
                    return ListTile(
                      minVerticalPadding: 15,
                      leading: Container(
                          width: 35, height: 35, decoration: getDecoration()),
                      trailing: Column(
                        children: [
                          p != 0
                              ? const Text("owes",
                                  style: TextStyle(
                                      color: Color(0xff9D2228), fontSize: 15))
                              : const Text("Settled up",
                                  style: TextStyle(
                                      color: Color(0xff1ec677), fontSize: 15)),
                          p != 0
                              ? Text(group.members[idx]["totalShare"],
                                  style:
                                      const TextStyle(color: Color(0xff1ec677)))
                              : const Text("Noting due",
                                  style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      subtitle: Text(members[idx].email,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12)),
                      title: Text(members[idx].name),
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
