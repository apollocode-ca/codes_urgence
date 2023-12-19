import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:somum/src/utilities/inherited_widgets/l10n_provider.dart';
import 'package:somum/src/widgets/buttons/custom_round_outlined_button.dart';
import 'package:somum/src/widgets/logo_widget.dart';

AppBar universalAppBar(BuildContext context) => AppBar(
      elevation: 0,
      leadingWidth: 80,
      backgroundColor: Colors.transparent,
      toolbarHeight: 85,
      title: Row(children: [
        Container(
          height: 56,
          padding: const EdgeInsets.only(right: 12),
          child: const LogoWidget(),
        ),
        Container(
          width: 3,
          height: 37,
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onBackground,
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        Text(
          L10nProvider.of(context).metadata_title.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(),
        )
      ]),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            "ÉTABLISSEMENT ABC",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: CustomRoundOutlinedButton(
            size: const Size(35, 35),
            child: const Icon(Icons.logout),
            onPressed: () => Beamer.of(context, root: true)
                .beamToReplacementNamed("/auth/home"),
          ),
        )
      ],
      centerTitle: false,
    );
