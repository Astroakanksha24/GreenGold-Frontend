import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:green_building/admin/home.dart';
import 'package:green_building/admin/quiz.dart';
import 'package:green_building/admin/result.dart';
import 'package:http/http.dart' as http;

final storage = new FlutterSecureStorage();

class survey extends StatefulWidget {
  const survey({Key? key}) : super(key: key);

  @override
  State<survey> createState() => _surveyState();
}

class _surveyState extends State<survey> {
  final _questions = const [
    {
      "_id": "6295ae41ad45ab1e7d08681d",
      "questionText":
          "Percentage of Site Area with Natural Topography and/or Vegetated Area",
      "type": "mcq",
      "answers": [
        {"text": "Less than 15%", "score": 0},
        {"text": "15% - 25%", "score": 5},
        {"text": "More than 25%", "score": 10}
      ],
      "maximum_score": 10,
      "__v": 0
    },
    {
      "_id": "6295ae66ad45ab1e7d08681f",
      "questionText": "Turf Area as a Percentage of Total Landscaped Area",
      "type": "mcq",
      "answers": [
        {"text": "Less than 20%", "score": 10},
        {"text": "20% - 40%", "score": 5},
        {"text": "More than 40%", "score": 0}
      ],
      "maximum_score": 10,
      "__v": 0
    },
    {
      "_id": "6295ae78ad45ab1e7d086821",
      "questionText":
          "Drought Tolerant Species as a Percentage of Total Landscaped Area",
      "type": "mcq",
      "answers": [
        {"text": "Less than 20%", "score": 0},
        {"text": "20% - 40%", "score": 5},
        {"text": "More than 40%", "score": 10}
      ],
      "maximum_score": 10,
      "__v": 0
    },
    {
      "_id": "6295ae90ad45ab1e7d086823",
      "questionText": "Rainwater Harvesting System to Capture / Recharge",
      "type": "mcq",
      "answers": [
        {"text": "Less than 50% of runoff volumes", "score": 0},
        {"text": "50% - 75% of runoff volumes", "score": 5},
        {"text": "More than 75% of runoff volumes", "score": 10}
      ],
      "maximum_score": 10,
      "__v": 0
    },
    {
      "_id": "6295af30ad45ab1e7d086827",
      "questionText": "Percentage of Treated Organic Waste",
      "type": "mcq",
      "answers": [
        {"text": "Less than 50%", "score": 0},
        {"text": "50% - 95%", "score": 5},
        {"text": "More than 95%", "score": 10}
      ],
      "maximum_score": 10,
      "__v": 0
    },
    {
      "_id": "6295af51ad45ab1e7d086829",
      "questionText":
          "Percentage of Construction Waste Materials being recycled without sending to landfills",
      "type": "mcq",
      "answers": [
        {"text": "Less than 50%", "score": 0},
        {"text": "50% - 95%", "score": 5},
        {"text": "More than 95%", "score": 10}
      ],
      "maximum_score": 10,
      "__v": 0
    },
    {
      "_id": "6295af80ad45ab1e7d08682b",
      "questionText":
          "Percentage of Local Materials manufactured within 400km of usage site",
      "type": "mcq",
      "answers": [
        {"text": "Less than 25%", "score": 0},
        {"text": "25% - 50%", "score": 5},
        {"text": "More than 50%", "score": 10}
      ],
      "maximum_score": 10,
      "__v": 0
    },
    {
      "_id": "6295af94ad45ab1e7d08682d",
      "questionText":
          "Percentage of Regularly Occupied Spaces with Daylighting",
      "type": "mcq",
      "answers": [
        {"text": "Less than 75%", "score": 0},
        {"text": "75% - 95%", "score": 5},
        {"text": "More than 95%", "score": 10}
      ],
      "maximum_score": 10,
      "__v": 0
    },
    {
      "_id": "6295afaaad45ab1e7d08682f",
      "questionText":
          "Percentage of Regularly Occupied Spaces with Cross Ventilation",
      "type": "mcq",
      "answers": [
        {"text": "Less than 50%", "score": 0},
        {"text": "50% - 75%", "score": 5},
        {"text": "More than 75%", "score": 10}
      ],
      "maximum_score": 10,
      "__v": 0
    },
    {
      "_id": "6295b49b0c7a34303675e9c5",
      "questionText":
          "Renewable Energy as a Percentage of Total Connected Load of the Building/ Campus",
      "type": "mcq",
      "answers": [
        {"text": "Less than 5/2%", "score": 0},
        {"text": "5/2% - 5%", "score": 5},
        {"text": "5% - 15/2%", "score": 7},
        {"text": "More than 15/2%", "score": 10}
      ],
      "maximum_score": 10,
      "__v": 0
    }
  ];

  String? role = '', token = '', username = '';

  void getUserData() async {
    token = await storage.read(key: 'token');
    print("token");
    print(token);
    username = await storage.read(key: 'username');
    role = await storage.read(key: 'role');
    return;
  }

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score, String answer, String question_id) async {
    log(getSelectedProject());
    Map<String, dynamic> theData = {
      "question_id": question_id,
      "project_id": getSelectedProject(),
      "answer": answer,
      "obtained_marks": score
    };
    print(theData);

    JsonEncoder encoder = JsonEncoder();
    final dynamic object = encoder.convert(theData);

    print(object);

    print(token);

    final response = await http.put(
        Uri.parse(
            'https://asia-south1-greengold-34fc0.cloudfunctions.net/api/save-answer'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'authorization': '$token'
        },
        body: json.encode(theData));

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 401) {
      final snackBar = SnackBar(
        content: Text('Invalid token '),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if (response.statusCode == 404) {
      final snackBar = SnackBar(
        content: Text('Something went wrong! '),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if (response.statusCode == 201) {
      var resp = jsonDecode(response.body);
      _totalScore = resp["score"];
      // setState(() {
      //   _questionIndex = _questionIndex + 1;
      // });
      print(_questionIndex);
      if (_questionIndex < _questions.length) {
        print('We have more questions!');
      } else {
        print('No more questions!');
      }
    }
    final snackBar = SnackBar(
      content: Text('Answer saved successfully. '),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return;
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
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38),
            child: Center(
              child: LinearProgressIndicator(
                backgroundColor: Colors.red,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  ) //Quiz
                : Result(),
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(children: [
            SizedBox(
              width: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (_questionIndex > 0) {
                  setState(() {
                    _questionIndex--;
                  });
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF13552C)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                              color: Color(0xFF13552C), width: 2.0)))),
              child: Text('< Prev',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            SizedBox(
              width: 160.0,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _questionIndex++;
                });
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF13552C)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                              color: Color(0xFF13552C), width: 2.0)))),
              child: Text('Next >',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ]),
        ],
      )),
    );
  }
}
