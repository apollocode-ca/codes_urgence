import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class CardThemeProvider extends AbstractedThemeProvider<CardTheme> {
  static const _theme = CardTheme(
    clipBehavior: Clip.antiAlias,
    elevation: 0,
    margin: EdgeInsetsDirectional.zero,
  );

  CardThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  CardTheme copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      color: colorScheme.surface,
      shadowColor: colorScheme.shadow,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadiusDirectional.all(
          Radius.circular(12),
        ),
        side: BorderSide(
          color: colorScheme.outline,
          width: 1,
        ),
      ),
      surfaceTintColor: colorScheme.surfaceTint,
    );
  }
}
