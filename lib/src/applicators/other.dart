import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../flutter_apply.dart';

Applicator scaffold(
    {Key key,
    PreferredSizeWidget appBar,
    Color color,
    Widget fab,
    Widget bnb,
    Widget drawer,
    Color drawerScrimColor}) {
  return apply((child) {
    return Scaffold(
      key: key,
      appBar: appBar,
      body: child,
      resizeToAvoidBottomInset: false,
      backgroundColor: color,
      floatingActionButton: fab,
      drawerScrimColor: drawerScrimColor,
      bottomNavigationBar: bnb,
      drawer: drawer,
    );
  });
}

Applicator expanded([int flex = 1]) {
  return apply((child) => Expanded(flex: flex, child: child));
}

Applicator flexible() {
  return apply((child) => Flexible(child: child));
}

Applicator circleAvatar({@required Color color}) {
  return apply((child) => CircleAvatar(backgroundColor: color, child: child));
}

Applicator bgColor(Color color) {
  return apply((child) {
    return Container(color: color, child: child);
  }).when(color != null);
}

Applicator clip() => apply((child) => ClipRect(child: child));

Applicator clipCircular(double radius) {
  return apply((child) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: child,
    );
  });
}

Applicator card({double elevation, ShapeBorder shape, Color color}) {
  return apply((child) {
    return Card(elevation: elevation, shape: shape, color: color, child: child);
  });
}

Applicator keyed(Key key) {
  return apply((child) => KeyedSubtree(key: key, child: child));
}

Applicator keyedStr(String str) {
  return apply((child) => KeyedSubtree(key: ValueKey(str), child: child));
}

Applicator scrollBar() => apply((child) => CupertinoScrollbar(child: child));

Applicator opacity(num opacity) {
  return apply((child) {
    return Opacity(opacity: opacity.toDouble(), child: child);
  }).when(opacity != null);
}

Applicator singleChildScrollView(
    {ScrollController controller, EdgeInsets padding}) {
  return apply((child) {
    return SingleChildScrollView(
      controller: controller,
      padding: padding,
      child: child,
    );
  });
}

Applicator singleChildScrollViewH(
    {ScrollController controller, EdgeInsets padding}) {
  return apply((child) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      padding: padding,
      child: child,
    );
  });
}

Applicator animOpacity(double opacity,
    {Duration duration = const Duration(milliseconds: 300), Curve curve}) {
  return apply((child) {
    return AnimatedOpacity(
      duration: duration,
      opacity: opacity,
      curve: curve ?? Curves.linear,
      child: child,
    );
  });
}

Applicator animContainer({
  Duration duration = const Duration(milliseconds: 300),
  Curve curve,
  Decoration decoration,
  double height,
}) {
  return apply((child) {
    return AnimatedContainer(
      duration: duration,
      curve: curve ?? Curves.linear,
      decoration: decoration,
      height: height,
      child: child,
    );
  });
}

Applicator fittedBox({BoxFit fit = BoxFit.contain}) {
  return apply((child) => FittedBox(fit: fit, child: child));
}

Applicator fittedBoxScaleDown() {
  return apply((child) => FittedBox(fit: BoxFit.scaleDown, child: child));
}

Applicator material(double elevation,
    {BorderRadius borderRadius, Color color}) {
  return apply((child) {
    return Material(
      borderRadius: borderRadius,
      elevation: elevation,
      color: color,
      child: child,
    );
  });
}

Applicator materialCircular(double elevation, double radius) {
  return apply((child) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      elevation: elevation,
      child: child,
    );
  });
}

Applicator center() => apply((child) => Center(child: child));

Applicator safeArea() => apply((child) => SafeArea(child: child));

Applicator willPopScope(Future<bool> Function() onWillPop) {
  return apply((child) => WillPopScope(onWillPop: onWillPop, child: child));
}

Widget fadeInImagePath(String path, Size size,
    {Duration duration, BoxFit fit}) {
  return FadeInImage(
    key: ValueKey(path),
    placeholder: emptyImage,
    image: AssetImage(path),
    width: size.width,
    height: size.height,
    fit: fit,
    fadeInDuration: duration ?? const Duration(milliseconds: 200),
  );
}
