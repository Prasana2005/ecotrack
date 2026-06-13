import 'package:flutter/material.dart';
import '../models/user_data.dart';

class ImpactScreen extends StatefulWidget {
  const ImpactScreen({super.key});

  @override
  State<ImpactScreen> createState() => _ImpactScreenState();
}

class _ImpactScreenState extends State<ImpactScreen> {
  void donatePoints(int points) {
    if (UserData.ecoPoints >= points) {
      setState(() {
        UserData.ecoPoints -= points;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Thank you for donating $points Eco Points 🌱")),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Not enough Eco Points")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),

            child: Column(
              children: [
                const SizedBox(height: 10),

                const Text(
                  "Real Impact 🌍",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 12),

                Text(
                  "Your Eco Points: ${UserData.ecoPoints}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 35),

                _impactCard(
                  icon: Icons.park,
                  color: Colors.green,
                  title: "Trees Planted",
                  value: "25",
                ),

                const SizedBox(height: 18),

                _impactCard(
                  icon: Icons.water_drop,
                  color: Colors.blue,
                  title: "Water Saved",
                  value: "12,500 L",
                ),

                const SizedBox(height: 18),

                _impactCard(
                  icon: Icons.eco,
                  color: Colors.lightGreen,
                  title: "CO₂ Reduced",
                  value: "350 kg",
                ),

                const SizedBox(height: 40),

                const Text(
                  "Donate Eco Points",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Support environmental projects using your earned Eco Points.",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),

                const SizedBox(height: 25),

                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  alignment: WrapAlignment.center,
                  children: [
                    _donateButton(100),
                    _donateButton(250),
                    _donateButton(500),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _impactCard({
    required IconData icon,
    required Color color,
    required String title,
    required String value,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 22),

        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(0.15),
              child: Icon(icon, color: color, size: 28),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _donateButton(int points) {
    return ElevatedButton.icon(
      onPressed: () => donatePoints(points),

      icon: const Icon(Icons.favorite),

      label: Text("Donate $points"),

      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
