import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class SnackBarThemeProvider extends AbstractedThemeProvider<SnackBarThemeData> {
  static const _insetPadding = 16.0;

  static const _theme = SnackBarThemeData(
    actionOverflowThreshold: 0.15,
    behavior: SnackBarBehavior.floating,
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.all(
        Radius.circular(4),
      ),
    ),
    showCloseIcon: true,
    width: null,
  );

  final TextThemeProvider textThemeProvider;

  SnackBarThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  SnackBarThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    final horizontalInsetPadding = _horizontalInsetPadding;

    return _theme.copyWith(
      actionBackgroundColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onInverseSurface.withOpacity(0.12);
        }

        final opacity = getOverlayOpacity(states);

        return colorScheme.inversePrimary.withOpacity(opacity);
      }),
      actionTextColor: colorScheme.inversePrimary,
      backgroundColor: colorScheme.inverseSurface,
      closeIconColor: colorScheme.onInverseSurface,
      contentTextStyle: textThemeProvider.theme.bodyMedium?.copyWith(
        color: colorScheme.onInverseSurface,
      ),
      disabledActionTextColor: colorScheme.onInverseSurface.withOpacity(0.38),
      insetPadding: EdgeInsets.only(
        left: horizontalInsetPadding,
        right: horizontalInsetPadding,
        bottom: _insetPadding,
      ),
    );
  }

  double get _horizontalInsetPadding {
    final helper = FigmaManager.instance.helper;
    if (helper.isDesktop()) {
      return ResponsivePadding.largePadding + _insetPadding;
    }
    if (helper.isLaptop()) {
      const laptopFixedWidth = ResponsivePadding.laptopFixedWidth;
      final laptopPadding = (helper.mediaSize.width - laptopFixedWidth) / 2;
      return laptopPadding + _insetPadding;
    }
    if (helper.isMedium()) {
      return ResponsivePadding.mediumPadding + _insetPadding;
    }
    return ResponsivePadding.smallPadding + _insetPadding;
  }
}
