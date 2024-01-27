import 'package:flutter/material.dart';
import 'package:mobile_dev_project/features/authentication/business/entities/user.dart';
import 'package:mobile_dev_project/features/profile/components/pages.dart';
import 'package:mobile_dev_project/features/profile/components/statistics.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
                backgroundColor: Colors.red,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              user.fullname,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              user.username,
              style: TextStyle(
                color: Color(0xFF706C6C),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            SizedBox(height: 40,),
            Statistics(),
            SizedBox(height: 40,),
            Pages(), //slider (and tapbar?)
          ],
        )],
      ),
    );
  }
}
