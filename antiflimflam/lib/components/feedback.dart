import 'package:flutter/material.dart';

class FeedbackComponent extends StatefulWidget {
  const FeedbackComponent({super.key});

  @override
  _FeedbackComponentState createState() => _FeedbackComponentState();
}

class _FeedbackComponentState extends State<FeedbackComponent> {
  final TextEditingController _feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Enter your feedback here...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Send feedback logic goes here
                String feedback = _feedbackController.text;
                //print('Sending feedback: $feedback');
                // Reset text field after sending feedback
                _feedbackController.clear();
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(const MaterialApp(
    home: FeedbackComponent(),
  ));
}
