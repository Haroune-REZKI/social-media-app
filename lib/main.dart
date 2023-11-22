import 'package:flutter/material.dart';
import 'package:mobile_dev_project/features/authentication/views/signin_page.dart';
import 'package:mobile_dev_project/features/authentication/views/welcome_page.dart';
import 'package:mobile_dev_project/features/feed/views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media Application',
      debugShowCheckedModeBanner: true,
      home: const WelcomePage(),
      routes: {
        // to be filled
        "login_page": (context) => const SignIn(),
      },
    );
  }
}
