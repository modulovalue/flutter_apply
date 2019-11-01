import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

Applicator widgetMaterialApp(Color color) {
  return apply((child) {
    return WidgetsApp(
        debugShowCheckedModeBanner: false,
        color: color,
        builder: (context, snapshot) {
          return MaterialApp(
            color: color,
            debugShowCheckedModeBanner: false,
            home: child,
          );
        });
  });
}

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

/// Based on the example described in [SingleChildScrollView]s documentation.
///
/// Give children a width, which will act as a minimum width
/// and then they can be expanded to fill the viewport.
Applicator expandableSingleChildScrollViewH() {
  return apply((child) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return singleChildScrollViewH() &
              constrain(
                  BoxConstraints(minWidth: viewportConstraints.maxWidth)) &
              intrinsicWidth() >
          child;
    });
  });
}

Applicator canOverflowHeight() {
  return onLayoutBuilder((context, constraints, child) {
    return onStack() >>
        [
          positioned(width: constraints.maxWidth) > child,
        ];
  });
}

/// Based on the example described in [SingleChildScrollView] documentation.
///
/// Give children a height, which will act as a minimum height
/// and then they can be expanded to fill the viewport.
Applicator expandableSingleChildScrollViewV() {
  return apply((child) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return singleChildScrollView() &
              constrain(
                  BoxConstraints(minHeight: viewportConstraints.maxHeight)) &
              intrinsicHeight() >
          child;
    });
  });
}

ImageProvider emptyImage = MemoryImage(Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE
]));

const Duration aSecond = Duration(seconds: 1);

const Duration ms0 = Duration(milliseconds: 0);

const Duration ms100 = Duration(milliseconds: 100);

const Duration ms200 = Duration(milliseconds: 200);

const Duration ms300 = Duration(milliseconds: 300);

const Duration ms400 = Duration(milliseconds: 400);

const Duration ms500 = Duration(milliseconds: 500);

Iterable<MapEntry<int, T>> indexedIterable<T>(Iterable<T> children) =>
    children.toList().asMap().entries;
