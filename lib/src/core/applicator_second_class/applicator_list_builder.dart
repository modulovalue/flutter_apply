part of 'applicator_second_class.dart';

ListBuilderApplicator listApplyBuilder(
    Widget Function(Widget Function(BuildContext, int index)) builder) {
  return ListBuilderApplicator._(builder);
}

class ListBuilderApplicator extends SecondClassApplicator<
    Widget Function(BuildContext context, int index), Widget> {
  const ListBuilderApplicator._(
      Widget Function(Widget Function(BuildContext context, int index)) builder)
      : super._(builder);
}
