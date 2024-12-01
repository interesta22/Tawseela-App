import 'package:flutter/material.dart';
// import 'package:tawssela2_app/widgets/LogoWidgets.dart';

class TopViewOnbrdingWidget extends StatelessWidget {
  final String image;
  final Widget logo;
  const TopViewOnbrdingWidget({
    super.key,
    required this.logo,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.center,
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Image.asset(
            image,
            // صورة الخلفية بالأعلى
            // height: 200,
            // width: 200,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          child: logo,
        ),
      ],
    );
  }
}
