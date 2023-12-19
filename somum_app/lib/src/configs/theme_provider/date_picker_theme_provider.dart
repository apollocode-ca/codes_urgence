import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class DatePickerThemeProvider
    extends AbstractedThemeProvider<DatePickerThemeData> {
  static const _theme = DatePickerThemeData(
    elevation: 3,
    headerBackgroundColor: null,
    rangePickerElevation: 3,
    rangePickerHeaderBackgroundColor: null,
    rangePickerShape: RoundedRectangleBorder(),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(
        Radius.circular(28),
      ),
    ),
  );

  final TextThemeProvider textThemeProvider;

  DatePickerThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  DatePickerThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    final bodySmall = textThemeProvider.theme.bodySmall;
    final bodyLarge = textThemeProvider.theme.bodyLarge;
    final headlineLarge = textThemeProvider.theme.headlineLarge;
    final labelMedium = textThemeProvider.theme.labelMedium;

    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.12);
          }

          return colorScheme.primary;
        }

        return null;
      }),
      dayForegroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.38);
        }

        if (states.contains(MaterialState.selected)) {
          return colorScheme.onPrimary;
        }

        return colorScheme.onSurface;
      }),
      dayOverlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return null;
        }

        final opacity = getOverlayOpacity(states);

        if (opacity > 0) {
          return colorScheme.onSurface.withOpacity(opacity);
        }

        return null;
      }),
      dayStyle: bodySmall,
      headerForegroundColor: colorScheme.onSurfaceVariant,
      headerHeadlineStyle: headlineLarge?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      headerHelpStyle: labelMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      rangePickerBackgroundColor: colorScheme.surface,
      rangePickerHeaderForegroundColor: colorScheme.onSurfaceVariant,
      rangePickerHeaderHeadlineStyle: headlineLarge?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      rangePickerHeaderHelpStyle: labelMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      rangePickerShadowColor: colorScheme.shadow,
      rangePickerSurfaceTintColor: colorScheme.surfaceTint,
      rangeSelectionBackgroundColor: colorScheme.primaryContainer,
      rangeSelectionOverlayColor: MaterialStateProperty.resolveWith((states) {
        final opacity = getOverlayOpacity(states);

        if (opacity > 0) {
          return colorScheme.onPrimaryContainer.withOpacity(opacity);
        }

        return null;
      }),
      shadowColor: colorScheme.shadow,
      surfaceTintColor: colorScheme.surfaceTint,
      todayBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.12);
          }

          return colorScheme.primary;
        }

        return null;
      }),
      todayBorder: MaterialStateBorderSide.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return BorderSide.none;
        }

        return BorderSide(
          color: colorScheme.primary,
          width: 1,
        );
      }),
      todayForegroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.38);
        }

        if (states.contains(MaterialState.selected)) {
          return colorScheme.onPrimary;
        }

        return colorScheme.primary;
      }),
      weekdayStyle: bodySmall?.copyWith(
        color: colorScheme.onSurface,
      ),
      yearBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.12);
          }

          return colorScheme.primary;
        }

        return null;
      }),
      yearForegroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.38);
        }

        if (states.contains(MaterialState.selected)) {
          return colorScheme.onPrimary;
        }

        return colorScheme.onSurfaceVariant;
      }),
      yearOverlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return null;
        }

        final opacity = getOverlayOpacity(states);

        if (opacity > 0) {
          return colorScheme.onSurfaceVariant.withOpacity(opacity);
        }

        return null;
      }),
      yearStyle: bodyLarge,
    );
  }
}
