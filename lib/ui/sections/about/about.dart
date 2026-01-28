import 'package:flutter/material.dart';

import '../../animated_terminal_box.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
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
                  "Flutter Developer | Mobile Engineer",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Colors.tealAccent,
                    letterSpacing: 0.5,
                  ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                ),
                const SizedBox(height: 32),
                Text(
                  "I build high-quality mobile applications that blend performance, design, "
                  "and usability. With 3 years of professional experience in Flutter and Android, "
                  "I specialize in crafting scalable, cross-platform solutions that work seamlessly "
                  "across iOS and Android devices.\n\n"
                  "I am passionate about clean architecture, state management, and modern design "
                  "patterns that ensure maintainable and future-proof code. My focus is on creating "
                  "apps that deliver real value, from startups to enterprise-level clients.\n\n"
                  "Beyond coding, I bring strong problem-solving skills, a global mindset, "
                  "and a collaborative spirit to every project — making technology not only "
                  "functional but also impactful on an international scale.",
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
