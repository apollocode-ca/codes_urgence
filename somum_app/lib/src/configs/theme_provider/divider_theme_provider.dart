import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class DividerThemeProvider extends AbstractedThemeProvider<DividerThemeData> {
  static const _theme = DividerThemeData(
    endIndent: 0,
    indent: 0,
    space: null,
    thickness: 1,
  );

  DividerThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  DividerThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return _theme.copyWith(
      color: colorScheme.outline,
    );
  }
}
