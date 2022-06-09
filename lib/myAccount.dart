//Main Home Page for classification
// ignore_for_file: file_names, unnecessary_string_interpolations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vegetable_app/drawer.dart';
import 'package:vegetable_app/googleSign.dart';
import 'package:vegetable_app/signup_page.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  late User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignUpPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: const Text(
            'My Account',
            style: TextStyle(
              fontFamily: 'Comfortaa',
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              _user.photoURL != null
                  ? ClipOval(
                      child: Material(
                        color: Colors.black,
                        child: Image.network(
                          _user.photoURL!,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                  : const ClipOval(
                      child: Material(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 16.0,
              ),
              // const Text(
              //   'Hello',
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 26,
              //   ),
              // ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                _user.displayName!,
                // "Name",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                '${_user.email!}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 24.0),
              // const Text(
              //   'You are now signed in using your Google account. To sign out of your account, click the "Sign Out" button below.',
              //   style: TextStyle(
              //       color: Colors.black, fontSize: 14, letterSpacing: 0.2),
              // ),
              const SizedBox(
                height: 16.0,
              ),
              _isSigningOut
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.redAccent,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          _isSigningOut = true;
                        });
                        await Authentication.signOut(context: context);
                        setState(() {
                          _isSigningOut = false;
                        });
                        Navigator.of(context)
                            .pushReplacement(_routeToSignInScreen());
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}
