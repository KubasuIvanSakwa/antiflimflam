import 'package:flutter/material.dart';
import 'categories_detail.dart';

class Article {
  final String title;
  final String description;
  final String imageUrl;

  Article({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class Categories extends StatelessWidget {
  final List<Article> articles = [
    Article(
      title: 'Scams',
      description: 'Learn about various methods to protect yourself from cyber attacks.',
      imageUrl: 'lib/images/image1.jpg',
    ),
    Article(
      title: 'Phishing',
      description: 'Understanding the increasing threat of ransomware attacks and how to defend against them.',
      imageUrl: 'lib/images/image2.jpg',
    ),
    Article(
      title: 'Phishing: How Hackers Trick You into Giving Up Your Information',
      description: 'Exploring the dangers of phishing attacks and how to recognize and avoid them.',
      imageUrl: 'lib/images/image3.jpeg',
    ),
    Article(
      title: 'Social Engineering',
      description: 'social engineers prey on trust, curiosity and fear to trick individuals and organisations into divulging sensitive information or performing risky actions.',
      imageUrl: 'lib/images/image3.jpeg',
    ),
    Article(
      title: 'Mobile Security',
      description: 'Securing Your Smartphone and Mobile Apps article.',
      imageUrl: 'lib/images/image3.jpeg',
    ),

  ];

  Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: Image.asset(
                articles[index].imageUrl,
                width: 100,
                fit: BoxFit.cover,
              ),
              title: Text(articles[index].title),
              subtitle: Text(articles[index].description),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoriesDetailPage(
                      title: articles[index].title,
                      description: articles[index].description,
                      imageUrl: articles[index].imageUrl,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Categories(),
  ));
}
