import 'package:flutter/material.dart';
import 'package:portfolio/ui/sections/Certificate/certificate.dart';

import '../models/user.dart';
import '../services/data.dart';
import 'sections/about/about.dart';
import 'sections/contact/contact.dart';
import 'sections/education/education.dart';
import 'sections/experience/experience.dart';
import 'sections/skills/skills.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final User _userData = DataService.getData();


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 1,
          image: AssetImage("assets/bgim.png"), // <-- your background image
          fit: BoxFit.cover, // cover entire background
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
                child: Container(
                  alignment: AlignmentDirectional.centerStart,
                  padding: const EdgeInsetsDirectional.only(
                    start: 50,
                    top: 50,
              end: 50,
              bottom: 50,
                  ),
                  child: FractionallySizedBox(
                    widthFactor: .9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                  // About Section
                  const AboutSection(),
                  const SizedBox(height: 40),

                  // Experience Section
                        ExperienceSection(
                          experiences: _userData.experience,
                          projects: _userData.projects,
                        ),
                  const SizedBox(height: 40),

                  // Skills Section
                  const SkillsSection(),
                  const SizedBox(height: 40),

                  // Certificates Section
                  const CertificationScreen(),
                  const SizedBox(height: 40),

                  // Education Section
                        EducationSection(
                          educations: _userData.education.where((edu) => 
                            !edu.degree.toLowerCase().contains('10th') && 
                            !edu.degree.toLowerCase().contains('12th')
                          ).toList(),
                        ),
                  const SizedBox(height: 40),

                  // Contact Section
                  const ContactSection(),
                  const SizedBox(height: 30),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
