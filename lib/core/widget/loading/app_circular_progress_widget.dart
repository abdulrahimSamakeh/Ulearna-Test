// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppCircularProgressWidget extends StatelessWidget {
  final Color? color;
  const AppCircularProgressWidget({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive();
  }
}
