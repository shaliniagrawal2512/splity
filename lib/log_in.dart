import 'package:flutter/material.dart';
import 'package:splity/constatnts.dart';
import 'package:splity/sign_up.dart';

final _formKey = GlobalKey<FormState>();

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);
  Widget myButton(String label, Function()? onTap, Color col) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 3, primary: col, fixedSize: const Size(0, 50)),
        onPressed: onTap,
        child: Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white)));
  }

  static const Widget divide = SizedBox(height: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(25),
          children: [
            const Text("Welcome Back 😃 !!!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    cursorColor: Colors.white,
                    decoration:
                        kInputDecoration.copyWith(hintText: "Email address"),
                  ),
                  divide,
                  TextFormField(
                    cursorColor: Colors.white,
                    obscureText: true,
                    decoration: kInputDecoration.copyWith(hintText: "Password"),
                  ),
                  divide,
                  divide,
                  myButton("Log In", () => null, const Color(0xff1DCE77))
                ],
              ),
            ),
            divide,
            divide,
            Row(
              children: [
                const Text("Don't have an account ?  ",
                    style: TextStyle(fontSize: 18)),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SignUp()));
                    },
                    child: const Text("Sign Up",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1dce77)))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
