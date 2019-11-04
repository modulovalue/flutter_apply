import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

Applicator size(Size edge) {
  return apply((child) =>
      SizedBox(height: edge.height, width: edge.width, child: child));
}

Applicator square(double edge) =>
    apply((child) => SizedBox(height: edge, width: edge, child: child));

Applicator intrinsicHeight() {
  return apply((child) => IntrinsicHeight(child: child));
}

Applicator intrinsicWidth() {
  return apply((child) => IntrinsicWidth(child: child));
}

Applicator width(double width) {
  return apply((child) => SizedBox(width: width, child: child));
}

Applicator height(double height) {
  return apply((child) => SizedBox(height: height, child: child));
}

Applicator relativeWidth(double width) {
  return onBuilder((context, child) {
    final _width = MediaQuery.of(context).size.width;
    return SizedBox(width: width * _width, child: child);
  });
}

Applicator relativeHeight(double height) {
  return onBuilder((context, child) {
    final _height = MediaQuery.of(context).size.height;
    return SizedBox(height: height * _height, child: child);
  });
}

PreferredApplicator preferredWidth(double width) =>
    apply.preferredSize(Size.fromWidth(width));

PreferredApplicator preferredHeight(double height) =>
    apply.preferredSize(Size.fromHeight(height));

Applicator constrain(BoxConstraints constraints, {Decoration decoration}) {
  return apply((child) {
    return Container(
      constraints: constraints,
      decoration: decoration,
      child: child,
    );
  });
}

Applicator constrainWith(
    {double minHeight,
    double maxHeight,
    double minWidth,
    double maxWidth,
    Decoration decoration}) {
  return apply((child) {
    return Container(
      constraints: BoxConstraints(
        minWidth: minWidth ?? 0.0,
        maxWidth: maxWidth ?? double.infinity,
        minHeight: minHeight ?? 0.0,
        maxHeight: maxHeight ?? double.infinity,
      ),
      decoration: decoration,
      child: child,
    );
  });
}
