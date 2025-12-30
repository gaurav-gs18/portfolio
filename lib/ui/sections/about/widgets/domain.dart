import 'package:flutter/material.dart';

import '../../../../models/domain.dart';

class DomainWidget extends StatelessWidget {
  const DomainWidget({Key? key, required this.domain}) : super(key: key);

  final Domain domain;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double iconSize = constraints.maxWidth * 0.15; // adaptive icon size
        double fontSize = constraints.maxWidth * 0.07; // adaptive font size

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border(
              bottom: BorderSide(
                color: Color(domain.color),
                width: 2,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconTheme(
                data: IconThemeData(color: Color(domain.color), size: iconSize),
                child: Image.asset(
                  'icons/${domain.icon}',
                  height: iconSize,
                  color: Color(domain.color),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                domain.name,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: fontSize.clamp(14, 22), // responsive font size
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
