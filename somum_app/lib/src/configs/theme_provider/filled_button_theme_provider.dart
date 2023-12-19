import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class FilledButtonThemeProvider
    extends AbstractedThemeProvider<FilledButtonThemeData> {
  static final _style = ButtonStyle(
    alignment: AlignmentDirectional.center,
    animationDuration: kThemeAnimationDuration,
    elevation: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.hovered)) {
        return 1;
      }

      return 0;
    }),
    enableFeedback: true,
    fixedSize: const MaterialStatePropertyAll(
      Size.fromHeight(40),
    ),
    iconSize: const MaterialStatePropertyAll(18),
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
          Radius.circular(20),
        ),
      ),
    ),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.standard,
  );

  final TextThemeProvider textThemeProvider;

  FilledButtonThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  FilledButtonThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    final helper = FigmaManager.instance.helper;
    final labelLarge = textThemeProvider.theme.labelLarge;

    return FilledButtonThemeData(
      style: _style.copyWith(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.12);
          }

          return colorScheme.primary;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.38);
          }

          return colorScheme.onPrimary;
        }),
        iconColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.38);
          }

          return colorScheme.onPrimary;
        }),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          final opacity = getOverlayOpacity(states);

          if (opacity > 0) {
            return colorScheme.onPrimary.withOpacity(opacity);
          }

          return null;
        }),
        shadowColor: MaterialStatePropertyAll(
          colorScheme.shadow,
        ),
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
            color: colorScheme.onPrimary,
          );
        }),
      ),
    );
  }
}
