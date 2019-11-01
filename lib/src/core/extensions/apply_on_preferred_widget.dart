import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

class ApplyOnPreferredSizeWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final PreferredSizeWidget child;
  final Applicator applicator;

  const ApplyOnPreferredSizeWidget(this.child, this.applicator);

  @override
  Widget build(BuildContext context) {
    return applicator > child;
  }

  @override
  Size get preferredSize {
    return child.preferredSize;
  }
}
