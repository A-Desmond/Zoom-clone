import 'package:flutter/material.dart';
import 'package:zoom/screens/meeting_history.dart';
import 'package:zoom/screens/meeting_screen.dart';
import 'package:zoom/utils/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int selectedIndex = 0;

class _HomeState extends State<Home> {
  changePage(int page) {
    setState(() {
      selectedIndex = page;
    });
  }

List widgets = [
  MeetingScreen(),
 const MeetingHistory()
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Meeting & Chat'),
        centerTitle: true,
        backgroundColor: scaffoldbackgroud,
      ),
      body: widgets[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 14,
          onTap: changePage,
          items: const [
            BottomNavigationBarItem(  
                icon: Icon(Icons.comment_bank), label: 'Meet & Chat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: 'Meetings'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Contacts'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}
