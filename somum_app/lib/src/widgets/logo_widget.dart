import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image(image: AssetImage('assets/logos/logo_full_${MediaQuery.of(context).platformBrightness.name}.png')),
    );
  }
}
