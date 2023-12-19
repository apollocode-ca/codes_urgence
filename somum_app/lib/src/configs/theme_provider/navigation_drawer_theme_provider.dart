import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class NavigationDrawerThemeProvider
    extends AbstractedThemeProvider<NavigationDrawerThemeData> {
  static const _iconTheme = IconThemeData(
    fill: 0,
    grade: 0,
    opacity: 1,
    opticalSize: 24,
    shadows: <Shadow>[],
    size: 24,
    weight: 500,
  );

  static const _interactions = [
    MaterialState.hovered,
    MaterialState.focused,
    MaterialState.pressed,
  ];

  static const _theme = NavigationDrawerThemeData(
    elevation: 0,
    indicatorShape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(
        Radius.circular(28),
      ),
    ),
    indicatorSize: Size(336, 56),
    tileHeight: 56,
  );

  final TextThemeProvider textThemeProvider;

  NavigationDrawerThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  NavigationDrawerThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    return _theme.copyWith(
      backgroundColor: Color.alphaBlend(
        colorScheme.surfaceTint.withOpacity(0.05),
        colorScheme.surface,
      ),
      iconTheme: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return _iconTheme.copyWith(
            color: colorScheme.onSurface.withOpacity(0.38),
          );
        }

        if (states.contains(MaterialState.selected)) {
          return _iconTheme.copyWith(
            color: colorScheme.onSecondaryContainer,
          );
        }

        if (states.any((state) => _interactions.contains(state))) {
          return _iconTheme.copyWith(
            color: colorScheme.onSurface,
          );
        }

        return _iconTheme.copyWith(
          color: colorScheme.onSurfaceVariant,
        );
      }),
      indicatorColor: colorScheme.secondaryContainer,
      labelTextStyle: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return textThemeProvider.theme.labelLarge?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.38),
          );
        }

        if (states.contains(MaterialState.selected)) {
          return textThemeProvider.theme.labelLarge?.copyWith(
            color: colorScheme.onSecondaryContainer,
          );
        }

        if (states.any((state) => _interactions.contains(state))) {
          return textThemeProvider.theme.labelLarge?.copyWith(
            color: colorScheme.onSurface,
          );
        }

        return textThemeProvider.theme.labelLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        );
      }),
      shadowColor: colorScheme.shadow,
      surfaceTintColor: colorScheme.surfaceTint,
    );
  }
}
