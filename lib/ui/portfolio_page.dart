import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HEADER WITH IMAGE ---
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Profile Image
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: const AssetImage("assets/gppic.jpg"),
                      backgroundColor: Colors.grey[200],
                    ),
                    const SizedBox(width: 20),
                    // Name & tagline
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "GAURAV KUMAR",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Flutter Developer | Android | MVVM & Riverpod Enthusiast",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Social Media Links
                Row(
                  children: [
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.linkedin),
                      onPressed: () {
                        // LinkedIn link
                      },
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.github),
                      onPressed: () {
                        // GitHub link
                      },
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.googlePlay),
                      onPressed: () {
                        // Play Store link
                      },
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),

            // --- ABOUT SECTION ---
            const SizedBox(height: 30),
            const Text(
              "ABOUT ME",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Passionate Flutter Developer with 2+ years of experience in mobile app development. "
              "I love solving problems, building clean UI/UX, and delivering scalable apps. "
              "Strong background in Riverpod, MVVM, and performance optimization.",
              style: TextStyle(fontSize: 16),
            ),

            // --- SKILLS ---
            const SizedBox(height: 30),
            const Text(
              "SKILLS",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const [
                Chip(label: Text("Flutter")),
                Chip(label: Text("Dart")),
                Chip(label: Text("Kotlin")),
                Chip(label: Text("Java")),
                Chip(label: Text("Riverpod")),
                Chip(label: Text("MVVM")),
                Chip(label: Text("Git & GitHub")),
                Chip(label: Text("Firebase")),
              ],
            ),

            // --- PROJECTS ---
            const SizedBox(height: 30),
            const Text(
              "PROJECTS",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            projectTile(
              "Drogo Smart Farming",
              "Agriculture app with drone-based pesticide spraying. [Live on Play Store]",
            ),
            projectTile(
              "Geo-Intelligence",
              "Task management & location tracking app for IndusInd Bank employees.",
            ),
            projectTile(
              "Secure Chat",
              "MDM-based encrypted messaging & calling app with WebSockets.",
            ),
            projectTile(
              "Nova Plus",
              "Land survey & inspection management app with charts & media uploads.",
            ),
            projectTile(
              "PMC",
              "Project management solution for construction sites with multiple roles.",
            ),
            projectTile(
              "Intent Sharing",
              "Cross-platform data sharing between native Android & Flutter.",
            ),
            projectTile(
              "Android-TV App",
              "MDM-based private app for teachers.",
            ),
            projectTile(
              "APSE",
              "Session management app for Andhra Pradesh School Education Dept.",
            ),

            // --- EDUCATION ---
            const SizedBox(height: 30),
            const Text(
              "EDUCATION",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Bachelor of Technology in Electrical Engineering\n"
              "Government Engineering College, Mainpuri (2018 - 2024)\nCGPA: 7.99",
              style: TextStyle(fontSize: 16),
            ),

            // --- CONTACT ---
            const SizedBox(height: 30),
            const Text(
              "CONTACT",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text("📍 Hyderabad, Telangana, India"),
            const Text("📧 gauravkumar613982@gmail.com"),
            const Text("📞 9368112955"),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget projectTile(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description, style: const TextStyle(fontSize: 14)),
      ),
    );
  }
}
