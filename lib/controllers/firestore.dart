import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MeetingDatabase{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingHistoryDta => _firestore.collection('users').doc(_firebaseAuth.currentUser!.uid).collection('meeting').snapshots();
  void meetingHistory({
    required String meetingname,
  }) async {
    try {
      await _firestore.collection('users').doc(_firebaseAuth.currentUser!.uid).collection('meeting').add({
        'meetingName': meetingname,
        'createdAt': DateTime.now(),
      });
    } catch (e) {
      print(e.toString());
    }
  }
}