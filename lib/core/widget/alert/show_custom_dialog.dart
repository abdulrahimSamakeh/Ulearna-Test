import 'package:flutter/material.dart';

showCustomDialog({required BuildContext context, required Widget child}) {
  showDialog(
    context: context,
    builder: (context) {
      return GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Material(color: Colors.transparent, child: child));
    },
  );
}
