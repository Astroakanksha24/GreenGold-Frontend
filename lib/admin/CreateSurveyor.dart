import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateSurveyor extends StatefulWidget {
  const CreateSurveyor({Key? key}) : super(key: key);

  @override
  State<CreateSurveyor> createState() => _CreateSurveyorState();
}

class _CreateSurveyorState extends State<CreateSurveyor> {
  String first_name = '',
      last_name = '',
      password = '',
      username = '',
      surveyor_id = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE0FCFB),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Create Surveyor',
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
                        borderSide:
                            BorderSide(color: Color(0xFF13552C), width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide:
                            BorderSide(color: Color(0xFF13552C), width: 2.0),
                      ),
                      hintText: ' Firstname',
                      hintStyle: TextStyle(color: Color(0xFF13552C))),
                  //controller: _usernameController,
                  textInputAction: TextInputAction.next,
                  onChanged: (val) {
                    setState(() {
                      first_name = val;
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
                        borderSide:
                            BorderSide(color: Color(0xFF13552C), width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide:
                            BorderSide(color: Color(0xFF13552C), width: 2.0),
                      ),
                      hintText: 'Lastname',
                      hintStyle: TextStyle(color: Color(0xFF13552C))),
                  //controller: _usernameController,
                  textInputAction: TextInputAction.next,
                  onChanged: (val) {
                    setState(() {
                      last_name = val;
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
                        borderSide:
                            BorderSide(color: Color(0xFF13552C), width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide:
                            BorderSide(color: Color(0xFF13552C), width: 2.0),
                      ),
                      hintText: ' Username',
                      hintStyle: TextStyle(color: Color(0xFF13552C))),
                  //controller: _usernameController,
                  textInputAction: TextInputAction.next,
                  onChanged: (val) {
                    setState(() {
                      username = val;
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
                        borderSide:
                            BorderSide(color: Color(0xFF13552C), width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide:
                            BorderSide(color: Color(0xFF13552C), width: 2.0),
                      ),
                      hintText: ' Password',
                      hintStyle: TextStyle(color: Color(0xFF13552C))),
                  //controller: _usernameController,
                  textInputAction: TextInputAction.next,
                  onChanged: (val) {
                    setState(() {
                      password = val;
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF13552C)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Color(0xFF13552C),
                                          width: 2.0)))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: Text('Create',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      onPressed: () async {
                        Map<String, dynamic> theData = {
                          "username": username,
                          "password": password,
                          "first_name": first_name,
                          "last_name": last_name
                        };
                        print(theData);

                        JsonEncoder encoder = JsonEncoder();
                        final dynamic object = encoder.convert(theData);

                        print(object);

                        final response = await http.post(
                            Uri.parse(
                                'https://asia-south1-greengold-34fc0.cloudfunctions.net/api/surveyor-signup'),
                            headers: <String, String>{
                              'Content-Type': 'application/json; charset=UTF-8',
                            },
                            body: json.encode(theData));

                        print(response.statusCode);
                        print(response.body);

                        if (response.statusCode == 401) {
                          final snackBar = SnackBar(
                            content: Text('Username already exists! '),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        }

                        if (response.statusCode == 201) {
                          final snackBar = SnackBar(
                            content: Text('Surveyor created successfully. '),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
        ),
      ),
    );
  }
}
