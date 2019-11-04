import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

double wrapSpacing(Iterable<Widget> children, double spacing) {
  final _visibleChildren = children.where((a) => a != nothing).toList();
  return (_visibleChildren.isEmpty || _visibleChildren.length == 1)
      ? 0.0
      : spacing;
}

ListApplicator onWrap({
  Key key,
  Axis direction = Axis.horizontal,
  WrapAlignment alignment = WrapAlignment.start,
  double spacing = 0.0,
  WrapAlignment runAlignment = WrapAlignment.start,
  double runSpacing = 0.0,
  WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,
  TextDirection textDirection,
  VerticalDirection verticalDirection = VerticalDirection.down,
}) {
  return listApply((children) {
    return Wrap(
      key: key,
      direction: direction,
      alignment: alignment,
      spacing: spacing,
      runAlignment: runAlignment,
      runSpacing: runSpacing,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: children.toList(),
    );
  });
}

ListApplicator onWrapCenter(
    {double spacing, double runSpacing, double allSpacing}) {
  return onWrap(
    spacing: spacing ?? allSpacing ?? 0.0,
    runSpacing: runSpacing ?? allSpacing ?? 0.0,
    alignment: WrapAlignment.center,
  );
}

ListApplicator onWrapCenterCenter(
    {double spacing, double runSpacing, double allSpacing}) {
  return onWrap(
    spacing: spacing ?? allSpacing ?? 0.0,
    runSpacing: runSpacing ?? allSpacing ?? 0.0,
    alignment: WrapAlignment.center,
    crossAxisAlignment: WrapCrossAlignment.center,
  );
}

ListApplicator onWrapEvenlyCenter(
    {double spacing, double runSpacing, double allSpacing}) {
  return onWrap(
    spacing: spacing ?? allSpacing ?? 0.0,
    runSpacing: runSpacing ?? allSpacing ?? 0.0,
    alignment: WrapAlignment.spaceEvenly,
    crossAxisAlignment: WrapCrossAlignment.center,
  );
}

ListApplicator onWrapAroundCenter(
    {double spacing, double runSpacing, double allSpacing}) {
  return onWrap(
    spacing: spacing ?? allSpacing ?? 0.0,
    runSpacing: runSpacing ?? allSpacing ?? 0.0,
    alignment: WrapAlignment.spaceAround,
    crossAxisAlignment: WrapCrossAlignment.center,
  );
}

ListApplicator onWrapBetweenCenter(
    {double spacing, double runSpacing, double allSpacing}) {
  return onWrap(
    spacing: spacing ?? allSpacing ?? 0.0,
    runSpacing: runSpacing ?? allSpacing ?? 0.0,
    alignment: WrapAlignment.spaceBetween,
    crossAxisAlignment: WrapCrossAlignment.center,
  );
}

ListApplicator onWrapCenterEnd(
    {double spacing, double runSpacing, double allSpacing}) {
  return onWrap(
    spacing: spacing ?? allSpacing ?? 0.0,
    runSpacing: runSpacing ?? allSpacing ?? 0.0,
    alignment: WrapAlignment.center,
    crossAxisAlignment: WrapCrossAlignment.end,
  );
}

ListApplicator onWrapStart(
    {double spacing, double runSpacing, double allSpacing}) {
  return onWrap(
    spacing: spacing ?? allSpacing ?? 0.0,
    runSpacing: runSpacing ?? allSpacing ?? 0.0,
    alignment: WrapAlignment.start,
  );
}

ListApplicator onWrapStartCenter(
    {double spacing, double runSpacing, double allSpacing}) {
  return onWrap(
    spacing: spacing ?? allSpacing ?? 0.0,
    runSpacing: runSpacing ?? allSpacing ?? 0.0,
    alignment: WrapAlignment.start,
    crossAxisAlignment: WrapCrossAlignment.center,
  );
}

ListApplicator onWrapEnd(
    {double spacing, double runSpacing, double allSpacing}) {
  return onWrap(
    spacing: spacing ?? allSpacing ?? 0.0,
    runSpacing: runSpacing ?? allSpacing ?? 0.0,
    alignment: WrapAlignment.end,
  );
}

ListApplicator onWrapEndEnd(
    {double spacing, double runSpacing, double allSpacing}) {
  return onWrap(
    spacing: spacing ?? allSpacing ?? 0.0,
    runSpacing: runSpacing ?? allSpacing ?? 0.0,
    alignment: WrapAlignment.end,
    crossAxisAlignment: WrapCrossAlignment.end,
  );
}

ListApplicator onWrapStartStart(
    {double spacing, double runSpacing, double allSpacing}) {
  return onWrap(
    spacing: spacing ?? allSpacing ?? 0.0,
    runSpacing: runSpacing ?? allSpacing ?? 0.0,
    alignment: WrapAlignment.start,
    crossAxisAlignment: WrapCrossAlignment.start,
  );
}
