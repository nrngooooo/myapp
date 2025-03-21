import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget {
  final Map<String, dynamic> news;

  const NewsDetailScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(news["garchig"] ?? "News Detail")),
      body: SingleChildScrollView(
        // Makes the content scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news["zurag"] != null && news["zurag"].isNotEmpty)
              Image.network(news["zurag"]),
            SizedBox(height: 10),
            Text(
              news["garchig"] ?? "",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("By: ${news["niitlegch"] ?? "Unknown"}"),
            SizedBox(height: 10),
            Text(news["tailbar"] ?? "No details available."),
          ],
        ),
      ),
    );
  }
}
