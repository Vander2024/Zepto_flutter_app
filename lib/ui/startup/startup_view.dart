import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:zepto_flutter_app/ui/startup/startup_view_desktop.dart';
import 'package:zepto_flutter_app/ui/startup/startup_view_mobile.dart';
import 'package:zepto_flutter_app/ui/startup/startup_viewmodel.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      onModelReady: ((model) =>
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            model.performStartupCheck();
          })),
      builder: (context, model, child) {
        return ScreenTypeLayout(
          mobile: const StartUpViewMobile(),
          desktop: const StartUpViewDeskTop(),
        );
      },
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
