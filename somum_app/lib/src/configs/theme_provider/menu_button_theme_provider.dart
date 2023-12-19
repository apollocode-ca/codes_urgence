import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class MenuButtonThemeProvider
    extends AbstractedThemeProvider<MenuButtonThemeData> {
  static const height = 48.0;

  static const _style = ButtonStyle(
    alignment: AlignmentDirectional.centerStart,
    animationDuration: kThemeAnimationDuration,
    backgroundColor: MaterialStatePropertyAll(null),
    elevation: MaterialStatePropertyAll(0),
    enableFeedback: true,
    fixedSize: MaterialStatePropertyAll(
      Size.fromHeight(height),
    ),
    iconSize: MaterialStatePropertyAll(24),
    mouseCursor: MaterialStateMouseCursor.clickable,
    padding: MaterialStatePropertyAll(null),
    shadowColor: MaterialStatePropertyAll(null),
    side: MaterialStatePropertyAll(
      BorderSide.none,
    ),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(),
    ),
    surfaceTintColor: MaterialStatePropertyAll(null),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.standard,
  );

  final TextThemeProvider textThemeProvider;

  MenuButtonThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  MenuButtonThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    final helper = FigmaManager.instance.helper;

    return MenuButtonThemeData(
      style: _style.copyWith(
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.38);
          }

          return colorScheme.onSurface;
        }),
        iconColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.38);
          }

          return colorScheme.onSurfaceVariant;
        }),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          final opacity = getOverlayOpacity(states);

          if (opacity > 0) {
            return colorScheme.onSurface.withOpacity(opacity);
          }

          return null;
        }),
        splashFactory: helper.isLarge() ? NoSplash.splashFactory : null,
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return textThemeProvider.theme.labelLarge?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.38),
            );
          }

          return textThemeProvider.theme.labelLarge?.copyWith(
            color: colorScheme.onSurface,
          );
        }),
      ),
    );
  }
}
