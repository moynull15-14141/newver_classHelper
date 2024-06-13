import 'package:flutter/material.dart';
import 'package:newapp/live/constant.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

class LivePage extends StatefulWidget {
  final String roomID;
  final bool isHost;
  final String userName;
  final String userId;

  const LivePage(
      {super.key,
      required this.roomID,
      required this.isHost,
      required this.userId,
      required this.userName});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveAudioRoom(
        appID: constant.appId,
        appSign: constant.appSign,
        userID: widget.userId,
        userName: widget.userName,
        roomID: widget.roomID,
        events: ZegoUIKitPrebuiltLiveAudioRoomEvents(onLeaveConfirmation: (
          ZegoLiveAudioRoomLeaveConfirmationEvent event,

          /// defaultAction to return to the previous page
          Future<bool> Function() defaultAction,
        ) async {
          return await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.blue[900]!.withOpacity(0.9),
                title: const Text("This is your custom dialog",
                    style: TextStyle(color: Colors.white70)),
                content: const Text("You can customize this dialog as you like",
                    style: TextStyle(color: Colors.white70)),
                actions: [
                  ElevatedButton(
                    child: const Text("Cancel",
                        style: TextStyle(color: Color.fromARGB(179, 0, 0, 0))),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  ElevatedButton(
                      child: const Text("Exit"),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      }),
                ],
              );
            },
          );
        }),
        config: widget.isHost
            ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
            : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience()
          ..background = Container(
            color: const Color.fromARGB(255, 1, 60, 64),
          ),
      ),
    );
  }
}
