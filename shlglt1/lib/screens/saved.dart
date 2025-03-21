import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  final List<Map<String, dynamic>> savedArticles = [
    {
      'title': 'Explore the most popular festivals around the world',
      'category': 'FESTIVALS',
      'imageUrl':
          'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3',
      'color': Colors.orange,
      'turul': 'Festival', // Ensure 'turul' is defined here
    },
    {
      'title': 'Discover the best images on Unsplash in 2017',
      'category': 'DESIGN',
      'imageUrl': 'https://images.unsplash.com/photo-1542831371-29b0f74f9713',
      'color': Colors.purple,
      'turul': 'Design', // Ensure 'turul' is defined here
    },
    {
      'title': 'The most popular places to travel in December',
      'category': 'TRAVEL',
      'imageUrl':
          'https://images.unsplash.com/photo-1488646953014-85cb44e25828',
      'color': Colors.blue,
      'turul': 'Travel', // Ensure 'turul' is defined here
    },
    {
      'title': 'The latest art exhibitions opened last week',
      'category': 'ART',
      'imageUrl': 'https://images.unsplash.com/photo-1561214115-f2f134cc4912',
      'color': Colors.pink,
      'turul': 'Art', // Ensure 'turul' is defined here
    },
    {
      'title': 'Light pollution prevents us from seeing the stars',
      'category': 'ENVIRONMENT',
      'imageUrl':
          'https://images.unsplash.com/photo-1519681393784-d120267933ba',
      'color': Colors.green,
      'turul': 'Environment', // Ensure 'turul' is defined here
    },
  ];

  SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Saved Articles',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),

        // Search Bar
        TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
        SizedBox(height: 16),

        // Saved Articles List
        Expanded(
          child: ListView.builder(
            itemCount: savedArticles.length,
            itemBuilder: (context, index) {
              final article = savedArticles[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Article Content
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Category
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: article['color'] as Color,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              article['turul'] ??
                                  'No Category', // Default value for 'turul'
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          // Title
                          Text(
                            article['title']!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    // Article Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Image.network(
                          article['imageUrl']!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: Icon(
                                Icons.image_not_supported,
                                color: Colors.grey[600],
                              ),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: Colors.grey[200],
                              child: Center(
                                child: CircularProgressIndicator(
                                  value:
                                      loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                              loadingProgress
                                                  .expectedTotalBytes!
                                          : null,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
