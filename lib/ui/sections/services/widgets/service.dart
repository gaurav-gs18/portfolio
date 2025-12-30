import 'package:flutter/material.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({
    Key? key,
    required this.title,
    required this.counter,
  }) : super(key: key);

  final String title;
  final String counter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          counter,
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(fontSize: 50, color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }
}
