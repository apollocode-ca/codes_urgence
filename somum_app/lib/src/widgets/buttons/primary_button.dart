import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final Size? size;
  const PrimaryButton(
      {super.key, required this.child, this.onPressed, this.size});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size?>(size),
            textStyle: MaterialStateProperty.all<TextStyle>(
                GoogleFonts.raleway(fontSize: 14, fontWeight: FontWeight.bold)),
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.primary),
            foregroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.onPrimary)),
        child: child);
  }
}
