//here we handle all firebase services, maybe to be moved to backend
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  // create an instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  //function to initialize notifications
  Future<void> initNotifications() async {
    // request permission from user(will prompt user)
    await _firebaseMessaging.requestPermission();

    String value = 'hello';

    //fetch the FCM token for this device (each device will a special token)
    final FCMToken = await _firebaseMessaging.getToken(); // when i did not use await, fcmtoken was empty

    // print the token for debugging
    print("Token: $FCMToken");

  }

  // function to handle received notifications

  // functon to initialize foreground and background settings
}
