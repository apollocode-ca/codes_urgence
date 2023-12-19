import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:somum_utilities/enums.dart';
import 'package:somum/src/utilities/extensions/code_types_extension.dart';
import 'package:flutter/material.dart';

class CodeWidget extends StatelessWidget {
  final CodeType code;
  final Function()? onTap;
  const CodeWidget({super.key, required this.code, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 12,
      onTap: onTap,
      child: Container(
          width: 355,
          height: 115,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.surface),
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 125,
                height: 55,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: code.color(context),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                    width: 1,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleText(
                    code.l10Name(context),
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  SizedBox(
                    width: 175,
                    child: LabelText(
                      code.l10Description(context),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                          overflow: TextOverflow.visible,
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
