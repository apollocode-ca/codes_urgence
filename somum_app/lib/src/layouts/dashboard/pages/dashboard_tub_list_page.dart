import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:beamer/beamer.dart';
import 'package:somum/src/layouts/dashboard/widgets/tub_widget.dart';
import 'package:somum/src/utilities/inherited_widgets/l10n_provider.dart';
import 'package:somum/src/widgets/buttons/custom_outlined_button.dart';
import 'package:somum/src/widgets/title_widget.dart';
import 'package:flutter/material.dart';

/// Bluethoot pairing sequence
class DashboardListPage extends StatelessWidget {
  const DashboardListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BeamScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TitleWidget(
            title: L10nProvider.of(context).pairing_tubs_list_title,
          ),
          for (var i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TubWidget(
                tub: i,
                onTap: () {
                  Beamer.of(context, root: true).beamToNamed('/tub/home');
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: CustomOutlinedButton(
                size: const Size(225, 40),
                onPressed: () {
                  Beamer.of(context, root: true)
                      .beamToNamed('/pairing/available-tubs');
                },
                child: Text(L10nProvider.of(context).pairing_tubs_add)),
          )
        ],
      ),
    );
  }
}
