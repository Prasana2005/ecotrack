import 'package:flutter/material.dart';
import '../models/user_data.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  final List<Map<String, dynamic>> habits = [
    {
      "title": "Used Reusable Bottle",
      "completed": false,
      "icon": Icons.local_drink,
    },
    {
      "title": "Used Public Transport",
      "completed": false,
      "icon": Icons.directions_bus,
    },
    {
      "title": "Switched Off Lights",
      "completed": false,
      "icon": Icons.lightbulb,
    },
    {"title": "Saved Water", "completed": false, "icon": Icons.water_drop},
  ];

  @override
  Widget build(BuildContext context) {
    int completedCount = habits
        .where((habit) => habit["completed"] == true)
        .length;

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
                  "Habit Tracker 🌱",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                Text(
                  "$completedCount / ${habits.length} Habits Completed",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 20),

                LinearProgressIndicator(
                  value: completedCount / habits.length,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(10),
                ),

                const SizedBox(height: 25),

                Expanded(
                  child: ListView.builder(
                    itemCount: habits.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.only(bottom: 12),
                        child: CheckboxListTile(
                          secondary: Icon(
                            habits[index]["icon"],
                            color: Colors.green,
                          ),
                          title: Text(habits[index]["title"]),
                          value: habits[index]["completed"],
                          onChanged: (value) {
                            setState(() {
                              bool wasCompleted = habits[index]["completed"];

                              habits[index]["completed"] = value!;

                              if (!wasCompleted && value) {
                                UserData.ecoPoints += 10;
                                UserData.completedHabits += 1;
                              }

                              if (wasCompleted && !value) {
                                UserData.ecoPoints -= 10;
                                UserData.completedHabits -= 1;
                              }
                            });
                          },
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
