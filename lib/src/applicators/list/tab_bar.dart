import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

Applicator tabC({@required int length, int initialIndex = 0}) =>
    apply((child) => DefaultTabController(
        initialIndex: initialIndex, length: length, child: child));

ListApplicator onTabBarView() {
  return listApply((children) => TabBarView(children: children.toList()));
}

IndexedListApplicator onTabBarViewIndexed() {
  return indexedListApply((children) {
    final _children0 = children
        .toList()
        .asMap()
        .entries
        .map((entry) => entry.value(entry.key));
    return TabBarView(children: _children0.toList());
  });
}
