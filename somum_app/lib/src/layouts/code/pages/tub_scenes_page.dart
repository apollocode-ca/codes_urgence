import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:somum/src/widgets/logo_widget.dart';
import 'package:somum/src/widgets/title_widget.dart';
import 'package:flutter/material.dart';

/// Page pour les settings.
class CodeScenesPage extends StatelessWidget {
  const CodeScenesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BeamScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 85,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: LogoWidget(),
              )
            ]),
          ),
          TitleWidget(
            title: "Your Scenes",
            subtitle: "Select or edit your favorites presets",
          ),
        ],
      ),
    );
  }
}
