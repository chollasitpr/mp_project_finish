import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigatorButton extends StatelessWidget {
  final String text;
  final String navigatorNamed;
  const NavigatorButton(
      {Key? key, required this.text, required this.navigatorNamed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextButton(
        style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromARGB(255, 240, 205, 7)),
          foregroundColor:
              MaterialStateProperty.all(const Color.fromARGB(219, 54, 2, 61)),
        ),
        onPressed: () => Navigator.pushNamed(context, navigatorNamed),
        child: Text(
          text,
          style: GoogleFonts.acme(fontSize: 20),
        ),
      ),
    );
  }
}
