import 'package:flutter/material.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom/controllers/auth.dart';
import 'package:zoom/controllers/firestore.dart';

class JitsiMeeting {
  final Auth _auth = Auth();
  final MeetingDatabase meetingDatabase = MeetingDatabase();
  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution.HD_RESOLUTION;
      String name;
      if (username.isEmpty) {
        name = _auth.user.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = name
        ..userEmail = _auth.user.email
        ..userAvatarURL = _auth.user.photoURL
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      meetingDatabase.meetingHistory(meetingname: roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (e) {
      debugPrint("error: $e");
    }
  }
}
