import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

final storage = new FlutterSecureStorage();

class report extends StatefulWidget {
  const report({Key? key}) : super(key: key);

  @override
  State<report> createState() => _reportState();
}

class _reportState extends State<report> {
  bool isLoading = true;
  String? TOKEN = '', USERNAME = '';

  void getUserData() async {
    TOKEN = await storage.read(key: 'token');
    USERNAME = await storage.read(key: 'username');
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    //final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    // Map<dynamic, dynamic> data = arguments['data'];
    List<DocumentInstance> docList = [];
    // setState(() {
    //   for (var i = 0; i < data['documentsArray'].length; i++) {
    //     docList.add(
    //         DocumentInstance(link: data['documentsArray'][i], index: i + 1));
    //   }
    // });
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
                        text: 'Reports',
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
              children: docList,
            )
          ],
        ),
      ),
    );
  }
}

class DocumentInstance extends StatefulWidget {
  String link = '';
  int index = -1;

  DocumentInstance({required this.link, required this.index});

  @override
  _DocumentInstanceState createState() => _DocumentInstanceState();
}

class _DocumentInstanceState extends State<DocumentInstance> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/pdf',
              arguments: {"link": widget.link});
        },
        child: Container(
          padding: EdgeInsets.all(5),
          child: Center(
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Report ${widget.index}',
                  style: TextStyle(
                      color: Color(0xFF3E5A81),
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                )
              ]),
            ),
          ),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color(0xFFFFFFFF), width: 2.0)))),
      ),
    );
  }
}
