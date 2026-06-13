import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),

      appBar: AppBar(title: const Text("Notifications 🔔")),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          NotificationTile(
            icon: Icons.emoji_events,
            title: "Challenge Completed",
            subtitle: "+50 Eco Points earned",
          ),

          NotificationTile(
            icon: Icons.eco,
            title: "Reward Unlocked",
            subtitle: "Green Starter Badge available",
          ),

          NotificationTile(
            icon: Icons.local_fire_department,
            title: "Streak Achieved",
            subtitle: "You reached a 7-day streak",
          ),

          NotificationTile(
            icon: Icons.notifications_active,
            title: "New Daily Challenge",
            subtitle: "Use Public Transport today",
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
