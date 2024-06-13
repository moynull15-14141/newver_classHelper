import 'package:flutter/material.dart';
import 'package:newapp/live/constant.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

class LivePage extends StatefulWidget {
  final String roomID;
  final bool isHost;
  final String userName;
  final String userId;

  const LivePage({
    super.key,
    required this.roomID,
    required this.isHost,
    required this.userId,
    required this.userName,
  });

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
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
                return PopScope(
                  canPop: true,
                  child: AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    backgroundColor: const Color.fromARGB(255, 1, 60, 64),
                    title: const Text("Live Room",
                        style: TextStyle(color: Colors.white)),
                    content: const Text("Do You want to leave ?",
                        style: TextStyle(color: Colors.white)),
                    actions: [
                      ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5), // Set your desired radius value here (e.g., 10.0, 20.0)
                            ),
                          ),
                          backgroundColor: const WidgetStatePropertyAll(
                            Color.fromARGB(255, 7, 123, 130),
                          ),
                        ),
                        child: const Text("Cancel",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255))),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    5), // Set your desired radius value here (e.g., 10.0, 20.0)
                              ),
                            ),
                            backgroundColor: const WidgetStatePropertyAll(
                              Color.fromARGB(255, 7, 123, 130),
                            ),
                          ),
                          child: const Text(
                            "Exit",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          }),
                    ],
                  ),
                );
              },
            );
          }),
          config: widget.isHost
              ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
              : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience()
            ..background = Container(
              color: const Color.fromARGB(255, 1, 60, 64),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Class Helper',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: 'Font1',
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
        ),
      ),
    );
  }
}
