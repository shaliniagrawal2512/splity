import 'dart:math';
import 'package:flutter/material.dart';

class SettleUp extends StatelessWidget {
  const SettleUp({Key? key}) : super(key: key);

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
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.cancel, color: Color(0xff1ec677)))
          ],
          title: const Text("Select a balance to settle",
              style: TextStyle(fontSize: 20)),
          backgroundColor: const Color(0xff373445),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          itemCount: 5,
          itemBuilder: (context, idx) {
            return ListTile(
              trailing: Column(
                children: const [
                  Text("you owe", style: TextStyle(color: Color(0xff9d2228))),
                  Text("INR rs168.00",
                      style: TextStyle(color: Color(0xff9d2228))),
                ],
              ),
              title: const Text("Shalini Agrawal"),
              leading: Container(
                width: 40,
                decoration: getDecoration(),
              ),
            );
          },
        ));
  }
}
