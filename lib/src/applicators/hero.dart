import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

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
