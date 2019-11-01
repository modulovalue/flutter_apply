import 'package:flutter/material.dart';
import 'package:flutter_apply/src/core/extensions/apply_on_preferred_widget.dart';
import 'package:flutter_apply/src/core/extensions/delayed.dart';

// Can't be const because _id can't be const (toplevel functions with type
// params can't be const?) throws a runtime error if const instead of final.
// ignore: prefer_const_constructors
final Applicator apply = _IDApplicator();

T _id<T>(T t) => t;

class _IDApplicator extends Applicator {
  const _IDApplicator() : super._(_id);
}

class Applicator {
  Widget applyWidget(Widget child) => _apply(child);

  final Widget Function(Widget) _apply;

  const Applicator._(this._apply);

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

  PreferredSizeWidget applyOnPrefWidget(PreferredSizeWidget child) {
    return ApplyOnPreferredSizeWidget(child, this);
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
}
