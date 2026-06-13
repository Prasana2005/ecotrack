import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../services/app_state.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  List<bool> get completed => UserData.completedChallenges;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 1;

    if (screenWidth > 1100) {
      crossAxisCount = 3;
    } else if (screenWidth > 650) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 1;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Daily Challenges 🏆",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Complete challenges and earn Eco Points",
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),

                  const SizedBox(height: 25),

                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      childAspectRatio: 1.45,
                    ),
                    children: [
                      _challengeCard(
                        index: 0,
                        icon: Icons.directions_bus,
                        title: "Use Public Transport",
                        points: "30 Points",
                        description:
                            "Take a bus or train instead of a personal vehicle.",
                        color: Colors.green,
                      ),

                      _challengeCard(
                        index: 1,
                        icon: Icons.recycling,
                        title: "Recycle 5 Bottles",
                        points: "20 Points",
                        description:
                            "Recycle at least 5 plastic bottles today.",
                        color: Colors.blue,
                      ),

                      _challengeCard(
                        index: 2,
                        icon: Icons.park,
                        title: "Plant a Tree",
                        points: "50 Points",
                        description:
                            "Plant a sapling and contribute to a greener future.",
                        color: Colors.orange,
                      ),

                      _challengeCard(
                        index: 3,
                        icon: Icons.water_drop,
                        title: "Save Water",
                        points: "25 Points",
                        description:
                            "Reduce water usage by avoiding unnecessary wastage.",
                        color: Colors.cyan,
                      ),

                      _challengeCard(
                        index: 4,
                        icon: Icons.bolt,
                        title: "Switch Off Lights",
                        points: "15 Points",
                        description: "Turn off unused lights and appliances.",
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _challengeCard({
    required int index,
    required IconData icon,
    required String title,
    required String points,
    required String description,
    required Color color,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: color.withOpacity(0.15),
                  radius: 22,
                  child: Icon(icon, color: color, size: 22),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 3),

                      Text(
                        points,
                        style: TextStyle(
                          color: color,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black54, fontSize: 12),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 38,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: completed[index] ? Colors.grey : color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: completed[index]
                    ? null
                    : () {
                        setState(() {
                          completed[index] = true;
                        });

                        AppState.addChallengePoints();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Challenge Completed! +50 Points 🌱"),
                          ),
                        );
                      },
                child: Text(
                  completed[index] ? "✓ Completed" : "Complete",
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
