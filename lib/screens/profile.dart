import 'package:flutter/material.dart';
import '../models/user_data.dart';
import 'rewards.dart';
import 'leaderboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'impact.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 700),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.person, size: 70, color: Colors.white),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Akshaya",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "Eco Warrior 🌱",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    children: [
                      Expanded(
                        child: _statCard(
                          UserData.ecoPoints.toString(),
                          "Eco Points",
                          Icons.star,
                          Colors.amber,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: _statCard(
                          UserData.streak.toString(),
                          "Day Streak",
                          Icons.local_fire_department,
                          Colors.orange,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  Row(
                    children: [
                      Expanded(
                        child: _statCard(
                          UserData.challengesCompleted.toString(),
                          "Challenges",
                          Icons.emoji_events,
                          Colors.blue,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: _statCard(
                          "3",
                          "Trees Planted",
                          Icons.park,
                          Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "🏅 Achievements",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 15),

                          if (UserData.ecoPoints >= 100)
                            const ListTile(
                              leading: Text(
                                "🥉",
                                style: TextStyle(fontSize: 24),
                              ),
                              title: Text("Green Beginner"),
                            ),

                          if (UserData.ecoPoints >= 250)
                            const ListTile(
                              leading: Text(
                                "🥈",
                                style: TextStyle(fontSize: 24),
                              ),
                              title: Text("Eco Warrior"),
                            ),

                          if (UserData.ecoPoints >= 500)
                            const ListTile(
                              leading: Text(
                                "🥇",
                                style: TextStyle(fontSize: 24),
                              ),
                              title: Text("Sustainability Hero"),
                            ),

                          if (UserData.ecoPoints >= 1000)
                            const ListTile(
                              leading: Text(
                                "👑",
                                style: TextStyle(fontSize: 24),
                              ),
                              title: Text("Eco Champion"),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text("Settings"),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.help_outline),
                      title: const Text("Help & Support"),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 10),

                  Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.card_giftcard,
                        color: Colors.green,
                      ),
                      title: const Text("Rewards"),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RewardsScreen(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.emoji_events,
                        color: Colors.orange,
                      ),
                      title: const Text("Leaderboard"),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LeaderboardScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),

                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.public, color: Colors.green),
                      title: const Text("Real Impact"),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ImpactScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),

                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.logout, color: Colors.red),
                      title: const Text(
                        "Logout",
                        style: TextStyle(color: Colors.red),
                      ),
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _statCard(
    String value,
    String label,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Icon(icon, color: color, size: 35),

            const SizedBox(height: 10),

            Text(
              value,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
