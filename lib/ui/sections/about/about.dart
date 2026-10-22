import 'package:flutter/material.dart';

import '../../animated_terminal_box.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.center,
        children: [
          // LEFT SIDE - Profile Picture with Professional Styling
          if (!isMobile) ...[
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  children: [
                    // Professional Profile Picture with Decorative Ring
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Colors.tealAccent[400]!,
                            Colors.tealAccent[400]!.withOpacity(0.5),
                            Colors.tealAccent[400]!,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.tealAccent[400]!.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF1E1E1E),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/gppic.webp",
                            width: 180,
                            height: 180,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                            cacheWidth: 360,
                            cacheHeight: 360,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Terminal Box on Desktop - Right Side
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TerminalBox(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 60),
          ],

          // RIGHT SIDE - Content
          Expanded(
            flex: isMobile ? 0 : 2,
            child: Column(
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                // Profile Picture for Mobile - At Top
                if (isMobile) ...[
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Colors.tealAccent[400]!,
                          Colors.tealAccent[400]!.withOpacity(0.5),
                          Colors.tealAccent[400]!,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.tealAccent[400]!.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF1E1E1E),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/gppic.webp",
                          width: 140,
                          height: 140,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                          cacheWidth: 280,
                          cacheHeight: 280,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],

                Text(
                  "Hi, I'm",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.tealAccent[400],
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Gaurav Kumar",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0,
                      ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                ),
                const SizedBox(height: 16),
                Text(
                  "Senior Software Developer (Flutter & Android) | Architect",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: Colors.tealAccent,
                        letterSpacing: 0.5,
                      ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                ),
                const SizedBox(height: 32),
                Text(
                  "I'm a Senior Software Developer with "
                  "${DateTime.now().difference(DateTime(2023, 8, 21)).inDays ~/ 365}+ years "
                  "of experience building and shipping production apps in Flutter and native "
                  "Android. I've delivered enterprise products across agriculture, banking, "
                  "construction, workforce management and secure communications: apps that "
                  "run in the field, work offline and hold up at scale.\n\n"
                  "On mobile, I build with Clean Architecture and choose the state management "
                  "that fits the problem, whether BLoC, Riverpod, Provider or GetX. I've shipped "
                  "offline-first sync with SQLite, real-time features over WebSockets and FCM, "
                  "maps and geofencing, payments and MDM-managed enterprise apps. I care about "
                  "what users never see: predictable state, testable layers and stable releases.\n\n"
                  "Today I work across the full stack, pairing Flutter apps with .NET 8 APIs, "
                  "Angular admin portals, PostgreSQL and AWS. I own features end to end, from "
                  "database design to Play Store and App Store release, and every change goes "
                  "through UAT before it reaches production.",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white70,
                      ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                ),

                const SizedBox(height: 30),

                // Terminal Box for Mobile - Below Content
                if (isMobile) ...[
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TerminalBox(),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
