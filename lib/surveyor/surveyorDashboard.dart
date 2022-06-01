import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:green_building/surveyor/home.dart';
import 'package:green_building/surveyor/profile.dart';
import 'package:green_building/surveyor/reports.dart';
import 'package:green_building/surveyor/survey.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

final storage = new FlutterSecureStorage();

class SurveyorDashboard extends StatefulWidget {
  const SurveyorDashboard({Key? key}) : super(key: key);

  @override
  _SurveyorDashboardState createState() => _SurveyorDashboardState();
}

class _SurveyorDashboardState extends State<SurveyorDashboard> {
  Map<String, dynamic> entityData = {};
  String? token = '', username = '', role = '';

  void getStorageValues() async {
    token = await storage.read(key: 'token');
    username = await storage.read(key: 'username');
    role = await storage.read(key: 'role');
  }

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
      return;
    }
    await storage.write(key: 'username', value: null);
    await storage.write(key: 'token', value: null);
    await storage.write(key: 'role', value: null);
    Navigator.pushReplacementNamed(context, '/start');
    return;
  }

  @override
  late PageController _pageController = PageController();
  void initState() {
    super.initState();
    // getStorageValues();
    super.initState();
    _pageController = PageController();
    getUserData(username, token);
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF13552C),
        title: Text(
          'GREEN GOLD',
          style: TextStyle(
            fontFamily: 'Lobster',
            color: Colors.white,
            fontSize: 25.0,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Center(
        child: <Widget>[
          home(),
          survey(),
          report(),
          profile(),
        ].elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF13552C),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xFF13552C),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist_outlined),
            label: 'Survey',
            backgroundColor: Color(0xFF13552C),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: 'Reports',
            backgroundColor: Color(0xFF13552C),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
            backgroundColor: Color(0xFF13552C),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFFFFFF),
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ),
    );
  }
}
