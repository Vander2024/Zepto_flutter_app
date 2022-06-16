import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:zepto_flutter_app/ui/home/home_viewmodel.dart';

class DashboardMessagesView extends HookViewModelWidget<HomeViewModel> {
  const DashboardMessagesView({
    Key? key,
  }) : super(key: key, reactive: true);

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(
          left: 15,
          top: 10,
          right: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'My Messages',
              style: (TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            GestureDetector(
              onTap: () => viewModel.setMessageCount(),
              child: const Text(
                'View all',
                style: (TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    fontStyle: FontStyle.italic)),
              ),
            )
          ],
        ),
      ),
      ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: viewModel.messageCount,
        itemBuilder: (BuildContext context, int index) => Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      color: Colors.blue,
                      height: 45.0,
                      width: 60.0,
                      child: const Icon(Icons.message_rounded),
                    ),
                  ),
                ],
              ),
              title: const Text('Notes'),
              subtitle: const Text('Heat & Thermo- dynamics Calorimetry'),
              trailing: const Icon(Icons.navigate_next_rounded),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      )
    ]);
  }
}
