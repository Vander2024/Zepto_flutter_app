import 'package:flutter/material.dart';
import 'package:zepto_flutter_app/ui/home/dashboard/dashboard_live_schedule.dart';
import 'package:zepto_flutter_app/ui/home/dashboard/dashboard_messages.dart';
import 'package:zepto_flutter_app/ui/home/dashboard/dashboard_schedule.dart';
import 'package:zepto_flutter_app/ui/home/dashboard/dashboard_statistics.dart';
import 'package:zepto_flutter_app/ui/home/dashboard/dashboard_summery.dart';
import 'package:zepto_flutter_app/ui/home/dashboard/dashboard_upcomming_classes.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const DashboardSummeryView(),
            const SizedBox(
              height: 15,
            ),
            const DashboardLiveScheduleView(),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Card(
                child: DashboardScheduleView(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Card(
                child: SizedBox(
                  height: 240,
                  child: DashboardStatsView(),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Card(
                child: DashboardUpcommingClassesView(),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Card(
                child: DashboardMessagesView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
