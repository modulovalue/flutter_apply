part of 'applicator_second_class.dart';

PreferredApplicator preferApply(PreferredSizeWidget Function(Widget) apply) {
  return PreferredApplicator._(apply);
}

class PreferredApplicator
    extends SecondClassApplicator<Widget, PreferredSizeWidget> {
  const PreferredApplicator._(PreferredSizeWidget Function(Widget) builder)
      : super._(builder);
}
