import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:tewseela_app/core/utils/colors.dart';
import 'package:tewseela_app/core/routing/routs.dart';
import 'package:tewseela_app/core/helpers/spacing.dart';
import 'package:tewseela_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tewseela_app/core/widgets/custom_button.dart';
import 'package:tewseela_app/core/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tewseela_app/features/auth/logic/cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isObsecureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            setState(() {
              isLoading = true;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }

          if (state is Authenticated) {
            context.pushReplacementNamed(Routes.bottomNavBar);
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            progressIndicator: CircularProgressIndicator(
              backgroundColor: ColorManager.mainColor.withOpacity(0.2),
              color: ColorManager.mainColor,
              strokeWidth: 5,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
            opacity: 0.1,
            inAsyncCall: isLoading,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(right: 30.w, left: 30.w, top: 30.h),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildWelcomeText(),
                          SizedBox(
                            height: 250.h,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/rb_757.png',
                            ),
                          ),
                          CustomTextField(
                            hintText: 'البريد الالكتروني',
                            controller: emailController,
                            isObsecure: false,
                            validator: (value) => value?.isEmpty ?? true
                                ? 'الرجاء إدخال البريد الإلكتروني'
                                : null,
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
                              onPressed: () => setState(
                                  () => isObsecureText = !isObsecureText),
                              icon: Icon(isObsecureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined),
                            ),
                          ),
                          verticaalSpacing(20),
                          CustomButton(
                            buttonText: 'تسجيل الدخول',
                            textStyle: FontManager.font15WhiteMedium,
                            backgroundColor: ColorManager.mainBlack,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthCubit>().login(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                              }
                            },
                          ),
                          TextButton(
                            onPressed: () {
                              context.pushNamed(Routes.phoneScreen);
                            },
                            child: Text(
                              "انشاء حساب",
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
          );
        },
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "مرحبًا بك مرة أخرى!",
          style: FontManager.font24BlueBold,
        ),
        verticaalSpacing(8),
        Text(
          "قم بتسجيل الدخول للمتابعة واستكشاف خدماتنا.",
          style: FontManager.font13BlackRegular,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
