import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

final storage = new FlutterSecureStorage();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String? token = '', username = '', role = '';
  bool _passwordVisible = false;

  void getStorageValues() async {
    token = await storage.read(key: 'token');
    username = await storage.read(key: 'username');
    role = await storage.read(key: 'role');

    if (username != null) {
      if (username!.length > 0) {
        if (role == 'admin') {
          Navigator.pushReplacementNamed(context, '/adminDashboard');
        } else if (role == 'surveyor') {
          Navigator.pushReplacementNamed(context, '/surveyorDashboard');
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getStorageValues();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF13552C),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.transparent,
                  // child: Image.asset('images/GreenGold.png'),
                  backgroundImage: AssetImage('images/GreenGold.png'),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: TextField(
                    cursorColor: Color(0xFFE0FCFB),
                    style: TextStyle(color: Color(0xFFE0FCFB)),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide:
                              BorderSide(color: Color(0xFFE0FCFB), width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide:
                              BorderSide(color: Color(0xFFE0FCFB), width: 2.0),
                        ),
                        hintText: 'Enter your username',
                        hintStyle: TextStyle(color: Color(0xFFE0FCFB))),
                    controller: _usernameController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: TextField(
                    cursorColor: Color(0xFFE0FCFB),
                    style: TextStyle(color: Color(0xFFE0FCFB)),
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide:
                              BorderSide(color: Color(0xFFE0FCFB), width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide:
                              BorderSide(color: Color(0xFFE0FCFB), width: 2.0),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: Color(0xFFE0FCFB))),
                    controller: _passwordController,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    String username = _usernameController.text;
                    String password = _passwordController.text;

                    if (username.length == 0) {
                      final snackBar = SnackBar(
                        content: Text('Please enter your username'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }

                    if (password.length == 0) {
                      final snackBar = SnackBar(
                        content: Text('Please enter your Password'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }

                    Map<String, dynamic> theData = {
                      "username": username,
                      "password": password,
                    };

                    final response = await http.post(
                        Uri.parse(
                            'https://asia-south1-greengold-34fc0.cloudfunctions.net/api/admin-login'),
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: json.encode(theData));

                    log(response.body);
                    log(response.statusCode.toString());

                    if (response.statusCode == 401) {
                      final snackBar = SnackBar(
                        content: Text('Password Invalid. '),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }

                    if (response.statusCode == 404) {
                      final snackBar = SnackBar(
                        content: Text('Username does not exist.'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }

                    if (response.statusCode == 201) {
                      final snackBar = SnackBar(
                        content: Text('Successfully Logged in.'),
                      );
                      log("suceess");
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      Map<String, dynamic> resp = json.decode(response.body);

                      await storage.write(key: 'username', value: username);
                      await storage.write(key: 'token', value: resp['token']);
                      await storage.write(key: 'role', value: resp['role']);
                      log(resp["role"]);
                      if (resp['role'] == 'admin') {
                        log("in admin");
                        Navigator.pushReplacementNamed(
                            context, '/adminDashboard');
                      } else if (resp['role'] == 'surveyor') {
                        Navigator.pushReplacementNamed(
                            context, '/surveyorDashboard');
                      }
                      return;
                    }

                    final snackBar = SnackBar(
                      content: Text('Some error occurred. Please try later '),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: Colors.white, width: 2.0)))),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23.0,
                          letterSpacing: 5.5,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                SizedBox(
                  height: 100.0,
                ),
                Text(
                  'Terms and Conditions Applied',
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
              ]),
        ),
      ),
    );
  }
}
