import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

Applicator flatButton(void Function() onPressed) {
  return apply((child) {
    return FlatButton(onPressed: onPressed, child: child);
  });
}

Applicator fab(void Function() onPressed, {String tooltip}) {
  return apply((child) {
    return FloatingActionButton(
      tooltip: tooltip,
      onPressed: onPressed,
      child: child,
    );
  });
}

Applicator raisedButton(void Function() onPressed) {
  return apply((child) {
    return RaisedButton(onPressed: onPressed, child: child);
  });
}

Applicator outlineButton(void Function() onPressed) {
  return apply((child) {
    return OutlineButton(onPressed: onPressed, child: child);
  });
}
