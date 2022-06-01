import 'package:flutter/material.dart';
import 'package:green_building/admin/textNonEdit.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Color(0xFFE0FCFB),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            TextNonEdit(label: 'Username', text: 'Astro24'),
            SizedBox(
              height: 20,
            ),
            TextNonEdit(label: 'Name', text: 'Astro'),
            SizedBox(
              height: 20,
            ),
            TextNonEdit(label: 'Designation', text: 'Hello'),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
