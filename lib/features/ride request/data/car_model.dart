import 'package:cloud_firestore/cloud_firestore.dart';

class CarModel {
  final String id, img, name, color;
  final double price;

  CarModel({
    required this.id,
    required this.img,
    required this.name,
    required this.color,
    required this.price,
  });

  factory CarModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return CarModel(
      id: doc.id,
      name: data['name'],
      img: data['img'],
      color: data['color'],
      price:
          (data['price'] as num).toDouble(), // تحويل الرقم إلى double بشكل آمن
    );
  }

}
