import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

Applicator alignToTopLeft() =>
    apply((child) => Align(alignment: Alignment.topLeft, child: child));

Applicator alignToTopCenter() =>
    apply((child) => Align(alignment: Alignment.topCenter, child: child));

Applicator alignToTopRight() =>
    apply((child) => Align(alignment: Alignment.topRight, child: child));

Applicator alignToCenterLeft() =>
    apply((child) => Align(alignment: Alignment.centerLeft, child: child));

Applicator alignToCenter() =>
    apply((child) => Align(alignment: Alignment.center, child: child));

Applicator alignToCenterRight() =>
    apply((child) => Align(alignment: Alignment.centerRight, child: child));

Applicator alignToBottomLeft() =>
    apply((child) => Align(alignment: Alignment.bottomLeft, child: child));

Applicator alignToBottomCenter() =>
    apply((child) => Align(alignment: Alignment.bottomCenter, child: child));

Applicator alignToBottomRight() =>
    apply((child) => Align(alignment: Alignment.bottomRight, child: child));
