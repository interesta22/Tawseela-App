import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/routing/routs.dart';
import 'package:tewseela_app/core/widgets/alerts.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';
import 'package:tewseela_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/core/widgets/custom_button.dart';
import 'package:tewseela_app/features/auth/ui/screens/sign_up.dart';
import 'package:tewseela_app/features/auth/logic/cubit/auth_cubit.dart';

class OtpScreen extends StatelessWidget {
  final String verificationId;
  final String phoneNumber;

  const OtpScreen(
      {super.key, required this.verificationId, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                OtpForm(verificationId: verificationId, phoneNumber: phoneNumber,),
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
    );
  }
}

class OtpForm extends StatelessWidget {
  final String verificationId;
  final String phoneNumber;

  const OtpForm({super.key, required this.verificationId, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> otpControllers =
        List.generate(6, (index) => TextEditingController());

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
                  child: OtpTextField(controller: otpControllers[index]),
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
              String otp =
                  otpControllers.map((controller) => controller.text).join();
              context.read<AuthCubit>().verifyOtp(otp, verificationId);
            },
          ),
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthVerified) {
                Alerts().successDialog(
                  context: context,
                  title: 'ابيض ع الابيض',
                  message: 'تم التحقق بنجاح',
                );
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SignupScreen(phoneNumber: phoneNumber)));
              } else if (state is AuthError) {
                Alerts().failureDialog(
                  context: context,
                  title: 'كدا مش حلو',
                  message: state.message,
                );
              }
            },
            child: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFF757575)),
  borderRadius: BorderRadius.all(Radius.circular(12)),
);

class OtpTextField extends StatelessWidget {
  final TextEditingController controller;

  const OtpTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (pin) {
        if (pin.isNotEmpty) {
          // Move to the next field if the current field is filled
          FocusScope.of(context).nextFocus();
        } else if (pin.isEmpty && controller.text.length == 1) {
          // Move to the previous field if the current field is emptied
          FocusScope.of(context).previousFocus();
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
