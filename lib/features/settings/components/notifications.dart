import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool notifications_on = true;
  bool updates = false;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
          children: [
          Container(
            margin: EdgeInsets.all(15),
              child: Icon(
                Icons.circle_notifications,
                color: Color(0xFF006175),
              ),
            ),
            Text(
              "Notifiction",
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
                notifications_on = !notifications_on;
              });},
              child: Text(
                "Notification",
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
                value: notifications_on,
                activeColor: Color(0xFF006175),
                onChanged: (value) {
                  setState(() {
                    notifications_on = value;
                  });
                }),
          ],
        ),
      ),
           Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {setState(() {
                updates = !updates;
              });},
              child: Text(
                "Updates",
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
                value: updates,
                activeColor: Color(0xFF006175),
                onChanged: (value) {
                  setState(() {
                    updates = value;
                  });
                }),
          ],
        ),
      ),
    ]);
  }
}
