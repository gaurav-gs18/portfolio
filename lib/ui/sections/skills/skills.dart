import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/section_header.dart';
import '../../../utils/responsive.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accentColor = Colors.tealAccent[400]!;
    
    final categories = {
      "Programming": ["Dart", "Java", "Kotlin", "C++"],
      "Frontend": ["Flutter", "Jetpack Compose", "XML"],
      "Backend": ["Firebase", "Node.js", "Spring Boot"],
      "Databases": ["SQLite", "Hive", "PostgreSQL"],
      "DevOps": ["Git", "GitHub", "CI/CD"],
      "Cloud": ["Firebase Cloud", "AWS"],
    };

    // Map each skill to an icon
    final Map<String, IconData> skillIcons = {
      "Dart": FontAwesomeIcons.code,
      "Java": FontAwesomeIcons.java,
      "Kotlin": FontAwesomeIcons.android,
      "C++": FontAwesomeIcons.code,
      "Flutter": FontAwesomeIcons.mobile,
      "Jetpack Compose": FontAwesomeIcons.android,
      "XML": FontAwesomeIcons.fileCode,
      "Firebase": FontAwesomeIcons.fire,
      "Node.js": FontAwesomeIcons.nodeJs,
      "Spring Boot": FontAwesomeIcons.leaf,
      "SQLite": FontAwesomeIcons.database,
      "Hive": FontAwesomeIcons.cube,
      "PostgreSQL": FontAwesomeIcons.database,
      "Git": FontAwesomeIcons.gitAlt,
      "GitHub": FontAwesomeIcons.github,
      "CI/CD": FontAwesomeIcons.gears,
      "Firebase Cloud": FontAwesomeIcons.cloud,
      "AWS": FontAwesomeIcons.aws,
    };

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: DefaultTabController(
      length: categories.keys.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeaderWidget(
            title: '',
              subtitle: 'TECH STACKS',
              icon: Icons.build_circle_outlined,
          ),
            const SizedBox(height: 30),

          // Tabs
          TabBar(
            isScrollable: true,
              indicatorColor: accentColor,
              indicatorWeight: 3,
              labelColor: accentColor,
            unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(
                fontSize: Responsive.getBodySize(context),
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: Responsive.getBodySize(context),
                fontWeight: FontWeight.w400,
              ),
            tabs: categories.keys.map((cat) => Tab(text: cat)).toList(),
          ),
            const SizedBox(height: 30),

          // Tab Views
          SizedBox(
              height: Responsive.isMobile(context) 
                  ? 250 
                  : Responsive.isTablet(context) 
                      ? 280 
                      : 200,
            child: TabBarView(
              children: categories.values.map((skills) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Responsive.isMobile(context) 
                          ? 2 
                          : Responsive.isTablet(context) 
                              ? 3 
                              : 4,
                      crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
                      mainAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
                      childAspectRatio: Responsive.isMobile(context) 
                          ? 1.3 
                          : Responsive.isTablet(context) 
                              ? 1.4 
                              : 1.8,
                    ),
                    itemCount: skills.length,
                    itemBuilder: (context, index) {
                      final skill = skills[index];
                      return _SkillCard(
                        skill: skill,
                        icon: skillIcons[skill] ?? Icons.code,
                        accentColor: accentColor,
                    );
                    },
                );
              }).toList(),
            ),
          ),
        ],
        ),
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final String skill;
  final IconData icon;
  final Color accentColor;

  const _SkillCard({
    Key? key,
    required this.skill,
    required this.icon,
    required this.accentColor,
  }) : super(key: key);

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isHovered = _isHovered;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isHovered
              ? widget.accentColor.withOpacity(0.15)
              : Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isHovered
                ? widget.accentColor.withOpacity(0.6)
                : Colors.transparent,
            width: isHovered ? 1.5 : 0,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: widget.accentColor.withOpacity(0.15),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        padding: EdgeInsets.all(Responsive.isMobile(context) ? 12 : 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.all(Responsive.isMobile(context) ? 12 : 10),
              decoration: BoxDecoration(
                color: widget.accentColor.withOpacity(isHovered ? 0.2 : 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.icon,
                color: widget.accentColor,
                size: Responsive.isMobile(context) 
                    ? 28 
                    : Responsive.isTablet(context) 
                        ? 30 
                        : 26,
              ),
            ),
            SizedBox(height: Responsive.isMobile(context) ? 12 : 8),
            Text(
              widget.skill,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: isHovered ? widget.accentColor : Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: Responsive.isMobile(context) 
                    ? 14 
                    : Responsive.isTablet(context) 
                        ? 13 
                        : 12,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
