import 'package:flutter/material.dart';
import '../models/car.dart';
import '../api/api_service.dart';

class CarList extends StatelessWidget {
  const CarList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Car>>(
      future:
          CarService.fetchCars(), // Ensure this method correctly fetches the car data
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No cars found'));
        } else {
          List<Car> cars = snapshot.data!;
          return ListView.builder(
            itemCount: cars.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  '${cars[index].carPlate} - ${cars[index].carMark}', // Show carMark
                ),
                leading: Image.network(
                  cars[index].entryPhoto.startsWith('http')
                      ? cars[index].entryPhoto
                      : 'http://127.0.0.1:8000${cars[index].entryPhoto}', // Ensure image URL is valid
                  errorBuilder:
                      (context, error, stackTrace) =>
                          Icon(Icons.image_not_supported),
                ),
              );
            },
          );
        }
      },
    );
  }
}
