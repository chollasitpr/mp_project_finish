import 'package:flutter/material.dart';

import 'input_with_error_text.dart';

// ignore: must_be_immutable
class MyTextInputWithErrorText extends StatelessWidget {
  InputWithErrorText input;
  final bool obscureText;
  final String hintText;
  final TextInputType textInputType;
  MyTextInputWithErrorText({Key? key, required this.input, this.obscureText = false, required this.hintText, this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextField(
        keyboardType: textInputType,
        obscureText: obscureText,
        onChanged: (value) {
          input.valueText = value;
        },
        decoration: InputDecoration(
          hintText: hintText,
          errorText: input.errorText,
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
      ),
    );
  }
}
