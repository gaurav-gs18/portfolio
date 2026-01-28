import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.icon,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
        Text(
          title,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.secondary,
              fontSize: Responsive.getSmallSize(context),
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        if (title.isNotEmpty) SizedBox(height: isMobile ? 6 : 8),
        Row(
          mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: Colors.tealAccent[400],
                size: Responsive.getTitleSize(context) * 1.0,
        ),
              const SizedBox(width: 16),
            ],
            Flexible(
              child: Text(
          subtitle,
                style: theme.textTheme.displayLarge?.copyWith(
                  color: Colors.white,
                  fontSize: Responsive.getTitleSize(context),
                ),
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
