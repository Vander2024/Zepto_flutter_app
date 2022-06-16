import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zepto_flutter_app/ui/startup/startup_viewmodel.dart';

class StartUpViewDeskTop extends StatelessWidget {
  const StartUpViewDeskTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.nonReactive(
      builder: (context, model, child) => Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_bg_desktop.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
