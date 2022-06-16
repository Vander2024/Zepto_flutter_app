import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:zepto_flutter_app/ui/home/home_viewmodel.dart';

class DashboardUpcommingClassesView extends HookViewModelWidget<HomeViewModel> {
  const DashboardUpcommingClassesView({
    Key? key,
  }) : super(key: key, reactive: true);

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 15,
              top: 10,
              right: 10,
            ),
            child: Text(
              'Upcomming Classes',
              style: (TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ),
          SizedBox(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.messageCount,
                    itemBuilder: (BuildContext context, int index) => Card(
                      child: SizedBox(
                        width: 280,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '02:00',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF707070)),
                                ),
                              ],
                            ),
                            title: const Text('Physics'),
                            subtitle: const Text(
                                'Heat & Thermo- dynamics Calorimetry'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]);
  }
}
