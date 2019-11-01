import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

Applicator flatButton(void Function() onPressed) =>
    apply((child) => FlatButton(onPressed: onPressed, child: child));

Applicator fab(void Function() onPressed) =>
    apply((child) => FloatingActionButton(onPressed: onPressed, child: child));

Applicator raisedButton(void Function() onPressed) =>
    apply((child) => RaisedButton(onPressed: onPressed, child: child));
