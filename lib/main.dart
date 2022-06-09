import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vegetable_app/about.dart';
import 'package:vegetable_app/home_page.dart';
import 'package:vegetable_app/instructions.dart';
import 'package:vegetable_app/login_page.dart';
import 'package:vegetable_app/mainlogin_page.dart';
import 'package:vegetable_app/services.dart';
import 'package:vegetable_app/signup_page.dart';
import 'package:vegetable_app/welcome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   var email = preferences.getString("emailText");
//   // print(email);

//   runApp(
//     MaterialApp(
//       home: email == null ? const MyApp() : const HomePage(),
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        // ignore: non_constant_identifier_names
        '/screen1': (BuildContext context) => const Welcomescreen(),
        '/screen2': (BuildContext context) => const LoginPage(),
        '/screen3': (BuildContext context) => const HomePage(),
        '/screen4': (BuildContext context) => const SignUpPage(),
        '/screen6': (BuildContext context) => const AboutUs(),
        '/screen7': (BuildContext context) => const Instructions(),
        '/screen8': (BuildContext context) => const SomethingWentWrong(),
        '/screen9': (BuildContext context) => MainLoginPage(),
      },
      title: "Detector",
      home: const Welcomescreen(),
    );
  }
}
