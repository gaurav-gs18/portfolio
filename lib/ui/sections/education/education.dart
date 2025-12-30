import 'package:flutter/material.dart';

import '../../../models/education.dart';
import '../../../utils/responsive.dart';
import '../../common/section_header.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({
    Key? key,
    required this.educations,
  }) : super(key: key);

  final List<Education> educations;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeaderWidget(
            title: '',
            subtitle: 'EDUCATION',
            icon: Icons.school_outlined,
          ),
          const SizedBox(
            height: 30,
          ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: educations.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                educations[index].degree,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Responsive.getCardTitleSize(context),
                ),
              ),
              subtitle: Text(
                educations[index].institute,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Responsive.getBodySize(context),
                ),
              ),
              trailing: Text(
                '${educations[index].startAt} - ${educations[index].endAt}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontSize: Responsive.getSmallSize(context),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 10,
            );
          },
        ),
      ],
      ),
    );
  }
}
