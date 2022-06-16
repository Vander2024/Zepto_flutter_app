import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zepto_flutter_app/app/app.locator.dart';
import 'package:zepto_flutter_app/utils/colors.dart';
import 'package:zepto_flutter_app/utils/dialogs/setup_dialog_ui.dart';
import 'app/app.router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpZeptoLocator(environment: Environment.dev);
  setupDialogUi();
  runApp(const ZeptoApp()
      //  DevicePreview(
      //  enabled: !kReleaseMode,
      //builder: (context) => const ZeptoApp(), // Wrap your app
      //),
      );
}

class ZeptoApp extends StatelessWidget {
  const ZeptoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: generateMaterialColor(primaryColor),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            debugShowCheckedModeBanner: false,
            navigatorKey: StackedService.navigatorKey,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            // builder: DevicePreview.appBuilder,
          );
        },
      ),
    );
  }
}
