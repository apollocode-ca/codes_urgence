import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class TextButtonThemeProvider extends TextButtonThemeProviderInterface {
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
        horizontal: 12,
      ),
    ),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.all(
          Radius.circular(20),
        ),
      ),
    ),
    side: MaterialStatePropertyAll(
      BorderSide.none,
    ),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.standard,
  );

  final TextThemeProvider textThemeProvider;

  TextButtonThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  TextButtonThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    final helper = FigmaManager.instance.helper;
    return TextButtonThemeData(
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
        splashFactory: helper.isLarge() ? NoSplash.splashFactory : null,
        surfaceTintColor: MaterialStatePropertyAll(
          colorScheme.surfaceTint,
        ),
        textStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return textThemeProvider.theme.labelLarge?.copyWith(
              color: colorScheme.onSurface.withOpacity(0.38),
            );
          }

          return textThemeProvider.theme.labelLarge?.copyWith(
            color: colorScheme.primary,
          );
        }),
      ),
    );
  }
}
