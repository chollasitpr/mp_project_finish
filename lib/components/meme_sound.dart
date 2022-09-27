// import 'package:audioplayers/audioplayers.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MemeSound extends StatelessWidget {
  const MemeSound({
    Key? key,
    // required this.audiPlayer,
    // required this.source,
    required this.image,
    required this.label,
    required this.assetsAudioPlayer,
    required this.audio,
  }) : super(key: key);

  // final assetsAudioPlayer audiPlayer;
  // final Source source;
  final AssetsAudioPlayer assetsAudioPlayer;
  final Audio audio;
  final Image image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: TextButton(
                        onPressed: () async {
                          await assetsAudioPlayer.open(audio);
                        },
                        onLongPress: () async {
                          await assetsAudioPlayer.stop();
                        },
                        child: image,
                      ),
                    ),
                  ),
                  // Container(
                  //   color: const Color.fromARGB(255, 255, 220, 23),
                  //   margin:
                  //       const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       const Icon(Icons.volume_up),
                  //       Expanded(child: Container(child: Text(label)))
                  //     ],
                  //   ),
                  // ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(60, 20, 60, 20),
                        // padding: EdgeInsets.only(top: 25, bottom: 25),
                        color: const Color.fromARGB(255, 255, 200, 35),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Icon(Icons.volume_down_rounded),
                                    ],
                                  ),
                                  Text(
                                    label,
                                    style: GoogleFonts.bungee(fontSize: 10),
                                    // style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
