import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

Applicator iconButton(void Function() onPressed, {EdgeInsets pad}) =>
    apply((child) {
      if (pad != null) {
        return IconButton(onPressed: onPressed, icon: child, padding: pad);
      }
      return IconButton(onPressed: onPressed, icon: child);
    });

Applicator iconProperties({double size, Color color}) {
  return onBuilder((context, child) {
    return Theme(
      data: Theme.of(context).copyWith(
          iconTheme:
              Theme.of(context).iconTheme.copyWith(size: size, color: color)),
      child: child,
    );
  });
}
