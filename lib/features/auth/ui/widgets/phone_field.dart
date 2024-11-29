import 'package:flutter/material.dart';

class PhoneInputField extends StatefulWidget {
  final bool isEnabled;
  final TextEditingController controller;
  final bool isObsecure;
  final bool isDense;
  final String hintText;
  final String? Function(String?) validator;
  final Color? backgroundColor;
  final EdgeInsets? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Widget? suffixIcon;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;

  const PhoneInputField({
    super.key,
    required this.isEnabled,
    required this.controller,
    required this.validator,
    this.isObsecure = false,
    this.isDense = true,
    this.hintText = "Enter your phone number",
    this.backgroundColor,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.suffixIcon,
    this.inputTextStyle,
    this.hintStyle,
  });

  @override
  _PhoneInputFieldState createState() => _PhoneInputFieldState();
}

class _PhoneInputFieldState extends State<PhoneInputField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnabled,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return widget.validator(value);
      },
      focusNode: _focusNode,
      decoration: InputDecoration(
        // Egyptian Flag and +20 Prefix
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8, right: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/Flag-Egypt-circle-png.png', // Place your flag image in assets folder
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
              const Text(
                "+20",
                style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Alexandria'),
              ),
            ],
          ),
        ),
        suffixIconColor: _focusNode.hasFocus ? Colors.blue : Colors.grey,
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: widget.backgroundColor ?? Colors.white,
        isDense: widget.isDense,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),

        // Borders
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.blue, // Focused border color
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey, // Enabled border color
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        errorBorder: widget.errorBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red, // Error border color
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        focusedErrorBorder: widget.focusedErrorBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red, // Focused error border color
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey, // Disabled border color
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: widget.hintStyle ??
            const TextStyle(fontSize: 13, color: Colors.grey),
        hintText: widget.hintText,
        labelStyle: widget.hintStyle ??
            const TextStyle(fontSize: 16, color: Colors.black),
        labelText: widget.hintText,
      ),
      obscureText: widget.isObsecure,
      style: widget.inputTextStyle ??
          const TextStyle(fontSize: 13, color: Colors.black),
    );
  }
}
