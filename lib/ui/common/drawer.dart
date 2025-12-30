import 'package:flutter/material.dart';

import 'section.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key? key,
    this.elevation = 16.0,
    this.onSelectSection,
  }) : super(key: key);

  final double elevation;
  final ValueChanged<int>? onSelectSection;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int _selectedIndex = 0; // Track selected section

  @override
  Widget build(BuildContext context) {
    const _sections = [
      'ABOUT',
      'EXPERIENCE',
      //'SERVICES',
      'SKILLS',
      'CERTIFICATES',
      'EDUCATION',
      //'WORK',
      'CONTACT',
    ];

    final isMobile = MediaQuery.of(context).size.width < 800;

    return Drawer(
      backgroundColor: isMobile ? Colors.black : Colors.transparent,
      elevation: widget.elevation,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),

            // Profile Picture
            ClipOval(
              child: Image.asset(
                'assets/gppic.webp',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                cacheWidth: 200,
                cacheHeight: 200,
              ),
            ),

            const SizedBox(height: 30),

            // Name
            Text(
              'Gaurav Kumar',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: Colors.white),
            ),

            const SizedBox(height: 10),

            // Role
            Text(
              'Flutter Developer',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.tealAccent[400],
                  ),
            ),

            const SizedBox(height: 40),

            // Sections List
            Theme(
              data: Theme.of(context).copyWith(
                textTheme: Theme.of(context).textTheme.apply(
                      bodyColor: Colors.white,
                      displayColor: Colors.white,
                    ),
              ),
              child: ListView.separated(
                itemCount: _sections.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SectionWidget(
                    index: index,
                    name: _sections[index],
                    color: _selectedIndex == index
                        ? Colors.tealAccent[400]
                        : Colors.white, // Selected color
                    onTap: () {
                      setState(() {
                        _selectedIndex = index; // Update selected index
                      });
                      widget.onSelectSection?.call(index);
                    },
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
              ),
            ),

            const SizedBox(height: 50),

            // Copyright
            Opacity(
              opacity: .7,
              child: Text(
                '© Copyright ${DateTime.now().year} All rights reserved.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
