import 'package:flutter/material.dart';
import '../models/user_data.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final leaderboard = [
      {"name": "Akshaya", "points": UserData.ecoPoints},
      {"name": "Rahul", "points": 220},
      {"name": "Priya", "points": 180},
      {"name": "Arjun", "points": 150},
      {"name": "Sneha", "points": 120},
    ];
    leaderboard.sort(
      (a, b) => (b["points"] as int).compareTo(a["points"] as int),
    );
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),

      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 20),

                const Text(
                  "Eco Leaderboard 🏆",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Top Eco Warriors",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),

                const SizedBox(height: 30),

                Expanded(
                  child: ListView.builder(
                    itemCount: leaderboard.length,
                    itemBuilder: (context, index) {
                      String medal = "";

                      if (index == 0) {
                        medal = "🥇";
                      } else if (index == 1) {
                        medal = "🥈";
                      } else if (index == 2) {
                        medal = "🥉";
                      } else {
                        medal = "${index + 1}";
                      }

                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.green.shade100,
                            child: Text(
                              medal,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),

                          title: Text(
                            leaderboard[index]["name"].toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),

                          subtitle: Text(
                            "${leaderboard[index]["points"]} Points",
                          ),

                          trailing: const Icon(
                            Icons.emoji_events,
                            color: Colors.amber,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
