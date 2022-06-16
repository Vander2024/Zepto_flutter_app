import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zepto_flutter_app/ui/home/ask_doubt/ask_doubt.dart';
import 'package:zepto_flutter_app/ui/home/attendance/attendance.dart';
import 'package:zepto_flutter_app/ui/home/home_view.dart';
import 'package:zepto_flutter_app/ui/home/learning_resource/learning_resource.dart';
import 'package:zepto_flutter_app/ui/home/recommended_courses/recommended_courses.dart';
import 'package:zepto_flutter_app/ui/home/schedule/schedule.dart';
import '../api/api.dart';
import '../api/api_helper.dart';
import '../sharedprefs/shared_pref_helper.dart';
import '../ui/login/login_view.dart';
import '../ui/startup/startup_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartUpView, initial: true),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: LearningResourcesView),
  MaterialRoute(page: ScheduleView),
  MaterialRoute(page: AttendanceView),
  MaterialRoute(page: AskDoubtView),
  MaterialRoute(page: RecommendedCoursesView)
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: SharedPrefsHelper),
  LazySingleton(classType: API),
  LazySingleton(classType: ApiHelper),
], locatorName: 'zeptoLocator', locatorSetupName: 'setUpZeptoLocator')
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
