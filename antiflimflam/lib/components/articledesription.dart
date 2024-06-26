import 'package:flutter/material.dart';

class ArticleDescriptionPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String  articledesc;

  ArticleDescriptionPage({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.articledesc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
        child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              articledesc,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    ),);
  }
}
