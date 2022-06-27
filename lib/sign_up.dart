import 'package:flutter/material.dart';
import 'package:splity/constatnts.dart';
import 'package:splity/log_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const Widget divide = SizedBox(height: 20);
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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

  final _confirm = TextEditingController();
  final _fullname = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _password.dispose();
    _email.dispose();
    _fullname.dispose();
    _confirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(25),
          children: [
            const Text("Welcome 😃 !!!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username can\'t be null';
                      }
                      return null;
                    },
                    controller: _fullname,
                    cursorColor: Colors.white,
                    decoration:
                        kInputDecoration.copyWith(hintText: "Full Name"),
                  ),
                  SignUp.divide,
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Email';
                      } else if (!value.contains('@')) {
                        return 'Please Enter a Valid Email Address';
                      }
                      return null;
                    },
                    controller: _email,
                    cursorColor: Colors.white,
                    decoration:
                        kInputDecoration.copyWith(hintText: "Email address"),
                  ),
                  SignUp.divide,
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      } else if (value.length < 6) {
                        return 'Password is too weak';
                      }
                      return null;
                    },
                    controller: _password,
                    cursorColor: Colors.white,
                    obscureText: true,
                    decoration: kInputDecoration.copyWith(hintText: "Password"),
                  ),
                  SignUp.divide,
                  TextFormField(
                    validator: (value) {
                      if (value != _password.text) {
                        return 'Password and confirm password does not match';
                      }
                      return null;
                    },
                    controller: _confirm,
                    cursorColor: Colors.white,
                    obscureText: true,
                    decoration:
                        kInputDecoration.copyWith(hintText: "Confirm Password"),
                  ),
                  SignUp.divide,
                  SignUp.divide,
                  myButton("Sign Up", () => null, const Color(0xff1DCE77))
                ],
              ),
            ),
            SignUp.divide,
            SignUp.divide,
            Row(
              children: [
                const Text("Already have an account ?  ",
                    style: TextStyle(fontSize: 18)),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LogIn()));
                    },
                    child: const Text("Log In",
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
