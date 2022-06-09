// Important: As of now the app can only detect the quality of following 6 vegetables
// 1) Tomato
// 2) Potato
// 3) Onion
// 4) Capsicum
// 5) Carrot
// 6) Brinjal

// Please use the image of one of these 6 vegetables only. The app will not detect the quality of any other vegetable.

// Please follow the instructions below to check the quality of vegetables

// 1) Register using your email id if you haven't already.
// 2) Login to the app using your registered email id.
// 3) Click on the start button to get started.
// 4) Click a clear picture of the vegetable in good light using the camera icon or select an image of the vegetable from your gallery using the file icon to check the quality of the vegetable.

import 'package:flutter/material.dart';
import 'package:vegetable_app/home_page.dart';

class Instructions extends StatefulWidget {
  const Instructions({Key? key}) : super(key: key);

  @override
  _InstructionsState createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: const Text(
            'Instructions',
            style: TextStyle(
              fontSize: 25.0,
              fontFamily: "Comfortaa",
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Center(
                  child: Column(
                    children: const <Widget>[
                      Text(
                        "How to use this app effectively",
                        style: TextStyle(
                          fontFamily: "Comfortaa",
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Important: As of now the app can only detect the quality of following 6 vegetables \n\n 1) Tomato \n 2) Potato \n 3) Onion \n 4) Capsicum \n 5) Carrot \n 6) Brinjal \n",
                        style: TextStyle(
                          fontFamily: "Comfortaa",
                          fontSize: 22.0,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Please use the image of one of these 6 vegetables only. The app will not detect the quality of any other vegetable.\n",
                        style: TextStyle(
                          fontFamily: "Comfortaa",
                          fontSize: 22.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Please follow the instructions below to check the quality of vegetables",
                        style: TextStyle(
                          fontFamily: "Comfortaa",
                          fontSize: 22.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "1) Register using your email id if you haven't already. \n\n2) Login to the app using your registered email id. \n\n3) Click on the start button to get started. \n\n4) Click a clear picture of the vegetable in proper lighting and select that image from your gallery using the file icon to check the quality of that vegetable.",
                        style: TextStyle(
                          fontFamily: "Comfortaa",
                          fontSize: 22.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Note: You can also use this app without any signup or login.\n\nJust click on Let's Start button below and click images.",
                        style: TextStyle(
                          fontFamily: "Comfortaa",
                          fontSize: 22.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                    setState(() {});
                  },
                  color: Colors.black,
                  splashColor: Colors.white,
                  height: 60,
                  minWidth: 250,
                  child: const Text(
                    'Let\' s Start',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
