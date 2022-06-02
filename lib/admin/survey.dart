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
          ],
        ),
      ),
    );
  }
}
