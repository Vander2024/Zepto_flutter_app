import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zepto_flutter_app/ui/home/recommended_courses/recommended_courses_viewmodel.dart';

class RecommendedCoursesView extends StatelessWidget {
  const RecommendedCoursesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecommendedCoursesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: const Text('Recommended Courses')),
        body: Container(
          color: Colors.amber,
          child: const Center(
              child: Text(
            'Recommended Courses',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )),
        ),
      ),
      viewModelBuilder: () => RecommendedCoursesViewModel(),
    );
  }
}
