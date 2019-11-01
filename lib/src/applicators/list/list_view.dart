import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

ListApplicator onListView(
    {EdgeInsets padding, bool keepAlive, bool reverse, bool shrinkWrap}) {
  return listApply((children) {
    final _children = CachingIterable<Widget>(children.iterator);
    return onListViewBuilder(
            count: null, shrinkWrap: shrinkWrap, padding: padding) >>
        (context, index) {
          if (_children.length > index) {
            return _children.elementAt(index);
          } else {
            return null;
          }
        };
  });
}

IndexedListApplicator onListViewIndexed(
    {EdgeInsets padding,
    bool keepAlive,
    bool reverse,
    bool shrinkWrap,
    Axis axis}) {
  return indexedListApply((Iterable<Widget Function(int)> children) {
    final _children0 =
        indexedIterable(children).map((entry) => entry.value(entry.key));
    final _children = CachingIterable<Widget>(_children0.iterator);
    return onListViewBuilder(
            count: null,
            shrinkWrap: shrinkWrap,
            axis: axis,
            padding: padding) >>
        (context, index) {
          if (_children.length > index) {
            return _children.elementAt(index);
          } else {
            return null;
          }
        };
  });
}

ListApplicator onListViewH(
    {EdgeInsets padding, bool keepAlive, bool reverse, bool shrinkWrap}) {
  return listApply((children) {
    final _children = CachingIterable<Widget>(children.iterator);
    return onListViewBuilder(
            count: null,
            shrinkWrap: shrinkWrap,
            axis: Axis.horizontal,
            padding: padding) >>
        (context, index) {
          if (_children.length > index) {
            return _children.elementAt(index);
          } else {
            return null;
          }
        };
  });
}

ListBuilderApplicator onListViewBuilder({
  @required int count,
  EdgeInsets padding,
  bool keepAlive,
  bool reverse,
  bool shrinkWrap,
  Axis axis,
  ScrollController controller,
}) {
  return listApplyBuilder((builder) {
    return ListView.builder(
      shrinkWrap: shrinkWrap ?? false,
      scrollDirection: axis ?? Axis.vertical,
      itemBuilder: builder,
      itemCount: count,
      controller: controller,
      padding: padding,
      reverse: reverse ?? false,
    );
  });
}
