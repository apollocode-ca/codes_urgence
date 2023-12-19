import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class ActionIconThemeProvider
    extends AbstractedThemeProvider<ActionIconThemeData> {
  static const _size = 24.0;

  final IconThemeData iconTheme;

  ActionIconThemeProvider({
    required super.colorSchemeProvider,
    required this.iconTheme,
  });

  @override
  ActionIconThemeData copyWith(ColorScheme colorScheme, Brightness brightness) {
    return ActionIconThemeData(
      backButtonIconBuilder: (context) {
        return IconTheme(
          data: iconTheme.copyWith(
            size: _size,
          ),
          child: const Icon(
            Icons.arrow_back,
          ),
        );
      },
      closeButtonIconBuilder: (context) {
        return IconTheme(
          data: iconTheme.copyWith(
            size: _size,
          ),
          child: const Icon(
            Icons.close,
          ),
        );
      },
      drawerButtonIconBuilder: (context) {
        return IconTheme(
          data: iconTheme.copyWith(
            size: _size,
          ),
          child: const Icon(
            Icons.menu,
          ),
        );
      },
      endDrawerButtonIconBuilder: (context) {
        return IconTheme(
          data: iconTheme.copyWith(
            size: _size,
          ),
          child: const Icon(
            Icons.menu,
          ),
        );
      },
    );
  }
}
