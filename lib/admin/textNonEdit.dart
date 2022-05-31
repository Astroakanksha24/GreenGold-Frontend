import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextNonEdit extends StatefulWidget {
  String label = '', text = '';

  TextNonEdit({required this.label, required this.text});

  @override
  _TextNonEditState createState() => _TextNonEditState();
}

class _TextNonEditState extends State<TextNonEdit> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(0xfff3f6f2),
              border: Border.all(color: Color(0xFF13552C)),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            width: 200.0,
            height: 30.0,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: '${widget.label}',
                      style: TextStyle(color: Color(0xFF13552C), fontSize: 15),
                    )
                  ]),
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: '${widget.text}',
                      style: TextStyle(
                          color: Color(0xFF13552C),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )
                  ]),
                ),
              ],
            )),
      ),
    );
  }
}
