//Function To Check if is LTR
import 'package:flutter/widgets.dart';

bool checkIfLTR({required BuildContext context}) {
  return Directionality.of(context) == TextDirection.ltr;
}
