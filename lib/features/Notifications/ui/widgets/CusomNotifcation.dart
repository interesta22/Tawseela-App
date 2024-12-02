import 'package:flutter/material.dart';
import 'package:tewseela_app/core/constants/snackbar.dart';
import 'package:tewseela_app/core/constants/app_colors.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';

// import 'package:tawssela2_app/feature/Notifications/ui/widgets/custom_snackbar.dart'; // استيراد الكلاس

class CusomNotifcatio extends StatelessWidget {
  const CusomNotifcatio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const Key('notification_key'),
      direction: DismissDirection.horizontal, 
      onDismissed: (direction) {
        // عند السحب يظهر الـ SnackBar باستخدام الكلاس CustomSnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          CustomSnackBar.build('تم حذف الإشعار'),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('17 Oct', style: AppTextStyles.datNoti),
                const Row(
                  children: [
                    Text('السائق في الطريق', style: AppTextStyles.titelNoti),
                    SizedBox(width: 4),
                    Icon(Icons.directions_car, size: 20),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '11:00 pm',
                  style: AppTextStyles.timeNoti,
                ),
                const Spacer(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'قام السائق بقبول طلب الرحلة الخاصة بك',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:tawssela2_app/core/constants/app_colors.dart';
// import 'package:tawssela2_app/core/constants/app_text_styles.dart';
// import 'package:tawssela2_app/feature/Notifications/ui/widgets/CusomSnackBar.dart';

// class CusomNotifcatio extends StatelessWidget {
//   const CusomNotifcatio({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       key: const Key('notification_key'), // مفتاح فريد للعنصر
//       direction: DismissDirection.horizontal, // لتفعيل السحب أفقيًا
//       onDismissed: (direction) {
//         // عندما يتم سحب العنصر، يظهر الـ SnackBar مع خيار التراجع
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: const Text('تم حذف الإشعار'),
//             action: SnackBarAction(
//               label: 'Undo',
//               onPressed: () {
//                 // منطق لإعادة الإشعار عند الضغط على "Undo"
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('تم استرجاع الإشعار')),
//                 );
//               },
//             ),
//             backgroundColor: AppColors.primaryColor, // تخصيص لون الـ SnackBar
//             duration: const Duration(seconds: 3), // مدة ظهور الـ SnackBar
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10), // إضافة زوايا مدورة
//             ),
//             behavior: SnackBarBehavior.floating, // جعل الـ SnackBar عائمًا
//           ),
//         );
//       },
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColors.primaryColor, width: 2),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('17 Oct', style: AppTextStyles.datNoti),
//                 const Row(
//                   children: [
//                     Text('السائق في الطريق', style: AppTextStyles.titelNoti),
//                     SizedBox(width: 4),
//                     Icon(Icons.directions_car, size: 20),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '11:00 pm',
//                   style: AppTextStyles.timeNoti,
//                 ),
//                 const Spacer(),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'قام السائق بقبول طلب الرحلة الخاصة بك',
//                         style: AppTextStyles.caption,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


