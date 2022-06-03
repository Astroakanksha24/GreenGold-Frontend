import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:green_building/admin/textNonEdit.dart';
import 'package:http/http.dart' as http;
import 'package:green_building/admin/CreateSurveyor.dart';

final storage = new FlutterSecureStorage();

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  Map<String, dynamic> entityData = {};

  String? token = '', username = '', role = '';

  void getUserData(username, token) async {
    token = await storage.read(key: 'token');
    username = await storage.read(key: 'username');
    role = await storage.read(key: 'role');

    String theURL =
        'https://asia-south1-greengold-34fc0.cloudfunctions.net/api/user/' +
            username;
    final response = await http.get(Uri.parse(theURL),
        headers: {HttpHeaders.authorizationHeader: token});

    if (response.statusCode == 201) {
      log(response.statusCode.toString());
      Map<String, dynamic> resp = jsonDecode(response.body);
      setState(() {
        entityData = resp;
      });
      log(resp.toString());
      return;
    }
    await storage.write(key: 'username', value: null);
    await storage.write(key: 'token', value: null);
    await storage.write(key: 'role', value: null);
    Navigator.pushReplacementNamed(context, '/login');
    return;
  }

  @override
  void initState() {
    super.initState();
    // getStorageValues();
    getUserData(username, token);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Color(0xFFE0FCFB),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Name: ${entityData["first_name"] + " " + entityData["last_name"]}',
              style: TextStyle(
                  fontSize: 26,
                  color: Color(0xFF13552C),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ), //Text
            Text(
              'Username: ${entityData["_id"]}',
              style: TextStyle(
                  fontSize: 26,
                  color: Color(0xFF13552C),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Designation: ${entityData["role"]}',
              style: TextStyle(
                  fontSize: 26,
                  color: Color(0xFF13552C),
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF13552C)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                              color: Color(0xFF13552C), width: 2.0)))),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/CreateSurveyor');
              },
              child: Text('Create Surveyor',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF13552C)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                              color: Color(0xFF13552C), width: 2.0)))),
              onPressed: () async {
                await storage.write(key: 'username', value: null);
                await storage.write(key: 'token', value: null);
                await storage.write(key: 'type', value: null);
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Logout',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ) //Text//FlatButton
          ], //<Widget>[]
        ), //Column
      ),
      // Center
    );
  }
}
