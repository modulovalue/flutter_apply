import 'package:flutter/material.dart';

part 'applicator_list.dart';

part 'applicator_indexed_list.dart';

part 'applicator_list_builder.dart';

part 'applicator_preferred.dart';

class SecondClassApplicator<S, T> {
  final T Function(S) builder;

  const SecondClassApplicator._(this.builder);

  T call(S w) => builder(w);

  T operator >>(S val) => builder(val);

  T apply(S val) => this >> val;
}
