import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatService {
  final apiUrl = "http://127.0.0.1:8000";
  TextEditingController userinput = TextEditingController();

  Future<void> sendPostRequest() async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"content": userinput.text}),
    );

    if (response.statusCode == 200) {
      print("Request successful");
    } else {
      print('Request failed: ${response.statusCode}');
    }
  }
}
