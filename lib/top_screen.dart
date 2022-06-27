import 'package:flutter/material.dart';
import 'package:splity/sign_up.dart';

import 'log_in.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({Key? key}) : super(key: key);
  Widget myButton(String label, Function()? onTap, Color col, int num) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 3, primary: col, fixedSize: const Size(0, 50)),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (num == 3) Image.asset("assets/google.png", height: 30),
            if (num == 3) const SizedBox(width: 20),
            Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white)),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        children: [
          Image.asset(
            "assets/logo1.png",
            scale: 1.2,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                myButton("Sign up", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const SignUp()));
                }, const Color(0xff1DCE77), 1),
                const SizedBox(height: 20),
                myButton("Log in", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const LogIn()));
                }, const Color(0xff373445), 2),
                const SizedBox(height: 20),
                myButton(
                    "Sign in with Google", () {}, const Color(0xff373445), 3)
              ]),
        ],
      ),
    );
  }
}
