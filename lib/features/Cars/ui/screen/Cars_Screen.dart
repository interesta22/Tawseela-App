import 'package:flutter/material.dart';
import 'package:tewseela_app/features/Cars/ui/widget/CusomAppBarCar.dart';
import 'package:tewseela_app/features/Cars/ui/widget/CusomeContainerCar.dart';


class CarScreen extends StatelessWidget {
  static String id = '/Cars';
  const CarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cars = [
      {
        'name': 'BMW Cabrio',
        'color': 'رمادي',
        'price': '70',
        'image': 'assets/images/carphoto.png',
      },
      {
        'name': 'Mercedes Benz',
        'color': 'أسود',
        'price': '100',
        'image': 'assets/images/carphoto.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const CusomAppBarCar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: cars.length, // عدد العناصر في القائمة
          itemBuilder: (BuildContext context, int index) {
            final car = cars[index];
            return CusomeContainerCar(
              carName: car['name']!,
              carColor: car['color']!,
              carPrice: car['price']!,
              carImage: car['image']!,
            );
          },
        ),
      ),
    );
  }
}