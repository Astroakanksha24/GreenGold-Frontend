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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            TextNonEdit(label: 'Username', text: entityData["_id"]),
            SizedBox(
              height: 20,
            ),
            TextNonEdit(
                label: 'Name',
                text: entityData["first_name"] + ' ' + entityData["last_name"]),
            SizedBox(
              height: 20,
            ),
            TextNonEdit(label: 'Designation', text: entityData["role"]),
            SizedBox(
              height: 20,
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
                      child: Text('Create Surveyor',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    onPressed: () async {
                      Navigator.pushReplacementNamed(
                          context, '/CreateSurveyor');
                    },
                  ),
                ),
              ],
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
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Color(0xFFFFFFFF),
                                        width: 2.0)))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Logout',
                            style: TextStyle(
                                color: Color(0xFF3E5A81), fontSize: 20),
                          )
                        ]),
                      ),
                    ),
                    onPressed: () async {
                      await storage.write(key: 'username', value: null);
                      await storage.write(key: 'token', value: null);
                      await storage.write(key: 'type', value: null);
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
