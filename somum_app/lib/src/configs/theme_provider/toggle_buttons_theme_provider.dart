import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class ToggleButtonsThemeProvider
    extends AbstractedThemeProvider<ToggleButtonsThemeData> {
  static const _theme = ToggleButtonsThemeData(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
    borderWidth: 1,
    constraints: BoxConstraints(
      maxHeight: 40,
      maxWidth: double.infinity,
      minHeight: 40,
      minWidth: 0,
    ),
  );

  final TextThemeProvider textThemeProvider;

  ToggleButtonsThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  ToggleButtonsThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    final helper = FigmaManager.instance.helper;

    return _theme.copyWith(
      borderColor: colorScheme.outline,
      color: colorScheme.onSurface,
      disabledBorderColor: colorScheme.onSurface.withOpacity(0.12),
      disabledColor: colorScheme.onSurface.withOpacity(0.38),
      fillColor: colorScheme.secondaryContainer,
      focusColor: colorScheme.onSurface.withOpacity(0.12),
      highlightColor: colorScheme.onSurface.withOpacity(0.12),
      hoverColor: colorScheme.onSurface.withOpacity(0.08),
      selectedBorderColor: colorScheme.outline,
      selectedColor: colorScheme.onSecondaryContainer,
      splashColor:
          helper.isLarge() ? null : colorScheme.onSurface.withOpacity(0.12),
      textStyle: textThemeProvider.theme.labelLarge,
    );
  }
}
