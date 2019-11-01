import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

/// Variation of the 'Mostly Fluid' responsive design pattern.
/// https://developers.google.com/web/fundamentals/design-and-ux/responsive/patterns
///
/// Adds a margin to keep the contents width equal to [width].
Applicator fluidByMarginH(double width,
    {Applicator Function(double difference) whenActive}) {
  return onBuilder((context, child) {
    final mediaSize = MediaQuery.of(context).size;

    if (mediaSize.width <= width) {
      return child;
    } else {
      final dif = mediaSize.width - width;
      return padding(left: dif / 2, right: dif / 2) &
              (whenActive?.call(dif) ?? apply) >
          child;
    }
  });
}

Applicator resizeWhenKeyboardAppearsAndHideOnTap({Color bgColor}) {
  return onBuilder((context, child) {
    final bottomViewInsets = MediaQuery.of(context).viewInsets.bottom;
    return Listener(
      onPointerMove: (info) {
        if (bottomViewInsets != 0.0 && info.delta.dy > 24.0) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      onPointerUp: (event) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          body: child,
          resizeToAvoidBottomInset: true,
          backgroundColor: bgColor),
    );
  });
}
