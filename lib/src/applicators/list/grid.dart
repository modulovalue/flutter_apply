
import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

ListApplicator onGrid(int crossExtentCount,
    {EdgeInsets padding, bool shrinkWrap}) {
  return listApply((children) => GridView.count(
        padding: padding,
        crossAxisCount: crossExtentCount,
        shrinkWrap: shrinkWrap ?? false,
        children: children.toList(),
      ));
}

ListBuilderApplicator onGridBuilder(int count, SliverGridDelegate delegate,
    {EdgeInsets padding, bool keepAlive, bool reverse}) {
  return listApplyBuilder((builder) {
    return GridView.builder(
        gridDelegate: delegate,
        itemBuilder: builder,
        shrinkWrap: true,
        itemCount: count,
        padding: padding,
        reverse: reverse ?? false);
  });
}
