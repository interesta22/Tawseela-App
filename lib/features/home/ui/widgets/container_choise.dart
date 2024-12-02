import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoiseContainer extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final String title;
  const ChoiseContainer({
    super.key, required this.onTap, required this.icon, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                HugeIcons.strokeRoundedArrowLeft01,
                size: 25,
              ),
              Expanded(
                child: SizedBox(),
              ),
              Text(
                title,
                style: FontManager.font18BlackRegular,
              ),
              horizentalSpacing(10),
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.3),
                child: Icon(
                  icon,
                  size: 22,
                  color: ColorManager.mainBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
