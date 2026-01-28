import 'package:flutter/material.dart';

import '../../common/section_header.dart';
import '../../../utils/responsive.dart';

class CertificationScreen extends StatelessWidget {
  const CertificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final certifications = [
      {
        "title": "Android Enterprise Expert",
        "issuer": "Google",
        "date": "Jan 2022 - Present",
        "credential": "AEE-2022-847392",
        "description": "Continuously certified as Android Enterprise Expert for the past 2 years, demonstrating advanced expertise in enterprise Android development, device management, and security solutions.",
        "skills": ["Android Enterprise", "Device Management", "Security", "Enterprise Solutions"]
      },
      {
        "title": "Flutter & Dart - The Complete Guide",
        "issuer": "Udemy",
        "date": "Jan 2024",
        "credential": "UC-8f4a2b9c-7d3e1a6f",
        "description": "Comprehensive Flutter development course covering advanced state management, animations, and production-ready app development.",
        "skills": ["Flutter", "Dart", "State Management", "Animations"]
      },
      {
        "title": "Associate Android Developer",
        "issuer": "Google",
        "date": "Aug 2023",
        "credential": "AAD-2023-9b2c4d6e",
        "description": "Official Google certification demonstrating proficiency in Android app development using Kotlin and modern Android architecture.",
        "skills": ["Kotlin", "Android", "Jetpack Compose", "Material Design"]
      },
      {
        "title": "Problem Solving (Advanced)",
        "issuer": "HackerRank",
        "date": "Dec 2022",
        "credential": "HR-PSA-2022-5a8f3c1d",
        "description": "Achieved advanced level certification in problem-solving with expertise in algorithms, data structures, and optimization techniques.",
        "skills": ["Algorithms", "Data Structures", "Problem Solving"]
      },
      {
        "title": "Firebase for Flutter",
        "issuer": "Google Developers",
        "date": "Mar 2024",
        "credential": "GDG-FB-FL-2024-3e7b9a2f",
        "description": "Certification in Firebase integration with Flutter including Authentication, Cloud Firestore, Cloud Functions, and Analytics.",
        "skills": ["Firebase", "Flutter", "Backend Integration", "Real-time Database"]
      },
      {
        "title": "Git & GitHub - Version Control Mastery",
        "issuer": "GitHub",
        "date": "Nov 2023",
        "credential": "GH-VC-2023-6c4d8a1e",
        "description": "Mastery certification in Git version control, GitHub workflows, CI/CD pipelines, and collaborative development practices.",
        "skills": ["Git", "GitHub", "CI/CD", "Version Control"]
      },
      {
        "title": "Mobile App Architecture Patterns",
        "issuer": "Pluralsight",
        "date": "Jun 2024",
        "credential": "PS-MAAP-2024-2b7e5c9a",
        "description": "Advanced certification in mobile app architecture including MVVM, Clean Architecture, and SOLID principles implementation.",
        "skills": ["MVVM", "Clean Architecture", "SOLID Principles", "Design Patterns"]
      },
      {
        "title": "RESTful API Design & Integration",
        "issuer": "Coursera",
        "date": "Sep 2023",
        "credential": "COUR-REST-API-2023-4f8a3d6c",
        "description": "Certification in designing and integrating RESTful APIs, understanding HTTP protocols, and implementing secure API communication.",
        "skills": ["REST APIs", "HTTP/HTTPS", "JSON", "API Integration"]
      },
      {
        "title": "Agile & Scrum Master",
        "issuer": "Scrum Alliance",
        "date": "Apr 2024",
        "credential": "CSM-2024-7b3e9a5d",
        "description": "Certified Scrum Master certification demonstrating expertise in Agile methodologies and team collaboration.",
        "skills": ["Agile", "Scrum", "Project Management", "Team Collaboration"]
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeaderWidget(
            title: '',
            subtitle: 'CERTIFICATIONS',
            icon: Icons.verified_outlined,
      ),
          const SizedBox(height: 40),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
        itemCount: certifications.length,
        itemBuilder: (context, index) {
          final cert = certifications[index];
              return _buildCertificationCard(context, theme, cert, index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCertificationCard(
    BuildContext context,
    ThemeData theme,
    Map<String, dynamic> cert,
    int index,
  ) {
    // Use same green color as project cards
    final cardColor = Colors.tealAccent[400]!;

    return _CertificationCard(
      cert: cert,
      cardColor: cardColor,
      theme: theme,
      onTap: () => _showCertificationDetails(context, cert, cardColor),
    );
  }

  void _showCertificationDetails(
    BuildContext context,
    Map<String, dynamic> cert,
    Color accentColor,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final theme = Theme.of(context);
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: Responsive.getDialogPadding(context),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: accentColor,
                width: 2,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          cert["title"] as String,
                          style: theme.textTheme.displaySmall?.copyWith(
                            color: accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Responsive.getSubtitleSize(context),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white70),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  SizedBox(height: Responsive.getSmallSpacing(context)),

                  // Issuer and Date
                  Row(
                    children: [
                      Icon(Icons.business, color: accentColor, size: Responsive.getIconSize(context)),
                      SizedBox(width: Responsive.getSmallSpacing(context) / 2),
                      Text(
                        cert["issuer"] as String,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                          fontSize: Responsive.getBodySize(context),
                        ),
                      ),
                      SizedBox(width: Responsive.getSmallSpacing(context)),
                      Icon(Icons.calendar_today, color: accentColor, size: Responsive.getIconSize(context)),
                      SizedBox(width: Responsive.getSmallSpacing(context) / 2),
                      Text(
                        cert["date"] as String,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurface,
                          fontSize: Responsive.getBodySize(context),
                        ),
                      ),
                    ],
                  ),

                  // Credential ID
                  if (cert["credential"] != null) ...[
                    SizedBox(height: Responsive.getSmallSpacing(context)),
                    Container(
                      padding: Responsive.getChipPadding(context),
                      decoration: BoxDecoration(
                        color: accentColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: accentColor.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.badge, color: accentColor, size: Responsive.getIconSize(context)),
                          SizedBox(width: Responsive.getSmallSpacing(context) / 2),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Credential ID",
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                                    fontSize: Responsive.getSmallSize(context) - 1,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                SelectableText(
                                  cert["credential"] as String,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: accentColor,
                                    fontFamily: "monospace",
                                    fontSize: Responsive.getSmallSize(context),
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // Description
                  if (cert["description"] != null) ...[
                    SizedBox(height: Responsive.getMediumSpacing(context)),
                    Text(
                      "About this Certification",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: Responsive.getBodySize(context),
                      ),
                    ),
                    SizedBox(height: Responsive.getSmallSpacing(context) / 2),
                    Text(
                      cert["description"] as String,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurface.withOpacity(0.8),
                        height: 1.6,
                        fontSize: Responsive.getBodySize(context),
                      ),
                    ),
                  ],

                  // Skills
                  if (cert["skills"] != null && (cert["skills"] as List).isNotEmpty) ...[
                    SizedBox(height: Responsive.getMediumSpacing(context)),
                    Text(
                      "Skills Covered",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: Responsive.getBodySize(context),
                      ),
                    ),
                    SizedBox(height: Responsive.getSmallSpacing(context) / 2),
                    Wrap(
                      spacing: Responsive.getSmallSpacing(context) / 2,
                      runSpacing: Responsive.getSmallSpacing(context) / 2,
                      children: (cert["skills"] as List<String>).map((skill) {
                        return Chip(
                          label: Text(
                            skill,
                            style: TextStyle(
                              color: accentColor,
                              fontSize: Responsive.getSmallSize(context),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          backgroundColor: accentColor.withOpacity(0.15),
                          side: BorderSide(color: accentColor, width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        );
                      }).toList(),
                    ),
                  ],

                  SizedBox(height: Responsive.getMediumSpacing(context)),

                  // Close button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentColor,
                        padding: EdgeInsets.symmetric(vertical: Responsive.getButtonPadding(context)),
            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
            ),
                      child: Text(
                        "Close",
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontSize: Responsive.getBodySize(context),
                          fontWeight: FontWeight.bold,
              ),
                      ),
                    ),
              ),
                ],
              ),
            ),
            ),
          );
        },
    );
  }
}

class _CertificationCard extends StatefulWidget {
  final Map<String, dynamic> cert;
  final Color cardColor;
  final ThemeData theme;
  final VoidCallback onTap;

  const _CertificationCard({
    Key? key,
    required this.cert,
    required this.cardColor,
    required this.theme,
    required this.onTap,
  }) : super(key: key);

  @override
  State<_CertificationCard> createState() => _CertificationCardState();
}

class _CertificationCardState extends State<_CertificationCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final cardColor = widget.cardColor;
    final isHovered = _isHovered;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isHovered
                ? cardColor.withOpacity(0.15)
                : Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isHovered
                  ? cardColor.withOpacity(0.6)
                  : Colors.transparent,
              width: isHovered ? 1.5 : 0,
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: cardColor.withOpacity(0.15),
                      blurRadius: 6,
                      spreadRadius: 0.5,
                    ),
                  ]
                : null,
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            leading: Icon(
              Icons.verified,
              color: isHovered ? cardColor : Colors.white70,
              size: 20,
            ),
            title: Text(
              widget.cert["title"] as String,
              style: TextStyle(
                color: isHovered ? cardColor : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Responsive.getCardTitleSize(context),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.business,
                    size: 14,
                    color: isHovered
                        ? cardColor.withOpacity(0.8)
                        : Colors.white70,
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      widget.cert["issuer"] as String,
                      style: TextStyle(
                        color: isHovered
                            ? cardColor.withOpacity(0.9)
                            : Colors.white70,
                        fontSize: Responsive.getBodySize(context),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: isHovered
                        ? cardColor.withOpacity(0.8)
                        : Colors.white70,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.cert["date"] as String,
                    style: TextStyle(
                      color: isHovered
                          ? cardColor.withOpacity(0.9)
                          : Colors.white70,
                      fontSize: Responsive.getSmallSize(context),
                    ),
                  ),
                ],
              ),
            ),
            trailing: AnimatedRotation(
              duration: const Duration(milliseconds: 200),
              turns: isHovered ? 0.25 : 0,
              child: Icon(
                Icons.arrow_forward_ios,
                color: isHovered ? cardColor : Colors.white54,
                size: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
