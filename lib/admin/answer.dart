import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFF13552C)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color(0xFF13552C), width: 2.0)))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Text(answerText,
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        onPressed: selectHandler,
      ), //RaisedButton
    ); //Container
  }
}
