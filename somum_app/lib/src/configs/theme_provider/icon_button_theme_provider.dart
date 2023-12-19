import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class IconButtonThemeProvider extends IconButtonThemeProviderInterface {
  static const _style = ButtonStyle(
    alignment: AlignmentDirectional.center,
    animationDuration: kThemeAnimationDuration,
    elevation: MaterialStatePropertyAll(0),
    enableFeedback: true,
    fixedSize: MaterialStatePropertyAll(
      Size.square(40),
    ),
    iconSize: MaterialStatePropertyAll(24),
    mouseCursor: MaterialStateMouseCursor.clickable,
    padding: MaterialStatePropertyAll(
      EdgeInsets.zero,
    ),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.all(
          Radius.circular(20),
        ),
      ),
    ),
    tapTargetSize: MaterialTapTargetSize.padded,
    textStyle: MaterialStatePropertyAll(null),
    visualDensity: VisualDensity.standard,
  );

  IconButtonThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  IconButtonThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    final helper = FigmaManager.instance.helper;

    return IconButtonThemeData(
      style: _style.copyWith(
        backgroundColor: const MaterialStatePropertyAll(null),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.38);
          }

          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }

          return colorScheme.onSurfaceVariant;
        }),
        iconColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.38);
          }

          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }

          return colorScheme.onSurfaceVariant;
        }),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          final opacity = getOverlayOpacity(states);

          if (states.contains(MaterialState.selected)) {
            if (opacity > 0) {
              return colorScheme.primary.withOpacity(opacity);
            }

            return null;
          }

          if (opacity > 0) {
            return colorScheme.onSurfaceVariant.withOpacity(opacity);
          }

          return null;
        }),
        shadowColor: const MaterialStatePropertyAll(null),
        splashFactory: helper.isLarge() ? NoSplash.splashFactory : null,
        surfaceTintColor: MaterialStatePropertyAll(
          colorScheme.surfaceTint,
        ),
      ),
    );
  }
}
