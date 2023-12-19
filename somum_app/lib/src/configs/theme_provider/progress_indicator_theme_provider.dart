import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorThemeProvider
    extends AbstractedThemeProvider<ProgressIndicatorThemeData> {
  static const _theme = ProgressIndicatorThemeData(
    circularTrackColor: null,
    linearMinHeight: 4,
    refreshBackgroundColor: null,
  );

  ProgressIndicatorThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  ProgressIndicatorThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    return _theme.copyWith(
      color: colorScheme.primary,
      linearTrackColor: Color.alphaBlend(
        colorScheme.surfaceTint.withOpacity(0.14),
        colorScheme.surface,
      ),
    );
  }
}
