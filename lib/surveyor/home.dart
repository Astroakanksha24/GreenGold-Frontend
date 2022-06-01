import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

final storage = new FlutterSecureStorage();

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String? token = '', username = '', role = '';

  List<ProjectInstance> theProjects = [];

  void getUserData() async {
    token = await storage.read(key: 'token');
    username = await storage.read(key: 'username');
    role = await storage.read(key: 'role');

    try {
      String theURL =
          'https://asia-south1-greengold-34fc0.cloudfunctions.net/api/projects/admin/$username';
      final response = await http.get(Uri.parse(theURL),
          headers: {HttpHeaders.authorizationHeader: token!});

      if (response.statusCode == 201) {
        log("success");
        var resp = jsonDecode(response.body);
        log(resp.toString());
        List<dynamic> theArray = resp;
        List<Map<dynamic, dynamic>> allProjects = [];
        setState(() {
          //entityData = resp;
          for (var i = 0; i < theArray.length; i++) {
            Map<dynamic, dynamic> thread2 =
                Map<dynamic, dynamic>.from(theArray[i]);
            allProjects.add(thread2);
            theProjects.add(ProjectInstance(data: thread2));
          }
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Color(0xFFE0FCFB),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Projects',
                        style: TextStyle(
                          color: Color(0xFF13552C),
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
                  ),
                )
              ],
            ),
            Column(
              children: theProjects,
            )
          ],
        ),
      ),
    );
  }
}

class ProjectInstance extends StatefulWidget {
  var data = {};
  ProjectInstance({required this.data});
  //const ProjectInstance({Key? key}) : super(key: key);

  @override
  State<ProjectInstance> createState() => _ProjectInstanceState();
}

class _ProjectInstanceState extends State<ProjectInstance> {
  @override
  Widget build(BuildContext context) {
    var data = widget.data;
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border: Border.all(
          color: Color(0xFF13552C),
          width: 2,
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Building Name',
                      style: TextStyle(
                          color: Color(0xFF13552C),
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    )
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Building Name: ${data['building_name']}',
                      style: TextStyle(
                          color: Color(0xFF13552C),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'City: ${data['city']}',
                      style: TextStyle(
                          color: Color(0xFF13552C),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'State: ${data['state']}',
                      style: TextStyle(
                          color: Color(0xFF13552C),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                    )
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Surveyor: ${data['surveyor_id']}',
                      style: TextStyle(
                          color: Color(0xFF13552C),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                    )
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF13552C)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: Color(0xFF13552C), width: 2.0)))),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Text('Start survey',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  onPressed: null,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
