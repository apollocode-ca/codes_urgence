import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class SwitchThemeProvider extends AbstractedThemeProvider<SwitchThemeData> {
  static const _theme = SwitchThemeData(
    materialTapTargetSize: MaterialTapTargetSize.padded,
    mouseCursor: MaterialStateMouseCursor.clickable,
    splashRadius: 20,
    thumbIcon: MaterialStatePropertyAll(null),
  );

  SwitchThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  SwitchThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
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
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.surface;
          }

          if (states.contains(MaterialState.pressed)) {
            return colorScheme.primaryContainer;
          }

          if (states.contains(MaterialState.focused)) {
            return colorScheme.primaryContainer;
          }

          if (states.contains(MaterialState.hovered)) {
            return colorScheme.primaryContainer;
          }

          return colorScheme.onPrimary;
        }

        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.38);
        }

        if (states.contains(MaterialState.pressed)) {
          return colorScheme.onSurfaceVariant;
        }

        if (states.contains(MaterialState.focused)) {
          return colorScheme.onSurfaceVariant;
        }

        if (states.contains(MaterialState.hovered)) {
          return colorScheme.onSurfaceVariant;
        }

        return colorScheme.outline;
      }),
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.12);
          }

          return colorScheme.primary;
        }

        final surfaceHighest = Color.alphaBlend(
          colorScheme.surfaceTint.withOpacity(0.14),
          colorScheme.surface,
        );

        if (states.contains(MaterialState.disabled)) {
          return surfaceHighest.withOpacity(0.12);
        }

        return surfaceHighest;
      }),
      trackOutlineColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return null;
        }

        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.12);
        }

        return colorScheme.outline;
      }),
    );
  }
}
