import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class ElevatedButtonThemeProvider
    extends AbstractedThemeProvider<ElevatedButtonThemeData> {
  static final _style = ButtonStyle(
    alignment: AlignmentDirectional.center,
    animationDuration: kThemeAnimationDuration,
    elevation: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return 0;
      }

      if (states.contains(MaterialState.hovered)) {
        return 2;
      }

      return 1;
    }),
    enableFeedback: true,
    fixedSize: const MaterialStatePropertyAll(
      Size.fromHeight(56),
    ),
    iconSize: const MaterialStatePropertyAll(24),
    mouseCursor: MaterialStateMouseCursor.clickable,
    padding: const MaterialStatePropertyAll(
      EdgeInsetsDirectional.symmetric(
        horizontal: 24,
      ),
    ),
    side: const MaterialStatePropertyAll(
      BorderSide.none,
    ),
    shape: const MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.all(
          Radius.circular(100),
        ),
      ),
    ),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.standard,
  );

  final TextThemeProvider textThemeProvider;

  ElevatedButtonThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  ElevatedButtonThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    final helper = FigmaManager.instance.helper;
    final labelLarge = textThemeProvider.theme.labelMedium;

    return ElevatedButtonThemeData(
      style: _style.copyWith(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.12);
          }

          return colorScheme.surface;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.38);
          }

          return colorScheme.primary;
        }),
        iconColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.38);
          }

          return colorScheme.primary;
        }),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          final opacity = getOverlayOpacity(states);

          if (opacity > 0) {
            return colorScheme.primary.withOpacity(opacity);
          }

          return null;
        }),
        shadowColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }

          return colorScheme.shadow;
        }),
        splashFactory: helper.isLarge() ? NoSplash.splashFactory : null,
        surfaceTintColor: MaterialStatePropertyAll(
          colorScheme.surfaceTint,
        ),
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return labelLarge?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.38),
            );
          }

          return labelLarge?.copyWith(
            color: colorScheme.primary,
          );
        }),
      ),
    );
  }
}
