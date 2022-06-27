import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:splity/authenticate.dart';
import 'package:splity/sign_up.dart';

import 'home_screen.dart';
import 'log_in.dart';

bool showSpinner = false;

class TopScreen extends StatefulWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  Widget myButton(String label, Function()? onTap, Color col, int num) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5, primary: col, fixedSize: const Size(0, 50)),
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
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: ListView(
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
                  myButton("Sign in with Google", () async {
                    setState(() {
                      showSpinner = true;
                    });
                    String res = await Authenticate().googleLogin();
                    setState(() {
                      showSpinner = false;
                    });
                    if (res == 'Success') {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const MyHomePage()));
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(res),
                        duration: const Duration(seconds: 4)));
                  }, const Color(0xff373445), 3)
                ]),
          ],
        ),
      ),
    );
  }
}
