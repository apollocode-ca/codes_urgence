import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final Size? size;
  const CustomOutlinedButton({
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
            borderRadius: BorderRadius.circular(40),
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
