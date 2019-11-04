import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

/// The 'null' [Applicator].
///
/// An applies [apply] [Applicator] won't have
/// an effect on participating [Applicator]s.
const IDApplicator apply = IDApplicator();

Widget _id(Widget t) => t;

class IDApplicator extends Applicator {
  const IDApplicator() : super(_id);

  /// Allows each [apply] to create new [Applicator]s.
  ///
  /// Example:
  ///
  ///   apply((child) => ...);
  ///
  Applicator call(Widget Function(Widget child) applyNew) {
    return Applicator((child) => applyWidget(applyNew(child)));
  }
}

class Applicator {
  final Widget Function(Widget) _apply;

  const Applicator(this._apply);

  /// Applies this [Applicator] to [child].
  Widget applyWidget(Widget child) => _apply(child);

  /// Combines this [Applicator] with the passed [Applicator] into
  /// a new [Applicator].
  ///
  /// Example:
  ///
  ///   apply & apply
  ///
  /// The left applicator is applied first.
  Applicator operator &(Applicator operator) {
    return apply((a) => applyWidget(operator.applyWidget(a)));
  }

  /// Same as [applyWidget] applies this [Applicator] to [child].
  Widget operator >(Widget child) {
    return applyWidget(child);
  }

  /// Applies this [Applicator] to every child in [children].
  List<Widget> operator *(Iterable<Widget> children) {
    return children.map(applyWidget).toList();
  }

  /// Converts this [Applicator] into a [PreferredApplicator].
  PreferredApplicator preferredSize(Size size, [Key key]) {
    return PreferredApplicator._((child) {
      return PreferredSize(
        key: key,
        preferredSize: size,
        child: applyWidget(child),
      );
    });
  }

  /// Disables this [Applicator] when [condition] is false.
  ///
  /// If you specify [orElse] this [Applicator] will be
  /// replaced with it when [condition] is false.
  Applicator when(bool condition, {Applicator orElse}) {
    if (condition) {
      return this;
    } else {
      // should this apply a SizedBox as a performance optimization
      // (to keep the widget tree depth the same)?
      return orElse ?? apply;
    }
  }
}

class PreferredApplicator
    extends SecondClassApplicator<Widget, PreferredSizeWidget> {
  const PreferredApplicator._(PreferredSizeWidget Function(Widget) builder)
      : super(builder);
}
