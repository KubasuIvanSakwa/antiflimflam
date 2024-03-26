import 'package:flutter/material.dart';
import 'categories_detail.dart';

class Article {
  final String title;
  final String description;
  final String imageUrl;
  final String catdetail;

  Article({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.catdetail,
  });
}

class Categories extends StatelessWidget {
  final List<Article> articles = [
    Article(
      title: 'Scams',
      description: 'Learn about various methods to protect yourself from cyber attacks.',
      imageUrl: 'lib/images/image1.jpg',
      catdetail: """ What you can do to protect yourself
                        Here are some steps you can take to protect yourself from cyber attacks.
                        
                        Be on the lookout for suspicious links, attachments, and downloads
                        Malware and ransomware can be embedded in links, attachments, and downloads. Make sure a link is authentic before clicking on it.
                        Create and use strong passwords
                        You should always use strong and long passwords that are difficult to hack. Use unique passwords, meaning a different one for each account. Passwords should be at least 8 characters in length and contain numbers, special characters, and capitalized letters.
                        Use multi-factor authentication whenever possible
                        Multi-factor authentication adds an extra layer of security. If a service you are using offers multi-factor authentication, use it.
                        Use secure internet communications
                        Use sites that use “HTTPS” if you will access or provide any personal information. Don’t use sites with invalid certificates.
                        Update your anti-virus software regularly
                        Make sure your anti-virus software is up to date and updates are installed regularly.
                        Report anything suspicious to your IT department
                        Report any suspicious emails, files, or links to your company’s IT department."""
    ),
    Article(
      title: 'Phishing',
      description: 'Understanding the increasing threat of ransomware attacks and how to defend against them.',
      imageUrl: 'lib/images/image2.jpg',
        catdetail: """ What you can do to protect yourself
                        Here are some steps you can take to protect yourself from cyber attacks.
                        
                        Be on the lookout for suspicious links, attachments, and downloads
                        Malware and ransomware can be embedded in links, attachments, and downloads. Make sure a link is authentic before clicking on it.
                        Create and use strong passwords
                        You should always use strong and long passwords that are difficult to hack. Use unique passwords, meaning a different one for each account. Passwords should be at least 8 characters in length and contain numbers, special characters, and capitalized letters.
                        Use multi-factor authentication whenever possible
                        Multi-factor authentication adds an extra layer of security. If a service you are using offers multi-factor authentication, use it.
                        Use secure internet communications
                        Use sites that use “HTTPS” if you will access or provide any personal information. Don’t use sites with invalid certificates.
                        Update your anti-virus software regularly
                        Make sure your anti-virus software is up to date and updates are installed regularly.
                        Report anything suspicious to your IT department
                        Report any suspicious emails, files, or links to your company’s IT department."""
    ),
    Article(
      title: 'Phishing: How Hackers Trick You into Giving Up Your Information',
      description: 'Exploring the dangers of phishing attacks and how to recognize and avoid them.',
      imageUrl: 'lib/images/image3.jpeg',
        catdetail: """ What you can do to protect yourself
                        Here are some steps you can take to protect yourself from cyber attacks.
                        
                        Be on the lookout for suspicious links, attachments, and downloads
                        Malware and ransomware can be embedded in links, attachments, and downloads. Make sure a link is authentic before clicking on it.
                        Create and use strong passwords
                        You should always use strong and long passwords that are difficult to hack. Use unique passwords, meaning a different one for each account. Passwords should be at least 8 characters in length and contain numbers, special characters, and capitalized letters.
                        Use multi-factor authentication whenever possible
                        Multi-factor authentication adds an extra layer of security. If a service you are using offers multi-factor authentication, use it.
                        Use secure internet communications
                        Use sites that use “HTTPS” if you will access or provide any personal information. Don’t use sites with invalid certificates.
                        Update your anti-virus software regularly
                        Make sure your anti-virus software is up to date and updates are installed regularly.
                        Report anything suspicious to your IT department
                        Report any suspicious emails, files, or links to your company’s IT department."""
    ),
    Article(
      title: 'Social Engineering',
      description: 'social engineers prey on trust, curiosity and fear to trick individuals and organisations into divulging sensitive information or performing risky actions.',
      imageUrl: 'lib/images/image3.jpeg',
        catdetail: """ What you can do to protect yourself
                        Here are some steps you can take to protect yourself from cyber attacks.
                        
                        Be on the lookout for suspicious links, attachments, and downloads
                        Malware and ransomware can be embedded in links, attachments, and downloads. Make sure a link is authentic before clicking on it.
                        Create and use strong passwords
                        You should always use strong and long passwords that are difficult to hack. Use unique passwords, meaning a different one for each account. Passwords should be at least 8 characters in length and contain numbers, special characters, and capitalized letters.
                        Use multi-factor authentication whenever possible
                        Multi-factor authentication adds an extra layer of security. If a service you are using offers multi-factor authentication, use it.
                        Use secure internet communications
                        Use sites that use “HTTPS” if you will access or provide any personal information. Don’t use sites with invalid certificates.
                        Update your anti-virus software regularly
                        Make sure your anti-virus software is up to date and updates are installed regularly.
                        Report anything suspicious to your IT department
                        Report any suspicious emails, files, or links to your company’s IT department."""
    ),
    Article(
      title: 'Mobile Security',
      description: 'Securing Your Smartphone and Mobile Apps article.',
      imageUrl: 'lib/images/image3.jpeg',
        catdetail: """ What you can do to protect yourself
                        Here are some steps you can take to protect yourself from cyber attacks.
                        
                        Be on the lookout for suspicious links, attachments, and downloads
                        Malware and ransomware can be embedded in links, attachments, and downloads. Make sure a link is authentic before clicking on it.
                        Create and use strong passwords
                        You should always use strong and long passwords that are difficult to hack. Use unique passwords, meaning a different one for each account. Passwords should be at least 8 characters in length and contain numbers, special characters, and capitalized letters.
                        Use multi-factor authentication whenever possible
                        Multi-factor authentication adds an extra layer of security. If a service you are using offers multi-factor authentication, use it.
                        Use secure internet communications
                        Use sites that use “HTTPS” if you will access or provide any personal information. Don’t use sites with invalid certificates.
                        Update your anti-virus software regularly
                        Make sure your anti-virus software is up to date and updates are installed regularly.
                        Report anything suspicious to your IT department
                        Report any suspicious emails, files, or links to your company’s IT department."""
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
                      catdetail: articles[index].catdetail,
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
