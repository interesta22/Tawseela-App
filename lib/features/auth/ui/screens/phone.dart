import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/routing/routs.dart';
import 'package:tewseela_app/core/widgets/alerts.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';
import 'package:tewseela_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/core/widgets/custom_button.dart';
import 'package:tewseela_app/features/auth/ui/screens/otp.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tewseela_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:tewseela_app/features/auth/ui/widgets/phone_field.dart';

class PhoneAuthScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  bool isLoading = false;
  TextEditingController _phoneController = TextEditingController();
  String? verificationId; // Define the variable

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is AuthCodeSent) {
          setState(() {
            isLoading = false;
            verificationId =
                state.verificationId; // Capture the verification ID
          });
          if (verificationId != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpScreen(verificationId: verificationId!, phoneNumber: _phoneController.text.trim(),),
              ),
            );
          }
        } else if (state is AuthError) {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        body: ModalProgressHUD(
          progressIndicator: CircularProgressIndicator(
            backgroundColor: ColorManager.mainColor.withOpacity(0.2),
            color: ColorManager.mainColor,
            strokeWidth: 5,
          ),
          opacity: 0.1,
          inAsyncCall: isLoading,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildWelcomeText(),
                      verticaalSpacing(20),
                      PhoneInputField(
                        inputTextStyle: FontManager.font13BlackRegular,
                        hintStyle: FontManager.font13BlackRegular,
                        hintText: 'رقم الهاتف',
                        isEnabled: true,
                        controller: _phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يرجى إدخال رقم الهاتف';
                          }
                          return null;
                        },
                      ),
                      verticaalSpacing(20),
                      CustomButton(
                        buttonText: 'ارسال رمز التحقق',
                        textStyle: FontManager.font15WhiteMedium,
                        backgroundColor: ColorManager.mainBlack,
                        onPressed: () {
                          final phoneNumber = _phoneController.text.trim();
                          if (phoneNumber.isNotEmpty) {
                            context.read<AuthCubit>().sendOtp(phoneNumber);
                          } else {
                            Alerts().failureDialog(
                              context: context,
                              title: 'خلي بالك',
                              message: 'يرجى إدخال رقم الهاتف',
                            );
                          }
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          context.pushNamed(Routes.loginScreen);
                        },
                        child: Text(
                          "لدي حساب بالفعل",
                          style: FontManager.font13BlueRegular,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 130.h,
          width: double.infinity,
          child: Image.asset('assets/images/Frame 13.png'),
        ),
        verticaalSpacing(10),
        Text(
          '!مرحبًا بك في توصيلة',
          style: FontManager.font24BlueBold,
        ),
        verticaalSpacing(8),
        Text(
          '.نحن هنا لنجعل حياتك أسهل وأسرع من خلال خدمات مصممة خصيصًا لتلبية احتياجاتك. كل ما عليك فعله هو إدخال رقم هاتفك للانضمام إلى عائلتنا والاستمتاع بتجربة فريدة مليئة بالراحة والأمان',
          style: FontManager.font13BlackRegular,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
