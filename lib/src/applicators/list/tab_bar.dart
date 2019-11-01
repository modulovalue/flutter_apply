import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

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
