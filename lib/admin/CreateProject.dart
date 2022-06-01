import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

final storage = new FlutterSecureStorage();

class CreateProject extends StatefulWidget {
  @override
  _CreateProjectState createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  String building_name = '',
      address = '',
      city = '',
      state = '',
      surveyor_id = '';

  String? role = '', token = '', username = '';

  void getUserData() async {
    token = await storage.read(key: 'token');
    print("token");
    print(token);
    username = await storage.read(key: 'username');
    role = await storage.read(key: 'role');
    return;
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x13552C),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.0,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Create Project',
                              style: TextStyle(
                                color: Color(0xFF13552C),
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                              ),
                            )
                          ]),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: TextField(
                      cursorColor: Color(0xFF13552C),
                      style: TextStyle(color: Color(0xFF13552C)),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Color(0xFF13552C), width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Color(0xFF13552C), width: 2.0),
                          ),
                          hintText: 'Building Name',
                          hintStyle: TextStyle(color: Color(0xFF13552C))),
                      textInputAction: TextInputAction.next,
                      onChanged: (val) {
                        setState(() {
                          building_name = val;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: TextField(
                      cursorColor: Color(0xFF13552C),
                      style: TextStyle(color: Color(0xFF13552C)),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Color(0xFF13552C), width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Color(0xFF13552C), width: 2.0),
                          ),
                          hintText: 'Address',
                          hintStyle: TextStyle(color: Color(0xFF13552C))),
                      //controller: _usernameController,
                      textInputAction: TextInputAction.next,
                      onChanged: (val) {
                        setState(() {
                          address = val;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: TextField(
                      cursorColor: Color(0xFF13552C),
                      style: TextStyle(color: Color(0xFF13552C)),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Color(0xFF13552C), width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Color(0xFF13552C), width: 2.0),
                          ),
                          hintText: ' City',
                          hintStyle: TextStyle(color: Color(0xFF13552C))),
                      //controller: _usernameController,
                      textInputAction: TextInputAction.next,
                      onChanged: (val) {
                        setState(() {
                          city = val;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: TextField(
                      cursorColor: Color(0xFF13552C),
                      style: TextStyle(color: Color(0xFF13552C)),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Color(0xFF13552C), width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Color(0xFF13552C), width: 2.0),
                          ),
                          hintText: ' State',
                          hintStyle: TextStyle(color: Color(0xFF13552C))),
                      //controller: _usernameController,
                      textInputAction: TextInputAction.next,
                      onChanged: (val) {
                        setState(() {
                          state = val;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: TextField(
                      cursorColor: Color(0xFF13552C),
                      style: TextStyle(color: Color(0xFF13552C)),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Color(0xFF13552C), width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                color: Color(0xFF13552C), width: 2.0),
                          ),
                          hintText: ' Username of Surveyor ',
                          hintStyle: TextStyle(color: Color(0xFF13552C))),
                      //controller: _usernameController,
                      textInputAction: TextInputAction.next,
                      onChanged: (val) {
                        setState(() {
                          surveyor_id = val;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 5),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF13552C)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(
                                    color: Color(0xFF13552C), width: 2.0),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Text('Create',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ),
                          onPressed: () async {
                            Map<String, dynamic> theData = {
                              "building_name": building_name,
                              "address": address,
                              "city": city,
                              "state": state,
                              "surveyor_id": surveyor_id
                            };
                            print(theData);

                            JsonEncoder encoder = JsonEncoder();
                            final dynamic object = encoder.convert(theData);

                            print(object);

                            print(token);

                            final response = await http.post(
                                Uri.parse(
                                    'https://asia-south1-greengold-34fc0.cloudfunctions.net/api/create-project'),
                                headers: <String, String>{
                                  'Content-Type':
                                      'application/json; charset=UTF-8',
                                  'authorization': '$token'
                                },
                                body: json.encode(theData));

                            print(response.statusCode);
                            print(response.body);

                            if (response.statusCode == 401) {
                              final snackBar = SnackBar(
                                content: Text('Invalid token '),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;
                            }

                            if (response.statusCode == 402) {
                              final snackBar = SnackBar(
                                content:
                                    Text('Login through admin credentials. '),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;
                            }

                            if (response.statusCode == 201) {
                              final snackBar = SnackBar(
                                content: Text('Project created successfully. '),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              //route to ngoDashboard
                              Navigator.pushReplacementNamed(
                                  context, '/adminDashboard');
                              return;
                            }
                            ;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  border(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
      borderSide: BorderSide(
        color: Colors.white,
        width: 0.0,
      ),
    );
  }

  focusBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      ),
      borderSide: BorderSide(
        color: Color(0xFFe0fcfb),
        width: 1.0,
      ),
    );
  }
}
