part of 'applicator_second_class.dart';

IndexedListApplicator indexedListApply(
    Widget Function(Iterable<Widget Function(int index)>) builder) {
  return IndexedListApplicator._(builder);
}

class IndexedListApplicator extends SecondClassApplicator<
    Iterable<Widget Function(int index)>, Widget> {
  const IndexedListApplicator._(
      Widget Function(Iterable<Widget Function(int index)>) builder)
      : super._(builder);
}
