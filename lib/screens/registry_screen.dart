import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wt10/components/my_button.dart';
import 'package:wt10/components/my_text_input.dart';
import 'package:wt10/screens/sound_screen.dart';

class RegistryScreen extends StatefulWidget {
  static const id = 'RegistryScreen';
  const RegistryScreen({Key? key}) : super(key: key);

  @override
  State<RegistryScreen> createState() => _RegistryScreenState();
}

class _RegistryScreenState extends State<RegistryScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registry Screen',
          style: GoogleFonts.bungee(fontSize: 30),
        ),
        backgroundColor: const Color.fromARGB(219, 54, 2, 61),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Expanded(
              child: Row(
                children: [
                  SizedBox(
                    height: 150,
                    child: Hero(
                      tag: 'logo',
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('Create a new account',
                          textStyle: GoogleFonts.pacifico(
                              fontSize: 20, color: Colors.black))
                    ],
                  )
                  // const Text(
                  //   'Create a new account',
                  //   style: TextStyle(
                  //     fontSize: 50,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          MyTextInput(
            hintText: 'Enter your email',
            obscureText: false,
            onChanged: (value) {
              email = value;
            },
          ),
          MyTextInput(
            hintText: 'Enter your password',
            obscureText: true,
            onChanged: (value) {
              password = value;
            },
          ),
          MyButton(
            text: 'Next',
            onPressed: () async {
              try {
                UserCredential userCredential =
                    await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                if (userCredential.user != null) {
                  if (!mounted) return;
                  Navigator.pushNamed(context, SoundScreen.id);
                }
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  log('The password provider is to weak.');
                } else if (e.code == 'email-already-in-use') {
                  log('The account already exists for that email.');
                } else {
                  log(e.toString());
                }
              } catch (e) {
                log(e.toString());
              }
            },
          ),
        ],
      ),
    );
  }
}
