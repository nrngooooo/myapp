import 'package:flutter/material.dart';
import '../api/api_service.dart'; // Import the API file

class CarListScreen extends StatefulWidget {
  const CarListScreen({super.key});

  @override
  _CarListScreenState createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Car List",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey[900],
        foregroundColor: Colors.white,
        elevation: 5,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchCars(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 50, color: Colors.red),
                  const SizedBox(height: 10),
                  Text(
                    "Failed to load cars",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${snapshot.error}",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "No cars found",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                var car = snapshot.data![index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:
                          car["entry_photo"] != null
                              ? Image.network(
                                car["entry_photo"],
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              )
                              : const Icon(
                                Icons.car_repair,
                                size: 50,
                                color: Colors.grey,
                              ),
                    ),
                    title: Text(
                      car["car_plate"] ?? "Unknown",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      car["mark"],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey[700],
                      ),
                    ),
                    // trailing: Icon(
                    //   Icons.arrow_forward_ios,
                    //   color: Colors.blueGrey[600],
                    // ),
                    onTap: () {
                      // Add navigation or action here
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
