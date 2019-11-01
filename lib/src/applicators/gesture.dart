import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

Applicator ignorePointer([bool ignore = true]) =>
    apply((child) => IgnorePointer(ignoring: ignore, child: child));

Applicator onLongPress(void Function() execute) =>
    apply((child) => GestureDetector(onLongPress: execute, child: child));

Applicator onTap(void Function() execute, [HitTestBehavior behavior]) =>
    apply((child) =>
        GestureDetector(onTap: execute, behavior: behavior, child: child));

Applicator onPointerUp(void Function(PointerUpEvent) execute,
        [HitTestBehavior behavior]) =>
    apply((child) => Listener(
        onPointerUp: execute,
        behavior: behavior ?? HitTestBehavior.deferToChild,
        child: child));

Applicator onTapUp(void Function(TapUpDetails) execute,
        [HitTestBehavior behavior]) =>
    apply((child) =>
        GestureDetector(onTapUp: execute, behavior: behavior, child: child));
