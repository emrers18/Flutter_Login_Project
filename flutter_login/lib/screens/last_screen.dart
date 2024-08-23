import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/screens/welcome_screen.dart';

class LastScreen extends StatelessWidget {
  const LastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 187, 186, 183),
        elevation: 0,
        title:Text(
          "Thanks!",
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
                ),
        )
    ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Last_screen.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
                  children: <Widget>[
                  SizedBox(height: 500),
                  Text(
                    "Thanks for using\nLogin App!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  
                  ),
                SizedBox(height: 40),
            InkWell(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> WelcomeScreen()));
            },
            child:Align(
              alignment: Alignment(0.75,-3),
              child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
            child: const Center(
              child: Text(
                "Go to Home Page",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)
                ),
              ),
            ),
            ),
            )
          ),
        ]
        )
      ),
    );
  }
}