import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

Applicator sliverToBox() {
  return apply((child) => SliverToBoxAdapter(child: child));
}

Applicator sliverFillRemaining() {
  return apply((child) => SliverFillRemaining(child: child));
}

ListApplicator customScrollView() {
  return listApply((children) => CustomScrollView(slivers: children.toList()));
}
