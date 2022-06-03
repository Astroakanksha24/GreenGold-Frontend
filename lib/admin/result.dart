import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:green_building/admin/home.dart';
import 'package:http/http.dart' as http;

final storage = new FlutterSecureStorage();

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String? token = '', username = '', role = '';
  String project_id = '';

  bool showScreen = false;
  dynamic projectData = [];
  void getUserData() async {
    token = await storage.read(key: 'token');
    username = await storage.read(key: 'username');
    role = await storage.read(key: 'role');
    project_id = getSelectedProject();
    log(project_id);
    try {
      String theURL =
          'https://asia-south1-greengold-34fc0.cloudfunctions.net/api/projects/$project_id';
      final response = await http.get(Uri.parse(theURL),
          headers: {HttpHeaders.authorizationHeader: token!});

      if (response.statusCode == 201) {
        log("success");
        var resp = jsonDecode(response.body);
        log(resp.toString());
        setState(() {
          showScreen = true;
          projectData = resp;
        });
        return;
      }
      await storage.write(key: 'username', value: null);
      await storage.write(key: 'token', value: null);
      await storage.write(key: 'role', value: null);
      Navigator.pushReplacementNamed(context, '/start');
      return;
    } catch (e) {
      print(e);
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  final int resultScore = 0;

  @override
  Widget build(BuildContext context) {
    return showScreen
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${projectData["certification_badge"]} certified',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ), //Text
                Text(
                  'Score ${projectData["score"]}/100',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: null,
                  child: Text('Restart Quiz',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ) //Text//FlatButton
              ], //<Widget>[]
            ), //Column
          )
        : SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          ); //Center

  
  }
}
