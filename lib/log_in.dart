import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splity/constants.dart';
import 'package:splity/forget_password.dart';
import 'package:splity/home_screen.dart';
import 'package:splity/sign_up.dart';

import 'authenticate.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);
  static const Widget divide = SizedBox(height: 20);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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

  void getLogIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        showSpinner = true;
      });
      _formKey.currentState!.save();
      String result =
          await Authenticate().signInWithEmail(_email.text, _password.text);
      if (result == 'success') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', _email.text);
        _email.clear();
        _password.clear();
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const MyHomePage()));
        setState(() {
          showSpinner = false;
        });
      } else {
        setState(() {
          showSpinner = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(result), duration: const Duration(seconds: 7)));
      }
    }
  }

  final _email = TextEditingController();
  final _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _password.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
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
                    LogIn.divide,
                    TextFormField(
                      cursorColor: Colors.white,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Password';
                        }
                        return null;
                      },
                      controller: _password,
                      obscureText: true,
                      decoration:
                          kInputDecoration.copyWith(hintText: "Password"),
                    ),
                    LogIn.divide,
                    LogIn.divide,
                    myButton(
                        "Log In", () => getLogIn(), const Color(0xff1DCE77))
                  ],
                ),
              ),
              LogIn.divide,
              LogIn.divide,
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
              ),
              LogIn.divide,
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ForgetPassword()));
                },
                child: const Text("Forgot Password ?",
                    style: TextStyle(color: Color(0xff1dce77))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
