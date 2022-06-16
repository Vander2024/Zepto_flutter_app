import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zepto_flutter_app/app/app.locator.dart';
import 'package:zepto_flutter_app/app/app.router.dart';

import '../../utils/dialogs/enums/dialog_type.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = zeptoLocator<NavigationService>();
  final _dialogService = zeptoLocator<DialogService>();

  late bool _isObScureText = true;
  late bool _isRememberMe = true;
  bool get isObScureText => _isObScureText;

  setObscureText(bool value) {
    _isObScureText = value;
    notifyListeners();
  }

  bool get isRememberMeFlag => _isRememberMe;

  void setRememberMeFlag(bool value) async {
    _isRememberMe = !_isRememberMe;
    notifyListeners();
  }

  void launchDashboard() async {
    _navigationService.navigateTo(Routes.homeView);
  }

  void showForgotPasswordDialog() async {
    final dialogResult = await _dialogService.showCustomDialog(
      variant: DialogType.form,
      title: 'ForgotPassword',
      description: 'Are you sure want to logout?',
      secondaryButtonTitle: 'cancel',
      mainButtonTitle: 'Yes',
    );
  }
}
