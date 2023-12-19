import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class NavigationBarThemeProvider
    extends AbstractedThemeProvider<NavigationBarThemeData> {
  static const _iconTheme = IconThemeData(
    grade: 0,
    opacity: 1,
    opticalSize: 24,
    shadows: <Shadow>[],
    size: 24,
    weight: 500,
  );

  static const _theme = NavigationBarThemeData(
    elevation: 2,
    height: 80,
    indicatorShape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(
        Radius.circular(16),
      ),
    ),
    labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
  );

  final TextThemeProvider textThemeProvider;

  NavigationBarThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  NavigationBarThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      iconTheme: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return _iconTheme.copyWith(
            color: colorScheme.onSecondaryContainer,
            fill: 1,
          );
        }

        return _iconTheme.copyWith(
          color: colorScheme.onSurfaceVariant,
          fill: 0,
        );
      }),
      indicatorColor: colorScheme.secondaryContainer,
      labelTextStyle: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return textThemeProvider.theme.labelMedium?.copyWith(
            color: colorScheme.onSurface,
          );
        }

        return textThemeProvider.theme.labelMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        );
      }),
      shadowColor: colorScheme.shadow,
      surfaceTintColor: colorScheme.surfaceTint,
    );
  }
}
