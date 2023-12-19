import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final Size? size;
  const ErrorButton({super.key, required this.child, this.onPressed, this.size});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size?>(size),
            textStyle: MaterialStateProperty.all<TextStyle>(
                GoogleFonts.cabin(fontSize: 20, fontWeight: FontWeight.bold)),
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.error),
            foregroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.onError)),
        child: child);
  }
}
