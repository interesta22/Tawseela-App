import 'package:flutter/material.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';
import 'package:tewseela_app/features/Payment/ui/widget/CusomeAppBar.dart';
import 'package:tewseela_app/features/Payment/ui/widget/CusomlineINpayment.dart';
import 'package:tewseela_app/features/Payment/ui/widget/DiscountCodeField.dart';
import 'package:tewseela_app/features/Payment/ui/widget/DividerWidget.dart';
import 'package:tewseela_app/features/Payment/ui/widget/DoditDivider.dart';
import 'package:tewseela_app/features/Payment/ui/widget/buttomWidget.dart';
import 'package:tewseela_app/features/Payment/ui/widget/paymentMethod.dart';

class Paymentscreen extends StatefulWidget {
  static const String id = 'Paymentscreen';
  const Paymentscreen({super.key});

  @override
  State<Paymentscreen> createState() => _PaymentscreenState();
}

class _PaymentscreenState extends State<Paymentscreen> {
  String? selectedPaymentMethod; // متغير لتحديد طريقة الدفع المختارة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CusomAppBarPayment(),
        titleTextStyle: AppTextStyles.AppbarTittel,
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
                   Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'الفاتورة',
                        style: AppTextStyles.titelpayment,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const CusomlineINpayment(
                    textName: 'الاسم',
                    textValue: 'احمد خميس محمد',
                  ),
                  const CusomlineINpayment(
                    textName: 'العنوان',
                    textValue: 'العجمي - البيطاش',
                  ),
                  const CusomlineINpayment(
                    textName: 'رقم الهاتف',
                    textValue: '01122334455',
                  ),
                  const CusomlineINpayment(
                    textName: 'اسم السائق',
                    textValue: 'ايمن محمد',
                  ),
                  const CusomlineINpayment(
                    textName: 'من',
                    textValue: 'كفر الشيخ',
                  ),
                  const CusomlineINpayment(
                    textName: 'الي',
                    textValue: 'الإسكندرية',
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ج.م100',
                          style: AppTextStyles.priceValu,
                        ),
                        Text(
                          'ثمن الرحلة',
                          style: AppTextStyles.priceTrip,
                        ),
                      ],
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ج.م30',
                          style: AppTextStyles.discountValu,
                        ),
                        Text(
                          'خصم',
                          style: AppTextStyles.discount,
                        ),
                      ],
                    ),
                  ),
                  CustomPaint(
                    painter: DashedLinePainter(),
                    size: const Size(double.infinity, 1),
                  ),
                   Padding(
                    padding:const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ج.م80',
                          style: AppTextStyles.totalPrice,
                        ),
                        Text(
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
                // color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   Text(
                    ': اختر طريقة الدفع',
                    style: AppTextStyles.titelpayment,
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    // iconColor: Colors.blue,
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

            buttomWidget(selectedPaymentMethod: selectedPaymentMethod),
          ],
        ),
      ),
    );
  }
}

