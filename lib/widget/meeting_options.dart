
import 'package:flutter/material.dart';
import 'package:zoom/utils/colors.dart';

class MeetingOption extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChanged;
  const MeetingOption({
    super.key, 
    required this.text,
     required this.isMute,
     required this.onChanged
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: scaffoldbackgroud,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text, style: const TextStyle(fontSize: 16)),
          ),
          Switch.adaptive(value: isMute, onChanged: onChanged)
        ],
      ),
    );
  }
}

/// text extension when am free
extension MyStyle on String{
    String fourDit (String string){
       var newVal = string[0] +string[1]+string[2]+string[3];
       return newVal;
    }
}