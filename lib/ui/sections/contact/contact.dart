 import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/section_header.dart';
import '../../../utils/responsive.dart';
import '../../../services/resume_service.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          const SectionHeaderWidget(
            title: '',
            subtitle: 'CONTACT',
            icon: Icons.contact_mail_outlined,
          ),
          // Text(
          //   'Contact',
          //   style: Theme.of(context).textTheme.titleLarge?.copyWith(
          //         color: Colors.blueAccent,
          //         fontWeight: FontWeight.bold,
          //         letterSpacing: 1.5,
          //       ),
          // ),
          const SizedBox(height: 20),

          // Short Intro
          Text(
            "I am a passionate Mobile App Developer with hands-on experience in building "
            "user-friendly, efficient, and scalable applications. I focus on writing "
            "clean, maintainable code and delivering high-quality results.",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: Responsive.getBodySize(context),
                  height: 1.5,
                  color: Colors.white,
                ),
          ),
          const SizedBox(height: 15),

          // Contact Info
          Row(
            children: [
              Icon(Icons.email, color: Colors.tealAccent[400], size: Responsive.isMobile(context) ? 18 : 20),
              const SizedBox(width: 10),
              Text(
                "gauravkumar613982@gmail.com",
                style: TextStyle(
                  fontSize: Responsive.getBodySize(context),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Icon(Icons.phone, color: Colors.tealAccent[400], size: Responsive.isMobile(context) ? 18 : 20),
              const SizedBox(width: 10),
              Text(
                "+91 93682112955",
                style: TextStyle(
                  fontSize: Responsive.getBodySize(context),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.tealAccent[400], size: Responsive.isMobile(context) ? 18 : 20),
              const SizedBox(width: 10),
              Text(
                "Hyderabad, India",
                style: TextStyle(
                  fontSize: Responsive.getBodySize(context),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment:
                isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedin),
                color: Colors.white,
                onPressed: () async {
                  final Uri url = Uri.parse(
                      "https://www.linkedin.com/in/gauravkumar613982");
                  if (!await launchUrl(url,
                      mode: LaunchMode.externalApplication)) {
                    throw 'Could not launch $url';
                  }
                },
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.github),
                color: Colors.white,
                onPressed: () async {
                  final Uri url = Uri.parse("https://github.com/gaurav-gs18");
                  if (!await launchUrl(url,
                      mode: LaunchMode.externalApplication)) {
                    throw 'Could not launch $url';
                  }
                },
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.envelope),
                color: Colors.white,
                onPressed: () async {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'gauravkumar613982@gmail.com',
                    query: 'subject=Hello&body=Hi Gaurav,', // optional
                  );

                  if (!await launchUrl(emailLaunchUri)) {
                    throw 'Could not launch $emailLaunchUri';
                  }
                },
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.twitter),
                color: Colors.white,
                onPressed: () async {
                  final Uri url = Uri.parse("https://x.com/gksingh613982");
                  if (!await launchUrl(url,
                      mode: LaunchMode.externalApplication)) {
                    throw 'Could not launch $url';
                  }
                },
              ),
            ],
          ),
          // Download Resume Buttons (only in debug mode)
          if (!kReleaseMode) ...[
            const SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      try {
                        await ResumeService.generateATSResume();
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error generating resume: $e'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    icon: const Icon(Icons.description, size: 20),
                    label: Text(
                      'Download ATS-Optimized Resume',
                      style: TextStyle(
                        fontSize: Responsive.getBodySize(context),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent[400],
                      foregroundColor: Colors.black87,
                      padding: EdgeInsets.symmetric(
                        horizontal: Responsive.isMobile(context) ? 24 : 32,
                        vertical: Responsive.isMobile(context) ? 14 : 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 4,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton.icon(
                    onPressed: () async {
                      try {
                        await ResumeService.generateAndDownloadResume(isUSFormat: false);
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error generating resume: $e'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    icon: const Icon(Icons.download, size: 20),
                    label: Text(
                      'Download Resume - Indian Format',
                      style: TextStyle(
                        fontSize: Responsive.getBodySize(context),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent[400],
                      foregroundColor: Colors.black87,
                      padding: EdgeInsets.symmetric(
                        horizontal: Responsive.isMobile(context) ? 24 : 32,
                        vertical: Responsive.isMobile(context) ? 14 : 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 4,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton.icon(
                    onPressed: () async {
                      try {
                        await ResumeService.generateAndDownloadResume(isUSFormat: true);
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error generating resume: $e'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    icon: const Icon(Icons.download, size: 20),
                    label: Text(
                      'Download Resume - USA Format',
                      style: TextStyle(
                        fontSize: Responsive.getBodySize(context),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.tealAccent[400],
                      foregroundColor: Colors.black87,
                      padding: EdgeInsets.symmetric(
                        horizontal: Responsive.isMobile(context) ? 24 : 32,
                        vertical: Responsive.isMobile(context) ? 14 : 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
