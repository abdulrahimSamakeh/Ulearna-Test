import 'package:flutter/material.dart';

import '../widget/app_bar/main_app_bar.dart';
import '../widget/button/refresh_button.dart';

//Deafult Page If Routing Fail
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(title: 'Some Thing WentWrong'),
      body: Center(
        child: RefreshButton(refreshTitle: 'Some Thing Went Wrong'),
      ),
    );
  }
}
