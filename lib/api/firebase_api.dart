//here we handle all firebase services, maybe to be moved to backend
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notification_channel_manager/notification_channel_manager.dart';

class FirebaseApi {
  // create an instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  final channel = NotificationChannel(
      id: "1",
      name: "new_posts",
      description: 'Notifications for new posts on the app',
      importance: NotificationChannelImportance.high);

  //function to initialize notifications
  Future<void> initNotifications() async {
    // request permission from user(will prompt user)
    await _firebaseMessaging.requestPermission();

    //fetch the FCM token for this device (each device will a special token)
    final FCMToken = await _firebaseMessaging
        .getToken(); // when i did not use await, fcmtoken was empty

    // print the token for debugging
    print("Token: $FCMToken");
  }

  Future<void> initializeFcm() async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      await FirebaseMessaging.instance.subscribeToTopic("new_posts");
    }
  }

  // function to handle received notifications

  // functon to initialize foreground and background settings
}
