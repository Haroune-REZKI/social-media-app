import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mobile_dev_project/features/authentication/guards/login_or_home.dart';
import 'package:mobile_dev_project/api/firebase_api.dart';
import 'package:mobile_dev_project/features/authentication/views/email_sent_page.dart';
import 'package:mobile_dev_project/features/authentication/views/forgot_password_page.dart';
import 'package:mobile_dev_project/features/authentication/views/personal_info_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_dev_project/features/authentication/views/reset_password_page.dart';
import 'package:mobile_dev_project/features/authentication/views/sign_up_page.dart';
import 'package:mobile_dev_project/features/authentication/views/signin_page.dart';
import 'package:mobile_dev_project/features/authentication/views/welcome_page.dart';
import 'package:mobile_dev_project/features/feed/views/home_page.dart';
import 'package:mobile_dev_project/features/posts/views/add_post.dart';
import 'package:mobile_dev_project/features/profile/views/profile.dart';
import 'package:mobile_dev_project/features/settings/views/settings.dart';
import 'package:get/get.dart';
import 'package:mobile_dev_project/firebase_options.dart';
import 'package:notification_channel_manager/notification_channel_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  print(
      "======================================= ${DefaultFirebaseOptions.currentPlatform}");

  await NotificationChannelManager.createChannel(FirebaseApi().channel);

  await FirebaseApi().initializeFcm();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Social Media Application',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routes: {
        // to be filled
        "/": (context) => AuthPageSwitcher(),
        '/settings': (context) => const Settings(),
        '/login_page': (context) => const SignIn(),
        '/sign_up_page': (context) => const SignUp(),
        '/feed': (context) => const HomeFeed(),
        '/add_post': (context) => const AddPost(),
        '/personal_info_page': (context) => const PersonalInfoPage(),
        '/profile': (context) => const Profile(),
        '/forgot_password': (context) => const ForgotPasswordPage(),
        '/email_sent': (context) => const EmailSent(),
        '/reset_password': (context) => const ResetPassword(),
      },
    );
  }
}
