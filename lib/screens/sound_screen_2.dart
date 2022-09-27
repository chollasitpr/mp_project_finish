import 'dart:developer';
// import 'package:audioplayers/audioplayers.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as a;
import 'package:google_fonts/google_fonts.dart';
import 'package:wt10/components/meme_sound.dart';
import 'package:wt10/screens/main_screen.dart';
import 'package:wt10/screens/sound_screen.dart';

import '../components/navigator_button.dart';

class SoundScreen2 extends StatefulWidget {
  static const id = 'SoundScreen2';
  const SoundScreen2({Key? key}) : super(key: key);

  @override
  State<SoundScreen2> createState() => _SoundScreen2State();
}

class _SoundScreen2State extends State<SoundScreen2> {
  final Stream<a.QuerySnapshot> messageStream =
      a.FirebaseFirestore.instance.collection('messages').snapshots();
  User? user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    // if (user!= null && !user.emailVerified) {
    //   await user.sendEmailVerification();
    // }
    if (user == null) {
      //Tod o: Throw error
    } else {
      log(user!.email.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final assetsAudioPlayer = AssetsAudioPlayer();
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(219, 54, 2, 61),
        leading: null,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (!mounted) return;
              Navigator.popAndPushNamed(context, MainScreen.id);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        title: Text(
          'Best For Editing!!',
          style: GoogleFonts.bungee(fontSize: 20, color: Colors.amber),
          // style: TextStyle(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: MemeSound(
                        label: 'They ask you How you are',
                        image:
                            const Image(image: AssetImage('images/Button.png')),
                        // source: DeviceFileSource(
                        //     'sounds/they-ask-you-how-you-are-and-you-just-have-to-say-that-youre-fine-sound-effect_IgYM1CV.mp3'),
                        // audiPlayer: audiPlayer),
                        audio: Audio(
                            'assets/audios/they-ask-you-how-you-are-and-you-just-have-to-say-that-youre-fine-sound-effect_IgYM1CV.mp3'),
                        assetsAudioPlayer: assetsAudioPlayer),
                  ),
                  MemeSound(
                      label: 'Run Meme',
                      image:
                          const Image(image: AssetImage('images/Button.png')),
                      // source:
                      //     DeviceFileSource('sounds/run-vine-sound-effect.mp3'),
                      // audiPlayer: audiPlayer),
                      audio: Audio('assets/audios/run-vine-sound-effect.mp3'),
                      assetsAudioPlayer: assetsAudioPlayer),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  MemeSound(
                      label: 'Sad Violin Meme',
                      image:
                          const Image(image: AssetImage('images/Button.png')),
                      // source: DeviceFileSource('sounds/sadViolin.mp3'),
                      // audiPlayer: audiPlayer),
                      audio: Audio('assets/audios/sadViolin.mp3'),
                      assetsAudioPlayer: assetsAudioPlayer),
                  MemeSound(
                      label: 'What are you doing Meme',
                      image:
                          const Image(image: AssetImage('images/Button.png')),
                      // source: DeviceFileSource(
                      //     'sounds/what-are-you-doing-in-my-swamp-.mp3'),
                      // audiPlayer: audiPlayer),
                      audio: Audio(
                          'assets/audios/what-are-you-doing-in-my-swamp-.mp3'),
                      assetsAudioPlayer: assetsAudioPlayer),
                ],
              ),
            ),
            // const NavigatorButton(
            //     text: 'Next', navigatorNamed: SoundScreen3.id),
            const NavigatorButton(text: 'Back', navigatorNamed: SoundScreen.id),
          ],
        ),
      ),
    );
  }
}
