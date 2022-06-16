import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zepto_flutter_app/ui/home/ask_doubt/ask_doubt_viewmodel.dart';

class AskDoubtView extends StatelessWidget {
  const AskDoubtView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AskDoubtViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: const Text('Ask Doubt')),
        body: Container(
          color: Colors.greenAccent,
          child: const Center(
              child: Text(
            'Ask Doubt',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )),
        ),
      ),
      viewModelBuilder: () => AskDoubtViewModel(),
    );
  }
}
