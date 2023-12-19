import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:somum/src/layouts/code/dialogs/code_confirmation_dialog.dart';
import 'package:somum/src/layouts/code/widgets/function_widget.dart';
import 'package:somum/src/utilities/enums.dart';
import 'package:somum/src/widgets/logo_widget.dart';
import 'package:somum/src/widgets/title_widget.dart';
import 'package:flutter/material.dart';

/// Page d'accueil du dashboard.
class CodeFloorsPage extends StatefulWidget {
  const CodeFloorsPage({
    super.key,
  });

  @override
  State<CodeFloorsPage> createState() => _CodeFloorsPageState();
}

class _CodeFloorsPageState extends State<CodeFloorsPage> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return BeamScrollView(
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
          Column(
            children: [
              Image(
                  width: 135,
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/images/default_tub.png')),
              TitleWidget(
                title: "Primary Bathroom",
                subtitle: "18 functions - Model ABC123",
              ),
            ],
          ),
          for (var type in CodeType.values)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: CodeWidget(
                type: type,
                onTap: () {
                  showFunctionDialog(context, type);
                },
              ),
            )
        ],
      ),
    );
  }
}
