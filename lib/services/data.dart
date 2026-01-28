import '../models/user.dart';

class DataService {
  static User getData() {
    return User.fromJson(data);
  }
}

final Map<String, dynamic> data = {
  "about": {
    "first_name": "Gaurav",
    "last_name": "Kumar",
    "nick_name": "Cheeku",
    "email": "gauravkumar613982@gmail.com",
    "address": "Hyderabad, Telangana, India",
    "phone": "+91 9368112955",
    "description":
        "I’ve been in the world of Mobile Development for around ${DateTime.now().year - 2023}+ years now (yes, time flies faster than app updates 😅). During this journey, I’ve mastered the art of crafting apps using top-notch technologies, especially Flutter — my go-to superpower for building sleek, functional, and user-friendly apps. With a Master’s in Computer Science, coding and problem-solving are practically second nature to me. I’ve built and delivered multiple projects, collaborated with companies and individuals, and always enjoyed the process (well, except debugging at 3 AM, but that’s part of the fun 🐛🔥). I’m passionate about mobile and software technology, and I never miss a chance to sharpen my skills and stay ahead of the curve. Recruiters and clients often describe me as creative, hardworking, and someone with a surprising amount of stamina — probably thanks to all the coffee. ☕🚀",
    "domains": [
      {
        "icon": "mobile-application.png",
        "name": "Application",
        "color": 0xff2c98f0
      },
      // {
      //   "icon": "feature.png",
      //   "name": "Backend",
      //   "color": 0xffec5453,
      // },
      {
        "icon": "software-development.png",
        "name": "Software",
        "color": 0xfff9bf3f,
      },
      {
        "icon": "global-network.png",
        "name": "Networking",
        "color": 0xff4054b2,
      },
    ],
  },
  "statistics": {
    "experience": 2,
    "projects": 6,
    "clients": 5,
  },
  "skills": [
    {
      "name": "Mobile Applications",
      "percentage": 99,
      "color": 0xFF4CAF50,
    },
    {
      "name": "Flutter",
      "percentage": 98,
      "color": 0xFF4CAF50,
    },
    {
      "name": "Git",
      "percentage": 90,
      "color": 0xFF4CAF50,
    },
    {
      "name": "Problem Solving",
      "percentage": 99,
      "color": 0xFF4CAF50,
    },
    {
      "name": "Clean code",
      "percentage": 90,
      "color": 0xFF4CAF50,
    },
    {
      "name": "Testing",
      "percentage": 90,
      "color": 0xFF4CAF50,
    },
  ],
  "education": [
    {
      "institute": "Government Engineering College Mainpuri, Uttar Pradesh",
      "degree": "B-Tech, EE",
      "start_at": "2018/08",
      "end_at": "2022/07",
    },
    {
      "institute": "R.B.S Inter College, Nangal, Bijnor, Uttar Pradesh",
      "degree": "12th, PCM",
      "start_at": "2016/07",
      "end_at": "2017/07",
    },
    {
      "institute": "R.B.S Inter College, Nangal, Bijnor, Uttar Pradesh",
      "degree": "10th, PCM",
      "start_at": "2014/07",
      "end_at": "2015/07",
    },
  ],
  "experience": [
    {
      "name": "Mobile Developer",
      "type": "Full-time",
      "company": "Tectoro Consulting Private Limited",
      "location": "Hyderabad, Telangana, India",
      "start_at": "2023/08"
    }
  ],
  "projects": [
    {
      "title": "NovaPlus",
      "description":
          "A comprehensive land survey and inspection management system built with Flutter following Clean Architecture principles. The app uses Riverpod for state management and implements MVVM architecture pattern for better code organization and maintainability.\n\n"
          "Key features include real-time project tracking, detailed inspection updates with image and video attachments, interactive progress charts and analytics, offline data synchronization, and role-based access control. The application handles complex data flows efficiently with proper separation of concerns between presentation, domain, and data layers.\n\n"
          "Built with a focus on scalability and performance, the app supports multiple projects simultaneously with seamless navigation and data management. The clean architecture ensures easy testing, maintenance, and future feature additions.",
      "technologies": ["Flutter", "Riverpod", "Clean Architecture", "MVVM", "REST APIs", "SQLite", "Charts"]
    },
    {
      "title": "SecureChat",
      "description":
          "An enterprise-grade MDM-based secure messaging and calling application built with Flutter using Clean Architecture and Provider for state management. The app ensures end-to-end encryption for all communications with robust security measures.\n\n"
          "Features include real-time encrypted messaging, secure voice and video calling capabilities, WebSocket-based instant communication, push notifications via FCM, offline message queuing, and comprehensive message history management. The app implements advanced security protocols to protect sensitive corporate communications.\n\n"
          "The clean architecture implementation allows for easy integration with various MDM solutions and ensures the app remains maintainable and scalable. All data is stored securely with encryption at rest and in transit.",
      "technologies": ["Flutter", "Provider", "Clean Architecture", "FCM", "WebSocket", "SQLite", "Encryption", "MDM"]
    },
    {
      "title": "Drogo Smart Farming",
      "description":
          "A comprehensive agricultural operations management platform built with Flutter following Clean Architecture principles. The app uses Provider for state management and provides end-to-end solutions for modern farming operations.\n\n"
          "Key features include drone-based pesticide spraying coordination, detailed land survey and mapping with GPS integration, comprehensive farmer data collection and management, real-time project tracking and monitoring, weather integration for optimal farming decisions, and detailed analytics and reporting.\n\n"
          "The application is published on Google Play Store and serves thousands of farmers. Built with clean architecture to ensure maintainability and scalability, the app handles complex agricultural workflows efficiently. The modular design allows for easy feature additions and updates.",
      "technologies": ["Flutter", "Provider", "Clean Architecture", "REST APIs", "Google Maps", "GPS", "Firebase"]
    },
    {
      "title": "PMC",
      "description":
          "A robust project management system for construction companies built with Flutter using Clean Architecture and BLoC pattern for state management. The app streamlines construction project workflows and improves team collaboration.\n\n"
          "Features include comprehensive project tracking and monitoring, detailed inspection updates with photo documentation, real-time progress reporting, task assignment and management, document management and sharing, team collaboration tools, and advanced analytics and insights.\n\n"
          "The clean architecture implementation ensures separation of business logic from UI, making the codebase highly maintainable and testable. BLoC pattern provides predictable state management and excellent performance even with complex data flows. The app supports multiple construction sites and projects simultaneously.",
      "technologies": ["Flutter", "BLoC", "Clean Architecture", "REST APIs", "Firebase", "File Management"]
    },
    {
      "title": "Geo-Intelligence",
      "description":
          "An advanced fieldwork management application for bank employees built with Flutter using Clean Architecture and GetX for state management. The app enables efficient field operations with offline capabilities and location intelligence.\n\n"
          "Key features include comprehensive task management and assignment, real-time location tracking and geofencing, offline data synchronization with conflict resolution, detailed field visit reports and documentation, customer data management, route optimization for field visits, and seamless integration with banking systems.\n\n"
          "The clean architecture ensures the app remains maintainable and scalable while handling complex business logic. GetX provides efficient state management for real-time updates and offline data handling. The app significantly improves field employee productivity and operational efficiency.",
      "technologies": ["Flutter", "GetX", "Clean Architecture", "SQLite", "Location Services", "Offline Sync", "Geofencing"]
    }
  ]
};
