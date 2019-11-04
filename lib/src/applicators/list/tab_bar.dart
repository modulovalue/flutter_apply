import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

Applicator tabC({@required int length, int initialIndex = 0}) {
  return apply((child) {
    return DefaultTabController(
        initialIndex: initialIndex, length: length, child: child);
  });
}

ListApplicator onTabBarView() {
  return listApply((children) {
    return TabBarView(
      children: children.toList(),
    );
  });
}
