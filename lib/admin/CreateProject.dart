import 'dart:async';
import 'dart:convert';
import 'dart:io';

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
  final _formKey = GlobalKey<FormState>();
  String? _chosenValueRole;
  bool _passwordVisible = false;

  String username = '',
      password = '',
      cpassword = '',
      email = '',
      name = '',
      city = '',
      state = '',
      address = '',
      description = '',
      fName = '',
      lName = '',
      location = '',
      bio = '',
      contactNo = '',
      imageURL =
          'https://firebasestorage.googleapis.com/v0/b/bizrep-b0184.appspot.com/o/profile_picture.png?alt=media&token=f23c3431-328e-47d6-8e0c-a1dfabbf13bf';

  double latitude = 0.0, longitude = 0.0;

  String type = '';

  List<String> selectedSectors = [];

  List<String> allTheSectors = [];

  String? _chosenSector;

  //File _image = File('images/giftbox.png');
  File? _image;
  late String url;

  String profilePic =
      'https://booleanstrings.com/wp-content/uploads/2021/10/profile-picture-circle-hd.png';

  // Future<File> urlToFile(String imageUrl) async {
  //   var rng = new Random();
  //   Directory tempDir = await getTemporaryDirectory();
  //   String tempPath = tempDir.path;
  //   File file = new File('$tempPath' + (rng.nextInt(100)).toString() + '.png');
  //   http.Response response = await http.get(Uri.parse(imageUrl));
  //   await file.writeAsBytes(response.bodyBytes);
  //   return file;
  // }

  // void setImage() async {
  //   File tempo = await urlToFile(profilePic);
  //   setState(() {
  //     _image = tempo;
  //   });
  // }

  @override
  // void initState() {
  //   super.initState();
  //   setImage();
  //   getCurrentLocation();
  // }

  @override
  Widget build(BuildContext context) {
    Future<void> uploadPic(BuildContext context) async {
      if (_image == null) {
        setState(() {
          imageURL = "";
        });
      } else {
        var postUri = Uri.parse(
            "https://asia-south1-sahayya-9c930.cloudfunctions.net/api/upload-file");
        var request = new http.MultipartRequest("POST", postUri);
        request.files
            .add(await http.MultipartFile.fromPath('file', _image!.path));
        request.send().then((result) async {
          http.Response.fromStream(result).then((response) async {
            var body = json.decode(response.body);
            print(body['link']);
            setState(() {
              imageURL = body['link'];
            });
          });
        });
        setState(() {
          imageURL = "";
        });
      }
    }

    int myTrigger = 3;

    void deleteSectorInstance(String value) {
      print(value);
      setState(() {
        allTheSectors.add(value);
        selectedSectors.remove(value);
        myTrigger = 25;
      });
      print(allTheSectors);
      print(selectedSectors);
      print("Hey Angel");
    }

    return Scaffold(
      backgroundColor: Color(0xFF3E5A81),
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
                          username = val;
                        });
                      },
                    ),
                  ),
                  TextField(
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                    enabled: true,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      filled: true,
                      fillColor: Color(0xFF3E5A81),
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: border(context),
                      enabledBorder: border(context),
                      focusedBorder: focusBorder(context),
                    ),
                    textInputAction: TextInputAction.next,
                    onChanged: (val) {
                      setState(() {
                        username = val;
                      });
                    },
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
                              "username": username,
                              "email": email,
                              "password": password,
                              "coOrdinates": {
                                "latitude": latitude,
                                "longitude": longitude
                              },
                              "picture": imageURL,
                              "name": name,
                              "city": city,
                              "state": state,
                              "address": address,
                              "sectors": selectedSectors,
                              "description": description,
                            };
                            print(theData);

                            JsonEncoder encoder = JsonEncoder();
                            final dynamic object = encoder.convert(theData);

                            print(object);

                            final response = await http.post(
                                Uri.parse(
                                    'https://asia-south1-sahayya-9c930.cloudfunctions.net/api/ngo-signup'),
                                headers: <String, String>{
                                  'Content-Type':
                                      'application/json; charset=UTF-8',
                                },
                                body: json.encode(theData));

                            print(response.statusCode);
                            print(response.body);

                            if (response.statusCode == 403) {
                              final snackBar = SnackBar(
                                content: Text('Username already exists. '),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              return;
                            }

                            if (response.statusCode == 201) {
                              final snackBar = SnackBar(
                                content: Text('NGO signed up successfully. '),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              Map<String, dynamic> resp =
                                  json.decode(response.body);

                              await storage.write(
                                  key: 'username', value: username);
                              await storage.write(
                                  key: 'token', value: resp['token']);
                              await storage.write(key: 'type', value: type);
                              //route to ngoDashboard
                              Navigator.pushReplacementNamed(
                                  context, '/ngoDashboard');
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
