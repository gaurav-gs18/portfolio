import 'package:flutter/material.dart';
import 'package:portfolio/ui/sections/services/widgets/service.dart';

import '../../../models/statistics.dart';
import '../../common/section_header.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({
    Key? key,
    required this.statistics,
  }) : super(key: key);

  final Statistics statistics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeaderWidget(
          title: 'SERVICES',
          subtitle: 'HERE ARE SOME OF MY EXPERTISE',
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Expanded(
              child: ServiceWidget(
                title: 'YEARS OF EXPERIENCE',
                counter: '${statistics.experience}',
              ),
            ),
            Expanded(
              child: ServiceWidget(
                title: 'PROJECTS',
                counter: '${statistics.projects}',
              ),
            ),
            Expanded(
              child: ServiceWidget(
                title: 'CLIENTS',
                counter: '${statistics.clients}',
              ),
            ),
            Expanded(
              child: ServiceWidget(
                title: 'CUPS OF COFFEE',
                counter: '∞',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
