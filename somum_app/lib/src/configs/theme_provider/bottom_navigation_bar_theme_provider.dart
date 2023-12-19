import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarThemeProvider
    extends AbstractedThemeProvider<BottomNavigationBarThemeData> {
  static const _iconTheme = IconThemeData(
    grade: 0,
    opacity: 1,
    opticalSize: 24,
    shadows: <Shadow>[],
    size: 24,
    weight: 500,
  );

  static const _theme = BottomNavigationBarThemeData(
    elevation: 2,
    enableFeedback: true,
    landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
    mouseCursor: MaterialStateMouseCursor.clickable,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  );

  final TextThemeProvider textThemeProvider;

  BottomNavigationBarThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  BottomNavigationBarThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    final labelMedium = textThemeProvider.theme.labelMedium;

    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      selectedIconTheme: _iconTheme.copyWith(
        color: colorScheme.onSecondaryContainer,
        fill: 1,
      ),
      selectedItemColor: colorScheme.onSecondaryContainer,
      selectedLabelStyle: labelMedium?.copyWith(
        color: colorScheme.onSecondaryContainer,
      ),
      unselectedIconTheme: _iconTheme.copyWith(
        color: colorScheme.onSurfaceVariant,
        fill: 0,
      ),
      unselectedItemColor: colorScheme.onSurfaceVariant,
      unselectedLabelStyle: labelMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }
}
