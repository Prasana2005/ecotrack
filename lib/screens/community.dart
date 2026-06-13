import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 700),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Community Feed 🌱",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "See what eco-warriors are doing today",
                    style: TextStyle(color: Colors.black54),
                  ),

                  const SizedBox(height: 25),

                  _postCard(
                    name: "Akshaya",
                    action:
                        "Planted a tree today and contributed to a greener future! 🌳",
                    likes: 24,
                    comments: 5,
                  ),

                  const SizedBox(height: 15),

                  _postCard(
                    name: "Rahul",
                    action:
                        "Used public transport instead of a personal vehicle today. 🚌",
                    likes: 18,
                    comments: 2,
                  ),

                  const SizedBox(height: 15),

                  _postCard(
                    name: "Priya",
                    action: "Recycled 10 plastic bottles this morning. ♻️",
                    likes: 31,
                    comments: 8,
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _postCard({
    required String name,
    required String action,
    required int likes,
    required int comments,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green.shade100,
                  child: const Icon(Icons.person, color: Colors.green),
                ),

                const SizedBox(width: 10),

                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Text(action, style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 20),

            Row(
              children: [
                const Icon(Icons.favorite, color: Colors.red),

                const SizedBox(width: 5),

                Text("$likes Likes"),

                const SizedBox(width: 25),

                const Icon(Icons.comment, color: Colors.blue),

                const SizedBox(width: 5),

                Text("$comments Comments"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
