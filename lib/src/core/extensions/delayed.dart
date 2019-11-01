import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

class DelayedWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Applicator applicator;

  const DelayedWidget({
    @required this.child,
    @required this.duration,
    @required this.applicator,
  });

  @override
  _DelayedWidgetState createState() => _DelayedWidgetState();
}

class _DelayedWidgetState extends State<DelayedWidget> {
  bool wait = true;

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(widget.duration).then((_) {
      if (mounted) {
        setState(() {
          wait = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (wait) {
      return widget.child;
    } else {
      return widget.applicator > widget.child;
    }
  }
}
