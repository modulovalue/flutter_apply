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

Applicator aboveZ(
    Iterable<Widget> Function(BuildContext, BoxConstraints) aboveAll) {
  return onLayoutBuilder((context, constraints, child) {
    return Stack(
      alignment: Alignment.topCenter,
      fit: StackFit.expand,
      children: [
        // content
        positioned(
                left: 0,
                top: 0,
                width: constraints.maxWidth,
                height: constraints.maxHeight) >
            child,
        ...aboveAll(context, constraints),
      ],
    );
  });
}

Applicator listTileLeading() {
  return apply((child) {
    return onRowMin() >>
        [
          Container(alignment: Alignment.center, child: child),
        ];
  });
}

ListApplicator centeredColumn() {
  return listApply((children) {
    return center() > onColumnMinCenterCenter() >> children;
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

Applicator hero(
  String tag, {
  String additionalIfNotNull = "",
  bool enableTextFix = false,
  bool transitionOnUserGestures = false,
  HeroAnimationStyle style = HeroAnimationStyle.lerp,
}) {
  if (tag == null || additionalIfNotNull == null) {
    return apply;
  } else {
    return apply((child) {
      return textSize(2.0)
              .when(enableTextFix && style == HeroAnimationStyle.fade) >
          Hero(
            createRectTween: (a, b) {
              if (enableTextFix) {
                return _MyRectTween(a, b);
              } else {
                return RectTween(begin: a, end: b);
              }
            },
            transitionOnUserGestures: transitionOnUserGestures ?? false,
            flightShuttleBuilder: (_,
                Animation<double> animation,
                HeroFlightDirection flightDirection,
                BuildContext fromHeroContext,
                BuildContext toHeroContext) {
              return AnimatedBuilder(
                animation: animation,
                builder: (_, _child) {
                  assert(style != null);
                  return _applyHeroStyle(
                        style: style,
                        lerpValue: flightDirection == HeroFlightDirection.pop
                            ? 1 - animation.value
                            : animation.value,
                        fromHeroContext: fromHeroContext,
                        toHeroContext: toHeroContext,
                      ) >
                      child;
                },
                child: child,
              );
            },
            tag: tag + additionalIfNotNull,
            child: child,
          );
    });
  }
}

class _MyRectTween extends Tween<Rect> {
  final Rect from;
  final Rect to;

  _MyRectTween(this.from, this.to) : super(begin: from, end: to);

  @override
  Rect lerp(double t) {
    final rect = RectTween(begin: from, end: to).lerp(t);
    // Fixes a hero new-line bug
    return Rect.fromLTRB(rect.left, rect.top, rect.right + 1.0, rect.bottom);
  }
}

Applicator _applyHeroStyle({
  @required HeroAnimationStyle style,
  @required double lerpValue,
  @required BuildContext fromHeroContext,
  @required BuildContext toHeroContext,
}) {
  return apply((child) {
    switch (style) {
      case HeroAnimationStyle.lerp:
        final fromTheme = Theme.of(fromHeroContext);
        final toTheme = Theme.of(toHeroContext);
        final fromTS = DefaultTextStyle.of(fromHeroContext).style;
        final toTS = DefaultTextStyle.of(toHeroContext).style;
        final fromIT = IconTheme.of(fromHeroContext);
        final toIT = IconTheme.of(toHeroContext);

        return Theme(
          data: ThemeData.lerp(fromTheme, toTheme, lerpValue),
          child: DefaultTextStyle.merge(
            style: TextStyle.lerp(fromTS.copyWith(inherit: true),
                toTS.copyWith(inherit: true), lerpValue),
            child: IconTheme.merge(
              data: IconThemeData.lerp(fromIT, toIT, lerpValue),
              child: child,
            ),
          ),
        );
      case HeroAnimationStyle.fade:
        return _applyHeroStyle(
              style: HeroAnimationStyle.lerp,
              fromHeroContext: fromHeroContext,
              toHeroContext: toHeroContext,
              lerpValue: lerpValue,
            ) >
            Stack(
              alignment: Alignment.center,
              children: [
                opacity(1 - lerpValue) > fromHeroContext.widget,
                opacity(lerpValue) > toHeroContext.widget,
              ],
            );
    }
    throw Exception("Unknown hero style $style");
  });
}

enum HeroAnimationStyle {
  lerp,
  fade,
}
