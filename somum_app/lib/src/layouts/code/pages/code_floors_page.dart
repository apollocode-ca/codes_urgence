import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:beamer/beamer.dart';
import 'package:somum/src/layouts/dashboard/widgets/code_widget.dart';
import 'package:somum_utilities/enums.dart';
import 'package:somum/src/utilities/inherited_widgets/l10n_provider.dart';
import 'package:somum/src/widgets/buttons/custom_outlined_button.dart';
import 'package:somum/src/widgets/title_widget.dart';
import 'package:flutter/material.dart';

/// Bluethoot pairing sequence
class CodeFloorsPage extends StatelessWidget {
  const CodeFloorsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BeamScrollView(
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          for (var code in CodeType.values)
            CodeWidget(
              code: code,
              onTap: () {
                Beamer.of(context, root: true)
                    .beamToNamed('/code/${code.index}/floors');
              },
            ),
        ],
      ),
    );
  }
}
