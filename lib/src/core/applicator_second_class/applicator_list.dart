part of 'applicator_second_class.dart';

ListApplicator listApply(Widget Function(Iterable<Widget>) builder) =>
    ListApplicator._(builder);

class ListApplicator extends SecondClassApplicator<Iterable<Widget>, Widget> {
  const ListApplicator._(Widget Function(Iterable<Widget>) builder)
      : super._(builder);
}