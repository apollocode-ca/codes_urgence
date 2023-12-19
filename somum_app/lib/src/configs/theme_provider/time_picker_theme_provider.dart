import 'package:somum/src/configs/theme_provider/input_decoration_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/text_button_theme_provider.dart';
import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class TimePickerThemeProvider
    extends AbstractedThemeProvider<TimePickerThemeData> {
  static const _theme = TimePickerThemeData(
    elevation: 3,
    dayPeriodShape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(
        Radius.circular(8),
      ),
    ),
    hourMinuteShape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(
        Radius.circular(8),
      ),
    ),
    padding: EdgeInsetsDirectional.all(24),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(
        Radius.circular(24),
      ),
    ),
  );

  final IconThemeData iconTheme;
  final InputDecorationThemeProvider inputDecorationThemeProvider;
  final TextButtonThemeProvider textButtonThemeProvider;
  final TextThemeProvider textThemeProvider;

  TimePickerThemeProvider({
    required super.colorSchemeProvider,
    required this.iconTheme,
    required this.inputDecorationThemeProvider,
    required this.textButtonThemeProvider,
    required this.textThemeProvider,
  });

  @override
  TimePickerThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    final textButtonTheme = textButtonThemeProvider.getFrom(brightness);
    final bodyLarge = textThemeProvider.theme.bodyLarge;

    if (bodyLarge == null) {
      throw StateError('bodyLarge must be defined in the TextTheme');
    }

    final displayLarge = textThemeProvider.theme.displayMedium;

    if (displayLarge == null) {
      throw StateError('displayLarge must be defined in the TextTheme');
    }

    final labelMedium = textThemeProvider.theme.labelMedium;
    final titleMedium = textThemeProvider.theme.titleMedium;

    if (titleMedium == null) {
      throw StateError('titleMedium must be defined in the TextTheme');
    }

    final inputDecorationTheme = inputDecorationThemeProvider.getFrom(
      brightness,
    );

    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      cancelButtonStyle: textButtonTheme.style,
      confirmButtonStyle: textButtonTheme.style,
      dayPeriodBorderSide: BorderSide(
        color: colorScheme.outline,
        width: 1,
      ),
      dayPeriodColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return colorScheme.tertiaryContainer;
        }

        return colorScheme.surface;
      }),
      dayPeriodTextColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return colorScheme.onTertiaryContainer;
        }

        return colorScheme.onSurface;
      }),
      dayPeriodTextStyle: MaterialStateTextStyle.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return titleMedium.copyWith(
            color: colorScheme.onTertiaryContainer,
          );
        }

        return titleMedium.copyWith(
          color: colorScheme.onSurface,
        );
      }),
      dialBackgroundColor: Color.alphaBlend(
        colorScheme.surfaceTint.withOpacity(0.14),
        colorScheme.surface,
      ),
      dialHandColor: colorScheme.primary,
      dialTextColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return colorScheme.onPrimary;
        }

        return colorScheme.onSurface;
      }),
      dialTextStyle: MaterialStateTextStyle.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return bodyLarge.copyWith(
            color: colorScheme.onPrimary,
          );
        }

        return bodyLarge.copyWith(
          color: colorScheme.onSurface,
        );
      }),
      entryModeIconColor: iconTheme.color,
      helpTextStyle: labelMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      hourMinuteColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return colorScheme.primaryContainer;
        }

        return Color.alphaBlend(
          colorScheme.surfaceTint.withOpacity(0.14),
          colorScheme.surface,
        );
      }),
      hourMinuteTextColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return colorScheme.onPrimaryContainer;
        }

        return colorScheme.onSurface;
      }),
      hourMinuteTextStyle: MaterialStateTextStyle.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return displayLarge.copyWith(
            color: colorScheme.onPrimaryContainer,
          );
        }

        return displayLarge.copyWith(
          color: colorScheme.onSurface,
        );
      }),
      inputDecorationTheme: inputDecorationTheme.copyWith(
        border: MaterialStateOutlineInputBorder.resolveWith((states) {
          if (states.contains(MaterialState.focused)) {
            return OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: colorScheme.onPrimaryContainer,
                width: 2,
              ),
            );
          }

          return const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          );
        }),
        contentPadding: EdgeInsetsDirectional.zero,
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.focused)) {
            return colorScheme.primaryContainer;
          }

          return Color.alphaBlend(
            colorScheme.surfaceTint.withOpacity(0.14),
            colorScheme.surface,
          );
        }),
        filled: true,
      ),
    );
  }
}
