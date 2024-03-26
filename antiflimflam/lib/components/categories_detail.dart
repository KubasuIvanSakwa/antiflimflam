import 'package:flutter/material.dart';

class CategoriesDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String catdetail;

  CategoriesDetailPage({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.catdetail,
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
                catdetail,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
