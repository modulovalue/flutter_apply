import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

Applicator sliverPadding({
  num all,
  num vertical,
  num horizontal,
  num left,
  num right,
  num top,
  num bottom,
  num allButBottom,
  num allButRight,
  num allButLeft,
  num allButTop,
  EdgeInsets padding,
}) {
  return apply((child) {
    return Builder(builder: (context) {
      EdgeInsets insets = EdgeInsets.zero;

      if (all != null) {
        insets += EdgeInsets.all(all.toDouble());
      }

      if (vertical != null) {
        insets += EdgeInsets.symmetric(vertical: vertical.toDouble());
      }

      if (horizontal != null) {
        insets += EdgeInsets.symmetric(horizontal: horizontal.toDouble());
      }

      if (left != null) {
        insets += EdgeInsets.only(left: left.toDouble());
      }

      if (right != null) {
        insets += EdgeInsets.only(right: right.toDouble());
      }

      if (top != null) {
        insets += EdgeInsets.only(top: top.toDouble());
      }

      if (bottom != null) {
        insets += EdgeInsets.only(bottom: bottom.toDouble());
      }

      if (allButBottom != null) {
        insets += EdgeInsets.only(
            left: allButBottom.toDouble(),
            right: allButBottom.toDouble(),
            top: allButBottom.toDouble());
      }

      if (allButLeft != null) {
        insets += EdgeInsets.only(
            bottom: allButLeft.toDouble(),
            right: allButLeft.toDouble(),
            top: allButLeft.toDouble());
      }

      if (allButRight != null) {
        insets += EdgeInsets.only(
            left: allButRight.toDouble(),
            bottom: allButRight.toDouble(),
            top: allButRight.toDouble());
      }

      if (allButTop != null) {
        insets += EdgeInsets.only(
            left: allButTop.toDouble(),
            right: allButTop.toDouble(),
            bottom: allButTop.toDouble());
      }

      if (padding != null) {
        insets += padding;
      }

      return SliverPadding(
        padding: insets,
        sliver: child,
      );
    });
  });
}

Applicator padding({
  num all,
  num vertical,
  num horizontal,
  num left,
  num right,
  num top,
  num bottom,
  num allButBottom,
  num allButRight,
  num allButLeft,
  num allButTop,
  EdgeInsets padding,
}) {
  return apply((child) {
    return Builder(builder: (context) {
      EdgeInsets insets = EdgeInsets.zero;

      if (all != null) {
        insets += EdgeInsets.all(all.toDouble());
      }
      if (vertical != null) {
        insets += EdgeInsets.symmetric(vertical: vertical.toDouble());
      }
      if (horizontal != null) {
        insets += EdgeInsets.symmetric(horizontal: horizontal.toDouble());
      }
      if (left != null) {
        insets += EdgeInsets.only(left: left.toDouble());
      }
      if (right != null) {
        insets += EdgeInsets.only(right: right.toDouble());
      }
      if (top != null) {
        insets += EdgeInsets.only(top: top.toDouble());
      }
      if (bottom != null) {
        insets += EdgeInsets.only(bottom: bottom.toDouble());
      }
      if (allButBottom != null) {
        insets += EdgeInsets.only(
            left: allButBottom.toDouble(),
            right: allButBottom.toDouble(),
            top: allButBottom.toDouble());
      }
      if (allButLeft != null) {
        insets += EdgeInsets.only(
            bottom: allButLeft.toDouble(),
            right: allButLeft.toDouble(),
            top: allButLeft.toDouble());
      }
      if (allButRight != null) {
        insets += EdgeInsets.only(
            left: allButRight.toDouble(),
            bottom: allButRight.toDouble(),
            top: allButRight.toDouble());
      }
      if (allButTop != null) {
        insets += EdgeInsets.only(
            left: allButTop.toDouble(),
            right: allButTop.toDouble(),
            bottom: allButTop.toDouble());
      }
      if (padding != null) {
        insets += padding;
      }

      return Padding(
        padding: insets,
        child: child,
      );
    });
  });
}
