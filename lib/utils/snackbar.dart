import 'package:flutter/material.dart';

import '../main.dart';

enum SnackBarType { success, warning, error }

showSnackBar({
  required SnackBarType snackBarType,
  required String content,
}) {
  snackBarKey.currentState?.showSnackBar(
    SnackBar(
      backgroundColor: snackBarType == SnackBarType.success
          ? Colors.green
          : snackBarType == SnackBarType.warning
              ? Colors.amber
              : Colors.red,
      content: Text(
        content,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
