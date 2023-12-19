import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class TextThemeProvider extends TextThemeProviderInterface {
  late final TextStyle _baseStyle;
  late final TextStyle _mediumStyle;
  late final TextStyle _regularStyle;
  late final TextTheme _textTheme;

  TextThemeProvider({
    required TextStyle baseStyle,
  }) {
    _baseStyle = baseStyle.copyWith(
      fontStyle: FontStyle.normal,
      textBaseline: TextBaseline.alphabetic,
    );

    _regularStyle = _baseStyle.copyWith(
      fontWeight: FontWeight.normal,
    );

    _mediumStyle = _baseStyle.copyWith(
      fontWeight: FontWeight.w500,
    );

    _textTheme = TextTheme(
      bodyLarge: _regularStyle.copyWith(
        fontSize: 16,
        height: 24 / 16,
        letterSpacing: 0.5,
      ),
      bodyMedium: _regularStyle.copyWith(
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0.25,
      ),
      bodySmall: _regularStyle.copyWith(
        fontSize: 12,
        height: 16 / 12,
        letterSpacing: 0.4,
      ),
      displayLarge: _regularStyle.copyWith(
        fontSize: 57,
        height: 64 / 57,
        letterSpacing: -0.25,
      ),
      displayMedium: _regularStyle.copyWith(
        fontSize: 45,
        height: 52 / 45,
      ),
      displaySmall: _regularStyle.copyWith(
        fontSize: 36,
        height: 44 / 36,
      ),
      headlineLarge: _regularStyle.copyWith(
        fontSize: 32,
        height: 40 / 32,
      ),
      headlineMedium: _regularStyle.copyWith(
        fontSize: 28,
        height: 36 / 28,
      ),
      headlineSmall: _regularStyle.copyWith(
        fontSize: 24,
        height: 32 / 24,
      ),
      labelLarge: _mediumStyle.copyWith(
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0.1,
      ),
      labelMedium: _mediumStyle.copyWith(
        fontSize: 12,
        height: 16 / 12,
        letterSpacing: 0.5,
      ),
      labelSmall: _mediumStyle.copyWith(
        fontSize: 11,
        height: 16 / 11,
        letterSpacing: 0.5,
      ),
      titleLarge: _regularStyle.copyWith(
        fontSize: 22,
        height: 28 / 22,
      ),
      titleMedium: _mediumStyle.copyWith(
        fontSize: 16,
        height: 24 / 16,
        letterSpacing: 0.15,
      ),
      titleSmall: _mediumStyle.copyWith(
        fontSize: 14,
        height: 20 / 14,
        letterSpacing: 0.1,
      ),
    );
  }

  @override
  TextStyle? get body {
    final helper = FigmaManager.instance.helper;

    if (helper.isLarge()) {
      return _textTheme.bodyLarge;
    }

    if (helper.isMedium()) {
      return _textTheme.bodyMedium;
    }

    return _textTheme.bodySmall;
  }

  @override
  TextStyle? get display {
    final helper = FigmaManager.instance.helper;

    if (helper.isLarge()) {
      return _textTheme.displayLarge;
    }

    if (helper.isMedium()) {
      return _textTheme.displayMedium;
    }

    return _textTheme.displaySmall;
  }

  @override
  TextStyle? get headline {
    final helper = FigmaManager.instance.helper;

    if (helper.isLarge()) {
      return _textTheme.headlineLarge;
    }

    if (helper.isMedium()) {
      return _textTheme.headlineMedium;
    }

    return _textTheme.headlineSmall;
  }

  @override
  TextStyle? get label {
    final helper = FigmaManager.instance.helper;

    if (helper.isLarge()) {
      return _textTheme.labelLarge;
    }

    if (helper.isMedium()) {
      return _textTheme.labelMedium;
    }

    return _textTheme.labelSmall;
  }

  @override
  TextTheme get theme {
    return _textTheme;
  }

  @override
  TextStyle? get title {
    final helper = FigmaManager.instance.helper;

    if (helper.isLarge()) {
      return _textTheme.titleLarge;
    }

    if (helper.isMedium()) {
      return _textTheme.titleMedium;
    }

    return _textTheme.titleSmall;
  }
}
