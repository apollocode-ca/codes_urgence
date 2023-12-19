import 'package:somum/src/utilities/figma_manager.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class BottomSheetThemeProvider
    extends AbstractedThemeProvider<BottomSheetThemeData> {
  static const _theme = BottomSheetThemeData(
    clipBehavior: Clip.antiAlias,
    dragHandleSize: Size(32, 4),
    elevation: 1,
    modalElevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(28),
        topEnd: Radius.circular(28),
      ),
    ),
    showDragHandle: true,
  );

  BottomSheetThemeProvider({
    required super.colorSchemeProvider,
  });

  @override
  BottomSheetThemeData copyWith(
    ColorScheme colorScheme,
    Brightness brightness,
  ) {
    return _theme.copyWith(
      backgroundColor: colorScheme.surfaceVariant,
      constraints: BoxConstraints(
        maxHeight: FigmaManager.instance.helper.mediaSize.height - 72,
        maxWidth: 640,
        minHeight: 0,
        minWidth: 0,
      ),
      dragHandleColor: colorScheme.onSurfaceVariant.withOpacity(0.4),
      modalBackgroundColor: colorScheme.surfaceVariant,
      modalBarrierColor: colorScheme.scrim.withOpacity(0.12),
      shadowColor: colorScheme.shadow,
      surfaceTintColor: colorScheme.surfaceTint,
    );
  }
}
