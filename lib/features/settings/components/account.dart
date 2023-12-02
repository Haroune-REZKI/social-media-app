import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
          Container(
            margin: EdgeInsets.all(15),
              child: Icon(
                Icons.manage_accounts,
                color: Color(0xFF006175),
              ),
            ),
            Text(
              "Account",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF006175),
                  fontSize: 20),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: TextButton(
              child: Text(
                "Edit Profile",
                style: TextStyle(
                  color: Color(0xFF454545),
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, side: BorderSide.none)),
        ),
          Container(
          margin: const EdgeInsets.only(left: 10),
          child: TextButton(
              child: Text(
                "Change Password",
                style: TextStyle(
                  color: Color(0xFF454545),
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, side: BorderSide.none)),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: TextButton(
              child: Text(
                "Privacy",
                style: TextStyle(
                  color: Color(0xFF454545),
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, side: BorderSide.none)),
        ),
      ],
    );
  }
}
