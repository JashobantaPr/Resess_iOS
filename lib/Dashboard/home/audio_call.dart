import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../controllers/video_audio_call_controller.dart/video_call_controller.dart';

class AudioCall extends StatefulWidget {
  @override
  State<AudioCall> createState() => _AudioCallState();
}

class _AudioCallState extends State<AudioCall> {
  final callCon = Get.put(CallController());

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable(); // Keep the screen awake during the call
  }

  @override
  void dispose() {
    WakelockPlus.disable(); // Allow the screen to sleep after the call ends
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? channelId = Get.arguments['channelId'];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Obx(() => Padding(
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          size: 100,
                          color: Colors.white,
                        ),
                        SizedBox(height: 20),
                        Text(
                          callCon.localUserJoined == true
                              ? "Connected"
                              : "Waiting for the other user...",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              callCon.onToggleMute();
                            },
                            child: Icon(
                              callCon.muted.value ? Icons.mic_off : Icons.mic,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              callCon.onCallEnd();
                            },
                            child: const Icon(
                              Icons.call_end,
                              size: 35,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              callCon.onSpeakerToggle();
                            },
                            child: Icon(
                              callCon.speakerOn.value
                                  ? Icons.volume_up
                                  : Icons.volume_off,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
