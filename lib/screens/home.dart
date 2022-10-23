import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zoom/utils/colors.dart';
import 'package:zoom/widget/meeting_botton.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Meeting & Chat'),
        centerTitle: true,
        backgroundColor: scaffoldbackgroud,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MeetingButton(
                icon: Icons.videocam,
                text: 'Meeting',
                onTap: () {},
              ),
              MeetingButton(
                icon: Icons.add_box_rounded,
                text: 'Join Meeting',
                onTap: () {},
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
      ),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: 'Meet & Chat'),
          ]),
    );
  }
}
