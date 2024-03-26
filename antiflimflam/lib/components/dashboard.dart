import 'package:flutter/material.dart';
import 'package:antiflimflam/components/my_button.dart';
import 'package:antiflimflam/components/articles.dart';
import 'package:antiflimflam/components/categories.dart';
import 'feedback.dart';

class Dashboard extends StatelessWidget {
  final List<String> items = ['Articles', 'CyberAttack Categories'];

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
                    padding: const EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding
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
                        // Navigate to the respective page based on the item
                        if (items[index] == 'Articles') {
                          // Navigate to the Articles page
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleComponent()));
                        } else if (items[index] == 'CyberAttack Categories') {
                          // Navigate to the CyberAttack Categories page
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Categories()));
                        }
                      },
                    ),
                  );
                },
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
}
