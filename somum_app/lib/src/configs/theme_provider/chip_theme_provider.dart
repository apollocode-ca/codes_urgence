import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

// This theme provider is based on the Suggestion chip specs of Material 3.
class ChipThemeProvider extends AbstractedThemeProvider<ChipThemeData> {
  static const _borderSide = BorderSide(
    width: 1,
  );

  static const _iconTheme = IconThemeData(
    fill: 0,
    grade: 0,
    opacity: 1,
    opticalSize: 20,
    shadows: <Shadow>[],
    size: 18,
    weight: 500,
  );

  static const _theme = ChipThemeData(
    elevation: 0,
    labelPadding: EdgeInsetsDirectional.zero,
    padding: EdgeInsetsDirectional.symmetric(
      horizontal: 12,
    ),
    pressElevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(
        Radius.circular(8),
      ),
    ),
    showCheckmark: true,
  );

  final TextThemeProvider textThemeProvider;

  ChipThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  ChipThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    final labelLarge = textThemeProvider.theme.labelLarge;

    return _theme.copyWith(
      backgroundColor: null,
      brightness: brightness,
      checkmarkColor: colorScheme.onSurfaceVariant,
      deleteIconColor: colorScheme.onSurfaceVariant,
      disabledColor: colorScheme.onSurface.withOpacity(0.12),
      iconTheme: _iconTheme.copyWith(
        color: colorScheme.primary,
      ),
      labelStyle: labelLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
      secondaryLabelStyle: labelLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
      secondarySelectedColor: colorScheme.secondaryContainer,
      selectedColor: colorScheme.secondaryContainer,
      selectedShadowColor: colorScheme.shadow,
      shadowColor: colorScheme.shadow,
      side: MaterialStateBorderSide.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return BorderSide.none;
        }

        if (states.contains(MaterialState.disabled)) {
          return _borderSide.copyWith(
            color: colorScheme.onSurface.withOpacity(0.12),
          );
        }

        return _borderSide.copyWith(
          color: colorScheme.outline,
        );
      }),
      surfaceTintColor: colorScheme.surfaceTint,
    );
  }
}
