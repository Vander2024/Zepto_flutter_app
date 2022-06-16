import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:zepto_flutter_app/ui/login/login_viewmodel.dart';

import '../../utils/colors.dart';
import '../../utils/image_paths.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: ((model) =>
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {})),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(SPLASHSCREEN), fit: BoxFit.cover),
                ),
              ),
              Card(
                color: const Color.fromARGB(111, 255, 255, 255),
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 10, bottom: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                        child: Image.asset(CENTERLOGO),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            labelText: 'Enter you username/EmailId*'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Password*',
                          suffixIcon: GestureDetector(
                              onTap: () {
                                model.setObscureText(!model.isObScureText);
                              },
                              child: model.isObScureText
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                        ),
                        obscureText: model.isObScureText,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      model.isBusy
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () {
                                model.launchDashboard();
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFF7155a2),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7.0))),
                                  minimumSize: const Size.fromHeight(50)),
                              child: const Text('Login'),
                            ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              // here toggle the bool value so that when you click
                              // on the whole item, it will reflect changes in Checkbox
                              onPressed: () {
                                model
                                    .setRememberMeFlag(!model.isRememberMeFlag);
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20.0,
                                      width: 20.0,
                                      child: Checkbox(
                                        checkColor: Colors.white,
                                        onChanged: (value) async {
                                          model.setRememberMeFlag(value!);
                                        },
                                        value: model.isRememberMeFlag,
                                      ),
                                    ),
                                    // You can play with the width to adjust your
                                    // desired spacing
                                    const SizedBox(width: 3.0),
                                    const Text(
                                      'Remember Me',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ])),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () async {},
                              child: GestureDetector(
                                onTap: () {
                                  model.showForgotPasswordDialog();
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'By Clicking Login, You Agree to our ',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 12),
                              ),
                              TextSpan(
                                  text: 'Terms and Condition ',
                                  style: const TextStyle(
                                      color: loginTermsLinkColor,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                      fontSize: 12),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                              const TextSpan(
                                text: ' and that you have read our ',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 12),
                              ),
                              TextSpan(
                                  text: 'Privacy Policy.',
                                  style: const TextStyle(
                                      color: loginTermsLinkColor,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                      fontSize: 12),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {})
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
