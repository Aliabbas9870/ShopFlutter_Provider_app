
import 'package:flutter/material.dart';
import 'package:shopapp/notification/notification.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                NotificationService.showInstantNotification(
                    "Instant Notification", "This shows an instant notifications");
              },
              child: const Text('Show Notification'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                DateTime scheduledDate = DateTime.now().add( const Duration(seconds: 5));
                NotificationService.scheduleNotification(
                  0,
                  "Scheduled Notification",
                  "This notification is scheduled to appear after 5 seconds",
                  scheduledDate,
                );
              },
              child: const Text('Schedule Notification'),
            ),
          ],
        ),
      ),
    );
  }
}