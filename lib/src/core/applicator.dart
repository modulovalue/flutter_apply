import 'package:flutter/material.dart';
import 'package:flutter_apply/src/core/delayed.dart';

class Applicator {
  Widget applyWidget(Widget child) => _apply(child);

  final Widget Function(Widget) _apply;

  const Applicator._(this._apply);

  PreferredSizeWidget applyOnPrefWidget(PreferredSizeWidget child) {
    return _ApplyOnPreferredSizeWidget(child, this);
  }

  Applicator when(bool condition, {Applicator orElse}) {
    if (condition) {
      return this;
    } else {
      return orElse ?? apply;
    }
  }

  Applicator delayed(Duration duration) {
    return apply((child) {
      return DelayedWidget(applicator: this, duration: duration, child: child);
    });
  }

  Applicator operator &(Applicator operator) {
    return apply((a) {
      return applyWidget(operator.applyWidget(a));
    });
  }

  Widget operator >(Widget w) {
    return applyWidget(w);
  }

  List<Widget> operator *(Iterable<Widget> w) {
    return w.map(applyWidget).toList();
  }

  Applicator call(Widget Function(Widget child) applyNew) {
    return apply((child) {
      return applyWidget(applyNew(child));
    });
  }
}

// Can't be const because _id can't be const (toplevel functions with type
// params can't be const?) throws a runtime error if const instead of final.
// ignore: prefer_const_constructors
final Applicator apply = _IDApplicator();

T _id<T>(T t) => t;

class _IDApplicator extends Applicator {
  const _IDApplicator() : super._(_id);
}

class _ApplyOnPreferredSizeWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final PreferredSizeWidget child;
  final Applicator applicator;

  const _ApplyOnPreferredSizeWidget(this.child, this.applicator);

  @override
  Widget build(BuildContext context) {
    return applicator > child;
  }

  @override
  Size get preferredSize {
    return child.preferredSize;
  }
}

class SecondClassApplicator<S, T> {
  final T Function(S) builder;

  const SecondClassApplicator._(this.builder);

  T call(S w) => builder(w);

  T operator >>(S val) => builder(val);

  T apply(S val) => this >> val;
}

ListApplicator listApply(Widget Function(Iterable<Widget>) builder) =>
    ListApplicator._(builder);

class ListApplicator extends SecondClassApplicator<Iterable<Widget>, Widget> {
  const ListApplicator._(Widget Function(Iterable<Widget>) builder)
      : super._(builder);
}

IndexedListApplicator indexedListApply(
    Widget Function(Iterable<Widget Function(int index)>) builder) {
  return IndexedListApplicator._(builder);
}

class IndexedListApplicator extends SecondClassApplicator<
    Iterable<Widget Function(int index)>, Widget> {
  const IndexedListApplicator._(
      Widget Function(Iterable<Widget Function(int index)>) builder)
      : super._(builder);
}

PreferredApplicator preferApply(PreferredSizeWidget Function(Widget) apply) {
  return PreferredApplicator._(apply);
}

class PreferredApplicator
    extends SecondClassApplicator<Widget, PreferredSizeWidget> {
  const PreferredApplicator._(PreferredSizeWidget Function(Widget) builder)
      : super._(builder);
}

ListBuilderApplicator listApplyBuilder(
    Widget Function(Widget Function(BuildContext, int index)) builder) {
  return ListBuilderApplicator._(builder);
}

class ListBuilderApplicator extends SecondClassApplicator<
    Widget Function(BuildContext context, int index), Widget> {
  const ListBuilderApplicator._(
      Widget Function(Widget Function(BuildContext context, int index)) builder)
      : super._(builder);
}
