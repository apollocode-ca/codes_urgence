import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:somum/src/utilities/enums.dart';
import 'package:flutter/material.dart';

/// Widget to display the Tub status.
class TubStatusWidget extends StatelessWidget {
  final Status status;
  const TubStatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.online:
        return Icon(
          Icons.wifi,
          size: 24,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        );
      case Status.offline:
        return Icon(
          Icons.wifi_off,
          size: 24,
          color: Theme.of(context).colorScheme.error,
        );
      default:
        return const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.wifi_off,
              color: Color(0xFFFFF7AB),
            ),
            LabelText(
              "?",
              style: TextStyle(color: Color(0xFFFFF7AB)),
            )
          ],
        );
    }
  }
}
