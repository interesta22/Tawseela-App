import 'package:flutter/material.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/routing/routs.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';
import 'package:tewseela_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/core/widgets/custom_button.dart';
import 'package:tewseela_app/core/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLoading = false;
  bool isObsecureText = true;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? selectedGovernorate;

  final List<String> governorates = [
    'القاهرة',
    'الاسكندرية',
    'الجيزة',
    'كفر الشيخ',
    'الاقصر',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'أكمل انشاء حسابك',
                        style: FontManager.font20BlackBold,
                      ),
                    ),
                    SizedBox(
                      height: 250.h,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/rb_4983.png',
                      ),
                    ),
                    CustomTextField(
                      hintText: 'الاسم',
                      controller: nameController,
                      isObsecure: false,
                      validator: (value) =>
                          value?.isEmpty ?? true ? 'الرجاء إدخال الاسم' : null,
                    ),
                    verticaalSpacing(15),
                    CustomTextField(
                      hintText: 'البريد الالكتروني',
                      controller: emailController,
                      isObsecure: false,
                      validator: (value) => value?.isEmpty ?? true
                          ? 'الرجاء إدخال البريد الإلكتروني'
                          : null,
                    ),
                    verticaalSpacing(15),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 16.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.3),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: ColorManager.mainColor, width: 1.3),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1.3),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        hintStyle: FontManager.font13BlackRegular,
                        hintText: 'المحافظة',
                      ),
                      icon:
                          const Icon(Icons.arrow_drop_down, color: Colors.grey),
                      dropdownColor: Colors.white,
                      items: governorates.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              value,
                              style: FontManager.font13BlackRegular,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedGovernorate = value;
                        });
                      },
                      hint: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'المحافظة',
                          style: FontManager.font13BlackRegular,
                        ),
                      ),
                    ),
                    verticaalSpacing(15),
                    CustomTextField(
                      controller: passwordController,
                      validator: (value) => value?.isEmpty ?? true
                          ? 'يرجى إدخال كلمة المرور'
                          : null,
                      hintText: 'كلمة المرور',
                      isObsecure: isObsecureText,
                      suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => isObsecureText = !isObsecureText),
                        icon: Icon(isObsecureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined),
                      ),
                    ),
                    verticaalSpacing(15),
                    CustomTextField(
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'يرجى تأكيد كلمة المرور';
                        }
                        if (value != passwordController.text) {
                          return 'كلمات المرور غير متطابقة';
                        }
                        return null;
                      },
                      hintText: 'تأكيد كلمة المرور',
                      isObsecure: isObsecureText,
                      suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => isObsecureText = !isObsecureText),
                        icon: Icon(isObsecureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined),
                      ),
                    ),
                    verticaalSpacing(20),
                    CustomButton(
                      buttonText: 'تسجيل',
                      textStyle: FontManager.font15WhiteMedium,
                      backgroundColor: ColorManager.mainBlack,
                      onPressed: () {
                        context.pushNamed(Routes.homeScreen);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
