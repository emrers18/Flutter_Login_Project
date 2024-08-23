import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/screens/signin.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 187, 186, 183),
        elevation: 0,
        title:Text(
          "Home Page",
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
              image: AssetImage("images/Welcome_screen_empty.png"),fit: BoxFit.cover),
          ),

    child: Column(
      children: [
        const Flexible(
          child: Align(
            alignment: Alignment(-0.5,6),
            child: Text(
              "Welcome to \nnew Flutter Project!", 
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                
              ),)
          )
        ),
        const Flexible(
          child:Align(
            alignment: Alignment(-0.85,3.20),
            child: Text(
            "Start to Join ",
            style: TextStyle(
              fontSize: 25,
              
            ),
          )
          )
        ),
        
        Flexible(
          child: InkWell(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=> SignIn()));
            },
            child:Align(
              alignment: Alignment(0.7,0.86),
              child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
            child: const Center(
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)
                ),
              ),
            ),
            ),

          )
          
            
        ),
      )
    ],
      
  ),
    
  )




    );
    



    
  }
}