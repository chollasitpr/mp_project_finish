import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const MyButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextButton(
          style: ButtonStyle(
            minimumSize:
                MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 240, 205, 7)),
            foregroundColor:
                MaterialStateProperty.all(const Color.fromARGB(219, 54, 2, 61)),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: GoogleFonts.acme(),
          )),
    );
  }
}
