// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:wt10/screens/registry_screen.dart';
import 'package:wt10/screens/sign_in_screen.dart';

class InputTextFeild extends StatelessWidget {
  const InputTextFeild({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(), hintText: label),
      ),
    );
  }
}

class ButtonSignIn extends StatelessWidget {
  const ButtonSignIn({
    Key? key,
    required this.label,
    required this.color,
  }) : super(key: key);
  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: TextButton(
            style: ButtonStyle(
              minimumSize:
                  MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
              backgroundColor:
                  MaterialStateProperty.all(Colors.lightBlueAccent.shade700),
              foregroundColor: MaterialStateProperty.all(color),
            ),
            onPressed: () {
              Navigator.pushNamed(context, SignInScreen.id);
            },
            child: Text(label)));
  }
}

class ButtonSignUp extends StatelessWidget {
  const ButtonSignUp({
    Key? key,
    required this.label,
    required this.color,
  }) : super(key: key);
  final String label;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: TextButton(
            style: ButtonStyle(
              minimumSize:
                  MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
              backgroundColor:
                  MaterialStateProperty.all(Colors.lightBlueAccent.shade700),
              foregroundColor: MaterialStateProperty.all(color),
            ),
            onPressed: () {
              Navigator.pushNamed(context, RegistryScreen.id);
            },
            child: Text(label)));
  }
}
