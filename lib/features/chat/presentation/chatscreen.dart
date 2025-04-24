import 'dart:convert';

import 'package:chatbot/core/theme/apptheme.dart';
import 'package:chatbot/features/chat/widgets/chatbubble.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Chatscreen extends StatefulWidget {
  Chatscreen({super.key});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  List<Map<String, dynamic>> messages = [];

  final apiUrl = "http://10.0.2.2:8000/chat";
  TextEditingController userinput = TextEditingController();

  Future<void> sendPostRequest() async {
    final userMessage = userinput.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      messages.add({"text": userMessage, "isUser": true});
    });

    userinput.clear();

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"message": userMessage}),
      );

      if (response.statusCode == 200) {
        print("Request successful");
        final data = jsonDecode(response.body);
        final botReply = data["response"];

        setState(() {
          messages.add({"text": botReply, "isUser": false});
        });
      } else {
        print('Request failed: ${response.statusCode}');
      }
    } catch (e) {
      print("Error: $e");
    }
  }
  // List<Map<String, dynamic>> messages = [
  //   "text":
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(131, 126, 44, 203),
              const Color.fromARGB(130, 255, 132, 232),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              children: [
                Text(
                  'Hello!\nHow can I help?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final msg = messages[index];
                      return Chatbubble(
                        message: msg["text"] ?? "",
                        isUser: msg["isUser"],
                      );
                    },
                  ),
                ),

                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: userinput,
                        decoration: InputDecoration(
                          labelText: 'Type a message ...',
                          labelStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: const Color(0xFF1E1E1E),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.purpleAccent,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.redAccent,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (userinput.text.trim().isNotEmpty) {
                          sendPostRequest();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.send),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
