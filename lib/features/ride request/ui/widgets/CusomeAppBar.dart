import 'package:flutter/material.dart';

class CusomAppBarPayment extends StatelessWidget {
  const CusomAppBarPayment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('مرحلة الدفع'),
        const SizedBox(
          width: 20,
        ),
        IconButton(
          onPressed: () {
            // Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_forward_ios,
          ),
        ),
      ],
    );
  }
}
