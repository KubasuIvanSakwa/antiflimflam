import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:antiflimflam/components/my_button.dart';
import 'package:antiflimflam/components/articles.dart';
import 'package:antiflimflam/components/categories.dart';
import 'package:http/http.dart' as http;
import 'feedback.dart';

class Dashboard extends StatelessWidget {
  final List<String> items = ['Articles', 'CyberAttack Categories'];

  Future<void> _makeHttpRequest() async {
    const String url = 'https://matjam-spam-scanner-v1.p.rapidapi.com/message';

    final Map<String, dynamic> requestData = {
      "ip": "192.168.0.1",
      "sender": "mwendeanncasty@gmail.com",
      "recipient": "musenyawafula@gmail.com",
      "body": "&{message}",
      "subject": "Just a test subject"
    };

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'X-RapidAPI-Key': '542e4e35c2mshd2cca66ea867bc6p100e3djsnac18a77a71f4',
        'X-RapidAPI-Host': 'matjam-spam-scanner-v1.p.rapidapi.com',
      },
      body: json.encode(requestData),
    );

    if (response.statusCode == 200) {
      // Request successful
      print('Response: ${response.body}');
    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}');
    }
  }

  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'CyberAttacks',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Map over the items list and create a MyButton for each item
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: MyButton(
                      text: Text(
                        items[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        if (items[index] == 'Articles') {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleComponent()));
                        } else if (items[index] == 'CyberAttack Categories') {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Categories()));
                        }
                      },
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    _showScanningDialog(context);
                  },
                  child: const Text('Scan for Security Issues'),
                ),
              ),
              GestureDetector( // Wrap with GestureDetector for onTap functionality
                onTap: () {
                  // Navigate to the Feedback page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackComponent()));
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Give Feedback',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _showScanningDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Scanning for Security Issues'),
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text('Please wait...'),
            ],
          ),
        );

      },
    );

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop(); // Close the scanning dialog
      _showScanResultDialog(context); // Show the scan result dialog
      _makeHttpRequest();
    });
  }

  void _showScanResultDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Scan Result'),
          content: const Text('No security issues detected.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the scan result dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
