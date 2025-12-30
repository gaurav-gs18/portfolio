import 'package:flutter/material.dart';

import '../../common/section_header.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeaderWidget(
          title: 'EXPERIENCE',
          subtitle: 'WORK EXPERIENCE',
        ),
        Text('WORK'),
        const SizedBox(
          height: 30,
        ),
        Text(
          'I am a passionate and dedicated mobile app developer with strong expertise in creating modern, user-friendly applications. I enjoy learning new technologies, solving challenging problems, and writing clean, maintainable code. My focus is always on building apps that deliver real value, perform efficiently, and provide a seamless user experience.',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
