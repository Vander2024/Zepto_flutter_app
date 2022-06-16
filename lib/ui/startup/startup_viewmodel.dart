import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zepto_flutter_app/app/app.locator.dart';
import 'package:zepto_flutter_app/app/app.router.dart';

class StartUpViewModel extends BaseViewModel {
  final _navigationService = zeptoLocator<NavigationService>();

  void performStartupCheck() async {
    await Future.delayed(const Duration(microseconds: 3000));
    _navigationService.navigateTo(Routes.loginView);
  }
}
