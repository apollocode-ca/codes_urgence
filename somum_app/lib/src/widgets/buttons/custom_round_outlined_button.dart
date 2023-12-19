import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRoundOutlinedButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final Size? size;
  const CustomRoundOutlinedButton({
    super.key,
    required this.child,
    this.onPressed,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        fixedSize: MaterialStateProperty.all<Size?>(size),
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.transparent,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.onBackground,
        ),
      ),
      child: child,
    );
  }
}
