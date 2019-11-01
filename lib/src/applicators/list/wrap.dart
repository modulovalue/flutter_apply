
import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

double _wrapSpacing(Iterable<Widget> children, double spacing) {
  final _visibleChildren = children.where((a) => a != nothing).toList();
  return (_visibleChildren.isEmpty || _visibleChildren.length == 1)
      ? 0.0
      : spacing;
}

ListApplicator onWrapCenter(
    {double spacing, double runSpacing, double allSpacing}) {
  return listApply((children) {
    return Wrap(
      spacing: _wrapSpacing(children, spacing ?? allSpacing ?? 0.0),
      runSpacing: runSpacing ?? allSpacing ?? 0.0,
      alignment: WrapAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onWrapCenterCenter(
    {double spacing, double runSpacing, double allSpacing}) {
  return listApply((children) {
    return Wrap(
      spacing: _wrapSpacing(children, spacing ?? allSpacing ?? 0.0),
      runSpacing: runSpacing ?? allSpacing ?? 0.0,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onWrapEvenlyCenter(
    {double spacing, double runSpacing, double allSpacing}) {
  return listApply((children) {
    return Wrap(
      spacing: _wrapSpacing(children, spacing ?? allSpacing ?? 0.0),
      runSpacing: runSpacing ?? allSpacing ?? 0.0,
      alignment: WrapAlignment.spaceEvenly,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onWrapAroundCenter(
    {double spacing, double runSpacing, double allSpacing}) {
  return listApply((children) {
    return Wrap(
      spacing: _wrapSpacing(children, spacing ?? allSpacing ?? 0.0),
      runSpacing: runSpacing ?? allSpacing ?? 0.0,
      alignment: WrapAlignment.spaceAround,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onWrapBetweenCenter(
    {double spacing, double runSpacing, double allSpacing}) {
  return listApply((children) {
    return Wrap(
      spacing: _wrapSpacing(children, spacing ?? allSpacing ?? 0.0),
      runSpacing: runSpacing ?? allSpacing ?? 0.0,
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onWrapCenterEnd(
    {double spacing, double runSpacing, double allSpacing}) {
  return listApply((children) {
    return Wrap(
      spacing: _wrapSpacing(children, spacing ?? allSpacing ?? 0.0),
      runSpacing: runSpacing ?? allSpacing ?? 0.0,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: children.toList(),
    );
  });
}

ListApplicator onWrapStart({double spacing}) {
  return listApply((children) {
    return Wrap(
      spacing: _wrapSpacing(children, spacing ?? 0.0),
      alignment: WrapAlignment.start,
      children: children.toList(),
    );
  });
}

ListApplicator onWrapStartCenter({double spacing}) {
  return listApply((children) {
    return Wrap(
      spacing: _wrapSpacing(children, spacing ?? 0.0),
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onWrapEnd({double spacing}) {
  return listApply((children) {
    return Wrap(
      spacing: _wrapSpacing(children, spacing ?? 0.0),
      alignment: WrapAlignment.end,
      children: children.toList(),
    );
  });
}

ListApplicator onWrapEndEnd({double spacing}) {
  return listApply((children) {
    return Wrap(
      spacing: _wrapSpacing(children, spacing ?? 0.0),
      alignment: WrapAlignment.end,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: children.toList(),
    );
  });
}

ListApplicator onWrapStartStart({double spacing}) {
  return listApply((children) {
    return Wrap(
      spacing: _wrapSpacing(children, spacing ?? 0.0),
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: children.toList(),
    );
  });
}
