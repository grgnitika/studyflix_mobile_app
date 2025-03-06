import 'package:flutter/material.dart';

const successColor = Colors.blue; // Primary color
const errorColor = Color(0xFFB8978C); // Secondary color

showMySnackBar({
  required BuildContext context,
  required String message,
  Color? color,
}) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color ?? Colors.green,
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
