import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  final List<String> items;

  const MyList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(items[index]),
          // Add more properties or customize ListTile as needed
        );
      },
    );
  }
}
