import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class PianoScreen extends StatefulWidget {
  const PianoScreen({Key? key}) : super(key: key);

  @override
  State<PianoScreen> createState() => _PianoScreenState();
}

class _PianoScreenState extends State<PianoScreen> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  void readNote(String note) {
    assetsAudioPlayer.open(Audio('assets/notes/$note.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double whiteWidth = constraints.maxWidth / 7;
            double blackWidth = whiteWidth * 0.6;
            double keyHeight = constraints.maxHeight / 2;
            return Stack(
              fit: StackFit.expand,
              children: [
                // White Keys
                for (int i = 0; i < 7; i++)
                  whiteTile('CDEFGAB'[i], i, whiteWidth),
                // Black Keys
                blackTile('Db', 1, whiteWidth, keyHeight, blackWidth),
                blackTile('Eb', 2, whiteWidth, keyHeight, blackWidth),
                blackTile('Gb', 4, whiteWidth, keyHeight, blackWidth),
                blackTile('Ab', 5, whiteWidth, keyHeight, blackWidth),
                blackTile('Bb', 6, whiteWidth, keyHeight, blackWidth),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget whiteTile(String tone, int position, double whiteWidth) {
    return Positioned(
      top: 0,
      left: position * whiteWidth,
      width: whiteWidth,
      bottom: 0,
      child: RawMaterialButton(
        onPressed: () {
          readNote(tone);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Colors.black, width: 1),
        ),
        elevation: 2,
        fillColor: Colors.white,
      ),
    );
  }

  Widget blackTile(String tone, int position, double whiteWidth, double height,
      double width) {
    return Positioned(
      top: 0,
      left: position * whiteWidth - width / 2,
      width: width,
      height: height * 0.6,
      child: RawMaterialButton(
        onPressed: () {
          readNote(tone);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Colors.black, width: 1),
        ),
        elevation: 2,
        fillColor: Colors.grey[800],
      ),
    );
  }
}
