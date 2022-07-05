import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splity/home_screen.dart';
import 'package:splity/top_screen.dart';

// Alias: AndroidDebugKey
// MD5: AE:4B:D7:9B:A3:BD:0C:48:03:D2:0C:0C:92:E3:FF:82
// SHA1: AE:34:A7:C5:0C:CF:7B:C8:5D:3D:39:18:3F:EB:F1:F9:E7:A6:65:6E
// SHA-256: CA:57:65:5B:D2:2A:11:32:3D:A4:56:C6:43:DF:38:1C:6C:17:BD:0D:A0:D4:A0:1F:C0:B4:F2:F5:0E:4C:98:09
bool path = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null) path = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splity',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: const ColorScheme.dark().copyWith(
            primary: const Color(0xff1DCE77),
            secondary: const Color(0xff1DCE77),
          ),
          scaffoldBackgroundColor: const Color(0xff362B45),
          pageTransitionsTheme: const PageTransitionsTheme()),
      home: path ? const MyHomePage() : const TopScreen(),
    );
  }
}
