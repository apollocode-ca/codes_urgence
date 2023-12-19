import 'package:somum_utilities/enums.dart';
import 'package:somum/src/utilities/inherited_widgets/l10n_provider.dart';
import 'package:flutter/material.dart';

extension CodeTypesExtension on CodeType {
  String l10Name(BuildContext context) {
    switch (this) {
      case CodeType.silver:
        return L10nProvider.of(context).code_type_silver;
      case CodeType.blue:
        return L10nProvider.of(context).code_type_blue;
      case CodeType.grey:
        return L10nProvider.of(context).code_type_grey;
      case CodeType.mauve:
        return L10nProvider.of(context).code_type_mauve;
      case CodeType.orange:
        return L10nProvider.of(context).code_type_orange;
      case CodeType.red:
        return L10nProvider.of(context).code_type_red;
      case CodeType.white:
        return L10nProvider.of(context).code_type_white;
      case CodeType.brown:
        return L10nProvider.of(context).code_type_brown;
      case CodeType.yellow:
        return L10nProvider.of(context).code_type_yellow;
      case CodeType.black:
        return L10nProvider.of(context).code_type_black;
      case CodeType.pink:
        return L10nProvider.of(context).code_type_pink;
      case CodeType.green:
        return L10nProvider.of(context).code_type_green;
      default:
        return 'unknown';
    }
  }

  String l10Description(BuildContext context) {
    switch (this) {
      case CodeType.silver:
        return L10nProvider.of(context).code_type_silver_description;
      case CodeType.blue:
        return L10nProvider.of(context).code_type_blue_description;
      case CodeType.grey:
        return L10nProvider.of(context).code_type_grey_description;
      case CodeType.mauve:
        return L10nProvider.of(context).code_type_mauve_description;
      case CodeType.orange:
        return L10nProvider.of(context).code_type_orange_description;
      case CodeType.red:
        return L10nProvider.of(context).code_type_red_description;
      case CodeType.white:
        return L10nProvider.of(context).code_type_white_description;
      case CodeType.brown:
        return L10nProvider.of(context).code_type_brown_description;
      case CodeType.yellow:
        return L10nProvider.of(context).code_type_yellow_description;
      case CodeType.black:
        return L10nProvider.of(context).code_type_black_description;
      case CodeType.pink:
        return L10nProvider.of(context).code_type_pink_description;
      case CodeType.green:
        return L10nProvider.of(context).code_type_green_description;
      default:
        return 'unknown';
    }
  }

  Color color(BuildContext context) {
    switch (this) {
      case CodeType.silver:
        return const Color(0xFFD9D9D9);
      case CodeType.blue:
        return const Color(0xFF00B0FF);
      case CodeType.grey:
        return const Color(0xFF7B7B79);
      case CodeType.mauve:
        return const Color(0xFF693C89);
      case CodeType.orange:
        return const Color(0xFFFF6D00);
      case CodeType.red:
        return const Color(0xFFD50000);
      case CodeType.white:
        return const Color(0xFFFFFFFF);
      case CodeType.brown:
        return const Color(0xFF795548);
      case CodeType.yellow:
        return const Color(0xFFFFEB3B);
      case CodeType.black:
        return const Color(0xFF000000);
      case CodeType.pink:
        return const Color(0xFFE91E63);
      case CodeType.green:
        return const Color(0xFF4CAF50);
      default:
        return Colors.blue;
    }
  }
}
