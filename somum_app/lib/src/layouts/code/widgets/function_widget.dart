import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:somum/src/layouts/code/widgets/function_icon_widget.dart';
import 'package:somum_utilities/enums.dart';
import 'package:somum/src/utilities/extensions/code_types_extension.dart';
import 'package:flutter/material.dart';

class CodeWidget extends StatelessWidget {
  final CodeType type;
  final Function()? onTap;
  final bool shrunkenVersion;
  const CodeWidget(
      {super.key,
      required this.type,
      this.onTap,
      this.shrunkenVersion = false});

  @override
  Widget build(BuildContext context) {
    if (shrunkenVersion) {
      return InkWell(
        radius: 12,
        onTap: onTap,
        child: Container(
            width: (shrunkenVersion) ? MediaQuery.of(context).size.width : 275,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.surface),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(
                      type.l10Name(context),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    LabelText(
                      type.l10Description(context),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    )
                  ],
                ),
                FunctionIconWidget(
                  type: type,
                ),
              ],
            )),
      );
    }

    return InkWell(
      radius: 12,
      onTap: onTap,
      child: Container(
          width: (shrunkenVersion) ? MediaQuery.of(context).size.width : 275,
          height: 165,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.surface),
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(
                    type.l10Name(context),
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  LabelText(
                    type.l10Description(context),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FunctionIconWidget(
                    type: type,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
