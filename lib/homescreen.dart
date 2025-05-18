import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_project/services/notification_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          OutlinedButton(
            onPressed: () async {
              await NotificationService.createNotification(
                id: 5,
                title: 'Action Button Notification',
                body: 'This is the body of the notification',
                payload: {'navigate': 'true'},
                actionButtons: [
                  NotificationActionButton(
                    key: 'action_button',
                    label: 'Click me',
                    actionType: ActionType.Default,
                  ),
                ],
              );
            },
            child: const Text('Action Button Notification'),
          ),
          OutlinedButton(
            onPressed: () async {
              await NotificationService.createNotification(
                id: 5,
                title: 'Scheduled Notification',
                body: 'This is the body of the notification',
                scheduled: true,
                interval: Duration(seconds: 5),
              );
            },
            child: const Text('Scheduled Notification'),
          ),
        ],
      ),
    );
  }
}
