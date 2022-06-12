import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/AuthService.dart';
import 'package:workout_app/screens/homePage.dart';
import 'package:workout_app/signUpPage.dart';

class LogInpage extends StatefulWidget {
  @override
  State<LogInpage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInpage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  late bool _passwordVisible;
  void initState() {
    _passwordVisible = false;
  }

  String errorMessage = '';

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 70, 93, 105),
      appBar: AppBar(
          title: Text('WorkoutBeast'),
          backgroundColor: Color.fromARGB(255, 70, 93, 105),
          elevation: 0,
          centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    labelText: 'Email',
                  ),
                  autofocus: true,
                ),
              ),
            ),
            Text(errorMessage, style: TextStyle(color: Colors.red)),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_passwordVisible,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                      onPressed: () async {
                        AuthService.logInMethod(
                          email: emailController.text,
                          password: passwordController.text,
                          errorMessage1: errorMessage
                            );
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      child: Text('LogIn',
                          style:
                              TextStyle(fontSize: 23.0, color: Colors.black))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}