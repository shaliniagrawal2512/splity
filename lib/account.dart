import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:splity/top_screen.dart';
import 'package:splity/user_group_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'authenticate.dart';

bool showSpinner = false;

class Account extends StatefulWidget {
  const Account({Key? key, required this.user}) : super(key: key);
  final OurUser user;

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    Widget getTile(Function? onPress, String label, IconData icon) {
      return ListTile(
          leading: Icon(icon, size: 30),
          onTap: onPress as void Function()?,
          title: Text(label,
              style: const TextStyle(fontSize: 20, color: Color(0xff1ec677))));
    }

    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          const ListTile(
              title: Text("Account",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500))),
          ListTile(
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              leading: const Icon(Icons.account_circle, size: 50),
              subtitle: Text(widget.user.email,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold)),
              title: Text(widget.user.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500))),
          const Divider(),
          getTile(() {}, "Scan Code", Icons.qr_code_scanner),
          const Divider(),
          getTile(() async {
            showSpinner = true;
            setState(() {});
            String res = await Authenticate().logOut();
            showSpinner = false;
            setState(() {});
            if (res == "success") {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const TopScreen()));
            } else {
              ScaffoldMessengerState().showSnackBar(SnackBar(
                content: Text(res),
                duration: const Duration(seconds: 5),
              ));
            }
          }, "Log Out", Icons.logout),
          const Divider(),
          const ListTile(
            title: Text(
              "About",
              style: TextStyle(fontSize: 25),
            ),
          ),
          const ListTile(
            title: Text(
              'This is my Personal project and can be found on my Github profile by clicking below.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            title: InkWell(
                child: const Text('Open Project',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xff1ec677))),
                onTap: () => launchUrl(Uri.parse(
                    'https://github.com/shaconst shaliniagrawal2512/'))),
          ),
          const ListTile(title: Text(' Made with ❤ by Shalini Agrawal !!')),
          const Image(image: AssetImage('assets/logo1.png'), height: 150),
        ],
      ),
    );
  }
}
