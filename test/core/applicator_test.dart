import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("$IDApplicator", () {
    test("apply is the identity applicator", () {
      expect(apply > testWidget1(), testWidget1());
    });

    test("apply can be used to define new applicators", () {
      final a = apply(testWidget3) > testWidget1();
      expect(a.key, const ValueKey("3"));
      expect((a as SizedBox).child.key, const ValueKey("1"));
    });
  });

  group("$Applicator", () {
    test("Applicator combination operator works as expected", () {
      final a = apply(testWidget3);
      final b = apply(testWidget4);
      final ab = a & b;
      final result = ab > testWidget1() as SizedBox;

      expect(result.key, const ValueKey("3"));
      expect(result.child.key, const ValueKey("4"));
      expect((result.child as SizedBox).child, testWidget1());
    });

    test("Application operator works as expected", () {
      final a = apply(testWidget3);
      final result = a > testWidget1() as SizedBox;

      expect(result.key, const ValueKey("3"));
      expect(result.child.key, const ValueKey("1"));
    });

    test("List application operator works as expected", () {
      final result = apply(testWidget3) *
          [
            testWidget1(),
            testWidget2(),
          ];

      expect(result.length, 2);
      expect(result[0].key, const ValueKey("3"));
      expect(result[1].key, const ValueKey("3"));
      expect((result[0] as SizedBox).child.key, const ValueKey("1"));
      expect((result[1] as SizedBox).child.key, const ValueKey("2"));
    });

    test("preferredSize", () {
      final result =
          apply(testWidget3).preferredSize(Size.zero, const ValueKey("pref")) >>
              testWidget1();
      expect(result is PreferredSize, true);
      expect(result.key, const ValueKey("pref"));
      expect((result as PreferredSize).child.key, const ValueKey("3"));
      expect(((result as PreferredSize).child as SizedBox).child.key,
          const ValueKey("1"));
    });

    group("when", () {
      test("true", () {
        final result1 = apply(testWidget3).when(true) > testWidget1();
        final result2 =
            apply(testWidget3).when(true, orElse: apply(testWidget4)) >
                testWidget1();
        expect(result1.key, const ValueKey("3"));
        expect(result2.key, const ValueKey("3"));
      });
      test("false", () {
        final result1 = apply(testWidget3).when(false) > testWidget1();
        final result2 =
            apply(testWidget3).when(false, orElse: apply(testWidget4)) >
                testWidget1();
        expect(result1.key, const ValueKey("1"));
        expect(result2.key, const ValueKey("4"));
      });
    });
  });
}

Widget testWidget1() => const SizedBox(key: ValueKey("1"));

Widget testWidget2() => const SizedBox(key: ValueKey("2"));

Widget testWidget3([Widget child]) =>
    SizedBox(key: const ValueKey("3"), child: child);

Widget testWidget4([Widget child]) =>
    SizedBox(key: const ValueKey("4"), child: child);
