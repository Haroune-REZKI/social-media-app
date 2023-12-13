import 'package:flutter/material.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    bool isPosts = true;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isPosts = true;
                });
              },
              child: Text("Posts", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: (isPosts)?Color(0xFF006175): Color(0xFF706C6C),
              ),
            ),
            SizedBox(width: 30,),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isPosts = false;
                });
              },
              child: Text("Channels", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: (!isPosts)?Color(0xFF006175): Color(0xFF706C6C),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
