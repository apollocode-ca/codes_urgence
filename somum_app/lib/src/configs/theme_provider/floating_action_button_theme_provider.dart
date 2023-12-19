import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonThemeProvider
    extends AbstractedThemeProvider<FloatingActionButtonThemeData> {
  static const _theme = FloatingActionButtonThemeData(
    disabledElevation: 1,
    elevation: 3,
    enableFeedback: true,
    extendedIconLabelSpacing: 12,
    extendedPadding: EdgeInsetsDirectional.symmetric(
      horizontal: 16,
    ),
    extendedSizeConstraints: BoxConstraints(
      maxHeight: 56,
      maxWidth: double.infinity,
      minHeight: 56,
      minWidth: 80,
    ),
    focusElevation: 3,
    highlightElevation: 3,
    hoverElevation: 4,
    iconSize: 24,
    largeSizeConstraints: BoxConstraints.tightFor(
      height: 96,
      width: 96,
    ),
    mouseCursor: MaterialStateMouseCursor.clickable,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(
        Radius.circular(16),
      ),
    ),
    sizeConstraints: BoxConstraints.tightFor(
      height: 56,
      width: 56,
    ),
    smallSizeConstraints: BoxConstraints.tightFor(
      height: 40,
      width: 40,
    ),
  );

  final TextThemeProvider textThemeProvider;

  FloatingActionButtonThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  FloatingActionButtonThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    final helper = FigmaManager.instance.helper;
    return _theme.copyWith(
      backgroundColor: colorScheme.primaryContainer,
      extendedTextStyle: textThemeProvider.theme.labelLarge?.copyWith(
        color: colorScheme.onPrimaryContainer,
      ),
      focusColor: Color.alphaBlend(
        colorScheme.onPrimaryContainer.withOpacity(0.12),
        colorScheme.primaryContainer,
      ),
      foregroundColor: colorScheme.onPrimaryContainer,
      hoverColor: Color.alphaBlend(
        colorScheme.onPrimaryContainer.withOpacity(0.08),
        colorScheme.primaryContainer,
      ),
      splashColor: helper.isLarge()
          ? null
          : colorScheme.onPrimaryContainer.withOpacity(0.12),
    );
  }
}
