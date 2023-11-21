import 'package:flutter/material.dart';
import 'package:mobile_dev_project/feature/authentication/views/welcome_page.dart';
import 'package:mobile_dev_project/feature/feed/views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Social Media Application',
      debugShowCheckedModeBanner: true,
      home: WelcomePage(),
      routes: const {
        // to be filled
      },
    );
  }
}
