import 'package:flutter/material.dart';
import 'package:green_building/admin/question.dart';
import 'package:green_building/admin/answer.dart';
import 'package:green_building/admin/quiz.dart';
import 'package:green_building/admin/result.dart';

class survey extends StatefulWidget {
  const survey({Key? key}) : super(key: key);

  @override
  State<survey> createState() => _surveyState();
}

class _surveyState extends State<survey> {
  final _questions = const [
    {
      'questionText': 'Q1. Who created Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': -2},
        {'text': 'Adobe', 'score': -2},
        {'text': 'Google', 'score': 10},
        {'text': 'Microsoft', 'score': -2},
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
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
                  : Result(_totalScore, _resetQuiz),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF13552C)),
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
                  onPressed: null,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF13552C)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: Color(0xFF13552C), width: 2.0)))),
                  child: Text('Next >',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
