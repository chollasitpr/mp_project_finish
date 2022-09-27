import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as a;
import 'package:google_fonts/google_fonts.dart';
import 'package:wt10/components/meme_sound.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:wt10/components/navigator_button.dart';
import 'package:wt10/screens/main_screen.dart';
import 'package:wt10/screens/sound_screen_2.dart';

class SoundScreen extends StatefulWidget {
  static const id = 'SoundScreen';
  const SoundScreen({Key? key}) : super(key: key);

  @override
  State<SoundScreen> createState() => _SoundScreenState();
}

class _SoundScreenState extends State<SoundScreen> {
  final Stream<a.QuerySnapshot> messageStream =
      a.FirebaseFirestore.instance.collection('messages').snapshots();
  final assetsAudioPlayer = AssetsAudioPlayer();
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
    // final audiPlayer = AudioPlayer();
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
          'Poppular Now!!!',
          style: GoogleFonts.bungee(fontSize: 20, color: Colors.amber),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  MemeSound(
                      label: 'AUUGHHH Meme',
                      image:
                          const Image(image: AssetImage('images/Button.png')),
                      audio: Audio(
                          'assets/audios/AUUGHHH Tik Tok Sound Effect.mp3'),
                      assetsAudioPlayer: assetsAudioPlayer),
                  MemeSound(
                      label: 'Astroimai Meme',
                      image:
                          const Image(image: AssetImage('images/Button.png')),
                      // source:
                      //     DeviceFileSource('sounds/y2mate-mp3cut_sRzY6rh.mp3'),
                      // audiPlayer: audiPlayer),
                      audio: Audio('assets/audios/y2mate-mp3cut_sRzY6rh.mp3'),
                      assetsAudioPlayer: assetsAudioPlayer),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  MemeSound(
                      label: 'Creditos Meme',
                      image:
                          const Image(image: AssetImage('images/Button.png')),
                      // source: DeviceFileSource(
                      //     'sounds/meme-de-creditos-finales.mp3'),
                      // audiPlayer: audiPlayer),
                      audio:
                          Audio('assets/audios/meme-de-creditos-finales.mp3'),
                      assetsAudioPlayer: assetsAudioPlayer),
                  MemeSound(
                      label: 'Dejavu Meme',
                      image:
                          const Image(image: AssetImage('images/Button.png')),
                      // source: DeviceFileSource('sounds/deja-vu.mp3'),
                      // audiPlayer: audiPlayer),
                      audio: Audio('assets/audios/deja-vu.mp3'),
                      assetsAudioPlayer: assetsAudioPlayer),
                ],
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.all(8),
            //   child: MyButton(
            //     text: 'Next',
            //     onPressed: () async {
            //       await Navigator.pushNamed(context, SoundScreen2.id);
            //     },
            //   ),
            // ),
            const NavigatorButton(
                text: 'Next', navigatorNamed: SoundScreen2.id),
          ],
        ),
      ),
    );
  }
}
