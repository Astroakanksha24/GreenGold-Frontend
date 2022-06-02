import 'package:flutter/material.dart';
import 'package:green_building/admin/CreateSurveyor.dart';
import 'package:green_building/admin/adminDashboard.dart';
import 'package:green_building/admin/home.dart';
import 'package:green_building/surveyor/home.dart';
import 'package:green_building/surveyor/surveyorDashboard.dart';
import 'package:green_building/utils/login.dart';

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
      home: LoginScreen(),
      routes: {
        '/adminDashboard': (context) => const AdminDashboard(),
        '/surveyorDashboard': (context) => const SurveyorDashboard(),
        '/CreateSurveyor': (context) => const CreateSurveyor(),
        '/login': (context) => const LoginScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
