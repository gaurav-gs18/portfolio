import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/section_header.dart';
import '../../../utils/responsive.dart';

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
                  final Uri url = Uri.parse("https://github.com/gauravgit-123");
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
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
