import 'package:flutter/material.dart';

import '../../../models/experience.dart';
import '../../../utils/responsive.dart';
import '../../common/section_header.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({
    Key? key,
    required this.experiences,
    required this.projects,
  }) : super(key: key);

  final List<Experience> experiences;
  final List<Projects> projects;

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  int _selectedExperienceIndex = -1;
  int _selectedProjectIndex = -1;

  final Color selectedColor = Colors.tealAccent[400]!;

  void _showProjectDetails(BuildContext context, Projects project) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: selectedColor,
                width: 2,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with title and close button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          project.title ?? "Project",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: selectedColor,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white70),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Description
                  if (project.description != null && project.description!.isNotEmpty)
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  const SizedBox(height: 8),
                  if (project.description != null && project.description!.isNotEmpty)
                    Text(
                      project.description!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        height: 1.6,
                      ),
                    ),
                  
                  // Technologies
                  if (project.technologies != null && project.technologies!.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    Text(
                      "Technologies Used",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.technologies!.map((tech) {
                        return Chip(
                          label: Text(
                            tech,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          backgroundColor: selectedColor.withOpacity(0.2),
                          side: BorderSide(color: selectedColor, width: 1),
                        );
                      }).toList(),
                    ),
                  ],
                  
                  const SizedBox(height: 20),
                  
                  // Close button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedColor,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Close",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeaderWidget(
            title: '',
            subtitle: 'WORK EXPERIENCE',
            icon: Icons.work_outline,
          ),
          const SizedBox(height: 30),

          // Work Experience list
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.experiences.length,
            itemBuilder: (context, index) {
              final isSelected = _selectedExperienceIndex == index;
              return ListTile(
                onTap: () {
                  setState(() {
                    _selectedExperienceIndex = index;
                  });
                },
                title: Text(
                  widget.experiences[index].name ?? "",
                  style: TextStyle(
                      color: isSelected ? selectedColor : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: Responsive.getCardTitleSize(context),
                  ),
                ),
                subtitle: Text(
                  widget.experiences[index].company ?? "",
                  style: TextStyle(
                      color: isSelected
                          ? selectedColor.withOpacity(0.8)
                        : Colors.white70,
                    fontSize: Responsive.getBodySize(context),
                  ),
                ),
                trailing: Text(
                  '${widget.experiences[index].startAt} - Present',
                  style: TextStyle(
                    color: isSelected ? selectedColor : Colors.white,
                    fontSize: Responsive.getSmallSize(context),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) =>
                const Divider(color: Colors.white24),
          ),

          const SizedBox(height: 40),

          // Projects Section
          const SectionHeaderWidget(
            title: '',
            subtitle: 'PROJECTS',
            icon: Icons.code,
          ),
          const SizedBox(height: 30),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.projects.length,
            itemBuilder: (context, index) {
              final isSelected = _selectedProjectIndex == index;
              final project = widget.projects[index];
              return _ProjectCard(
                project: project,
                isSelected: isSelected,
                selectedColor: selectedColor,
                onTap: () => _showProjectDetails(context, project),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Projects project;
  final bool isSelected;
  final Color selectedColor;
  final VoidCallback onTap;

  const _ProjectCard({
    Key? key,
    required this.project,
    required this.isSelected,
    required this.selectedColor,
    required this.onTap,
  }) : super(key: key);

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

// Helper function to get icon for each project
IconData _getProjectIcon(String? projectTitle) {
  if (projectTitle == null) return Icons.code;
  
  final title = projectTitle.toLowerCase();
  if (title.contains('nova')) return Icons.assessment;
  if (title.contains('secure') || title.contains('chat')) return Icons.lock;
  if (title.contains('farming') || title.contains('drogo')) return Icons.eco;
  if (title.contains('pmc')) return Icons.construction;
  if (title.contains('geo') || title.contains('intelligence')) return Icons.location_on;
  return Icons.apps;
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isSelected = widget.isSelected || _isHovered;
    final cardColor = isSelected
        ? widget.selectedColor.withOpacity(0.15)
        : Colors.black.withOpacity(0.4);
    final borderColor = isSelected
        ? widget.selectedColor.withOpacity(0.6)
        : Colors.transparent;

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
            color: cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: borderColor,
              width: isSelected ? 1.5 : 0,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: widget.selectedColor.withOpacity(0.15),
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
            title: Row(
              children: [
                Icon(
                  _getProjectIcon(widget.project.title),
                  color: isSelected ? widget.selectedColor : Colors.white70,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.project.title ?? "",
                    style: TextStyle(
                      color: isSelected ? widget.selectedColor : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Responsive.getCardTitleSize(context),
                    ),
                  ),
                ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                widget.project.description ?? "",
                style: TextStyle(
                  color: isSelected
                      ? widget.selectedColor.withOpacity(0.9)
                      : Colors.white70,
                  fontSize: Responsive.getBodySize(context),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            trailing: AnimatedRotation(
              duration: const Duration(milliseconds: 200),
              turns: _isHovered ? 0.25 : 0,
              child: Icon(
                Icons.arrow_forward_ios,
                color: isSelected ? widget.selectedColor : Colors.white54,
                size: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
