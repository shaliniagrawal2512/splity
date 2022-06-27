import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'authenticate.dart';
import 'constants.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;
  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  resetPassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        showSpinner = true;
      });
      String result = await Authenticate().forgetPassword(_email.text);
      setState(() {
        showSpinner = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            result,
          ),
        ),
      );
      _email.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    const Widget divide = SizedBox(height: 20);
    return Scaffold(
        body: Center(
      child: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(25),
          children: [
            divide,
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: const [
                  Text("Reset Your Password",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  divide,
                  Text(
                      "Enter your email address and we will send a link to reset your password",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xff1ec677))),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: TextFormField(
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
            ),
            divide,
            divide,
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 3,
                    primary: const Color(0xff1ec677),
                    fixedSize: const Size(0, 50)),
                onPressed: () {
                  resetPassword();
                },
                child: const Text("Reset",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white)))
          ],
        ),
      ),
    ));
  }
}
