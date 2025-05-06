import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DrumMachine());
}
class DrumMachine extends StatelessWidget {
  final oynatici = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.black, body: DrumPage()),
    );
  }
}
class DrumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 10,
          children: [
            Expanded(
              child: Column(
                spacing: 10,
                children: [
                  PlayWidget(path: 'audio/bip.wav', color: Colors.blue),
                  PlayWidget(path: 'audio/oobah.wav', color: Colors.purple),
                  PlayWidget(path: 'audio/clap1.wav', color: Colors.deepOrange),
                  PlayWidget(path: 'audio/clap2.wav', color: Colors.amber),
                ],
              ),
            ),
            Expanded(
              child: Column(
                spacing: 10,
                children: [
                  PlayWidget(path: 'audio/clap3.wav', color: Colors.pink),
                  PlayWidget(path: 'audio/how.wav', color: Colors.green),
                  PlayWidget(path: 'audio/crash.wav', color: Colors.grey),
                  PlayWidget(path: 'audio/ridebel.wav', color: Colors.brown),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayWidget extends StatelessWidget {
  const PlayWidget({super.key, required this.path, required this.color});
  final String path;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final oynatici = AudioPlayer();
    return Expanded(
      child: GestureDetector(
        onTap: () {
          oynatici.play(AssetSource(path));
        },
        child: Container(color: color),
      ),
    );
  }
}
