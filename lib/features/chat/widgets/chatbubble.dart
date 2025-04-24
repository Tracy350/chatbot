import 'package:chatbot/core/theme/apptheme.dart';
import 'package:flutter/material.dart';

class Chatbubble extends StatelessWidget {
  final String message;
  final bool isUser;
  const Chatbubble({super.key, required this.isUser, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Container(
        decoration: BoxDecoration(
          color: isUser ? AppTheme.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(message),
        ),
      ),
    );
  }
}
