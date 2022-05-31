import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<ProjectInstance> theProjects = [];
  @override
  Widget build(BuildContext context) {
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
                        text: 'Projects',
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
              children: theProjects,
            )
          ],
        ),
      ),
    );
  }
}

class ProjectInstance extends StatefulWidget {
  const ProjectInstance({Key? key}) : super(key: key);

  @override
  State<ProjectInstance> createState() => _ProjectInstanceState();
}

class _ProjectInstanceState extends State<ProjectInstance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        border: Border.all(
          color: Color(0xFF13552C),
          width: 2,
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Building Name',
                      style: TextStyle(
                          color: Color(0xFF13552C),
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    )
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Address',
                      style: TextStyle(
                          color: Color(0xFF13552C),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'City',
                      style: TextStyle(
                          color: Color(0xFF13552C),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'State',
                      style: TextStyle(
                          color: Color(0xFF13552C),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                    )
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Surveyor Username',
                      style: TextStyle(
                          color: Color(0xFF13552C),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                    )
                  ]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF13552C)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: Color(0xFF13552C), width: 2.0)))),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Text('Create Surveyor',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  onPressed: null,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
