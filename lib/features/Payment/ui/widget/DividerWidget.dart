import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey[300],
      height: 1,
      thickness: 1,
      indent: 35,
      endIndent: 35,
    );
  }
}