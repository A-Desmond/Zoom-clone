

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom/controllers/jitsi_meeting.dart';
import 'package:zoom/widget/meeting_botton.dart';

class MeetingScreen extends StatelessWidget {
 MeetingScreen({super.key});
 final JitsiMeeting jitsiMeeting = JitsiMeeting();
 createMeeting()async{
  var random = Random();
  String roomName = (random.nextInt(10000000)+10000000).toString();
  jitsiMeeting.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
 }
 joinMeeting(BuildContext context){
  Navigator.pushNamed(context, 'video_call');
 }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MeetingButton(
              icon: Icons.videocam,
              text: 'Meeting',
              onTap: createMeeting,
            ),
            MeetingButton(
              icon: Icons.add_box_rounded,
              text: 'Join Meeting',
              onTap: joinMeeting(context),
            ),
            MeetingButton(
              icon: Icons.calendar_today,
              text: 'Schedule',
              onTap: () {},
            ),
              MeetingButton(
              icon: Icons.arrow_upward,
              text: 'Share',
              onTap: () {},
            ),
          ],
        ),
       const  Expanded(child:  Center(child: Text('Create a meeting')))
      ],
    );
  }
}