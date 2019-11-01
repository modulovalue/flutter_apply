import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

ListApplicator onStack({Alignment alignment, StackFit fit, Overflow overflow}) {
  return listApply((children) {
    return Stack(
      fit: fit ?? StackFit.loose,
      overflow: overflow ?? Overflow.clip,
      // topStart is the default, can't be null.
      alignment: alignment ?? AlignmentDirectional.topStart,
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
