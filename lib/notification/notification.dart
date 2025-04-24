import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tzData;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  // Notification plugin instance
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Initialization function
  static Future<void> init() async {
    // Load timezone data
    tzData.initializeTimeZones();

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOSInit = DarwinInitializationSettings();

    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iOSInit,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotification,
      onDidReceiveBackgroundNotificationResponse: onDidReceiveNotification,
    );

    // Request Android-specific permission if needed (Android 13+)
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  /// Handler for received notifications
  static Future<void> onDidReceiveNotification(
      NotificationResponse notificationResponse) async {
    debugPrint("Notification received with payload: ${notificationResponse.payload}");
  }
static Future<void> scheduleNotification(
  int id,
  String title,
  String body,
  DateTime scheduledTime,
) async {
  final androidDetails = AndroidNotificationDetails(
    'reminder_channel',
    'Reminder Channel',
    channelDescription: 'Channel for booking reminders',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
    playSound: true,
    color: Color(0xFF123456),
    enableLights: true,
    ongoing: false,
    ledColor: Colors.red,
    ledOnMs: 1000,
    ledOffMs: 500,
    styleInformation: BigTextStyleInformation(
      body, // 🔥 This ensures full message is shown
      contentTitle: title,
      summaryText: 'Tap to view details',
    ),
  );

  const iOSDetails = DarwinNotificationDetails();

  final notificationDetails = NotificationDetails(
    android: androidDetails,
    iOS: iOSDetails,
  );

  await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    title,
    body,
    tz.TZDateTime.from(scheduledTime, tz.local),
    notificationDetails,
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    matchDateTimeComponents: DateTimeComponents.dateAndTime,
    
    payload: "custom_payload_123",
  );
}



}
