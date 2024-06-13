import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class media extends StatefulWidget {
  const media({super.key});

  @override
  State<media> createState() => _mediaState();
}

class _mediaState extends State<media> {
  AudioPlayer player = AudioPlayer();
  bool isplay = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');

    if (seconds < 3600) {
      return '$minutes:$remainingSeconds';
    } else {
      final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
      return '$hours:$minutes:$remainingSeconds';
    }
  }

  @override
  void initState() {
    super.initState();
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isplay = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: (value) {
              player.seek(position);
              player.resume();
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatTime(position.inSeconds),
                ),
                Text(formatTime((duration - position).inSeconds))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    if (isplay) {
                      player.pause();
                    } else {
                      player.play(
                        AssetSource("mp3/eee.mp3"),
                      );
                    }
                  },
                  icon: Icon(isplay ? Icons.pause : Icons.play_arrow)),
              IconButton(
                onPressed: () {
                  player.stop();
                },
                icon: const Icon(Icons.stop),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }
}
