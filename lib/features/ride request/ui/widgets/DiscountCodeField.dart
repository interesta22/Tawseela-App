import 'package:flutter/material.dart';
import 'package:tewseela_app/core/constants/app_colors.dart';
import 'package:tewseela_app/core/constants/app_text_styles.dart';


class DiscountCodeField extends StatefulWidget {
  const DiscountCodeField({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DiscountCodeFieldState createState() => _DiscountCodeFieldState();
}

class _DiscountCodeFieldState extends State<DiscountCodeField> {
  final TextEditingController _controller = TextEditingController();
  bool _isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border:
              Border.all(color: _isEmpty ? Colors.red : AppColors.greyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: () {},
              child: const Text(
                'تطبيق',
                style: AppTextStyles.code,
              ),
            ),
            // const SizedBox(width: 10),
            const Spacer(),
            Expanded(
              child: TextField(
                controller: _controller,
                decoration:  InputDecoration(
                  hintText: 'ادخل كود الخصم',
                  hintStyle: AppTextStyles.titleFildCode,
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    _isEmpty = value.isEmpty;
                  });
                },
                onEditingComplete: () {
                  setState(() {
                    _isEmpty = _controller.text.isEmpty;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
