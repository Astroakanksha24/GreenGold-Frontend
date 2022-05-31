import 'package:flutter/material.dart';
import 'package:green_building/utils/login.dart';
import 'package:green_building/utils/startscreen.dart';
import 'package:green_building/admin/profile.dart';
import 'package:green_building/admin/adminDashboard.dart';
import 'package:green_building/admin/CreateSurveyor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff13552C),
      ),
      //initialRoute: '/createSurveyor',
      home: AdminDashboard(),
      routes: {
        '/adminDashboard': (context) => const AdminDashboard(),
        'createSurveyor': (context) => const CreateSurveyor(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
