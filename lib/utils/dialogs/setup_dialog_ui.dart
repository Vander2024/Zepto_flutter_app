import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zepto_flutter_app/app/app.locator.dart';
import 'package:zepto_flutter_app/utils/dialogs/ui/form_dialog.dart';
import 'ui/basic_dialog.dart';
import 'enums/dialog_type.dart';

void setupDialogUi() {
  final dialogService = zeptoLocator<DialogService>();

  final builders = {
    DialogType.basic: (
      BuildContext context,
      DialogRequest sheetRequest,
      Function(DialogResponse) completer,
    ) =>
        BasicDialog(request: sheetRequest, completer: completer),
    DialogType.form: (
      BuildContext context,
      DialogRequest sheetRequest,
      Function(DialogResponse) completer,
    ) =>
        FormDialog(
          dialogRequest: sheetRequest, completer: completer,),
  };
  dialogService.registerCustomDialogBuilders(builders);
}
