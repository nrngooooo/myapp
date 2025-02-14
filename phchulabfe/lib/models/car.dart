class Car {
  final String carPlate;
  final String entryPhoto;
  final String carMark; // This should be markName

  Car({
    required this.carPlate,
    required this.entryPhoto,
    required this.carMark,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      carPlate: json['car_plate'] ?? 'Unknown Plate',
      entryPhoto: json['entry_photo'] ?? '',
      carMark:
          json['markId']?['markName'] ??
          'Unknown Mark', // Handle missing markId safely
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'car_plate': carPlate,
      'entry_photo': entryPhoto,
      'markName': carMark, // Ensure correct field name
    };
  }
}
