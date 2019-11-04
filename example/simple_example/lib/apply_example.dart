import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

class ExampleNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return scaffold()
      & bgColor(Colors.blue[100])
        & center()
        & singleChildScrollView() >
          onColumnMin() >>
            padding(all: 5.0) * [
              textAsCaption() >
                const Text("Hello"),

              textProperties(
                size: 20,
                weight: FontWeight.w900,
              ) >
                const Text("This is"),

              textColor(Colors.white) &
              textSize(40.0) &
              textWeight700() >
                const Text("flutter_apply"),

              verticalSpace(50.0),

              const FlutterLogo(),
            ];
  }
}
