import 'package:flutter/material.dart';

class SecondClassApplicator<S, T> {
  final T Function(S) _builder;

  const SecondClassApplicator(this._builder);

  T build(S t) => _builder(t);

  T operator >>(S val) => build(val);
}

ListApplicator listApply(Widget Function(Iterable<Widget>) builder) =>
    ListApplicator._(builder);

class ListApplicator extends SecondClassApplicator<Iterable<Widget>, Widget> {
  const ListApplicator._(Widget Function(Iterable<Widget>) builder)
      : super(builder);

  IndexedListApplicator indexed() {
    return IndexedListApplicator._((children) {
      return build(
        children.toList().asMap().entries.map((entry) {
          return entry.value(entry.key);
        }),
      );
    });
  }
}

class IndexedListApplicator extends SecondClassApplicator<
    Iterable<Widget Function(int index)>, Widget> {
  const IndexedListApplicator._(
      Widget Function(Iterable<Widget Function(int index)>) builder)
      : super(builder);
}

/// For widgets that natively have a builder constructor like
/// [ListView.builder] & [GridView.builder]
ListBuilderApplicator listApplyBuilder(
    Widget Function(Widget Function(BuildContext, int index)) builder) {
  return ListBuilderApplicator._(builder);
}

class ListBuilderApplicator extends SecondClassApplicator<
    Widget Function(BuildContext context, int index), Widget> {
  const ListBuilderApplicator._(
      Widget Function(Widget Function(BuildContext context, int index)) builder)
      : super(builder);
}
