// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/home/ask_doubt/ask_doubt.dart';
import '../ui/home/attendance/attendance.dart';
import '../ui/home/home_view.dart';
import '../ui/home/learning_resource/learning_resource.dart';
import '../ui/home/recommended_courses/recommended_courses.dart';
import '../ui/home/schedule/schedule.dart';
import '../ui/login/login_view.dart';
import '../ui/startup/startup_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String loginView = '/login-view';
  static const String homeView = '/home-view';
  static const String learningResourcesView = '/learning-resources-view';
  static const String scheduleView = '/schedule-view';
  static const String attendanceView = '/attendance-view';
  static const String askDoubtView = '/ask-doubt-view';
  static const String recommendedCoursesView = '/recommended-courses-view';
  static const all = <String>{
    startUpView,
    loginView,
    homeView,
    learningResourcesView,
    scheduleView,
    attendanceView,
    askDoubtView,
    recommendedCoursesView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.learningResourcesView, page: LearningResourcesView),
    RouteDef(Routes.scheduleView, page: ScheduleView),
    RouteDef(Routes.attendanceView, page: AttendanceView),
    RouteDef(Routes.askDoubtView, page: AskDoubtView),
    RouteDef(Routes.recommendedCoursesView, page: RecommendedCoursesView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    HomeView: (data) {
      var args = data.getArgs<HomeViewArguments>(
        orElse: () => HomeViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(key: args.key),
        settings: data,
      );
    },
    LearningResourcesView: (data) {
      var args = data.getArgs<LearningResourcesViewArguments>(
        orElse: () => LearningResourcesViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LearningResourcesView(
          key: args.key,
          showAppBar: args.showAppBar,
        ),
        settings: data,
      );
    },
    ScheduleView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ScheduleView(),
        settings: data,
      );
    },
    AttendanceView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AttendanceView(),
        settings: data,
      );
    },
    AskDoubtView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AskDoubtView(),
        settings: data,
      );
    },
    RecommendedCoursesView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const RecommendedCoursesView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomeView arguments holder class
class HomeViewArguments {
  final Key? key;
  HomeViewArguments({this.key});
}

/// LearningResourcesView arguments holder class
class LearningResourcesViewArguments {
  final Key? key;
  final bool? showAppBar;
  LearningResourcesViewArguments({this.key, this.showAppBar});
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToStartUpView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.startUpView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLoginView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.loginView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToHomeView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.homeView,
      arguments: HomeViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLearningResourcesView({
    Key? key,
    bool? showAppBar,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.learningResourcesView,
      arguments:
          LearningResourcesViewArguments(key: key, showAppBar: showAppBar),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToScheduleView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.scheduleView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAttendanceView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.attendanceView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAskDoubtView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.askDoubtView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToRecommendedCoursesView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.recommendedCoursesView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
