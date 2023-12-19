import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class OutlinedButtonThemeProvider
    extends AbstractedThemeProvider<OutlinedButtonThemeData> {
  static const _borderSide = BorderSide(
    width: 1,
  );
  static const _style = ButtonStyle(
    alignment: AlignmentDirectional.center,
    animationDuration: kThemeAnimationDuration,
    backgroundColor: MaterialStatePropertyAll(null),
    elevation: MaterialStatePropertyAll(0),
    enableFeedback: true,
    fixedSize: MaterialStatePropertyAll(
      Size.fromHeight(40),
    ),
    iconSize: MaterialStatePropertyAll(18),
    mouseCursor: MaterialStateMouseCursor.clickable,
    padding: MaterialStatePropertyAll(
      EdgeInsetsDirectional.symmetric(
        horizontal: 24,
      ),
    ),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.all(
          Radius.circular(20),
        ),
      ),
    ),
    visualDensity: VisualDensity.standard,
  );

  final TextThemeProvider textThemeProvider;

  OutlinedButtonThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  OutlinedButtonThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    final helper = FigmaManager.instance.helper;
    final labelLarge = textThemeProvider.theme.labelLarge;

    return OutlinedButtonThemeData(
      style: _style.copyWith(
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
        shadowColor: MaterialStatePropertyAll(
          colorScheme.shadow,
        ),
        side: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return _borderSide.copyWith(
              color: colorScheme.onSurface.withOpacity(0.12),
            );
          }

          if (states.contains(MaterialState.focused)) {
            return _borderSide.copyWith(
              color: colorScheme.primary,
            );
          }

          return _borderSide.copyWith(
            color: colorScheme.outline,
          );
        }),
        splashFactory: helper.isLarge() ? NoSplash.splashFactory : null,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
