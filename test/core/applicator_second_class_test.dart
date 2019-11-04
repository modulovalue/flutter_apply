import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("$SecondClassApplicator", () {
    test("second class application operator", () {
      expect(_testApplicator((str) => str.length) >> "hello", 5);
      expect(_testApplicator((str) => str.length).build("hello"), 5);
    });
  });

  group("$ListApplicator", () {
    test("listApply", () {
      final l = listApply((list) => Row(
            key: const ValueKey("list"),
            children: list.toList(),
          ));
      final sut = l >> [const Text("1"), const Text("2")];
      expect((sut as Row).children.map((a) => (a as Text).data), [
        "1",
        "2",
      ]);
      expect((sut as Row).key, const ValueKey("list"));
    });
    test(".indexed $IndexedListApplicator", () {
      final l = listApply((list) => Row(
            key: const ValueKey("list"),
            children: list.toList(),
          ));
      final sut = l.indexed() >>
          [
            (index) => Text("one", key: ValueKey(index)),
            (index) => Text("two", key: ValueKey(index)),
          ];
      expect(
        (sut as Row).key,
        const ValueKey("list"),
      );
      expect((sut as Row).children.map((a) => a.key), [
        const ValueKey(0),
        const ValueKey(1),
      ]);
      expect((sut as Row).children.map((a) => (a as Text).data), [
        "one",
        "two",
      ]);
    });
    test("$ListBuilderApplicator", () {
      final l = listApplyBuilder((children) {
        return _MyListBuilderWidget(children);
      });
      expect((l >> _myBuilder as _MyListBuilderWidget).builder, _myBuilder);
    });
  });
}

Widget _myBuilder(BuildContext context, int index) {
  return _MyListBuilderContainer(context, index);
}

class _MyListBuilderContainer extends StatelessWidget {
  final BuildContext context;
  final int index;

  const _MyListBuilderContainer(this.context, this.index);

  @override
  Widget build(BuildContext context) {
    return null;
  }
}

class _MyListBuilderWidget extends StatelessWidget {
  final void Function(BuildContext context, int i) builder;

  const _MyListBuilderWidget(this.builder);

  @override
  Widget build(BuildContext context) {
    return null;
  }
}

_TestSecondClassApplicator _testApplicator(int Function(String) builder) =>
    _TestSecondClassApplicator(builder);

class _TestSecondClassApplicator extends SecondClassApplicator<String, int> {
  const _TestSecondClassApplicator(int Function(String) builder)
      : super(builder);
}
