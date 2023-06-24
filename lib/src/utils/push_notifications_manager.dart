/*

import 'package:flutter/material.dart';


class PushNotificationsManager {
  static final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  PushNotificationsManager.init() {
    pushNotification();
  }

  Future<void> pushNotification() async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.initialize(AndroidInitializationSettings('toyota'),
            onSelectNotification: _handleSelectNotificationForeground);

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      var data = FirebaseNotification.fromJson(message.data);
      if (message.notification != null &&
          message.notification?.android != null) {
        _flutterLocalNotificationsPlugin.show(
          message.notification.hashCode,
          message.notification.title,
          message.notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channel.description,
              icon: 'toyota',
              importance: Importance.max,
              priority: Priority.high,
              color: Colors.white,
              styleInformation:
                  BigTextStyleInformation(message.notification.body),
            ),
          ),
          payload:
              "${data.notificationCode},${data.customerName},${data.customerId},${data.id},${data.startTime},${data.vehicleId},${data.date}",
        );
      }
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<dynamic> _handleSelectNotificationForeground(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }

    var data = NotificationParams.fromString(payload);

    handleSwitchNavigate(data);

    // handleSwitchNavigate(notificationCode: data[0], customerName: data[1], customerId: data[2]);
    _markAsRead(data.id);
  }

  static Future<void> handleSelectNotificationBackground() async {
    // Also handle any interaction when the app is in the background via a Stream
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      var data = FirebaseNotification.fromJson(message.data);
      handleSwitchNavigate(NotificationParams(
          notificationCode: data.notificationCode,
          customerName: data.customerName,
          customerId: data.customerId,
          vehicleId: data.vehicleId,
          startTime: data.startTime,
          id: data.id,
          date: data.date));
      _markAsRead(data.id);
    });
  }

  static Future<bool> handleSelectNotificationWhenAppTerminated() async {
    // a terminated state.
    var initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage?.data != null) {
      var data = FirebaseNotification.fromJson(initialMessage.data);
      handleSwitchNavigate(NotificationParams(
        notificationCode: data.notificationCode,
        customerName: data.customerName,
        customerId: data.customerId,
        vehicleId: data.vehicleId,
        startTime: data.startTime,
        id: data.id,
        date: data.date,
      ));
      _markAsRead(data.id);
    }

    return initialMessage?.data != null;
  }
}

Future<void> _markAsRead(id) async {
  var params = {"id": int.parse("$id")};
  await NotificationService.markAsRead(params);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
}
*/
