import 'dart:developer';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as a;
import 'package:google_fonts/google_fonts.dart';
import 'package:wt10/components/meme_sound.dart';
import 'package:wt10/screens/main_screen.dart';

class SoundScreen3 extends StatefulWidget {
  static const id = 'SoundScreen3';
  const SoundScreen3({Key? key}) : super(key: key);

  @override
  State<SoundScreen3> createState() => _SoundScreen3State();
}

class _SoundScreen3State extends State<SoundScreen3> {
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
      backgroundColor: const Color.fromARGB(255, 209, 51, 236),
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
            icon: const Icon(Icons.close_sharp),
          ),
        ],
        title: Text(
          'Sound Screen!!!',
          style: GoogleFonts.bungee(fontSize: 20, color: Colors.amber),
          // style: TextStyle(fontSize: 30),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: Column(
                  children: [
                    MemeSound(
                        label: 'Emotional Damaged Meme',
                        image:
                            const Image(image: AssetImage('images/Button.png')),
                        // source:
                        //     DeviceFileSource('sounds/emotional-damage-meme.mp3'),
                        // audiPlayer: audiPlayer),
                        audio: Audio('assets/audios/emotional-damage-meme.mp3'),
                        assetsAudioPlayer: assetsAudioPlayer),
                    MemeSound(
                        label: 'Error Meme',
                        image:
                            const Image(image: AssetImage('images/Button.png')),
                        // source: DeviceFileSource('sounds/error_CDOxCYm.mp3'),
                        // audiPlayer: audiPlayer),
                        audio: Audio('assets/audios/error_CDOxCYm.mp3'),
                        assetsAudioPlayer: assetsAudioPlayer),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: Column(
                  children: [
                    MemeSound(
                        label: 'GTA Meme',
                        image:
                            const Image(image: AssetImage('images/Button.png')),
                        // source: DeviceFileSource(
                        //     'sounds/gta-san-andreas-ah-shit-here-we-go-again_BWv0Gvc.mp3'),
                        // audiPlayer: audiPlayer),
                        audio: Audio(
                            'assets/audios/gta-san-andreas-ah-shit-here-we-go-again_BWv0Gvc.mp3'),
                        assetsAudioPlayer: assetsAudioPlayer),
                    MemeSound(
                        label: 'Jotaro Adventure Meme',
                        image:
                            const Image(image: AssetImage('images/Button.png')),
                        // source: DeviceFileSource(
                        //     'sounds/jojos-bizarre-adventure-ay-ay-ay-ay-_-sound-effect.mp3'),
                        // audiPlayer: audiPlayer),
                        audio: Audio(
                            'assets/audios/jojos-bizarre-adventure-ay-ay-ay-ay-_-sound-effect.mp3'),
                        assetsAudioPlayer: assetsAudioPlayer),
                  ],
                ),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.all(8),
            //   child: MyButton(
            //     text: 'Back',
            //     onPressed: () async {
            //       await Navigator.pushNamed(context, SoundScreen2.id);
            //     },
            //   ),
            // ),
            // const NavigatorButton(
            //     text: 'Back', navigatorNamed: SoundScreen2.id),
          ],
        ),
      ),
    );
  }
}
