import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiUrl = "http://127.0.0.1:8000/api/cars/";

Future<List<Map<String, dynamic>>> fetchCars() async {
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    List data = json.decode(response.body);
    return data.map((car) {
      return {
        "car_plate": car["car_plate"],
        "entry_photo":
            car["entry_photo"] != null ? "${car["entry_photo"]}" : null,
        "mark":
            car["markId"] != null ? car["markId"]["markName"] : "Unknown Mark",
      };
    }).toList();
  } else {
    throw Exception("Failed to load cars");
  }
}
