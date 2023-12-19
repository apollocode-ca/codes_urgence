import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class TextSelectionThemeProvider
    extends AbstractedThemeProvider<TextSelectionThemeData> {
  TextSelectionThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  TextSelectionThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    return TextSelectionThemeData(
      cursorColor: colorScheme.primary,
      selectionColor: colorScheme.primaryContainer,
      selectionHandleColor: colorScheme.primary,
    );
  }
}
