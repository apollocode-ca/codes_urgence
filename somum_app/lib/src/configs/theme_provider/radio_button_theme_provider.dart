import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class RadioButtonThemeProvider extends AbstractedThemeProvider<RadioThemeData> {
  static const _theme = RadioThemeData(
    materialTapTargetSize: MaterialTapTargetSize.padded,
    mouseCursor: MaterialStateMouseCursor.clickable,
    splashRadius: 20,
    visualDensity: VisualDensity.standard,
  );

  RadioButtonThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  RadioThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.38);
        }

        if (states.contains(MaterialState.selected)) {
          return colorScheme.primary;
        }

        if (states.contains(MaterialState.pressed)) {
          return colorScheme.onSurface;
        }

        if (states.contains(MaterialState.focused)) {
          return colorScheme.onSurface;
        }

        if (states.contains(MaterialState.hovered)) {
          return colorScheme.onSurface;
        }

        return colorScheme.onSurfaceVariant;
      }),
      overlayColor: MaterialStateProperty.resolveWith((states) {
        final opacity = getOverlayOpacity(states);

        if (opacity > 0) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary.withOpacity(opacity);
          }

          return colorScheme.onSurface.withOpacity(opacity);
        }

        return null;
      }),
    );
  }
}
