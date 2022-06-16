import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zepto_flutter_app/ui/home/schedule/schedule_viewmodel.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduleViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: const Text('Schedule')),
        body: Container(
          color: Colors.yellow,
          child: const Center(
              child: Text(
            'Schedule',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )),
        ),
      ),
      viewModelBuilder: () => ScheduleViewModel(),
    );
  }
}
