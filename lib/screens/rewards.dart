import 'package:flutter/material.dart';
import '../models/user_data.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),

                const Text(
                  "Rewards 🎁",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                Text(
                  "Your Eco Points: ${UserData.ecoPoints}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 30),

                _rewardCard(
                  icon: Icons.eco,
                  title: "Green Starter Badge",
                  requiredPoints: 100,
                ),

                const SizedBox(height: 15),

                _rewardCard(
                  icon: Icons.workspace_premium,
                  title: "Tree Plantation Certificate",
                  requiredPoints: 500,
                ),

                const SizedBox(height: 15),

                _rewardCard(
                  icon: Icons.emoji_events,
                  title: "Eco Champion Trophy",
                  requiredPoints: 1000,
                ),

                const SizedBox(height: 15),

                _rewardCard(
                  icon: Icons.card_giftcard,
                  title: "Special Eco Voucher",
                  requiredPoints: 1500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _rewardCard({
    required IconData icon,
    required String title,
    required int requiredPoints,
  }) {
    bool unlocked = UserData.ecoPoints >= requiredPoints;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),

        leading: Icon(
          icon,
          color: unlocked ? Colors.green : Colors.grey,
          size: 35,
        ),

        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

        subtitle: Text("$requiredPoints Points"),

        trailing: unlocked
            ? ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  "Redeem",
                  style: TextStyle(color: Colors.white),
                ),
              )
            : Chip(
                label: Text(
                  "🔒 Locked",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
      ),
    );
  }
}
