import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:crypto_price/src/l10n/l10n.dart';
import 'package:flutter/material.dart';

enum SnackBarType {
  error,
  warning,
  succes,
}

class DialogUtils {
  static showSnackbar(BuildContext context, String messageTitle, String message,
      SnackBarType snackBarType) {
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: messageTitle,
        message: message,

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: snackBarType == SnackBarType.error
            ? ContentType.failure
            : snackBarType == SnackBarType.warning
                ? ContentType.warning
                : ContentType.success,
      ),
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static showLimitFullDialog(
    BuildContext context,
  ) {
    CoolAlert.show(
      context: context,
      widget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset("assets/images/logo_reverse.png")),
      ),
      cancelBtnText: context.l10n.limitFullAlertDialogCancelBtn,
      confirmBtnText: context.l10n.ok,
      title: context.l10n.limitFullAlertDialogTitle,
      type: CoolAlertType.info,
      text: context.l10n.limitFullAlertDialogText,
      animType: CoolAlertAnimType.slideInUp,
    );
  }
}
