import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class BadgeThemeProvider extends AbstractedThemeProvider<BadgeThemeData> {
  static const _theme = BadgeThemeData(
    alignment: AlignmentDirectional.topEnd,
    largeSize: 24,
    offset: Offset.zero,
    padding: EdgeInsetsDirectional.all(4),
    smallSize: 6,
  );

  final TextThemeProvider textThemeProvider;

  BadgeThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  BadgeThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      backgroundColor: colorScheme.error,
      textColor: colorScheme.onError,
      textStyle: textThemeProvider.theme.labelSmall?.copyWith(
        color: colorScheme.onError,
      ),
    );
  }
}
