import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class BottomAppBarThemeProvider
    extends AbstractedThemeProvider<BottomAppBarTheme> {
  static const _theme = BottomAppBarTheme(
    elevation: 2,
    height: 80,
    padding: EdgeInsetsDirectional.only(
      bottom: 12,
      end: 16,
      start: 4,
      top: 12,
    ),
    shape: AutomaticNotchedShape(
      RoundedRectangleBorder(),
    ),
  );

  BottomAppBarThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  BottomAppBarTheme copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      color: colorScheme.surface,
      shadowColor: colorScheme.shadow,
      surfaceTintColor: colorScheme.surfaceTint,
    );
  }
}
