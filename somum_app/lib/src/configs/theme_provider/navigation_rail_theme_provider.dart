import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class NavigationRailThemeProvider
    extends AbstractedThemeProvider<NavigationRailThemeData> {
  static const _iconTheme = IconThemeData(
    grade: 0,
    opacity: 1,
    opticalSize: 24,
    shadows: <Shadow>[],
    size: 24,
    weight: 500,
  );

  static const _theme = NavigationRailThemeData(
    elevation: 0,
    groupAlignment: -1,
    indicatorShape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(
        Radius.circular(16),
      ),
    ),
    labelType: NavigationRailLabelType.all,
    minExtendedWidth: 360,
    minWidth: 80,
    useIndicator: true,
  );

  final TextThemeProvider textThemeProvider;

  NavigationRailThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  NavigationRailThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    final labelMedium = textThemeProvider.theme.labelMedium;

    return _theme.copyWith(
      backgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.secondaryContainer,
      selectedIconTheme: _iconTheme.copyWith(
        color: colorScheme.onSecondaryContainer,
        fill: 1,
      ),
      selectedLabelTextStyle: labelMedium?.copyWith(
        color: colorScheme.onSurface,
      ),
      unselectedIconTheme: _iconTheme.copyWith(
        color: colorScheme.onSurfaceVariant,
        fill: 0,
      ),
      unselectedLabelTextStyle: labelMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }
}
