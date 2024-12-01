
import 'package:flutter/material.dart';

class CusomAppBar extends StatelessWidget {
  const CusomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('الاشعارات'),
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
