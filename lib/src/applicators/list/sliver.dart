
import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

ListApplicator customScrollView() {
  return listApply((children) => CustomScrollView(slivers: children.toList()));
}
