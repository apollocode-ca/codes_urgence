import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarThemeProvider extends AbstractedThemeProvider<AppBarTheme> {
  static const _iconTheme = IconThemeData(
    grade: 0,
    opacity: 1,
    opticalSize: 24,
    shadows: <Shadow>[],
    size: 24,
    weight: 500,
  );

  static const _theme = AppBarTheme(
    centerTitle: true,
    elevation: 0,
    foregroundColor: null,
    scrolledUnderElevation: 2,
    titleSpacing: 16,
    toolbarHeight: 64,
  );

  final TextThemeProvider textThemeProvider;

  AppBarThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  AppBarTheme copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      actionsIconTheme: _iconTheme.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      backgroundColor: colorScheme.surface,
      iconTheme: _iconTheme.copyWith(
        color: colorScheme.primary,
      ),
      shadowColor: colorScheme.shadow,
      surfaceTintColor: colorScheme.surfaceTint,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: brightness,
        statusBarColor: colorScheme.surface,
        statusBarIconBrightness: brightness,
        systemNavigationBarColor: colorScheme.surface,
        systemNavigationBarDividerColor: colorScheme.outline,
        systemNavigationBarIconBrightness: brightness,
      ),
      titleTextStyle: textThemeProvider.theme.titleLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
    );
  }
}
