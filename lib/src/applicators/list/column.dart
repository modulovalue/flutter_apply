import 'package:flutter/material.dart';
import 'package:flutter_apply/flutter_apply.dart';

ListApplicator onColumnMin() => onColumn(mainAxisSize: MainAxisSize.min);

ListApplicator onColumnMax() => onColumn(mainAxisSize: MainAxisSize.max);

ListApplicator onColumnCenter() =>
    onColumn(mainAxisAlignment: MainAxisAlignment.center);

ListApplicator onColumnMinCenterCenter() => onColumn(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    );

ListApplicator onColumnMinCenterStretch() => onColumn(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );

ListApplicator onColumnMinCenterEnd() => onColumn(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
    );

ListApplicator onColumnMinCenterStart() => onColumn(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
    );

ListApplicator onColumnMaxStartStart() => onColumn(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    );

ListApplicator onColumnMaxStartCenter() => onColumn(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
    );

ListApplicator onColumnMaxCenterCenter() => onColumn(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    );

ListApplicator onColumnMaxCenterStretch() => onColumn(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );

ListApplicator onColumnMaxCenterStart() => onColumn(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
    );

ListApplicator onColumnMaxEvenlyCenter() => onColumn(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
    );

ListApplicator onColumnMaxAroundCenter() => onColumn(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
    );

ListApplicator onColumnMaxBetweenCenter() => onColumn(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
    );

ListApplicator onColumnMinStartCenter() {
  return onColumn(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
  );
}

ListApplicator onColumnMinStartStart() => onColumn(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    );

ListApplicator onColumnMinStartEnd() => onColumn(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
    );

ListApplicator onColumnMinStartStretch() => onColumn(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
