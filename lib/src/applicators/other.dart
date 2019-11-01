import 'dart:math' as m;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../flutter_apply.dart';

Applicator expanded([int flex = 1]) {
  return apply((child) => Expanded(flex: flex, child: child));
}

Applicator rotatedBox(int quarterTurns) {
  return apply((child) => RotatedBox(quarterTurns: quarterTurns, child: child));
}

Applicator flexible() {
  return apply((child) => Flexible(child: child));
}

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

Applicator circleAvatar({@required Color color}) =>
    apply((child) => CircleAvatar(backgroundColor: color, child: child));

Applicator listTileLeading() {
  return apply((child) {
    return onRowMin() >>
        [
          Container(alignment: Alignment.center, child: child),
        ];
  });
}

Applicator bgColor(Color color) =>
    apply((child) => Container(color: color, child: child)).when(color != null);

Applicator size(Size edge) {
  return apply((child) =>
      SizedBox(height: edge.height, width: edge.width, child: child));
}

Applicator constrain(BoxConstraints constraints, {Decoration decoration}) {
  return apply((child) => Container(
        constraints: constraints,
        decoration: decoration,
        child: child,
      ));
}

Applicator constrainWith(
    {double minHeight,
    double maxHeight,
    double minWidth,
    double maxWidth,
    Decoration decoration}) {
  return apply((child) {
    return Container(
      constraints: BoxConstraints(
        minWidth: minWidth ?? 0.0,
        maxWidth: maxWidth ?? double.infinity,
        minHeight: minHeight ?? 0.0,
        maxHeight: maxHeight ?? double.infinity,
      ),
      decoration: decoration,
      child: child,
    );
  });
}

Applicator intrinsicHeight() {
  return apply((child) => IntrinsicHeight(child: child));
}

Applicator intrinsicWidth() {
  return apply((child) => IntrinsicWidth(child: child));
}

Applicator width(double width) {
  return apply((child) => SizedBox(width: width, child: child));
}

Applicator height(double height) {
  return apply((child) => SizedBox(height: height, child: child));
}

Applicator relativeWidth(double width) {
  return onBuilder((context, child) {
    final _width = MediaQuery.of(context).size.width;
    return SizedBox(width: width * _width, child: child);
  });
}

Applicator relativeHeight(double height) {
  return onBuilder((context, child) {
    final _height = MediaQuery.of(context).size.height;
    return SizedBox(height: height * _height, child: child);
  });
}

PreferredApplicator preferredWidth(double width) => preferApply((child) =>
    PreferredSize(preferredSize: Size.fromWidth(width), child: child));

PreferredApplicator preferredHeight(double height) => preferApply((child) =>
    PreferredSize(preferredSize: Size.fromHeight(height), child: child));

Applicator square(double edge) =>
    apply((child) => SizedBox(height: edge, width: edge, child: child));

Applicator scale(double scale, {AlignmentGeometry alignment}) =>
    apply((child) => Transform.scale(
        scale: scale, alignment: alignment ?? Alignment.center, child: child));

num _degToRad(num deg) => deg * (m.pi / 180.0);

Applicator rotate(double angle, {AlignmentGeometry alignment}) =>
    apply((child) => Transform.rotate(
        angle: _degToRad(angle).toDouble(),
        alignment: alignment ?? Alignment.center,
        child: child));

Applicator translateXY(Offset offset) =>
    apply((child) => Transform.translate(offset: offset, child: child));

Applicator translateX(double x) => translateXY(Offset(x, 0.0));

Applicator translateY(double y) => translateXY(Offset(0.0, y));

Applicator perspective(Offset deg) => apply((child) =>
    // https://medium.com/flutter/perspective-on-flutter-6f832f4d912e
    Transform(
      // Transform widget
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // perspective
        ..rotateX(_degToRad(deg.dy).toDouble())
        ..rotateY(_degToRad(deg.dx).toDouble()),
      alignment: FractionalOffset.center,
      child: child,
    ));

Applicator clip() => apply((child) => ClipRect(child: child));

Applicator clipCircular(double radius) => apply((child) => ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(radius)), child: child));

Applicator card({double elevation, ShapeBorder shape, Color color}) =>
    apply((child) =>
        Card(elevation: elevation, shape: shape, color: color, child: child));

Applicator inkwell({
  void Function() onTap,
  void Function() onLongPress,
  BorderRadius borderRadius,
}) {
  return apply((child) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      borderRadius: borderRadius,
      child: child,
    );
  });
}

Applicator keyed(Key key) =>
    apply((child) => KeyedSubtree(key: key, child: child));

Applicator keyedStr(String str) =>
    apply((child) => KeyedSubtree(key: ValueKey(str), child: child));

Applicator scrollBar() => apply((child) => CupertinoScrollbar(child: child));

Applicator opacity(num opacity) =>
    apply((child) => Opacity(opacity: opacity.toDouble(), child: child))
        .when(opacity != null);

Applicator singleChildScrollView(
        {ScrollController controller, EdgeInsets padding}) =>
    apply((child) => SingleChildScrollView(
        controller: controller, padding: padding, child: child));

Applicator singleChildScrollViewH(
        {ScrollController controller, EdgeInsets padding}) =>
    apply((child) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        padding: padding,
        child: child));

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

Applicator animOpacity(double opacity,
    {Duration duration = const Duration(milliseconds: 300), Curve curve}) {
  return apply((child) => AnimatedOpacity(
      duration: duration,
      opacity: opacity,
      curve: curve ?? Curves.linear,
      child: child));
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

Applicator fittedBox({BoxFit fit = BoxFit.contain}) =>
    apply((child) => FittedBox(fit: fit, child: child));

Applicator fittedBoxScaleDown() =>
    apply((child) => FittedBox(fit: BoxFit.scaleDown, child: child));

Applicator material(double elevation,
        {BorderRadius borderRadius, Color color}) =>
    apply((child) => Material(
        borderRadius: borderRadius,
        elevation: elevation,
        color: color,
        child: child));

Applicator materialCircular(double elevation, double radius) =>
    apply((child) => Material(
        borderRadius: BorderRadius.circular(radius),
        elevation: elevation,
        child: child));

Applicator center() => apply((child) => Center(child: child));

Applicator safeArea() => apply((child) => SafeArea(child: child));

Applicator willPopScope(Future<bool> Function() onWillPop) =>
    apply((child) => WillPopScope(onWillPop: onWillPop, child: child));

Widget assetImage(String path, Size size, {Duration duration, BoxFit fit}) =>
    FadeInImage(
      key: ValueKey(path),
      placeholder: emptyImage,
      image: AssetImage(path),
      width: size.width,
      height: size.height,
      fit: fit,
      fadeInDuration: duration ?? const Duration(milliseconds: 200),
    );
