import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget getTile(Function? onPress, String label, IconData icon) {
      return ListTile(
          leading: Icon(icon, size: 30),
          onTap: onPress as void Function()?,
          title: Text(label,
              style: const TextStyle(fontSize: 20, color: Color(0xff1ec677))));
    }

    return ListView(
      padding: const EdgeInsets.all(25),
      children: [
        const ListTile(
            title: Text("Account",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500))),
        ListTile(
            trailing:
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            leading: const Icon(Icons.account_circle, size: 50),
            subtitle: const Text("shanuagrawal133@gmail.com",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            title: const Text("Shanu garg",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
        const Divider(),
        getTile(() {}, "Scan Code", Icons.qr_code_scanner),
        const Divider(),
        getTile(() {}, "Log Out", Icons.logout),
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
    );
  }
}
