// ignore_for_file: equal_keys_in_map

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wt10/firebase_options.dart';

import 'package:wt10/screens/sound_screen.dart';
import 'package:wt10/screens/main_screen.dart';
import 'package:wt10/screens/registry_screen.dart';
import 'package:wt10/screens/sign_in_screen.dart';

import 'package:wt10/screens/sound_screen_2.dart';
import 'package:wt10/screens/sound_screen_3.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animal Sound App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        MainScreen.id: (context) => const MainScreen(),
        SoundScreen.id: (context) => const SoundScreen(),
        RegistryScreen.id: (context) => const RegistryScreen(),
        SignInScreen.id: (context) => const SignInScreen(),
        SoundScreen2.id: (context) => const SoundScreen2(),
        SoundScreen3.id: (context) => const SoundScreen3(),
      },
      initialRoute: MainScreen.id,
    );
  }
}
