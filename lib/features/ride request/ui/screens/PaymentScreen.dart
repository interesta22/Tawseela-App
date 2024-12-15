import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/routing/routs.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';
import 'package:tewseela_app/core/helpers/extensions.dart';
import 'package:tewseela_app/core/widgets/custom_button.dart';
import 'package:tewseela_app/core/widgets/CusomAppBarCar.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';
import 'package:tewseela_app/features/ride%20request/ui/widgets/driver_card.dart';
import 'package:tewseela_app/features/ride%20request/ui/widgets/CusomeAppBar.dart';
import 'package:tewseela_app/features/ride%20request/ui/widgets/DoditDivider.dart';
import 'package:tewseela_app/features/ride%20request/ui/widgets/buttomWidget.dart';
import 'package:tewseela_app/features/ride%20request/ui/widgets/DividerWidget.dart';
import 'package:tewseela_app/features/ride%20request/ui/widgets/paymentMethod.dart';
import 'package:tewseela_app/features/ride%20request/logic/cubit/request_cubit.dart';
import 'package:tewseela_app/features/ride%20request/ui/widgets/DiscountCodeField.dart';
import 'package:tewseela_app/features/ride%20request/ui/widgets/CusomlineINpayment.dart';

class Paymentscreen extends StatefulWidget {
  static const String id = 'Paymentscreen';
  final Map<String, String> arguments;
  const Paymentscreen({super.key, required this.arguments});
  String? getUserUID() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid; // UID الخاص بالمستخدم الحالي
    }
    return null; // في حال لم يكن هناك مستخدم مسجل دخول
  }

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  String? selectedPaymentMethod; // متغير لتحديد طريقة الدفع المختارة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: ColorManager.mainWhite,
        backgroundColor: ColorManager.mainWhite,
        automaticallyImplyLeading: false,
        title: const CustomAppBar(title: 'مرحلة الدفع'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // فاتورة التفاصيل
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  verticaalSpacing(5),
                  CusomlineINpayment(
                    textName: 'اسم السائق',
                    textValue: widget.arguments['driverName'],
                  ),
                  CusomlineINpayment(
                    textName: 'من',
                    textValue: widget.arguments['from'],
                  ),
                  CusomlineINpayment(
                    textName: 'الي',
                    textValue: widget.arguments['to'],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          textDirection: TextDirection.rtl,
                          '${widget.arguments['fare']} ج.م',
                          style: AppTextStyles.priceValu,
                        ),
                        const Text(
                          'ثمن الرحلة',
                          style: AppTextStyles.priceTrip,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          textDirection: TextDirection.rtl,
                          '0 ج.م',
                          style: AppTextStyles.discount,
                        ),
                        Text(
                          'خصم',
                          style: AppTextStyles.discount,
                        ),
                      ],
                    ),
                  ),
                  verticaalSpacing(10),
                  CustomPaint(
                    painter: DashedLinePainter(),
                    size: const Size(double.infinity, 1),
                  ),
                  verticaalSpacing(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          textDirection: TextDirection.rtl,
                          '${widget.arguments['fare']} ج.م',
                          style: AppTextStyles.totalPrice,
                        ),
                        const Text(
                          'الاجمالي',
                          style: AppTextStyles.totalPrice,
                        ),
                      ],
                    ),
                  ),
                  const DiscountCodeField(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // طرق الدفع
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    ': اختر طريقة الدفع',
                    style: AppTextStyles.titelpayment,
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    title: const paymentMethod(
                      title: 'بطاقة الائتمان',
                      icon: Icons.credit_card,
                    ),
                    leading: Radio<String>(
                      value: 'بطاقة الائتمان',
                      groupValue: selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value;
                        });
                      },
                    ),
                  ),
                  const DividerWidget(),
                  ListTile(
                    title: const paymentMethod(
                      title: 'حساب بنكي',
                      icon: Icons.account_balance,
                    ),
                    leading: Radio<String>(
                      value: 'حساب بنكي',
                      groupValue: selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value;
                        });
                      },
                    ),
                  ),
                  const DividerWidget(),
                  ListTile(
                    title: const paymentMethod(
                      title: 'نقدي',
                      icon: Icons.monetization_on,
                    ),
                    leading: Radio<String>(
                      value: 'نقدي',
                      groupValue: selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value;
                        });
                      },
                    ),
                  ),
                  const DividerWidget(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            CustomButton(
              buttonText: 'تأكيد الدفع',
              textStyle: FontManager.font15WhiteMedium,
              onPressed: () {
                if (selectedPaymentMethod == null) {
                  // Show a message or feedback if no payment method is selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('الرجاء اختيار طريقة الدفع')),
                  );
                } else {
                  final uid = FirebaseAuth.instance.currentUser?.uid;
                  context.read<RequestCubit>().simulateRide(
                        uid: uid!,
                        from: widget.arguments['from']!,
                        to: widget.arguments['to']!,
                        price: widget.arguments['fare']!,
                        duration: Duration(
                          microseconds:
                              (double.parse(widget.arguments['time']!) *
                                      Duration.microsecondsPerMinute)
                                  .toInt(),
                        ),
                        time: widget.arguments['time']!,
                        dis: widget.arguments['dis']!
                      );
                  context.pushReplacementNamed(Routes.endScreen);
                }
              },
              backgroundColor: ColorManager.mainColor,
            ),
          ],
        ),
      ),
    );
  }
}
