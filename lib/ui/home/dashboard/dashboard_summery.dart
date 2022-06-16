import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:zepto_flutter_app/ui/home/home_viewmodel.dart';
import 'package:zepto_flutter_app/utils/colors.dart';

class DashboardSummeryView extends HookViewModelWidget<HomeViewModel> {
  const DashboardSummeryView({
    Key? key,
  }) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) {
    return SizedBox(
      height: 150.0,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) => Card(
          child: SizedBox(
            width: 250,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Assignment',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: loginTermsLinkColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            RichText(
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '02',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: '/',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18,
                                      )),
                                  TextSpan(
                                      text: '20',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                            ),
                          ),
                          child: Wrap(
                            direction: Axis.horizontal,
                            children: const [
                              Text(
                                '80',
                                style: TextStyle(fontSize: 32),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                    fontFeatures: [FontFeature.superscripts()]),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(
                  height: 1,
                  color: primaryColor,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'View details',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: darkPinkColor),
                      ),
                      Icon(
                        Icons.navigate_next_rounded,
                        color: darkPinkColor,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
