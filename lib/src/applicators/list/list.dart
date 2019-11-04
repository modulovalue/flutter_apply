import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

ListApplicator onColumn({
  Key key,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  MainAxisSize mainAxisSize = MainAxisSize.max,
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  TextDirection textDirection,
  VerticalDirection verticalDirection = VerticalDirection.down,
  TextBaseline textBaseline,
}) {
  return listApply((children) {
    return Column(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: children.toList(),
    );
  });
}

ListApplicator onRow({
  Key key,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  MainAxisSize mainAxisSize = MainAxisSize.max,
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  TextDirection textDirection,
  VerticalDirection verticalDirection = VerticalDirection.down,
  TextBaseline textBaseline,
}) {
  return listApply((children) {
    return Row(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: children.toList(),
    );
  });
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

ListApplicator onListView({EdgeInsets padding, bool reverse, bool shrinkWrap}) {
  return listApply((children) {
    return ListView(
      padding: padding,
      reverse: reverse ?? false,
      shrinkWrap: shrinkWrap ?? false,
      children: children.toList(),
      scrollDirection: Axis.vertical,
    );
  });
}

ListApplicator onListViewH(
    {EdgeInsets padding, bool reverse, bool shrinkWrap}) {
  return listApply((children) {
    return ListView(
      padding: padding,
      reverse: reverse ?? false,
      shrinkWrap: shrinkWrap ?? false,
      children: children.toList(),
      scrollDirection: Axis.horizontal,
    );
  });
}

ListBuilderApplicator onListViewBuilder({
  @required int count,
  EdgeInsets padding,
  bool reverse,
  bool shrinkWrap,
  Axis axis,
  ScrollController controller,
}) {
  return listApplyBuilder((builder) {
    return ListView.builder(
      itemCount: count,
      padding: padding,
      reverse: reverse ?? false,
      shrinkWrap: shrinkWrap ?? false,
      scrollDirection: axis ?? Axis.vertical,
      controller: controller,
      itemBuilder: builder,
    );
  });
}
