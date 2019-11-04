import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

ListApplicator onStack({
  Key key,
  AlignmentDirectional alignment = AlignmentDirectional.topStart,
  TextDirection textDirection,
  StackFit fit = StackFit.loose,
  Overflow overflow = Overflow.clip,
}) {
  return listApply((children) {
    return Stack(
      key: key,
      alignment: alignment,
      textDirection: textDirection,
      fit: fit,
      overflow: overflow,
      children: children.toList(),
    );
  });
}

ListApplicator onStackCenterVisible() {
  return listApply((children) {
    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.visible,
      children: children.toList(),
    );
  });
}

Applicator positioned({
  double bottom,
  double top,
  double left,
  double right,
  double width,
  double height,
}) {
  return apply((child) {
    return Positioned(
        bottom: bottom,
        top: top,
        right: right,
        left: left,
        width: width,
        height: height,
        child: child);
  });
}

Applicator positionedExpanded(BoxConstraints constraint) {
  return positioned(
      left: 0,
      top: 0,
      width: constraint.maxWidth,
      height: constraint.maxHeight);
}
