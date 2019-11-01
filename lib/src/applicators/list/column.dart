import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

ListApplicator centeredColumn() =>
    listApply((children) => center() > onColumnMinCenterCenter() >> children);

ListApplicator onColumnCenter() {
  return listApply((children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMinCenterCenter() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMinCenterStretch() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMinCenterEnd() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMinCenterStart() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMaxStartStart() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMaxStartCenter() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMaxCenterCenter() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMaxCenterStretch() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMaxCenterStart() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMaxEvenlyCenter() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMaxAroundCenter() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMaxBetweenCenter() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMinStartCenter() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMinStartStart() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMinStartEnd() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMinStartStretch() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children.toList(),
    );
  });
}

ListApplicator onColumn() {
  return listApply((children) {
    return Column(
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMin() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: children.toList(),
    );
  });
}

ListApplicator onColumnMax() {
  return listApply((children) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: children.toList(),
    );
  });
}
