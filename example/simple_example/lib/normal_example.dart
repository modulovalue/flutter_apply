import 'package:flutter/material.dart';

class ExampleOld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[100],
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: DefaultTextStyle.merge(
                    style: Theme.of(context).textTheme.caption,
                    child: const Text("Hello"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "This is not",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "flutter_apply",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: FlutterLogo(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
