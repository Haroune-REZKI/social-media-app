import 'package:flutter/material.dart';

class Other extends StatefulWidget {
  const Other({super.key});

  @override
  State<Other> createState() => _OtherState();
}

class _OtherState extends State<Other> {
  bool dark = false;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
          children: [
          Container(
            margin: EdgeInsets.all(15),
              child: Icon(
                Icons.settings_suggest,
                color: Color(0xFF006175),
              ),
            ),
            Text(
              "Other",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF006175),
                  fontSize: 20),
            )
          ],
        ),
      Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {setState(() {
                dark = !dark;
              });},
              child: Text(
                "Dark Mode",
                style: TextStyle(
                  color: Color(0xFF454545),
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Switch(
                value: dark,
                activeColor: Color(0xFF006175),
                onChanged: (value) {
                  setState(() {
                    dark = value;
                  });
                }),
          ],
        ),
      ),
    ]);
  }
}
