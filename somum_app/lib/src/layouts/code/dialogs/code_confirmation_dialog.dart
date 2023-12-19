import 'package:beamer/beamer.dart';
import 'package:somum/src/layouts/code/widgets/function_widget.dart';
import 'package:somum_utilities/enums.dart';
import 'package:flutter/material.dart';

showFunctionDialog(BuildContext context, CodeType type) {
  showModalBottomSheet(
      context: Beamer.of(context, root: true).navigator.context,
      builder: (context) => CodeConfirmationDialog(type: type));
}

class CodeConfirmationDialog extends StatelessWidget {
  final CodeType type;
  const CodeConfirmationDialog({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38),
        child: Column(
          children: [
            CodeWidget(
              type: type,
              shrunkenVersion: true,
            ),
          ],
        ),
      ),
    );
  }
}
