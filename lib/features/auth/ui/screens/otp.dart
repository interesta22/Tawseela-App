import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/routing/routs.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';
import 'package:tewseela_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/core/widgets/custom_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ModalProgressHUD(
          progressIndicator: CircularProgressIndicator(
            backgroundColor: ColorManager.mainColor.withOpacity(0.2),
            color: ColorManager.mainColor,
            strokeWidth: 5,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          opacity: 0.1,
          inAsyncCall: isLoading,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'ادخل رمز التحقق',
                      style: FontManager.font20BlackBold,
                    ),
                  ),
                  verticaalSpacing(10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "+20قد أرسلنا رمز التحقق الخاص بك الي 1278576046",
                      textAlign: TextAlign.center,
                      style: FontManager.font13BlackLight,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "ستنتهي صلاحية هذا الرمز في الساعة 00:30",
                      textAlign: TextAlign.center,
                      style: FontManager.font13BlackLight,
                    ),
                  ),
                  SizedBox(
                    height: 250.h,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/rb_5488.png',
                    ),
                  ),
                  const OtpForm(),
                  verticaalSpacing(10),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "اعادة ارسال رمز التحقق",
                      style: FontManager.font13BlackRegular,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFF757575)),
  borderRadius: BorderRadius.all(Radius.circular(12)),
);

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              6,
              (index) => Flexible(
                child: SizedBox(
                  width: 47.w,
                  height: 64.h,
                  child: OtpTextField(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          CustomButton(
            backgroundColor: ColorManager.mainColor,
            buttonText: 'تحقق',
            textStyle: FontManager.font15WhiteMedium,
            onPressed: () {
              context.pushNamed(Routes.signupScreen);
            },
          ),
        ],
      ),
    );
  }
}

class OtpTextField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  OtpTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onTap: () {
        if (_controller.text == "0") {
          _controller.clear(); // Clear the default value
        }
      },
      onChanged: (pin) {
        if (pin.isNotEmpty) {
          FocusScope.of(context).nextFocus(); // Move to the next field
        } else if (pin.isEmpty) {
          FocusScope.of(context).previousFocus(); // Move to the previous field
        }
      },
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      style: Theme.of(context).textTheme.titleLarge,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Color(0xFF757575)),
        border: authOutlineInputBorder,
        enabledBorder: authOutlineInputBorder,
        focusedBorder: authOutlineInputBorder.copyWith(
          borderSide: const BorderSide(color: ColorManager.mainColor),
        ),
      ),
    );
  }
}
