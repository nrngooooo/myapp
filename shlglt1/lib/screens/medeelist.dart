import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:shlglt1/api/api_service.dart';
import 'package:shlglt1/screens/medeedetail.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  List<Map<String, dynamic>> newsList = [];

  @override
  void initState() {
    super.initState();
    fetchMedee().then((data) {
      setState(() {
        newsList = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('EEEE, MMMM d').format(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date header
              SizedBox(height: 10),
              Text(
                currentDate,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SizedBox(height: 10),
              Text(
                "Top News",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              // 🟢 Top News - Carousel Slider
              if (newsList.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 220, // Adjusting the height for better spacing
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                    ),
                    items:
                        newsList.map((news) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => NewsDetailScreen(news: news),
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(news["zurag"] ?? ""),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  right: 10,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      news["turul"] ?? "Unknown Type",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                  ),
                ),

              // 🔹 "Recent News" Section
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent News",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {}, // Add navigation to all news
                    child: Text(
                      "See All",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),

              // 🔵 Horizontal Scroll for Recent News
              if (newsList.length > 1)
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        newsList.length - 1, // Exclude first item (carousel)
                    itemBuilder: (context, index) {
                      var news = newsList[index + 1]; // Adjust index
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => NewsDetailScreen(news: news),
                            ),
                          );
                        },
                        child: Container(
                          width: 160,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(news["zurag"] ?? ""),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 5,
                                left: 5,
                                right: 5,
                                child: Container(
                                  color: Colors.black.withOpacity(0.6),
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    news["garchig"] ?? "No title",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
