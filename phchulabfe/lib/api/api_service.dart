import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/car.dart';  // Import the Car model

class CarService {
  static const String _baseUrl = 'http://localhost:8000/cars/';

  // Fetch car data from the API
  static Future<List<Car>> fetchCars() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((carJson) => Car.fromJson(carJson)).toList();
    } else {
      throw Exception('Failed to load cars');
    }
  }
}
