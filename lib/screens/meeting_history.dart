

import 'package:flutter/material.dart';
import 'package:zoom/controllers/firestore.dart';

class MeetingHistory extends StatelessWidget {
  const MeetingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: MeetingDatabase().meetingHistoryDta, 
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
        if(snapshot.connectionState ==ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator.adaptive(),);
        }
        return ListView.separated(
          itemCount: (snapshot.data as dynamic).docs.length,

          itemBuilder: (context, index)=>ListTile(title: Text('Room Name ${(snapshot.data as dynamic).docs[index]['meetingName']}'), 
          // int Package to formate date and time at 2 hours 8 mins
          subtitle:Text('Joined on ${(snapshot.data as dynamic).docs[index]['createdAt']}'),),

          separatorBuilder: (context, index)=> const Divider(thickness: 1,), 
          );
       },

     );
  }
}

