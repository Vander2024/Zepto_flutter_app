// ignore: implementation_imports
import 'package:fl_chart/src/chart/bar_chart/bar_chart_data.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zepto_flutter_app/app/app.locator.dart';
import 'package:zepto_flutter_app/app/app.router.dart';
import 'package:zepto_flutter_app/ui/home/learning_resource/learning_resource.dart';
import 'package:zepto_flutter_app/utils/colors.dart';

@singleton
class HomeViewModel extends IndexTrackingViewModel {
  final _navigationService = zeptoLocator<NavigationService>();
  final _dialogService = zeptoLocator<DialogService>();

  showLogOutDialog() async {
    final dialogResult = await _dialogService.showDialog(
      title: 'Logout',
      description: 'Are you sure want to logout?',
      cancelTitle: 'cancel',
      buttonTitle: 'Yes',
    );

    if (dialogResult!.confirmed) {
      _navigationService.navigateTo(Routes.loginView);
    }
  }

  void navigateToRecommendedCourses() {
    _navigationService.navigateTo(Routes.recommendedCoursesView);
  }

  void navigateToAskDoubt() {
    _navigationService.navigateTo(Routes.askDoubtView);
  }

  void navigateToAttendance() {
    _navigationService.navigateTo(Routes.attendanceView);
  }

  void navigateToSchedule() {
    _navigationService.navigateTo(Routes.scheduleView);
  }

  void navigateToLearningResources() {
    _navigationService.navigateTo(Routes.learningResourcesView,
        arguments: LearningResourcesViewArguments(showAppBar: true));
  }

  List<BarChartGroupData> getDasboardStatsdata() {
    final barGroup1 = makeGroupData(1, 25, 35, 40);
    final barGroup2 = makeGroupData(2, 16, 36, 57);
    final barGroup3 = makeGroupData(3, 18, 58, 56);
    final barGroup4 = makeGroupData(4, 20, 34, 16);
    final barGroup5 = makeGroupData(5, 17, 56, 60);
    final barGroup6 = makeGroupData(6, 19, 46, 50);
    final barGroup7 = makeGroupData(7, 10, 34, 100);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    return items;
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double y3) {
    return BarChartGroupData(barsSpace: 2, x: x, barRods: [
      BarChartRodData(
        toY: y1,
        color: myStatsColor,
        width: 8,
      ),
      BarChartRodData(
        toY: y2,
        color: classAverageColor,
        width: 8,
      ),
      BarChartRodData(
        toY: y3,
        color: topperColor,
        width: 8,
      ),
    ]);
  }

  late int _messageCount = 2;

  int get messageCount => _messageCount;

  setMessageCount() {
    if (_messageCount == 2) {
      _messageCount = messageCount + 3;
    } else {
      _messageCount = 2;
    }
    notifyListeners();
  }
}
