import 'package:cloud_firestore/cloud_firestore.dart';

class DriverModel {
  final String id, name, img, phone;
  final double rating;

  DriverModel({required this.id, required this.name, required this.img, required this.phone, required this.rating});

  factory DriverModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return DriverModel(
      id: doc.id,
      name: data['name'],
      img: data['img'],
      phone: data['phone'],
      rating: (data['rating'] as num).toDouble(),
    );
  }
}
