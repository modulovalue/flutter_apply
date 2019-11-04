import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

Applicator onBuilder(Widget Function(BuildContext, Widget) builder) {
  return apply(
      (child) => Builder(builder: (context) => builder(context, child)));
}

Applicator onLayoutBuilder(
    Widget Function(BuildContext, BoxConstraints, Widget) builder) {
  return apply((child) => LayoutBuilder(
      builder: (context, constraints) => builder(context, constraints, child)));
}

Applicator onContext(Applicator Function(BuildContext) builder) {
  return onBuilder((context, child) => builder(context) > child);
}
