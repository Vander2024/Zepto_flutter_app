import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:zepto_flutter_app/ui/home/home_viewmodel.dart';

class DashboardLiveScheduleView extends HookViewModelWidget<HomeViewModel> {
  const DashboardLiveScheduleView({
    Key? key,
  }) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) {
    return SizedBox(
      height: 220.0,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) => Card(
          child: SizedBox(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Text(
                          'Live Classes',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          color: Colors.amber,
                          height: 80.0,
                          width: 80.0,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Wrap(
                    children: const [
                      Text(
                        'Class:',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Text(
                        'IIT - JEE Mains',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Wrap(
                    children: const [
                      Text(
                        'Batch:',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Text(
                        'Batch 01 Name (Morning)',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7.0))),
                                minimumSize: const Size.fromHeight(50)),
                            child: const Text('Join Now'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
