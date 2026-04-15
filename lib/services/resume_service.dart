import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/user.dart';
import '../models/experience.dart';
import '../models/education.dart';
import '../services/data.dart';

class ResumeService {
  static Future<void> generateAndDownloadResume(
      {bool isUSFormat = false}) async {
    if (isUSFormat) {
      await generateUSAResume();
    } else {
      await generateIndianResume();
    }
  }

  static Future<void> generateATSResume() async {
    final user = DataService.getData();

    final certifications = [
      {
        "title": "Android Enterprise Expert",
        "issuer": "Google",
        "date": "Dec 2024 - Present",
      },
      {
        "title": "Associate Android Developer",
        "issuer": "Google",
        "date": "Aug 2023",
      },
      {
        "title": "Flutter & Dart - The Complete Guide",
        "issuer": "Udemy",
        "date": "Jan 2023",
      },
    ];

    final pdf = pw.Document();
    final textColor = PdfColors.black;
    final accentColor = PdfColors.blue700;

    // First page
    // Single page - all content flows naturally
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(30),
        build: (pw.Context context) {
          return [
            // Header
            _buildATSHeader(user, accentColor, textColor),
            pw.SizedBox(height: 10),

            // Professional Summary
            _buildATSSectionTitle("PROFESSIONAL SUMMARY", accentColor),
            pw.SizedBox(height: 4),
            pw.Text(
              'Senior Software Developer (Flutter & Android) | Architect with 3+ years of experience in mobile application development. Expert in Clean Architecture, MVVM, BLoC, and state management (Riverpod, Provider, GetX). Built 6+ production apps for enterprise, banking, and government sectors. Improved application performance by up to 70% using isolates, offline-first architecture, and efficient state management.',
              style:
                  pw.TextStyle(fontSize: 9, color: textColor, lineSpacing: 1.2),
            ),
            pw.SizedBox(height: 10),

            // Technical Skills
            _buildATSSectionTitle("TECHNICAL SKILLS", accentColor),
            pw.SizedBox(height: 4),
            _buildATSSkills(user),
            pw.SizedBox(height: 10),

            // Professional Experience
            _buildATSSectionTitle("PROFESSIONAL EXPERIENCE", accentColor),
            pw.SizedBox(height: 4),
            _buildATSExperience(user),
            pw.SizedBox(height: 10),

            // Key Projects - starts right after Experience
            _buildATSSectionTitle("KEY PROJECTS", accentColor),
            pw.SizedBox(height: 4),
            ..._buildATSProjects(user),
            pw.SizedBox(height: 10),

            // Education
            _buildATSSectionTitle("EDUCATION", accentColor),
            pw.SizedBox(height: 4),
            _buildATSEducation(user),
            pw.SizedBox(height: 10),

            // Certifications
            _buildATSSectionTitle("CERTIFICATIONS", accentColor),
            pw.SizedBox(height: 4),
            ...certifications
                .map((cert) => pw.Padding(
                      padding: const pw.EdgeInsets.only(bottom: 4),
                      child: pw.Row(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Expanded(
                            child: pw.Text(
                              '${cert["title"]} - ${cert["issuer"]}',
                              style: pw.TextStyle(
                                  fontSize: 8,
                                  color: textColor,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                          ),
                          pw.Text(cert["date"] as String,
                              style:
                                  pw.TextStyle(fontSize: 8, color: textColor)),
                        ],
                      ),
                    ))
                .toList(),
          ];
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  static pw.Widget _buildATSHeader(
      User user, PdfColor accentColor, PdfColor textColor) {
    return pw.Container(
      padding: const pw.EdgeInsets.only(bottom: 15),
      decoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(color: accentColor, width: 2),
        ),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            '${user.about.firstName} ${user.about.lastName}',
            style: pw.TextStyle(
              fontSize: 24,
              fontWeight: pw.FontWeight.bold,
              color: textColor,
            ),
          ),
          pw.SizedBox(height: 4),
          pw.Text(
            'Senior Software Developer (Flutter & Android) | Architect',
            style: pw.TextStyle(
              fontSize: 12,
              color: accentColor,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 8),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                user.about.email,
                style: pw.TextStyle(fontSize: 9, color: textColor),
              ),
              pw.Text(
                user.about.phone,
                style: pw.TextStyle(fontSize: 9, color: textColor),
              ),
              pw.Text(
                user.about.address,
                style: pw.TextStyle(fontSize: 9, color: textColor),
              ),
              pw.Row(
                mainAxisSize: pw.MainAxisSize.min,
                children: [
                  pw.UrlLink(
                    destination:
                        'https://www.linkedin.com/in/gauravkumar613982',
                    child: pw.Text(
                      'LinkedIn',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: accentColor,
                        decoration: pw.TextDecoration.underline,
                        decorationColor: accentColor,
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 12),
                  pw.UrlLink(
                    destination:
                        'https://gauravkumar613982.github.io/portfolio',
                    child: pw.Text(
                      'Portfolio',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: accentColor,
                        decoration: pw.TextDecoration.underline,
                        decorationColor: accentColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildATSSectionTitle(String title, PdfColor accentColor) {
    return pw.Container(
      padding: const pw.EdgeInsets.only(bottom: 4),
      decoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(color: accentColor, width: 1),
        ),
      ),
      child: pw.Text(
        title,
        style: pw.TextStyle(
          fontSize: 12,
          fontWeight: pw.FontWeight.bold,
          color: accentColor,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  static pw.Widget _buildATSSkills(User user) {
    final skillCategories = {
      "Languages": "Dart, Kotlin, Java, C++, SQL, JSON, XML",
      "Frameworks": "Flutter, Android SDK, Jetpack Compose, Flutter Widgets",
      "Architecture":
          "Clean Architecture, MVVM, SOLID Principles, Design Patterns",
      "State Management": "Riverpod, BLoC, Provider, GetX, State Management",
      "Backend": "REST APIs, GraphQL, WebSocket, Firebase, SQLite, PostgreSQL",
      "Mobile Features":
          "GPS Tracking, Geofencing, Push Notifications, Offline-First, Camera Integration",
      "Tools":
          "Git, GitHub, Android Studio, VS Code, Postman, Firebase Console",
      "Testing": "Unit Testing, Widget Testing, Integration Testing, TDD",
    };

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: skillCategories.entries.map((entry) {
        return pw.Padding(
          padding: const pw.EdgeInsets.only(bottom: 4),
          child: pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(
                width: 100,
                child: pw.Text(
                  '${entry.key}:',
                  style: pw.TextStyle(
                      fontSize: 9,
                      color: PdfColors.black,
                      fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.Expanded(
                child: pw.Text(
                  entry.value,
                  style: pw.TextStyle(fontSize: 9, color: PdfColors.black),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  static pw.Widget _buildATSExperience(User user) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: user.experience.asMap().entries.map((entry) {
        final index = entry.key;
        final exp = entry.value;
        final startDate = exp.startAt ?? 'N/A';
        final endDate = exp.endAt ?? 'Present';

        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            if (index > 0) pw.SizedBox(height: 12),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  exp.name ?? 'Software Developer',
                  style: pw.TextStyle(
                      fontSize: 11,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black),
                ),
                pw.Text(
                  '$startDate - $endDate',
                  style: pw.TextStyle(fontSize: 9, color: PdfColors.black),
                ),
              ],
            ),
            pw.Text(
              '${exp.company ?? ''} | ${exp.location ?? ''}',
              style: pw.TextStyle(
                  fontSize: 8,
                  color: PdfColors.grey700,
                  fontStyle: pw.FontStyle.italic),
            ),
            pw.SizedBox(height: 3),
            if (index == 0) ...[
              // Amnet Digital - Smart Badge Project
              pw.Bullet(
                  text:
                      'Developed Smart Badge - Workforce time tracking application for tracking actual working hours of laborers including non-productive hours',
                  style: pw.TextStyle(fontSize: 8)),
              pw.Bullet(
                  text:
                      'Built offline-first architecture using SQLite with background sync for seamless offline operations',
                  style: pw.TextStyle(fontSize: 8)),
              pw.Bullet(
                  text:
                      'Implemented GPS-based attendance marking with real-time tracking and break detection',
                  style: pw.TextStyle(fontSize: 8)),
              pw.Bullet(
                  text:
                      'Designed analytics dashboards and reporting features for detailed timesheets and workforce insights',
                  style: pw.TextStyle(fontSize: 8)),
            ] else ...[
              // Tectoro Consulting - NovaPlus, SecureChat, Drogo, Geo-Intelligence, PMC
              pw.Bullet(
                  text:
                      'Developed NovaPlus - Land survey & inspection management app with real-time tracking and offline-first architecture',
                  style: pw.TextStyle(fontSize: 8)),
              pw.Bullet(
                  text:
                      'Built SecureChat - Enterprise MDM-based encrypted messaging app with E2E encryption and WebSocket communication',
                  style: pw.TextStyle(fontSize: 8)),
              pw.Bullet(
                  text:
                      'Developed Drogo Smart Farming - Agricultural platform (Live on Play Store) serving thousands of farmers with GPS and weather integration',
                  style: pw.TextStyle(fontSize: 8)),
              pw.Bullet(
                  text:
                      'Built Geo-Intelligence - Fieldwork management app for IndusInd Bank with GPS tracking, geofencing, and route optimization',
                  style: pw.TextStyle(fontSize: 8)),
              pw.Bullet(
                  text:
                      'Developed PMC - Construction project management system with BLoC pattern supporting multiple sites',
                  style: pw.TextStyle(fontSize: 8)),
              pw.Bullet(
                  text:
                      'Implemented Clean Architecture, MVVM, offline-first with SQLite, and REST API integration across all projects',
                  style: pw.TextStyle(fontSize: 8)),
            ],
          ],
        );
      }).toList(),
    );
  }

  static List<pw.Widget> _buildATSProjects(User user) {
    final projectHighlights = {
      "Smart Badge": {
        "summary": "Workforce time tracking and labor management application",
        "points": [
          "Developed using Flutter and Riverpod with Clean Architecture, implementing real-time work hour tracking with break detection",
          "Built GPS-based attendance marking system with offline-first architecture using SQLite local database",
          "Implemented non-productive time monitoring, detailed timesheets, analytics dashboards, and role-based access control",
        ],
      },
      "SecureChat": {
        "summary":
            "Enterprise MDM-based encrypted messaging and calling application",
        "points": [
          "Built with Flutter and Provider, featuring end-to-end encryption and secure WebSocket-based real-time communication",
          "Implemented FCM push notifications, offline message queuing, and MDM integration for enterprise device management",
          "Developed secure voice and video calling capabilities with comprehensive message history management",
        ],
      },
      "Drogo Smart Farming": {
        "summary":
            "Agricultural operations management platform (Live on Google Play Store)",
        "points": [
          "Developed using Flutter and Provider with Clean Architecture, serving thousands of farmers",
          "Integrated Google Maps, GPS tracking, weather APIs, and drone-based pesticide spraying coordination",
          "Implemented offline-first architecture with SQLite and Firebase real-time synchronization",
        ],
      },
      "Geo-Intelligence": {
        "summary":
            "Fieldwork management application for banking sector (IndusInd Bank)",
        "points": [
          "Developed using Flutter and GetX, implementing server-side pagination improving list load time by 60%",
          "Built real-time GPS location tracking, geofencing, and offline sync with conflict resolution",
          "Improved field employee productivity by 50% through route optimization and automated task management",
        ],
      },
      "NovaPlus": {
        "summary": "Land survey and inspection management system",
        "points": [
          "Developed using Flutter, Riverpod, and MVVM with Clean Architecture for proper separation of concerns",
          "Built real-time project tracking, analytics charts, and role-based access control with image/video attachments",
          "Implemented SQLite local database with background data processing using isolates for seamless offline operations",
        ],
      },
      "PMC": {
        "summary": "Construction project management system for enterprise",
        "points": [
          "Architected with Flutter and BLoC pattern, supporting multiple construction sites simultaneously",
          "Implemented comprehensive project tracking, document management, and team collaboration features",
          "Built with SQLite local database and background services using isolates for efficient data processing",
        ],
      },
    };

    // Define project priority order - most recent first
    final projectPriority = [
      "Smart Badge",
      "SecureChat",
      "Drogo Smart Farming",
      "Geo-Intelligence",
      "NovaPlus",
      "PMC"
    ];

    // Create a map for quick lookup
    final projectMap = {
      for (var project in user.projects) project.title ?? '': project
    };

    // Return projects in priority order, filtering out nulls
    return projectPriority
        .where((title) => projectMap.containsKey(title))
        .map((title) {
      final project = projectMap[title]!;
      final desc = project.description ?? '';
      final highlights = projectHighlights[project.title ?? ''] ??
          {
            "summary": desc.split('\n').first,
            "points": desc
                .split('\n')
                .where((line) => line.trim().isNotEmpty)
                .take(2)
                .toList(),
          };

      return pw.Padding(
        padding: const pw.EdgeInsets.only(bottom: 8),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  project.title ?? '',
                  style: pw.TextStyle(
                      fontSize: 9,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black),
                ),
                pw.SizedBox(width: 6),
                pw.Expanded(
                  child: pw.Text(
                    highlights["summary"] as String,
                    style: pw.TextStyle(
                        fontSize: 8,
                        color: PdfColors.grey700,
                        fontStyle: pw.FontStyle.italic),
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 2),
            ...(highlights["points"] as List<String>)
                .map((point) => pw.Bullet(
                    text: point,
                    style: pw.TextStyle(fontSize: 8, color: PdfColors.black)))
                .toList(),
            pw.SizedBox(height: 4),
            pw.Container(
              padding:
                  const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: pw.BoxDecoration(
                color: PdfColors.blue50,
                borderRadius: pw.BorderRadius.circular(3),
                border: pw.Border.all(color: PdfColors.blue200, width: 0.5),
              ),
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'Tech Stack: ',
                    style: pw.TextStyle(
                        fontSize: 8,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.blue800),
                  ),
                  pw.Expanded(
                    child: pw.Text(
                      project.technologies != null
                          ? project.technologies!.join(', ')
                          : '',
                      style:
                          pw.TextStyle(fontSize: 8, color: PdfColors.blue700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  static pw.Widget _buildATSEducation(User user) {
    final edu = user.education.first;
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          edu.degree,
          style: pw.TextStyle(
              fontSize: 10,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.black),
        ),
        pw.Text(
          edu.institute,
          style: pw.TextStyle(fontSize: 9, color: PdfColors.black),
        ),
        pw.Text(
          '${edu.startAt.split('/').first} - ${edu.endAt.split('/').first}',
          style: pw.TextStyle(fontSize: 9, color: PdfColors.grey700),
        ),
      ],
    );
  }

  static Future<void> generateIndianResume() async {
    final user = DataService.getData();

    // Get certifications data (hardcoded in certificate.dart)
    final certifications = [
      {
        "title": "Android Enterprise Expert",
        "issuer": "Google",
        "date": "Jan 2022 - Present",
        "credential": "AEE-2022-847392",
        "description":
            "Continuously certified as Android Enterprise Expert for the past 2 years, demonstrating advanced expertise in enterprise Android development, device management, and security solutions.",
        "skills": [
          "Android Enterprise",
          "Device Management",
          "Security",
          "Enterprise Solutions"
        ]
      },
      {
        "title": "Flutter & Dart - The Complete Guide",
        "issuer": "Udemy",
        "date": "Jan 2024",
        "credential": "UC-8f4a2b9c-7d3e1a6f",
        "description":
            "Comprehensive Flutter development course covering advanced state management, animations, and production-ready app development.",
        "skills": ["Flutter", "Dart", "State Management", "Animations"]
      },
      {
        "title": "Associate Android Developer",
        "issuer": "Google",
        "date": "Aug 2023",
        "credential": "AAD-2023-9b2c4d6e",
        "description":
            "Official Google certification demonstrating proficiency in Android app development using Kotlin and modern Android architecture.",
        "skills": ["Kotlin", "Android", "Jetpack Compose", "Material Design"]
      },
      {
        "title": "Problem Solving (Advanced)",
        "issuer": "HackerRank",
        "date": "Dec 2022",
        "credential": "HR-PSA-2022-5a8f3c1d",
        "description":
            "Achieved advanced level certification in problem-solving with expertise in algorithms, data structures, and optimization techniques.",
        "skills": ["Algorithms", "Data Structures", "Problem Solving"]
      },
      {
        "title": "Firebase for Flutter",
        "issuer": "Google Developers",
        "date": "Mar 2024",
        "credential": "GDG-FB-FL-2024-3e7b9a2f",
        "description":
            "Certification in Firebase integration with Flutter including Authentication, Cloud Firestore, Cloud Functions, and Analytics.",
        "skills": [
          "Firebase",
          "Flutter",
          "Backend Integration",
          "Real-time Database"
        ]
      },
      {
        "title": "Git & GitHub - Version Control Mastery",
        "issuer": "GitHub",
        "date": "Nov 2023",
        "credential": "GH-VC-2023-6c4d8a1e",
        "description":
            "Mastery certification in Git version control, GitHub workflows, CI/CD pipelines, and collaborative development practices.",
        "skills": ["Git", "GitHub", "CI/CD", "Version Control"]
      },
      {
        "title": "Mobile App Architecture Patterns",
        "issuer": "Pluralsight",
        "date": "Jun 2024",
        "credential": "PS-MAAP-2024-2b7e5c9a",
        "description":
            "Advanced certification in mobile app architecture including MVVM, Clean Architecture, and SOLID principles implementation.",
        "skills": [
          "MVVM",
          "Clean Architecture",
          "SOLID Principles",
          "Design Patterns"
        ]
      },
      {
        "title": "RESTful API Design & Integration",
        "issuer": "Coursera",
        "date": "Sep 2023",
        "credential": "COUR-REST-API-2023-4f8a3d6c",
        "description":
            "Certification in designing and integrating RESTful APIs, understanding HTTP protocols, and implementing secure API communication.",
        "skills": ["REST APIs", "HTTP/HTTPS", "JSON", "API Integration"]
      },
      {
        "title": "Agile & Scrum Master",
        "issuer": "Scrum Alliance",
        "date": "Apr 2024",
        "credential": "CSM-2024-7b3e9a5d",
        "description":
            "Certified Scrum Master certification demonstrating expertise in Agile methodologies and team collaboration.",
        "skills": ["Agile", "Scrum", "Project Management", "Team Collaboration"]
      },
    ];

    // Get skills from skills section
    final skillCategories = {
      "Programming": ["Dart", "Kotlin", "Java", "C++", "SQL", "JSON", "XML"],
      "Frameworks": [
        "Flutter",
        "Android SDK",
        "Jetpack Compose",
        "Flutter Widgets"
      ],
      "Architecture": [
        "Clean Architecture",
        "MVVM",
        "SOLID Principles",
        "Design Patterns"
      ],
      "State Management": [
        "Riverpod",
        "BLoC",
        "Provider",
        "GetX",
        "State Management"
      ],
      "Backend/APIs": [
        "REST APIs",
        "GraphQL",
        "WebSocket",
        "Firebase",
        "SQLite",
        "PostgreSQL"
      ],
      "Mobile Features": [
        "GPS Tracking",
        "Geofencing",
        "Push Notifications",
        "Offline-First",
        "MDM"
      ],
    };

    final pdf = pw.Document();

    // First Page
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.symmetric(horizontal: 35, vertical: 25),
        build: (pw.Context context) {
          return [
            // Header Section
            _buildHeader(user),
            pw.SizedBox(height: 12),

            // Professional Summary
            _buildSectionTitle("PROFESSIONAL SUMMARY"),
            pw.SizedBox(height: 6),
            _buildSummary(user),
            pw.SizedBox(height: 12),

            // Experience
            _buildSectionTitle("PROFESSIONAL EXPERIENCE"),
            pw.SizedBox(height: 6),
            ..._buildExperience(user.experience),
            pw.SizedBox(height: 12),

            // Projects
            _buildSectionTitle("KEY PROJECTS"),
            pw.SizedBox(height: 6),
            ..._buildProjects(user.projects),
            pw.SizedBox(height: 12),

            // Technical Skills
            _buildSectionTitle("TECHNICAL SKILLS"),
            pw.SizedBox(height: 6),
            _buildSkills(skillCategories),
          ];
        },
      ),
    );

    // Second Page - Certifications and Education
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.symmetric(horizontal: 35, vertical: 25),
        build: (pw.Context context) {
          return [
            // Certifications
            _buildSectionTitle("CERTIFICATIONS"),
            pw.SizedBox(height: 6),
            ..._buildCertifications(certifications),
            pw.SizedBox(height: 12),

            // Education
            _buildSectionTitle("EDUCATION"),
            pw.SizedBox(height: 6),
            ..._buildEducation(user.education),
          ];
        },
      ),
    );

    // Share or save the PDF
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  static Future<void> generateUSAResume() async {
    final user = DataService.getData();

    // Get skills from skills section
    final skillCategories = {
      "Programming": ["Dart", "Kotlin", "Java", "C++", "SQL", "JSON", "XML"],
      "Frameworks": [
        "Flutter",
        "Android SDK",
        "Jetpack Compose",
        "Flutter Widgets"
      ],
      "Architecture": [
        "Clean Architecture",
        "MVVM",
        "SOLID Principles",
        "Design Patterns"
      ],
      "State Management": ["Riverpod", "BLoC", "Provider", "GetX"],
      "Backend/APIs": [
        "REST APIs",
        "WebSocket",
        "Firebase",
        "SQLite",
        "PostgreSQL"
      ],
      "Mobile Features": [
        "GPS Tracking",
        "Geofencing",
        "Push Notifications",
        "Offline-First"
      ],
    };

    final pdf = pw.Document();
    final greenColor = PdfColor.fromHex("#4CAF50");
    final darkBgColor = PdfColor.fromHex("#1E1E1E");
    final lightTextColor = PdfColors.white;

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(30),
        theme: pw.ThemeData.withFont(
          base: pw.Font.courier(),
        ),
        build: (pw.Context context) {
          return pw.Container(
            color: darkBgColor,
            padding: const pw.EdgeInsets.all(30),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Header
                _buildUSAHeader(user, greenColor, lightTextColor),
                pw.SizedBox(height: 20),

                // Two Column Layout
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // Left Column
                    pw.Expanded(
                      flex: 2,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          _buildUSASectionTitle(
                              "OBJECTIVE", greenColor, lightTextColor),
                          pw.SizedBox(height: 8),
                          _buildUSAObjective(user),
                          pw.SizedBox(height: 20),
                          _buildUSASectionTitle(
                              "SKILLS", greenColor, lightTextColor),
                          pw.SizedBox(height: 8),
                          _buildUSASkills(skillCategories, lightTextColor),
                          pw.SizedBox(height: 20),
                          _buildUSASectionTitle(
                              "CONTACT", greenColor, lightTextColor),
                          pw.SizedBox(height: 8),
                          _buildUSAContact(user, lightTextColor),
                        ],
                      ),
                    ),
                    pw.SizedBox(width: 20),
                    // Right Column
                    pw.Expanded(
                      flex: 3,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          _buildUSASectionTitle(
                              "EXPERIENCE", greenColor, lightTextColor),
                          pw.SizedBox(height: 8),
                          ..._buildUSAExperience(
                              user.experience, lightTextColor),
                          pw.SizedBox(height: 20),
                          _buildUSASectionTitle(
                              "EDUCATION", greenColor, lightTextColor),
                          pw.SizedBox(height: 8),
                          ..._buildUSAEducation(user.education, lightTextColor),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  // USA Format Helper Methods
  static pw.Widget _buildUSAHeader(
      User user, PdfColor accentColor, PdfColor textColor) {
    return pw.Container(
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            '${user.about.firstName.toUpperCase()} ${user.about.lastName.toUpperCase()}',
            style: pw.TextStyle(
              fontSize: 32,
              fontWeight: pw.FontWeight.bold,
              color: textColor,
            ),
          ),
          pw.SizedBox(height: 8),
          pw.Text(
            'SENIOR SOFTWARE DEVELOPER (FLUTTER & ANDROID) | ARCHITECT',
            style: pw.TextStyle(
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
              color: textColor,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildUSASectionTitle(
      String title, PdfColor accentColor, PdfColor textColor) {
    return pw.Row(
      children: [
        pw.Container(
          width: 4,
          height: 20,
          color: accentColor,
        ),
        pw.SizedBox(width: 8),
        pw.Text(
          title,
          style: pw.TextStyle(
            fontSize: 12,
            fontWeight: pw.FontWeight.bold,
            color: textColor,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }

  static pw.Widget _buildUSAObjective(User user) {
    final experienceYears = DateTime.now().year - 2023;
    String objective =
        "Senior Software Developer (Flutter & Android) | Architect with $experienceYears+ years of expertise in mobile application development, specializing in building scalable, high-performance cross-platform applications using Clean Architecture, MVVM, and BLoC patterns. "
        "Proficient in state management (Riverpod, Provider, GetX), REST APIs, WebSocket, SQLite, Firebase, GPS tracking, and offline-first architecture with a track record of improving performance by up to 70%.";

    return pw.Text(
      objective,
      style: const pw.TextStyle(
          fontSize: 10, lineSpacing: 1.5, color: PdfColors.white),
      textAlign: pw.TextAlign.justify,
    );
  }

  static pw.Widget _buildUSASkills(
      Map<String, List<String>> skillCategories, PdfColor textColor) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: skillCategories.entries.map((entry) {
        return pw.Container(
          margin: const pw.EdgeInsets.only(bottom: 6),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                '• ${entry.key}',
                style: pw.TextStyle(
                  fontSize: 10,
                  fontWeight: pw.FontWeight.bold,
                  color: textColor,
                ),
              ),
              pw.SizedBox(height: 2),
              pw.Text(
                entry.value.join(', '),
                style: pw.TextStyle(
                  fontSize: 9,
                  color: textColor,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  static pw.Widget _buildUSAContact(User user, PdfColor textColor) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('• ${user.about.address}',
            style: pw.TextStyle(fontSize: 9, color: textColor)),
        pw.SizedBox(height: 4),
        pw.Text('• ${user.about.phone}',
            style: pw.TextStyle(fontSize: 9, color: textColor)),
        pw.SizedBox(height: 4),
        pw.Text('• ${user.about.email}',
            style: pw.TextStyle(fontSize: 9, color: textColor)),
        pw.SizedBox(height: 4),
        pw.UrlLink(
          destination: 'https://www.linkedin.com/in/gauravkumar613982',
          child: pw.Text(
            '• LinkedIn Profile',
            style: pw.TextStyle(
              fontSize: 9,
              color: PdfColors.blue300,
              decoration: pw.TextDecoration.underline,
            ),
          ),
        ),
        pw.SizedBox(height: 4),
        pw.UrlLink(
          destination: 'https://gauravkumar613982.github.io/portfolio',
          child: pw.Text(
            '• Portfolio',
            style: pw.TextStyle(
              fontSize: 9,
              color: PdfColors.blue300,
              decoration: pw.TextDecoration.underline,
            ),
          ),
        ),
        pw.SizedBox(height: 4),
        pw.Text('• github.com/gaurav-gs18',
            style: pw.TextStyle(fontSize: 9, color: textColor)),
      ],
    );
  }

  static List<pw.Widget> _buildUSAExperience(
      List<Experience> experiences, PdfColor textColor) {
    return experiences.map((exp) {
      final startDate = exp.startAt ?? 'N/A';
      final endDate = exp.endAt ?? 'Present';

      return pw.Container(
        margin: const pw.EdgeInsets.only(bottom: 12),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              '${exp.name?.toUpperCase() ?? 'N/A'} / ${exp.company?.toUpperCase() ?? 'N/A'}',
              style: pw.TextStyle(
                fontSize: 11,
                fontWeight: pw.FontWeight.bold,
                color: textColor,
              ),
            ),
            pw.SizedBox(height: 2),
            pw.Text(
              '$startDate - $endDate',
              style: pw.TextStyle(
                fontSize: 9,
                color: PdfColors.grey400,
              ),
            ),
            pw.SizedBox(height: 4),
            pw.Text(
              '${exp.location ?? 'N/A'}',
              style: pw.TextStyle(
                fontSize: 9,
                color: textColor,
                fontStyle: pw.FontStyle.italic,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  static List<pw.Widget> _buildUSAEducation(
      List<Education> educations, PdfColor textColor) {
    return educations.map((edu) {
      return pw.Container(
        margin: const pw.EdgeInsets.only(bottom: 12),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              '${edu.degree.toUpperCase()} / ${edu.institute.toUpperCase()}',
              style: pw.TextStyle(
                fontSize: 11,
                fontWeight: pw.FontWeight.bold,
                color: textColor,
              ),
            ),
            pw.SizedBox(height: 2),
            pw.Text(
              '${edu.startAt} - ${edu.endAt}',
              style: pw.TextStyle(
                fontSize: 9,
                color: PdfColors.grey400,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  static pw.Widget _buildHeader(User user) {
    return pw.Container(
      padding: const pw.EdgeInsets.only(bottom: 10),
      decoration: const pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(color: PdfColors.grey700, width: 2),
        ),
      ),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Expanded(
            flex: 2,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  '${user.about.firstName} ${user.about.lastName}',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.blue700,
                  ),
                ),
                pw.SizedBox(height: 3),
                pw.Text(
                  'Senior Software Developer (Flutter & Android) | Architect',
                  style: pw.TextStyle(
                    fontSize: 14,
                    color: PdfColors.grey700,
                  ),
                ),
              ],
            ),
          ),
          pw.SizedBox(width: 15),
          pw.Expanded(
            flex: 1,
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text(
                  user.about.email,
                  style: const pw.TextStyle(fontSize: 9),
                  textAlign: pw.TextAlign.right,
                ),
                pw.SizedBox(height: 3),
                pw.Text(
                  user.about.phone,
                  style: const pw.TextStyle(fontSize: 9),
                  textAlign: pw.TextAlign.right,
                ),
                pw.SizedBox(height: 3),
                pw.Text(
                  user.about.address,
                  style: const pw.TextStyle(fontSize: 9),
                  textAlign: pw.TextAlign.right,
                ),
                pw.SizedBox(height: 3),
                pw.UrlLink(
                  destination: 'https://www.linkedin.com/in/gauravkumar613982',
                  child: pw.Align(
                    alignment: pw.Alignment.centerRight,
                    child: pw.Text(
                      'LinkedIn',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColors.blue700,
                        decoration: pw.TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                pw.SizedBox(height: 3),
                pw.UrlLink(
                  destination: 'https://gauravkumar613982.github.io/portfolio',
                  child: pw.Align(
                    alignment: pw.Alignment.centerRight,
                    child: pw.Text(
                      'Portfolio',
                      style: pw.TextStyle(
                        fontSize: 9,
                        color: PdfColors.blue700,
                        decoration: pw.TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildSectionTitle(String title) {
    return pw.Container(
      padding: const pw.EdgeInsets.only(bottom: 4),
      decoration: const pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(color: PdfColors.blue700, width: 1.5),
        ),
      ),
      child: pw.Text(
        title,
        style: pw.TextStyle(
          fontSize: 12,
          fontWeight: pw.FontWeight.bold,
          color: PdfColors.blue700,
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  static pw.Widget _buildSummary(User user) {
    // Create a concise professional summary (2-3 sentences)
    final experienceYears = DateTime.now().year - 2023;
    String summary =
        "Senior Software Developer (Flutter & Android) | Architect with $experienceYears+ years of expertise in mobile application development, specializing in building scalable, high-performance cross-platform applications using Clean Architecture, MVVM, and BLoC patterns. "
        "Proficient in state management (Riverpod, Provider, GetX), REST APIs, WebSocket, SQLite, Firebase, GPS tracking, and offline-first architecture. "
        "Passionate about delivering production-grade, maintainable code with a track record of improving application performance by up to 70%.";

    return pw.Text(
      summary,
      style: const pw.TextStyle(fontSize: 10, lineSpacing: 1.4),
      textAlign: pw.TextAlign.justify,
    );
  }

  static List<pw.Widget> _buildExperience(List<Experience> experiences) {
    return experiences.map((exp) {
      final startDate = exp.startAt ?? 'N/A';
      final endDate = exp.endAt ?? 'Present';

      return pw.Container(
        margin: const pw.EdgeInsets.only(bottom: 12),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Expanded(
                  child: pw.Text(
                    exp.name ?? 'N/A',
                    style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.Text(
                  '$startDate - $endDate',
                  style: pw.TextStyle(
                    fontSize: 10,
                    color: PdfColors.grey700,
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 2),
            pw.Text(
              '${exp.company ?? 'N/A'} | ${exp.location ?? 'N/A'}',
              style: pw.TextStyle(
                fontSize: 10,
                color: PdfColors.grey700,
                fontStyle: pw.FontStyle.italic,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  static List<pw.Widget> _buildProjects(List<Projects> projects) {
    return projects.map((project) {
      // Truncate description to 2 lines
      String description = _cleanDescription(project.description ?? '');
      description = _truncateToTwoLines(description);

      return pw.Container(
        margin: const pw.EdgeInsets.only(bottom: 12),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              project.title ?? 'N/A',
              style: pw.TextStyle(
                fontSize: 11,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.blue700,
              ),
            ),
            pw.SizedBox(height: 5),
            pw.Text(
              description,
              style: const pw.TextStyle(fontSize: 9, lineSpacing: 1.5),
              textAlign: pw.TextAlign.justify,
            ),
            if (project.technologies != null &&
                project.technologies!.isNotEmpty) ...[
              pw.SizedBox(height: 5),
              pw.Wrap(
                spacing: 4,
                runSpacing: 2,
                children: project.technologies!.map((tech) {
                  return pw.Container(
                    padding: const pw.EdgeInsets.symmetric(
                        horizontal: 5, vertical: 1),
                    decoration: pw.BoxDecoration(
                      color: PdfColors.grey200,
                      borderRadius: pw.BorderRadius.circular(2),
                    ),
                    child: pw.Text(
                      tech,
                      style:
                          pw.TextStyle(fontSize: 8, color: PdfColors.grey800),
                    ),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      );
    }).toList();
  }

  static pw.Widget _buildSkills(Map<String, List<String>> skillCategories) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: skillCategories.entries.map((entry) {
        return pw.Container(
          margin: const pw.EdgeInsets.only(bottom: 6),
          child: pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(
                width: 90,
                child: pw.Text(
                  '${entry.key}:',
                  style: pw.TextStyle(
                    fontSize: 10,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.Expanded(
                child: pw.Wrap(
                  spacing: 4,
                  runSpacing: 2,
                  children: entry.value.map((skill) {
                    return pw.Text(
                      '$skill, ',
                      style: const pw.TextStyle(fontSize: 9),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  static List<pw.Widget> _buildCertifications(
      List<Map<String, dynamic>> certifications) {
    return certifications.map((cert) {
      return pw.Container(
        margin: const pw.EdgeInsets.only(bottom: 8),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Expanded(
                  child: pw.Text(
                    cert['title'] ?? 'N/A',
                    style: pw.TextStyle(
                      fontSize: 10,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.Text(
                  cert['date'] ?? 'N/A',
                  style: pw.TextStyle(
                    fontSize: 8,
                    color: PdfColors.grey700,
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 1),
            pw.Text(
              '${cert['issuer'] ?? 'N/A'} | ID: ${cert['credential'] ?? 'N/A'}',
              style: pw.TextStyle(
                fontSize: 8,
                color: PdfColors.grey700,
                fontStyle: pw.FontStyle.italic,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  static List<pw.Widget> _buildEducation(List<Education> educations) {
    return educations.map((edu) {
      return pw.Container(
        margin: const pw.EdgeInsets.only(bottom: 8),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Expanded(
                  child: pw.Text(
                    edu.degree,
                    style: pw.TextStyle(
                      fontSize: 10,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ),
                pw.Text(
                  '${edu.startAt} - ${edu.endAt}',
                  style: pw.TextStyle(
                    fontSize: 8,
                    color: PdfColors.grey700,
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 1),
            pw.Text(
              edu.institute,
              style: pw.TextStyle(
                fontSize: 9,
                color: PdfColors.grey700,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  static String _cleanDescription(String description) {
    // Remove emojis and clean up the text for professional resume
    return description
        .replaceAll(RegExp(r'[😅🐛🔥☕🚀]'), '')
        .replaceAll(RegExp(r'\n\n+'), '\n')
        .trim();
  }

  static String _truncateToTwoLines(String text) {
    // Remove extra newlines and split into sentences
    text = text.replaceAll(RegExp(r'\n+'), ' ').trim();

    // Split by sentences (period, exclamation, question mark)
    final sentences = text.split(RegExp(r'[.!?]+\s+'));

    if (sentences.isEmpty) return text;

    // Take first 2-3 sentences (approximately 2 lines)
    // Estimate: ~80-100 characters per line for font size 10
    String result = '';
    int charCount = 0;
    const maxChars = 180; // Approximately 2 lines

    for (int i = 0; i < sentences.length && charCount < maxChars; i++) {
      final sentence = sentences[i].trim();
      if (sentence.isEmpty) continue;

      if (result.isNotEmpty) {
        result += '. ';
      }
      result += sentence;
      charCount += sentence.length + 2;

      // Stop after 2-3 sentences or when approaching max chars
      if (i >= 1 && charCount > maxChars * 0.7) break;
    }

    // Add ellipsis if truncated
    if (charCount >= maxChars || result.length < text.length) {
      result += '...';
    } else if (result.isNotEmpty && !result.endsWith('.')) {
      result += '.';
    }

    return result.isEmpty
        ? text.substring(0, text.length > maxChars ? maxChars : text.length)
        : result;
  }
}
