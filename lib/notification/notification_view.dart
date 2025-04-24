
import 'package:flutter/material.dart';
import 'package:shopapp/notification/notification.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {

  void initState() {
  super.initState();
  NotificationService.init();

  // Auto-schedule a notification 10 seconds after screen opens
  final scheduledTime = DateTime.now().add(const Duration(seconds: 5));
  NotificationService.scheduleNotification(
    1,
    "Auto Notification",
    "This notification was scheduled automatically after 5 seconds.",
    scheduledTime,
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  DateTime scheduledDate = DateTime.now().add( const Duration(seconds: 7));
                  NotificationService.scheduleNotification(
                    
                    0,
                    "Booking Reminder",
                    "This notification is scheduled to appear after",
                    scheduledDate,
                  );
                },
                child: const Text('Schedule Notification'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}