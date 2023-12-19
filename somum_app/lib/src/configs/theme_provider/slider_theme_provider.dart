import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class SliderThemeProvider extends AbstractedThemeProvider<SliderThemeData> {
  static const _theme = SliderThemeData(
    minThumbSeparation: 16,
    mouseCursor: MaterialStateMouseCursor.clickable,
    overlayShape: RoundSliderOverlayShape(
      overlayRadius: 20,
    ),
    rangeThumbShape: RoundRangeSliderThumbShape(
      disabledThumbRadius: 10,
      elevation: 1,
      enabledThumbRadius: 10,
      pressedElevation: 1,
    ),
    rangeTickMarkShape: RoundRangeSliderTickMarkShape(
      tickMarkRadius: 2,
    ),
    rangeTrackShape: RoundedRectRangeSliderTrackShape(),
    rangeValueIndicatorShape: PaddleRangeSliderValueIndicatorShape(),
    showValueIndicator: ShowValueIndicator.always,
    thumbSelector: null,
    thumbShape: RoundSliderThumbShape(
      disabledThumbRadius: 10,
      elevation: 1,
      enabledThumbRadius: 10,
      pressedElevation: 1,
    ),
    tickMarkShape: RoundSliderTickMarkShape(
      tickMarkRadius: 2,
    ),
    trackHeight: 4,
    trackShape: RoundedRectSliderTrackShape(),
    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
  );

  final TextThemeProvider textThemeProvider;

  SliderThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  SliderThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    final labelMedium = textThemeProvider.theme.labelMedium;

    return _theme.copyWith(
      activeTickMarkColor: colorScheme.onPrimary.withOpacity(0.38),
      activeTrackColor: colorScheme.primary,
      disabledActiveTickMarkColor: colorScheme.onSurface.withOpacity(0.38),
      disabledActiveTrackColor: colorScheme.onSurface.withOpacity(0.38),
      disabledInactiveTickMarkColor: colorScheme.onSurface.withOpacity(0.38),
      disabledInactiveTrackColor: colorScheme.onSurface.withOpacity(0.12),
      disabledSecondaryActiveTrackColor: null,
      disabledThumbColor: Color.alphaBlend(
        colorScheme.onSurface.withOpacity(0.38),
        colorScheme.surface,
      ),
      inactiveTickMarkColor: colorScheme.onSurfaceVariant.withOpacity(0.38),
      inactiveTrackColor: Color.alphaBlend(
        colorScheme.surfaceTint.withOpacity(0.14),
        colorScheme.surface,
      ),
      overlappingShapeStrokeColor: colorScheme.onPrimary,
      overlayColor: colorScheme.primary.withOpacity(0.12),
      secondaryActiveTrackColor: null,
      thumbColor: colorScheme.primary,
      valueIndicatorColor: colorScheme.primary,
      valueIndicatorTextStyle: labelMedium?.copyWith(
        color: colorScheme.onPrimary,
      ),
    );
  }
}
