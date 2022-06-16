import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zepto_flutter_app/ui/home/learning_resource/learning_resource_viewmodel.dart';

class LearningResourcesView extends StatelessWidget {
  final bool? showAppBar;
  const LearningResourcesView({Key? key, this.showAppBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LearningResourceViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: showAppBar == true
            ? AppBar(title: const Text('Learning Resource'))
            : null,
        body: Container(
          color: Colors.amber,
          child: const Center(
              child: Text(
            'Learning Resource',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )),
        ),
      ),
      viewModelBuilder: () => LearningResourceViewModel(),
    );
  }
}
