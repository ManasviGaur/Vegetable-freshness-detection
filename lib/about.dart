//About Page

import 'package:flutter/material.dart';
import 'package:vegetable_app/drawer.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: const Text(
            'About Us',
            style: TextStyle(
              fontSize: 25.0,
              fontFamily: "Poppins",
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Column(
                  children: const <Widget>[
                    Text(
                      "DTU Developers",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Delhi Technological University",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 22.0,
                        color: Color(0xff196F3D),
                      ),
                    ),
                    Text("Bawana Rd,Shahbad Daulatpur Village",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 22.0,
                          color: Color(0xff196F3D),
                        )),
                    Text(
                      "Rohini, New Delhi, Delhi 110042",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 22.0,
                        color: Color(0xff196F3D),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Team Members",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Prof. S. Indu",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 25.0,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      "Siddharth Basoya",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 25.0,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      "Manasvi Gaur",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 25.0,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      "Parth Johri",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 25.0,
                        color: Colors.blue,
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
              margin: const EdgeInsets.fromLTRB(25.0, 70.0, 25.0, 70.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {},
                color: Colors.black,
                splashColor: Colors.white,
                height: 60,
                minWidth: 250,
                child: const Text(
                  'Customer Care 🙋‍♂️',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.0),
                ),
              ),
            ),
          ],
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}
