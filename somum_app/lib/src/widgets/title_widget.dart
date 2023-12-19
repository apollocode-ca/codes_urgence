import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  const TitleWidget({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.only(top: 35),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 16, left: 16),
            child: HeadlineText(
              title,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 185,
            height: 2,
            color: Theme.of(context).colorScheme.primary,
          ),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(
                  top: 12, right: 16, left: 16, bottom: 29),
              child: TitleText(
                subtitle!,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
