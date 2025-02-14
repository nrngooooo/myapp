class Car {
  final String carPlate;
  final String entryPhoto;
  final String carMark;  // Add car mark

  Car({required this.carPlate, required this.entryPhoto, required this.carMark});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      carPlate: json['car_plate'],
      entryPhoto: json['entry_photo'], // This should be the image URL
      carMark: json['markId']['markName'], // Assuming markId contains markName
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'car_plate': carPlate,
      'entry_photo': entryPhoto,
      'carMark': carMark,  // Add carMark in the JSON
    };
  }
}
