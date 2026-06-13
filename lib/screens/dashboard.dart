import 'package:flutter/material.dart';
import '../models/user_data.dart';
import 'notifications.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),
      appBar: AppBar(
        title: const Text("EcoTrack"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                const Text(
                  "Good Morning, Greenie! 🌱",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 25),

                // ECO SUMMARY CARD
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
                          "📊 Eco Summary",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _summaryItem(
                              "⭐",
                              UserData.ecoPoints.toString(),
                              "Points",
                            ),

                            _summaryItem(
                              "🏆",
                              UserData.challengesCompleted.toString(),
                              "Challenges",
                            ),

                            _summaryItem(
                              "🌱",
                              UserData.completedHabits.toString(),
                              "Habits",
                            ),

                            _summaryItem(
                              "🔥",
                              UserData.streak.toString(),
                              "Streak",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Your Impact Today",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 15),

                Row(
                  children: [
                    Expanded(
                      child: _impactCard(
                        Icons.eco,
                        "24.5 kg",
                        "CO₂ Saved",
                        Colors.green,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: _impactCard(
                        Icons.bolt,
                        "12 kWh",
                        "Energy Saved",
                        Colors.orange,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: _impactCard(
                        Icons.water_drop,
                        "152 L",
                        "Water Saved",
                        Colors.blue,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.local_fire_department,
                          color: Colors.orange,
                          size: 45,
                        ),

                        const SizedBox(width: 15),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${UserData.streak} Days",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const Text(
                              "Current Streak",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Today's Challenge",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 15),

                Card(
                  color: Colors.green.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15),
                    leading: const Icon(
                      Icons.directions_bus,
                      color: Colors.green,
                      size: 35,
                    ),
                    title: const Text(
                      "Use Public Transport",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("+30 Eco Points"),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        "Start",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Card(
                  child: ListTile(
                    leading: const Icon(Icons.recycling, color: Colors.green),
                    title: const Text("Recycle 5 Plastic Bottles"),
                    subtitle: const Text("+20 Eco Points"),
                    trailing: const Icon(Icons.check_circle_outline),
                  ),
                ),

                const SizedBox(height: 10),

                Card(
                  child: ListTile(
                    leading: const Icon(Icons.park, color: Colors.green),
                    title: const Text("Plant a Tree"),
                    subtitle: const Text("+50 Eco Points"),
                    trailing: const Icon(Icons.check_circle_outline),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _summaryItem(String emoji, String value, String label) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }

  static Widget _impactCard(
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),

            const SizedBox(height: 10),

            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            const SizedBox(height: 5),

            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
