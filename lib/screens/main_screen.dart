import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wt10/components/navigator_button.dart';
import 'package:wt10/screens/registry_screen.dart';
import 'package:wt10/screens/sign_in_screen.dart';

import 'package:wt10/screens/sound_screen_3.dart';

class MainScreen extends StatefulWidget {
  static const id = 'MainScreen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  late Animation animationColor;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      upperBound: 1,
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
    animationColor = ColorTween(
            begin: Colors.white, end: const Color.fromARGB(255, 255, 255, 255))
        .animate(animationController);
    animationController.forward();
    animationController.addListener(() {
      //log(animationController.value.toStringAsFixed(3));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(219, 54, 2, 61),
      // appBar: AppBar(title: const Text('Welcome to Animal Sound App')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: animation.value * 300,
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                'images/logo.png',
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Meme Sound',
                    textStyle: GoogleFonts.pacifico(
                        fontSize: 50, color: animationColor.value))
              ],
              onTap: () {
                // ignore: avoid_print
                print("Tap Event!!!");
              },
            ),
          ),

          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 50,
            child: Center(
              child: Text(
                'Login for more content.',
                style: GoogleFonts.pacifico(
                    fontSize: 10,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const NavigatorButton(
            text: 'Sign-in',
            navigatorNamed: SignInScreen.id,
          ),
          const NavigatorButton(
            text: 'Sign-up',
            navigatorNamed: RegistryScreen.id,
          ),
          // Column(
          //   children: const [
          //     Text('Or'),
          //   ],
          // ),
          SizedBox(
            height: 50,
            child: Center(
              child: Text(
                'Or another way you can',
                style: GoogleFonts.pacifico(
                    fontSize: 20,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const NavigatorButton(
            text: 'Go With Guest',
            navigatorNamed: SoundScreen3.id,
          ),
          SizedBox(
            height: 50,
            child: Center(
              child: Text(
                'If you not login you can see less content',
                style: GoogleFonts.pacifico(
                    fontSize: 10,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
