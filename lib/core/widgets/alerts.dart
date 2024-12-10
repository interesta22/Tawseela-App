import 'package:flutter/material.dart';
import 'package:tewseela_app/core/utils/fonts.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class Alerts {
  void successDialog({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        messageTextStyle: FontManager.font15WhiteMedium,
        titleTextStyle: FontManager.font16WhiteSemibold,
        title: title,
        message: message,
        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void failureDialog({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        messageTextStyle: FontManager.font15WhiteMedium,
        titleTextStyle: FontManager.font16WhiteSemibold,
        title: title,
        message: message,
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
