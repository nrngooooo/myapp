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
