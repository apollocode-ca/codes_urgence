import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

// To build a new Material Theme:
// https://www.figma.com/community/plugin/1034969338659738588/Material-Theme-Builder

class ColorSchemeProvider extends ColorSchemeProviderInterface {
  static const _dark = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF97CBFF),
    onPrimary: Color(0xFF003353),
    primaryContainer: Color(0xFF004A76),
    onPrimaryContainer: Color(0xFFCEE5FF),
    secondary: Color(0xFFB9C8DA),
    onSecondary: Color(0xFF233240),
    secondaryContainer: Color(0xFF3A4857),
    onSecondaryContainer: Color(0xFFD5E4F7),
    tertiary: Color(0xFFD3BFE6),
    onTertiary: Color(0xFF392A49),
    tertiaryContainer: Color(0xFF504061),
    onTertiaryContainer: Color(0xFFEFDBFF),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    outline: Color(0xFF8C9198),
    background: Color(0xFF1A1C1E),
    onBackground: Color(0xFFE2E2E5),
    surface: Color(0xFF121416),
    onSurface: Color(0xFFC6C6C9),
    surfaceVariant: Color(0xFF42474E),
    onSurfaceVariant: Color(0xFFC2C7CF),
    inverseSurface: Color(0xFFE2E2E5),
    onInverseSurface: Color(0xFF1A1C1E),
    inversePrimary: Color(0xFF00639B),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF97CBFF),
    outlineVariant: Color(0xFF42474E),
    scrim: Color(0xFF000000),
  );

  static const _light = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF00639B),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFCEE5FF),
    onPrimaryContainer: Color(0xFF001D33),
    secondary: Color(0xFF51606F),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD5E4F7),
    onSecondaryContainer: Color(0xFF0E1D2A),
    tertiary: Color(0xFF68587A),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFEFDBFF),
    onTertiaryContainer: Color(0xFF231533),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    outline: Color(0xFF72777F),
    background: Color(0xFFFCFCFF),
    onBackground: Color(0xFF1A1C1E),
    surface: Color(0xFFF9F9FC),
    onSurface: Color(0xFF1A1C1E),
    surfaceVariant: Color(0xFFDEE3EB),
    onSurfaceVariant: Color(0xFF42474E),
    inverseSurface: Color(0xFF2F3033),
    onInverseSurface: Color(0xFFF1F0F4),
    inversePrimary: Color(0xFF97CBFF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF00639B),
    outlineVariant: Color(0xFFC2C7CF),
    scrim: Color(0xFF000000),
  );

  @override
  ColorScheme getFrom(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return _dark;
    }

    return _light;
  }

  @override
  Color getDarkerPrimaryFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      // Primary30
      return const Color(0xFF770099);
    }

    // Primary70
    return const Color(0xFFE486FF);
  }

  @override
  Color getLighterPrimaryFrom(Brightness brightness) {
    if (brightness == Brightness.light) {
      // Primary50
      return const Color(0xFFB047D2);
    }

    // Primary90
    return const Color(0xFFFBD7FF);
  }
}
