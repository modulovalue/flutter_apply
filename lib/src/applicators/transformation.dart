import 'dart:math' as m;

import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

Applicator rotatedBox(int quarterTurns) {
  return apply((child) => RotatedBox(quarterTurns: quarterTurns, child: child));
}

Applicator scale(double scale, {AlignmentGeometry alignment}) {
  return apply((child) {
    return Transform.scale(
        scale: scale, alignment: alignment ?? Alignment.center, child: child);
  });
}

num _degToRad(num deg) => deg * (m.pi / 180.0);

Applicator rotate(double angle, {AlignmentGeometry alignment}) {
  return apply((child) {
    return Transform.rotate(
      angle: _degToRad(angle).toDouble(),
      alignment: alignment ?? Alignment.center,
      child: child,
    );
  });
}

Applicator translate(Offset offset) {
  return apply((child) {
    return Transform.translate(offset: offset, child: child);
  });
}

Applicator translateX(double x) => translate(Offset(x, 0.0));

Applicator translateY(double y) => translate(Offset(0.0, y));

Applicator perspective(Offset deg) {
  return apply((child) {
    return Transform(
      // Transform widget
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // perspective
        ..rotateX(_degToRad(deg.dy).toDouble())
        ..rotateY(_degToRad(deg.dx).toDouble()),
      alignment: FractionalOffset.center,
      child: child,
    );
  });
}
