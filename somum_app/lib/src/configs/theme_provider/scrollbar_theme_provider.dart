import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class ScrollbarThemeProvider
    extends AbstractedThemeProvider<ScrollbarThemeData> {
  static final _theme = ScrollbarThemeData(
    crossAxisMargin: 4,
    interactive: true,
    mainAxisMargin: 8,
    minThumbLength: 100,
    radius: const Radius.circular(4),
    thickness: const MaterialStatePropertyAll(8),
    thumbVisibility: const MaterialStatePropertyAll(true),
    trackBorderColor: const MaterialStatePropertyAll(
      Colors.transparent,
    ),
    trackVisibility: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
        return true;
      }

      return false;
    }),
  );

  ScrollbarThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  ScrollbarThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        return Colors.transparent;
        if (states.contains(MaterialState.dragged)) {
          return Color.alphaBlend(
            colorScheme.onPrimary.withOpacity(0.16),
            colorScheme.primary,
          );
        }

        if (states.contains(MaterialState.hovered)) {
          return Color.alphaBlend(
            colorScheme.onPrimary.withOpacity(0.08),
            colorScheme.primary,
          );
        }

        return colorScheme.primary;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.dragged)) {
          return colorScheme.primary.withOpacity(0.16);
        }

        if (states.contains(MaterialState.hovered)) {
          return colorScheme.primary.withOpacity(0.08);
        }

        return null;
      }),
    );
  }
}
