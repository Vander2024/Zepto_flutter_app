import 'package:animations/animations.dart';
import 'package:badges/badges.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:zepto_flutter_app/ui/home/ask_doubt/ask_doubt.dart';
import 'package:zepto_flutter_app/ui/home/attendance/attendance.dart';
import 'package:zepto_flutter_app/ui/home/dashboard/dashboard.dart';
import 'package:zepto_flutter_app/ui/home/home_viewmodel.dart';
import 'package:zepto_flutter_app/ui/home/learning_resource/learning_resource.dart';
import 'package:zepto_flutter_app/ui/home/recommended_courses/recommended_courses.dart';
import 'package:zepto_flutter_app/utils/colors.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: ((model) =>
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {})),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: primaryColor,
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, right: 15),
                child: Badge(
                  badgeColor: Colors.white,
                  padding: const EdgeInsets.all(4),
                  animationType: BadgeAnimationType.fade,
                  badgeContent: const Text(
                    '7',
                    style: TextStyle(
                        fontSize: 10,
                        color: primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      print('ontap-->');
                      _scaffoldKey.currentState!.openEndDrawer();
                    },
                    child: const Icon(
                      Icons.notifications_rounded,
                      size: 24,
                    ),
                  ),
                ),
              )
            ],
          ),
          body: PageTransitionSwitcher(
            duration: const Duration(milliseconds: 300),
            reverse: model.reverse,
            transitionBuilder: (
              Widget child,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child,
              );
            },
            child: getViewForIndex(model.currentIndex),
          ),
          drawer: Padding(
            padding: const EdgeInsets.only(top: 56),
            child: Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: primaryColor,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.person,
                                  color: Colors.indigo[900],
                                  size: 36,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Rahul',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: null,
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(
                                        side: BorderSide(
                                            width: 0,
                                            color: Colors.white,
                                            style: BorderStyle.none)),
                                  ),
                                  child: const Icon(
                                    Icons.lock_open_rounded,
                                    color: Colors.white54,
                                  ),
                                ),
                                const Text(
                                  'Change Password',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white54),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    model.showLogOutDialog();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(
                                        side: BorderSide(
                                            width: 0,
                                            color: Colors.white,
                                            style: BorderStyle.none)),
                                  ),
                                  child: const Icon(
                                    Icons.logout_rounded,
                                    color: Colors.white54,
                                  ),
                                ),
                                const Text(
                                  'Logout',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white54),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    selected: true,
                    leading: const Icon(Icons.dashboard),
                    title: const Text('Dashboard'),
                    dense: true,
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.explore_rounded),
                    title: const Text('Learning Resource'),
                    dense: true,
                    onTap: () {
                      model.navigateToLearningResources();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.schedule_rounded),
                    title: const Text('Schedule'),
                    dense: true,
                    onTap: () {
                      model.navigateToSchedule();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.present_to_all),
                    title: const Text('Attendance'),
                    dense: true,
                    onTap: () {
                      model.navigateToAttendance();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.quickreply_rounded),
                    title: const Text('Ask Doubt'),
                    dense: true,
                    onTap: () {
                      model.navigateToAskDoubt();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.recommend_rounded),
                    title: const Text('Recomended Courses'),
                    dense: true,
                    onTap: () {
                      model.navigateToRecommendedCourses();
                    },
                  ),
                ],
              ),
            ),
          ),
          endDrawer: Padding(
            padding: const EdgeInsets.only(top: 56),
            child: Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.grey[200],
              currentIndex: model.currentIndex,
              onTap: model.setIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bar_chart_rounded), label: 'Progress'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.quickreply_rounded), label: 'Query'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search_rounded), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.manage_accounts_rounded),
                    label: 'Profile'),
              ]),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    if (kDebugMode) {
      print('index-->$index');
    }
    switch (index) {
      case 0:
        return const DashboardView();
      case 1:
        return const LearningResourcesView(
          showAppBar: false,
        );
      case 2:
        return const AskDoubtView();
      case 3:
        return const RecommendedCoursesView();
      case 4:
        return const AttendanceView();
      default:
        return const DashboardView();
    }
  }
}
