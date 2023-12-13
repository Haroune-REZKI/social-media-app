import 'package:flutter/material.dart';
import 'package:mobile_dev_project/features/authentication/views/personal_info_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_dev_project/features/authentication/views/sign_up_page.dart';
import 'package:mobile_dev_project/features/authentication/views/signin_page.dart';
import 'package:mobile_dev_project/features/authentication/views/welcome_page.dart';
import 'package:mobile_dev_project/features/categories/views/categories_feed.dart';
import 'package:mobile_dev_project/features/feed/views/home_page.dart';
import 'package:mobile_dev_project/features/posts/views/add_post.dart';
import 'package:mobile_dev_project/features/settings/views/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media Application',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routes: {
        // to be filled
        "/": (context) => const WelcomePage(),
        '/settings': (context) => const Settings(),
        '/login_page': (context) => const SignIn(),
        '/sign_up_page': (context) => const SignUp(),
        '/feed': (context) => const HomeFeed(),
        '/add_post': (context) => const AddPost(),
        '/personal_info_page': (context) => const PersonalInfoPage(),
      },
    );
  }
}
