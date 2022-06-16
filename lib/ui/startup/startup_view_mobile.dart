import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zepto_flutter_app/ui/startup/startup_viewmodel.dart';

class StartUpViewMobile extends StatelessWidget {
  const StartUpViewMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.nonReactive(
      builder: (context, model, child) => Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_mob.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
