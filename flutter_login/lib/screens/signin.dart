import 'package:flutter/material.dart';
import 'package:flutter_login/screens/last_screen.dart';
import 'package:flutter_login/screens/signup.dart';
import 'package:email_validator/email_validator.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late String name;
  late String password;
  bool hidden = true;


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  

  void validateEmail() {
    final bool isValid = EmailValidator.validate(emailController.text.trim());
    if (isValid) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LastScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text("Not a Valid Email")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 187, 186, 183),
            elevation: 0,
            title: Text(
              "Sign In",
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            )),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Login_empty.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 330),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  Align(
                    alignment: Alignment.center, 
                    child: Text(
                      "Sign In to Continue",
                    ),
                  ),
                  SizedBox(height: 15),
                  Form(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: const Color.fromARGB(
                                      255, 255, 255, 255)),
                            ),
                            labelText: "EMAIL",
                            prefixIcon: Icon(Icons.email),

                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your email";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            name = value!;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          obscureText: hidden,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: hidden
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  hidden = !hidden;
                                });
                              },
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(
                                      255, 255, 255, 255)),
                            ),
                            labelText: "PASSWORD",
                            prefixIcon: Icon(Icons.password),

                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)),
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your password";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            password = value!;
                          },
                        ),
                        SizedBox(height: 10),
                        
                        
                        InkWell(
                          onTap: () {
                            validateEmail(); 
                          },
                          child: Align(
                            alignment: Alignment(0, -5),
                            child: Container(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              child: const Center(
                                child: Text(
                                  "Sign In",                                  
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(
                                          255, 255, 255, 255),
                                      fontWeight: FontWeight.bold),
                                      
                                ),
                                
                                
                              ),
                            ),
                          ),
                          
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Don't have an Account?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => SignUp()));
                          },
                          child: Align(
                            alignment: Alignment(0, -5),
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.black,
                              ),
                              child: const Center(
                                child: Text(
                                  "Sign Up!",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(
                                          255, 255, 255, 255),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
