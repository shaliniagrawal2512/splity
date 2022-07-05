import 'package:flutter/material.dart';
import 'package:splity/constants.dart';
import 'package:splity/services.dart';

class AddFriend extends StatelessWidget {
  const AddFriend({Key? key, required this.email}) : super(key: key);
  final String email;
  @override
  Widget build(BuildContext context) {
    List<String> emails = ["shanuagrawal133@gmail.com"];
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel, color: Color(0xff1ec677)))
          ],
          title: const Text("Add Friend", style: TextStyle(fontSize: 20)),
          backgroundColor: const Color(0xff373445),
        ),
        body: ListView(padding: const EdgeInsets.all(20), children: [
          TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty || !value.contains('@')) {
                  return "Please Enter A valid Email";
                }
                return null;
              },
              decoration:
                  kInputDecoration.copyWith(hintText: "Enter Email of Friend")),
          ElevatedButton(
              onPressed: () async {
                String res = await DataBases().addFriend(emails, email);
              },
              child: const Text("Add",
                  style: TextStyle(fontSize: 18, color: Colors.white)))
        ]));
  }
}
