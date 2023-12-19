import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:somum/src/layouts/dashboard/widgets/tub_status_widget.dart';
import 'package:somum/src/utilities/enums.dart';
import 'package:somum/src/widgets/buttons/custom_round_outlined_button.dart';
import 'package:flutter/material.dart';

class TubWidget extends StatelessWidget {
  final dynamic tub;
  final Function()? onTap;
  const TubWidget({super.key, required this.tub, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 12,
      onTap: onTap,
      child: Container(
          width: 275,
          height: 165,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.surface),
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleText(
                        "Primary bathroom",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      LabelText(
                        "18 functions - Model ABC123",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      )
                    ],
                  ),
                  TubStatusWidget(
                    status: Status.unknown,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image(
                      width: 135,
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/images/default_tub.png')),
                  CustomRoundOutlinedButton(
                      child: Icon(Icons.arrow_forward_ios_rounded),
                      size: const Size(48, 65),
                      onPressed: onTap),
                ],
              ),
            ],
          )),
    );
  }
}
