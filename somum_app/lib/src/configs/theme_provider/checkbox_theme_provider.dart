import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class CheckboxThemeProvider extends AbstractedThemeProvider<CheckboxThemeData> {
  static const _borderSide = BorderSide(
    width: 2,
  );

  static const _theme = CheckboxThemeData(
    materialTapTargetSize: MaterialTapTargetSize.padded,
    mouseCursor: MaterialStateMouseCursor.clickable,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(2),
      ),
    ),
    splashRadius: 20,
    visualDensity: VisualDensity.standard,
  );

  CheckboxThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  CheckboxThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      checkColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.surface;
          }

          if (states.contains(MaterialState.error)) {
            return colorScheme.onError;
          }

          return colorScheme.onPrimary;
        }

        return null;
      }),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.38);
          }

          if (states.contains(MaterialState.error)) {
            return colorScheme.error;
          }

          return colorScheme.primary;
        }

        return null;
      }),
      overlayColor: MaterialStateProperty.resolveWith((states) {
        final opacity = getOverlayOpacity(states);

        if (opacity > 0) {
          if (states.contains(MaterialState.error)) {
            return colorScheme.error.withOpacity(opacity);
          }

          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary.withOpacity(opacity);
          }

          return colorScheme.onSurface.withOpacity(opacity);
        }

        return null;
      }),
      side: MaterialStateBorderSide.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return BorderSide.none;
        }

        if (states.contains(MaterialState.disabled)) {
          return _borderSide.copyWith(
            color: colorScheme.onSurface.withOpacity(0.38),
          );
        }

        if (states.contains(MaterialState.error)) {
          return _borderSide.copyWith(
            color: colorScheme.error,
          );
        }

        return _borderSide.copyWith(
          color: colorScheme.onSurface,
        );
      }),
    );
  }
}
