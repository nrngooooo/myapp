import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiUrl = "http://127.0.0.1:8000/api/medee/";

Future<List<Map<String, dynamic>>> fetchMedee() async {
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    List data = json.decode(utf8.decode(response.bodyBytes));
    return data.map((medee) {
      return {
        "garchig": medee["garchig"],
        "tailbar": medee["tailbar"],
        "niitlegch": medee["niitlegch"],
        "niitelsen_ognoo": medee["niitelsen_ognoo"],
        "eh_surwalj": medee["eh_surwalj"],
        "uzelt": medee["uzelt"],
        "zurag": medee["zurag"] != null ? "${medee["zurag"]}" : null,
        "turul":
            medee["turul"] != null ? medee["turul"]["ner"] : "Unknown Turul",
      };
    }).toList();
  } else {
    throw Exception("Failed to load medee");
  }
}

class CategoryScreen extends StatefulWidget {
  CategoryScreen({super.key});

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<Map<String, dynamic>>> futureMedee;

  @override
  void initState() {
    super.initState();
    futureMedee = fetchMedee();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: futureMedee,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No categories found"));
            } else {
              List<Map<String, dynamic>> medeeList = snapshot.data!;
              return ListView.builder(
                itemCount: medeeList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(medeeList[index]["turul"]),
                    onTap: () {
                      // Handle category click (e.g., navigate to a new screen)
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
