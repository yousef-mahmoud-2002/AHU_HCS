import 'package:ahu_hcs/constants.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void appSnackBar(BuildContext context, String message, {bool success = false}) {
  return showTopSnackBar(
    Overlay.of(context),
    dismissType: DismissType.onSwipe,
    displayDuration: const Duration(milliseconds: 500),
    animationDuration: const Duration(milliseconds: 600),
    reverseAnimationDuration: const Duration(milliseconds: 400),
    CustomSnackBar.error(
      message: message,
      icon: const Icon(Icons.done, size: 0),
      textStyle: const TextStyle(color: kWhiteColor, fontSize: 19),
      backgroundColor:
          success ? Colors.green.withOpacity(0.5) : kRedColor.withOpacity(0.5),
    ),
  );
}
