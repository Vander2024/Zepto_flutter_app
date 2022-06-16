import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked_services/stacked_services.dart';

class FormDialog extends HookWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) completer;

  const FormDialog(
      {Key? key, required this.dialogRequest, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = useTextEditingController();
    return Material(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              dialogRequest.title.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () =>
                  completer(DialogResponse(data: [controller.text])),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: dialogRequest.showIconInMainButton!
                    ? const Icon(Icons.check_circle)
                    : Text(dialogRequest.mainButtonTitle!),
              ),
            )
          ],
        ),
      ),
    );
  }
}