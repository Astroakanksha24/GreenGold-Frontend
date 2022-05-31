import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CreateSurveyor extends StatefulWidget {
  const CreateSurveyor({Key? key}) : super(key: key);

  @override
  State<CreateSurveyor> createState() => _CreateSurveyorState();
}

class _CreateSurveyorState extends State<CreateSurveyor> {
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
                      hintText: 'Building Name',
                      hintStyle: TextStyle(color: Color(0xFF13552C))),
                  //controller: _usernameController,
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
                      hintText: 'Address',
                      hintStyle: TextStyle(color: Color(0xFF13552C))),
                  //controller: _usernameController,
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
                      hintText: ' City',
                      hintStyle: TextStyle(color: Color(0xFF13552C))),
                  //controller: _usernameController,
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
                      hintText: ' State',
                      hintStyle: TextStyle(color: Color(0xFF13552C))),
                  //controller: _usernameController,
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
                      hintText: ' Username of Surveyor ',
                      hintStyle: TextStyle(color: Color(0xFF13552C))),
                  //controller: _usernameController,
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
                      onPressed: null,
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
