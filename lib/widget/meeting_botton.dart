import 'package:flutter/material.dart';
import 'package:zoom/utils/colors.dart';

class MeetingButton extends StatelessWidget {
  final String  text;
  final IconData icon;
  final VoidCallback onTap;
  const MeetingButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.06),
                      offset: const Offset(0, 4))
                ]),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 10,),
          Text(text, style:const TextStyle(color: Colors.grey),), 
        ],
      ),
    );
  }
}
