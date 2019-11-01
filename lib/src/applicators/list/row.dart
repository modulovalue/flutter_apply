import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

ListApplicator onRowMinCenterCenter() {
  return listApply((children) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onRowMinCenterEnd() {
  return listApply((children) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: children.toList(),
    );
  });
}

ListApplicator onRowMinCenterBaselineAlphabetic() {
  return listApply((children) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: children.toList(),
    );
  });
}

ListApplicator onRowMinCenterCenterAlphabetic() {
  return listApply((children) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      children: children.toList(),
    );
  });
}

ListApplicator onRowMinStartBaselineAlphabetic() {
  return listApply((children) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: children.toList(),
    );
  });
}

ListApplicator onRowMinStartEnd() {
  return listApply((children) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: children.toList(),
    );
  });
}

ListApplicator onRowMinStartCenter() {
  return listApply((children) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onRowMinCenterStart() {
  return listApply((children) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children.toList(),
    );
  });
}

ListApplicator onRowMin() {
  return listApply((children) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children.toList(),
    );
  });
}

ListApplicator onRowMax() {
  return listApply((children) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: children.toList(),
    );
  });
}

ListApplicator onRowMaxStretch() {
  return listApply((children) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children.toList(),
    );
  });
}

ListApplicator onRowMaxCenter() {
  return listApply((children) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onRowMaxCenterCenter() {
  return listApply((children) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onRowMaxStartCenter() {
  return listApply((children) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onRowMaxStartBaselineAlphabetic() {
  return listApply((children) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: children.toList(),
    );
  });
}
