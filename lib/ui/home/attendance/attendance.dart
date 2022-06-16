import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zepto_flutter_app/ui/home/attendance/attendance_viewmodel.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AttendanceViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: const Text('Attendance')),
        body: Container(
          color: Colors.pink,
          child: const Center(
              child: Text(
            'Attendance',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )),
        ),
      ),
      viewModelBuilder: () => AttendanceViewModel(),
    );
  }
}
