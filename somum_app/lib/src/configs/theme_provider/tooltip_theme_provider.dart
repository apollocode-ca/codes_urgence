import 'package:somum/src/configs/theme_provider/text_theme_provider.dart';
import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class TooltipThemeProvider extends AbstractedThemeProvider<TooltipThemeData> {
  static const _theme = TooltipThemeData(
    enableFeedback: true,
    excludeFromSemantics: false,
    height: null,
    margin: null,
    preferBelow: true,
    textAlign: TextAlign.center,
    verticalOffset: 20,
    waitDuration: Duration(
      milliseconds: 400,
    ),
  );

  final TextThemeProvider textThemeProvider;

  TooltipThemeProvider({
    required super.colorSchemeProvider,
    required this.textThemeProvider,
  });

  @override
  TooltipThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    final helper = FigmaManager.instance.helper;

    return _theme.copyWith(
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusDirectional.all(
          Radius.circular(4),
        ),
        color: Color.alphaBlend(
          colorScheme.surfaceTint.withOpacity(0.08),
          colorScheme.surface,
        ),
        boxShadow: getShadowFor(
          elevation: 2,
          colorScheme: colorScheme,
        ),
      ),
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      showDuration: helper.isLarge()
          ? const Duration(
              milliseconds: 400,
            )
          : const Duration(
              milliseconds: 1500,
            ),
      textStyle: textThemeProvider.theme.labelLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
      triggerMode: helper.isLarge()
          ? TooltipTriggerMode.manual
          : TooltipTriggerMode.longPress,
    );
  }
}
