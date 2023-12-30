import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Container(
  width: 175,
  height: 48,
  child: Stack(
    children: [
      Positioned(
        left: 0,
        top: 0,
        child: Text(
          'Posts',
          style: TextStyle(
            color: Color(0xFF706C6C),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
      Positioned(
        left: 10,
        top: 24,
        child: SizedBox(
          width: 36,
          child: Text(
            '315',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ),
      ),
      Positioned(
        left: 102,
        top: 0,
        child: Text(
          'Channels',
          style: TextStyle(
            color: Color(0xFF706C6C),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
      Positioned(
        left: 135,
        top: 24,
        child: Text(
          '3',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
    ],
  ),
);
  }
}