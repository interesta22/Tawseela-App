// // import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tewseela_app/features/trip/ui/widget/CusomAppBarTrip.dart';
import 'package:tewseela_app/features/trip/ui/widget/CusomCardTrip.dart';


class Tripscreen extends StatelessWidget {
  static String id = '/Tripscreen';

  const Tripscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة من الرحلات
    final trips = [
      {
        'fromTripName': 'المنزل',
        'toTripName': 'الجامعه',
        'tripDate': '17 oct 2024',
        'priceTrip': '130',
      },
      {
        'fromTripName': 'المطار',
        'toTripName': 'المنتزه',
        'tripDate': '18 oct 2024',
        'priceTrip': '100',
      },
      {
        'fromTripName': 'المكتب',
        'toTripName': 'المدرسة',
        'tripDate': '19 oct 2024',
        'priceTrip': '80',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const CusomAppBarTrip(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        child: ListView.builder(
          itemCount: trips.length, // عدد العناصر في القائمة
          itemBuilder: (context, index) {
            return CusomCardTrip(
              fromTripName: trips[index]['fromTripName'] as String,
              toTripName: trips[index]['toTripName'] as String,
              tripDate: trips[index]['tripDate'] as String,
              priceTrip: trips[index]['priceTrip'] as String,
            );
          },
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:tawssela2_app/feature/trip/ui/widget/CusomAppBarTrip.dart';
// import 'package:tawssela2_app/feature/trip/ui/widget/CusomCardTrip.dart';

// class Tripscreen extends StatelessWidget {
//   static String id = '/Tripscreen';

//   const Tripscreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const CusomAppBarTrip(),
//       ),
//       body: const Padding(
//         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
//         child: CusomCardTrip(
//           fromTripName: 'المنزل',
//           toTripName: 'الجامعه',
//           tripDate: '17 oct 2024',
//           priceTrip: 130,
//         ),
//       ),
//     );
//   }
// }
