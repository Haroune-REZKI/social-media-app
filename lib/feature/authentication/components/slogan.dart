import 'package:flutter/material.dart';

class Slogan extends StatefulWidget {
  const Slogan({super.key});

  @override
  State<Slogan> createState() => _SloganState();
}

class _SloganState extends State<Slogan> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Let's Connect", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,),),
        Text("Together", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,),),
      ],
    );
  }
}