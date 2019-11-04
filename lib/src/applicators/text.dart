import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

Applicator textStyle(TextStyle style) {
  return apply((child) {
    return DefaultTextStyle.merge(
      child: child,
      style: style,
    );
  });
}

Applicator _textAs(TextStyle Function(TextTheme) map) {
  return onBuilder((context, child) {
    return textStyle(map(Theme.of(context).textTheme)) > child;
  });
}

Applicator textAsDisplay4() => _textAs((a) => a.display4);

Applicator textAsDisplay3() => _textAs((a) => a.display3);

Applicator textAsDisplay2() => _textAs((a) => a.display2);

Applicator textAsDisplay1() => _textAs((a) => a.display1);

Applicator textAsHeadline() => _textAs((a) => a.headline);

Applicator textAsTitle() => _textAs((a) => a.title);

Applicator textAsSubhead() => _textAs((a) => a.subhead);

Applicator textAsBody2() => _textAs((a) => a.body2);

Applicator textAsBody1() => _textAs((a) => a.body1);

Applicator textAsCaption() => _textAs((a) => a.caption);

Applicator textAsButton() => _textAs((a) => a.button);

Applicator textAsSubtitle() => _textAs((a) => a.subtitle);

Applicator textAsOverline() => _textAs((a) => a.overline);

List<Applicator> allTextStyles() => [
      textAsDisplay4(),
      textAsDisplay3(),
      textAsDisplay2(),
      textAsDisplay1(),
      textAsHeadline(),
      textAsTitle(),
      textAsSubhead(),
      textAsBody2(),
      textAsBody1(),
      textAsCaption(),
      textAsButton(),
      textAsSubtitle(),
      textAsOverline(),
    ];

Applicator textProperties({
  double size,
  FontWeight weight,
  String family,
  Color color,
  double letterSpacing,
  bool italic,
  bool underline,
  TextAlign align,
  int maxLines,
  TextOverflow overflow,
}) {
  return apply((child) {
    return DefaultTextStyle.merge(
      child: child,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        letterSpacing: letterSpacing,
        fontSize: size,
        fontWeight: weight,
        fontFamily: family,
        color: color,
        fontStyle: (italic ?? false) ? FontStyle.italic : FontStyle.normal,
        decoration: (underline ?? false) ? TextDecoration.underline : null,
      ),
    );
  });
}

Applicator textSize(double size) => textProperties(size: size);

Applicator textWeight(FontWeight weight) => textProperties(weight: weight);

Applicator textWeightBold() => textProperties(weight: FontWeight.bold);

Applicator textWeight900() => textProperties(weight: FontWeight.w900);

Applicator textWeight800() => textProperties(weight: FontWeight.w800);

Applicator textWeight700() => textProperties(weight: FontWeight.w700);

Applicator textWeight600() => textProperties(weight: FontWeight.w600);

Applicator textWeight500() => textProperties(weight: FontWeight.w500);

Applicator textWeight400() => textProperties(weight: FontWeight.w400);

Applicator textWeight300() => textProperties(weight: FontWeight.w300);

Applicator textWeight200() => textProperties(weight: FontWeight.w200);

Applicator textWeight100() => textProperties(weight: FontWeight.w100);

Applicator textColor(Color color) => textProperties(color: color);

Applicator textAlignC() => textProperties(align: TextAlign.center);

Applicator textAlignL() => textProperties(align: TextAlign.left);

Applicator textAlignR() => textProperties(align: TextAlign.right);

Applicator textMaxLine1WithEllipsis() {
  return textProperties(maxLines: 1, overflow: TextOverflow.ellipsis);
}
