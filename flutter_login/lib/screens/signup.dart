import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/screens/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  late String name;
  late String email;
  late String password;
  late String birth;
  
  var onPressed;
  TextEditingController _dateController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  bool validatePassword(String password) {
    String pattern = r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }

  void _validateInput() {
    setState(() {
      if (!validatePassword(_passwordController.text)) {
        _errorMessage = 'The password is not valid. It must contain at least 8 characters, one capital letter, one number and one special character.';
      } else {
        _errorMessage = '';  
      }
    });
  }

  void validateEmail() {
    final bool isValid = EmailValidator.validate(emailController.text.trim());
    if (isValid && _errorMessage.isEmpty) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
    } else if (!isValid) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter a Valid Password")),
      );
    }
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 187, 186, 183),
        elevation: 0,
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Create_account_Empty.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Text(
                  "  Create new Account",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already registered?"),
                    MaterialButton(
                      child: Text("Log in here."),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          labelText: "USERNAME",
                          prefixIcon: Icon(Icons.person),
                          labelStyle: TextStyle(color: Colors.blueAccent),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your name";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          name = value!;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          labelText: "EMAIL",
                          prefixIcon: Icon(Icons.email),
                          labelStyle: TextStyle(color: Colors.blueAccent),
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
                          email = value!;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          labelText: "PASSWORD",
                          prefixIcon: Icon(Icons.password),
                          labelStyle: TextStyle(color: Colors.blueAccent),
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
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          labelText: "DATE OF BIRTH",
                          filled: true,
                          prefixIcon: Icon(Icons.calendar_today),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                          labelStyle: TextStyle(color: Colors.blueAccent),
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        onTap: () {
                          _selectDate();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your date of birth";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          birth = value!;
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        _errorMessage,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(height: 50),
                      InkWell(
                        onTap: () {
                          _validateInput();
                          if (_errorMessage.isEmpty) {
                            validateEmail();
                          }
                        },
                        child: Align(
                          alignment: Alignment(0, -5),
                          child: Container(
                            height: 50,
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
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
      ),
    );
  }
}
