import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class SegmentedButtonThemeProvider
    extends AbstractedThemeProvider<SegmentedButtonThemeData> {
  static const _borderSide = BorderSide(
    width: 1,
  );

  static const _iconTheme = IconThemeData(
    fill: 0,
    grade: 0,
    opacity: 1,
    opticalSize: 20,
    shadows: <Shadow>[],
    size: 18,
    weight: 500,
  );

  static final _style = ButtonStyle(
    alignment: AlignmentDirectional.center,
    animationDuration: kThemeAnimationDuration,
    elevation: const MaterialStatePropertyAll(0),
    enableFeedback: true,
    fixedSize: const MaterialStatePropertyAll(
      Size.fromHeight(40),
    ),
    iconSize: MaterialStatePropertyAll(
      _iconTheme.size,
    ),
    mouseCursor: MaterialStateMouseCursor.clickable,
    padding: const MaterialStatePropertyAll(
      EdgeInsetsDirectional.symmetric(
        horizontal: 12,
      ),
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

  SegmentedButtonThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  SegmentedButtonThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    final helper = FigmaManager.instance.helper;
    final labelLarge = textThemeProvider.theme.labelLarge;

    return SegmentedButtonThemeData(
      selectedIcon: IconTheme(
        data: _iconTheme.copyWith(
          color: colorScheme.onSecondaryContainer,
        ),
        child: const Icon(
          Icons.check,
        ),
      ),
      style: _style.copyWith(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }

          if (states.contains(MaterialState.selected)) {
            return colorScheme.secondaryContainer;
          }

          return null;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.38);
          }

          if (states.contains(MaterialState.selected)) {
            return colorScheme.onSecondaryContainer;
          }

          return colorScheme.onSurface;
        }),
        iconColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return colorScheme.onSurface.withOpacity(0.38);
          }

          if (states.contains(MaterialState.selected)) {
            return colorScheme.onSecondaryContainer;
          }

          return colorScheme.onSurface;
        }),
        overlayColor: MaterialStateProperty.resolveWith((states) {
          final opacity = getOverlayOpacity(states);

          if (opacity > 0) {
            if (states.contains(MaterialState.selected)) {
              return colorScheme.onSecondaryContainer.withOpacity(opacity);
            }

            return colorScheme.onSurface.withOpacity(opacity);
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

          return _borderSide.copyWith(
            color: colorScheme.outline,
          );
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

          if (states.contains(MaterialState.selected)) {
            return labelLarge?.copyWith(
              color: colorScheme.onSecondaryContainer,
            );
          }

          return labelLarge?.copyWith(
            color: colorScheme.onSurface,
          );
        }),
      ),
    );
  }
}
